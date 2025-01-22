---
description: Manage resource allocation in NSO.
---

# Resource Manager

The NSO Resource Manager package contains both an API for generic resource pool handling called the `resource allocator`, and the two applications ([`id-allocator`](./#nso-id-allocator-deployment) and[`ipaddress-allocator`](./#nso-ip-address-allocator-deployment)) utilizing the API.  The applications are explained separately in the following sections below:

* [NSO ID Allocator Deployment](./#nso-id-allocator-deployment)&#x20;
* [NSO IP Address Allocator Deployment](./#nso-ip-address-allocator-deployment)&#x20;

{% hint style="info" %}
This version of NSO Resource Manager is 4.2.8 and was released together with NSO version 6.4.
{% endhint %}

## Background <a href="#d5e17" id="d5e17"></a>

NSO is often used to provision services in the networking layer. It is not unusual that these services require network-level information that is not (or cannot be) part of the instance data provided by the northbound system, so it needs to be fetched from, and eventually released back to a separate system. A common example of this is IP addresses used for layer-3 VPN services. The orchestrator tool is not aware of the blocks of IP addresses assigned to the network but relies on lower layers to fulfill this need.

Some customers have software systems to manage these types of temporary assets. E.g., for IP-addresses, they are usually known as IP Address Management (IPAM) systems. There is a whole industry of solutions for such systems, ranging from simple open-source solutions to entire suites integrated with DNS management. See [IP address management](https://en.wikipedia.org/wiki/IP_address_management) for more on this.

There are customers that either don't have an IPAM system for services that are planned for NSO or are not planning to get one for this single purpose. They usually don't want the operational overhead of another system and/or don't see the need for a separate investment. These customers are looking for NSO to provide basic resource allocation and lifecycle management for the assets required for services managed by NSO. They appreciate the fact that NSO is not an appropriate platform to provide more advanced features from the IPAM world like capacity planning nor to integrate with DNS and DHCP platforms. This means that the NSO Resource Manager does not compete with full-blown systems but is rather a complementary feature.

## Overview <a href="#d5e25" id="d5e25"></a>

The NSO Resource Manager interface, the `resource allocator`, provides a generic resource allocation mechanism that works well with services and in a high availability (HA) configuration. Expected is implementations of specific resource allocators implemented as separate NSO packages. A service will then have the possibility to use allocator implementations dedicated to different resources.

The YANG model of the resource allocator (`resource-allocator.yang`) can be augmented with different resource pools, as is the case for the two applications `id-allocator` and `ipaddress-allocator`. Each pool has an allocation list where services are expected to create instances to signal that they request an allocation. Request parameters are stored in the `request` container and the allocation response is written in the `response` container.

Since the allocation request may fail the response container contains a choice where one case is for error and one for success.

Each allocation list entry also contains an `allocating-service` leaf-list. These are instance identifiers that point to the services that requested the resource. These are the services that will be redeployed when the resource has been allocated.

The resource allocation packages should subscribe to several points in this `resource-pool` tree. First, they must detect when a new resource pool is created or deleted. Secondly, they must detect when an allocation request is created or deleted. A package may also augment the pool definition with additional parameters, for example, an IP address allocator may wish to add configuration parameters for defining the available subnets to allocate from, in which case it must also subscribe to changes to these settings.

## Installation <a href="#d5e45" id="d5e45"></a>

The installation of this package is done as with any other package, as described in the [NSO Packages](https://cisco-tailf.gitbook.io/nso-docs/administration/management/package-mgmt) section of the Administration Guide.

## Data Model for Resource Allocator <a href="#d5e48" id="d5e48"></a>

The API of the resource allocator is defined in this YANG data model:

```
  grouping resource-pool-grouping {
    leaf name {
      tailf:info "Unique name for the pool";
      type string;
    }

    list allocation {
      key id;

      leaf id {
        type string;
      }

      leaf username {
        description
          "Authenticated user for invoking the service";
        type string;
        mandatory true;
      }

      leaf-list allocating-service {
        tailf:info "Instance identifiers of service that own resource";
        type instance-identifier;
      }

      container request {
        description
          "When creating a request for a resource the
           implementing package augments here.";
      }

      container response {
        config false;
        tailf:cdb-oper {
          tailf:persistent true;
        }
        choice response-choice {
          case error {
            leaf error {
              type string;
            }
          }
          case ok {
            // The implementing package augments here
          }
        }
      }
      }
```

## HA Considerations <a href="#d5e52" id="d5e52"></a>

Looking at High Availability, there are two things we need to consider - the allocator state needs to be replicated, and the allocation needs only to be performed on one node.

The easiest way to replicate the state is to write it into CDB-oper and let CDB perform the replication. This is what we do in the `ipaddress-allocator`.

We only want the allocator to allocate addresses on the primary node. Since the allocations are written into CDB they will be visible on both primary and secondary nodes, and the CDB subscriber will be notified on both nodes. In this case, we only want the allocator on the primary node to perform the allocation.

We therefore read the HA mode leaf from CDB to determine which HA mode the current subscriber is running in; if HA mode is not enabled, or if HA mode is enabled and the current node is primary we proceed with the allocation.

## Synchronous Allocation <a href="#d5e60" id="d5e60"></a>

This synchronized allocation API request uses a reactive fastmap, so the user can allocate resources and still keep a synchronous interface. It allocates resources in the create callback, at that moment everything we modify in the database is part of the service intent and fast map. We need to guarantee that we have used a stable resource and communicate to other services, which resources we have used. So, during the create callback, we store what we have allocated. Other services that are evaluated within the same transaction which runs subsequent to ours will see allocations, when our service is redeployed, it will not have to create the allocations again.

When an allocation raises an exception in case the pool is exhausted, or if the referenced pool does not exist in the CDB, `commit` will get aborted. Synchronous allocation doesn't require service `re-deploy` to read allocation. The same transaction can read allocation, `commit dry-run` or `get-modification` should show up the allocation details as output.

{% hint style="info" %}
Synchronous allocation is only supported through the Java and Python APIs provided by the Resource Manager.
{% endhint %}

## NSO ID Allocator Deployment

This section explores deployment information and procedures for the NSO ID Allocator (`id-allocator`). The NSO Resource ID Allocator is an extension of the generic resource allocation mechanism called the NSO Manager. It can allocate integers which can serve for instance as VLAN identifiers.

### Overview

The ID Allocator can host any number of ID pools. Each pool contains a certain number of IDs that can be allocated. They are specified by a range, and potentially broken into several ranges by a list of excluded ranges.

The ID allocator YANG models are divided into a configuration data-specific model (`idallocator.yang`), and an operational data-specific model (`id-allocator-oper.yang`). Users of this package will request allocations in the configuration tree. The operational tree serves as an internal data structure of the package.

An ID request can allocate either the lowest possible ID in a pool or a specified (by the user) value, such as 5 or 1000.

Allocation requests can be synchronized between pools. This synchronization is based on the ID of the allocation request itself (such as for instance `allocation1`), the result is that the allocations will have the same allocated value across pools.

### Examples

This section presents some simple use cases of the NSO presented using Cisco-style CLI.

<details>

<summary>Create an ID Pool</summary>

The CLI interaction below depicts how it is possible to create a new ID pool and assign it a range of values from 100 to 1000.

```
admin@ncs# resource-pools id-pool pool1 range start 100 end 1000
admin@ncs# commit
```

</details>

<details>

<summary>Create an Allocation Request</summary>

When a pool has been created, it is possible to create allocation requests on the values handled by a pool. The CLI interaction below shows how to allocate a value in the pool defined above.

```
admin@ncs# resource-pools id-pool pool1 allocation a1 user myuser
admin@ncs# commit
```

At this point, we have a pool with a range of 100 to 1000 and one allocation (100). This is shown in the table below (Pool Range 100-1000).

```
| NAME  | START | END | START | END | START | END  |  ID  |
|-------|-------|-----|-------|-----|-------|------|------|
| pool1 |   -   |  -  |       |     |  101  | 1000 | 100  |
```

</details>

<details>

<summary>Create an Allocation Request Shared by Multiple Services</summary>

Allocations can be shared by multiple services by requesting the same allocation ID from all the services. All instance services in the `allocating-service` leaf-list will be redeployed when the resource has been allocated. The CLI interaction below shows how to allocate an ID shared by two services.

```
admin@ncs# resource-pools id-pool pool1 allocation a1 allocating-service \
           /services/vl:loop[name='myservice1'] user myuser
admin@ncs# resource-pools id-pool pool1 allocation a1 allocating-service \
           /services/vl:loop[name='myservice2'] user myuser
admin@ncs# commit
```

The allocation resource gets freed once all allocating services in the `allocating-service` leaf-list delete the allocation request.

</details>

<details>

<summary>Create a Synchronized Allocation Request</summary>

Allocations can be synchronized between pools by setting `request sync` to `true` when creating each allocation request. The allocation ID, which is `b` in this CLI interaction, determines which allocations will be synchronized across pools.

```
admin@ncs# resource-pools id-pool pool2 range start 100 end 1000
admin@ncs# resource-pools id-pool pool1 allocation b user myuser request sync true
admin@ncs# resource-pools id-pool pool2 allocation b user myuser request sync true
admin@ncs# commit
```

As can be seen in the table below (Synchronized Pools), the allocations `b` (in `pool1` and in `pool2`) are synchronized across pools `pool1` and `pool2` and receive the ID value of 1000 in both pools.

```
| NAME  | START | END | START | END | START | END |  ID  |
|-------|-------|-----|-------|-----|-------|-----|------|
| pool1 |   -   |  -  |       |     |  101  | 999 | 100  |
|       |   -   |  -  |       |     |       |     | 1000 |
| pool2 |   -   |  -  |       |     |  101  | 999 | 1000 |
```

</details>

<details>

<summary>Update Request ID</summary>

The element allocation/request/ID can be created and changed, then the previously allocated ID will be released and a new ID will be allocated depending on the new value of allocation/request/ID. In the case of a delete request/ID, the previously allocated ID will be retained.

```
admin@ncs# set resource-pools id-pool testPool allocation testAlloc username admin
admin@ncs# commit
admin@ncs# set resource-pools id-pool testPool allocation testAlloc request id 150
admin@ncs# commit
admin@ncs# set resource-pools id-pool testPool allocation testAlloc request id 180
admin@ncs# commit
```

</details>

<details>

<summary>Request an ID using the Round-Robin Method</summary>

The default behavior for requesting a new ID is to request the first free ID in increasing order.

This method is selectable using the `method` container. For example, the `firstfree` method can be explicitly set:

```
admin@ncs# set resource-pools id-pool methodRangeFirst allocation a username \
           admin request method firstfree
```

If we remove the allocation `a` and do a new allocation, using the default method, we allocate the first free ID, in this case, 1 again. Using the round-robin scheme, we instead allocate the next in order, i.e. 2.

```
admin@ncs# set resource-pools id-pool methodRoundRobin allocation a username \
           admin request method roundrobin
```

Note that the request method is set on a per-request basis. Two different requests may request IDs from the same pool using different request methods.

</details>

<details>

<summary>Create a Synchronous Allocation API Request for an ID</summary>

Synchronous allocation can be requested through various Java APIs provided in `resource-manager/src/java/src/com/tailf/pkg/idallocator/IDAllocator.java` and the Python API provided in `resource-manager/python/resource_manager/id_allocator.py`.

*   Request:Java:void idRequest(ServiceContext context, NavuNode service, RedeployType

    redeployType, String poolName, String username, String id, boolean sync\_pool, long requestedId,

    boolean sync\_alloc).
*   Request:Python:id\_request(service, svc\_xpath, username, pool\_name, allocation\_name, sync\_pool,

    requested\_id=-1, redeploy\_type="default", sync\_alloc=False, root=None).
*   Non-blocking call to check Response Ready:Java:boolean responseReady(NavuContext context,

    String poolName, String id).
*   Read Response:Java:ConfUInt32 idRead(NavuContext context, String poolName, String

    id)Python:id\_read(username, root, pool\_name, allocation\_name).
*   Note: The synchronous pool feature is not compatible with synchronous ID allocation. If you need

    to use a synchronous flow, you can utilize the requested-id feature to allocate the same ID from both pools.

</details>

### Security

The NSO ID Allocator requires a username to be configured by the service application when creating an allocation request. This username will be used to redeploy the service application once a resource has been allocated. Default NACM rules deny all standard users access to the `/ralloc:resource-pools` list. These default settings are provided in the (`initial_data/aaa_init.xml`) file of the resource-manager package.

It is up to the administrator to add a rule that allows the user to perform the service re-deploy.

The administrator's instructions on how to write these rules are detailed in the [AAA Infrastructure](https://cisco-tailf.gitbook.io/nso-docs/administration/management/aaa-infrastructure).

### Alarms

There are two alarms associated with the ID Allocator:

* **Empty Alarm**: This alarm is raised when the pool is empty, and there are no available IDs for further allocation.
* **Low threshold Reached Alarm**: This alarm is raised when the pool is nearing empty, e.g., there is only 10% or fewer left in the pool.

### CDB Upgrade from Package version below 4.0.0

Since the Resource Manager's version 4.0.0, the operational data model is not compatible with the previous version. In version 4.0.0 Yang model, there is a new element called `allocationId` added for `/Id-allocator/pool/allocation` to support sync ID allocation. The system will run the upgrade script automatically (when the Resource Manager of the new version is loaded) if there is a Yang model change in the new version. Users can also run the script manually for Resource Manager from 3.5.6 (or any version below 4.0.0) to version 4.0.0 or above; the script will add the missing `allocationId` element in the CDB operational data path `/id-allocator/pool/allocation`. The upgrade Python script is located in the Resource Manager package: `python/resource_manager/rm_upgrade_nso.py`.

{% hint style="warning" %}
After running the script manually to update CDB, the user must request `package reload` or `restart ncs` to reload new CBD data into the ID Pool java object in memory. For example, in the NSO CLI console: `admin@ncs> request packages reload force`.
{% endhint %}

### The `id-allocator-tool` Action

A set of debug and data tools (contained in `rm-action/id-allocator-tool` action) is available to help admin or support to operate on RM data. Two parameters in the `id-allocator-tool` action can be provided: `operation`, `pool`. All the process info and results will be logged in `ncs-java-vm.log`, and the action itself just returns the result. Here is a list of the valid operation values for the `id-allocator-tool` action:

* `check_missing_report`: Scan the current resource pool and ID pool in the system, and identify and report the missing element for each id-allocator entry without fixing.
* `fix_missing_allocation_id`: Add the missing allocation ID for each ID allocator entry.
* `fix_missing_owner`: Add the missing owner info for each ID allocator entry.
* `fix_missing_allocation`: Create the missing allocation entry in the ID allocator for each ID pool allocation response/id.
* `fix_response_id`: Scan the ID pool and check if the allocation contains an invalid allocation request ID, and release the allocation from the ID pool if found. It happens for sync allocation when the device configuration fails after a successful ID allocation and then causes a service transaction fail. This leaves the ID pool containing successfully allocated ID while the allocation request response doesn't exist
* `persistAll`: Manually sync from ID pool in memory to ID allocator in CDB.
* `printIdPool`: Print the current ID pool data in `ncs-java-vm.log` for debugging purposes.

#### Action Usage Example

Note that when a pool parameter is provided, the operation will be on this specific ID pool, and if no pool is provided, the operation will be running on all ID pools in the system.

```
admin@ncs> unhide debug
admin@ncs> request rm-action id-allocator-tool operation fix_missing_allocation
admin@ncs> request rm-action id-allocator-tool operation printIdPool pool multiService
```

## NSO IP Address Allocator Deployment

This section contains deployment information and procedures for the Tail-f NSO IP Adress Allocator (`ipaddress-allocator`) application.

### Overview

The NSO IP Address Allocator application contains an IP address allocator that use the Resource Manager API to provide IP address allocation. It uses a RAM-based allocation algorithm that stores its state in CDB as oper data.

The file `resource-manager/src/java/src/com/tailf/pkg/ipaddressallocator/IPAddressAllocator.java` contains the part that deals with the resource manager APIs whereas the RAM-based IP address allocator resides under `resource-manager/src/java/src/com/tailf/ pkg/ipam`.

The `IPAddressAllocator` class subscribes to five points in the DB:

* `/ralloc:resource-pools/ip-address-pool`: To be notified when new pools are created/deleted. It needs to create/delete instances of the IPAddressPool class. Each instance of the IPAddressPool handles one pool.
* `/ralloc:resource-pools/ip-address-pool/subnet`: To be notified when subnets are added/removed from an existing address pool. When a new subnet is added, it needs to invoke the `addToAvailable` method of the right `IPAddressPool` instance. When a pool is removed, it needs to reset all existing allocations from the pool, create new allocations, and re-deploy the services that had the allocations.
* `/ralloc:resource-pols/ip-address-pool/exclude`: To detect when new exclusions are added and when old exclusions are removed.
* `/ralloc:resource-pols/ip-address-pool/range`: To be notified when ranges are added to or removed from an address pool.
* `/ralloc:resource-pols/ip-address-pool/allocation`: To detect when new allocation requests are added and when old allocations are released. When a new request is added, the right size of the subnet is allocated from the `IPAddressPool` instance and the result is written to the response/subnet leaf, and finally, the service is redeployed.

### Examples

This section presents some simple use cases of the NSO IP Address Allocator. It uses the C-style CLI.

<details>

<summary>Create an IP Pool</summary>

Creating an IP pool requires the user to specify a list of subnets (identified by a network address and a CIDR mask), a list of IP ranges (identified by its first and last IP address), or a combination of the two to be handled by the pool.&#x20;

The following CLI interaction shows an allocation where a pool `pool1` is created, and the subnet 10.0.0.0/24 and the range 192.168.0.0 - 192.168.255.255 is added to it.

```
admin@ncs# resource-pools ip-address-pool pool1 subnet 10.0.0.0 24
admin@ncs# resource-pools ip-address-pool pool1 range 192.168.0.0 192.168.255.255
```

</details>

<details>

<summary>Create an Allocation Request for a Subnet</summary>

Since we have already populated one of our pools, we can now start creating allocation requests. In the CLI interaction below, we request to allocate a subnet with a CIDR mask of 30 in the pool `pool1`.

```
admin@ncs# resource-pools ip-address-pool pool1 allocation a1 username \
myuser request subnet-size 30
```

</details>

<details>

<summary>Create an Allocation Request for a Subnet Shared by Multiple Services</summary>

Allocations can be shared by multiple services by requesting the same subnet and using the same allocation ID. All instance services in the `allocating-service` leaf-list will be redeployed when the resource has been allocated. The CLI interaction below shows how to allocate a subnet shared by two services.&#x20;

```
admin@ncs# resource-pools ip-address-pool pool1 allocation a1 allocating-service \
/services/vl:loop[name='myservice1'] user myuser request subnet-size 30
admin@ncs# resource-pools ip-address-pool pool1 allocation a1 allocating-service \
/services/vl:loop[name='myservice2'] user myuser request subnet-size 30
admin@ncs# commit
```

The allocation resource gets freed once all allocating services in the `allocating-service` leaf-list deletes the allocation request.

</details>

<details>

<summary>Create a Static Allocation Request for a Subnet</summary>

If you need a specific IP or range of IPs for an allocation, now you can use the optional `subnet-start-ip` leaf, together with the `subnet-size`. The allocator will go through the available subnets in the requested pool and will look for a subnet containing the `subnet-start-ip` and which can also fit the `subnet-size`.

```
admin@ncs# resource-pools ip-address-pool pool1 allocation a2 username \
myuser request subnet-start-ip 10.0.0.36 subnet-size 32
```

The `subnet-start-ip` has to be the first IP address out of a subnet with the size `subnet-size`:

* Valid: `subnet-start-ip 10.0.0.36 subnet-size 30`, IP range 10.0.0.36 to 10.0.0.39.
* Invalid: `subnet-start-ip 10.0.0.36 subnet-size 29`, IP range 10.0.0.32 to 10.0.0.39.

If the `subnet-start-ip`/`subnet-size` pair does not give a subnet range starting with `subnet-start-ip`, the allocation will fail.

</details>

<details>

<summary>Create a Synchronous Allocation Request for a Subnet</summary>

Synchronous allocation can be requested through various Java APIs provided in `resource-manager/ src/java/src/com/tailf/pkg/ipaddressallocator/IPAddressAllocator.java` and Python API provided in `resource-manager/python/resource_manager/ ipadress_allocator.py`.

*   Request:Java:void subnetRequest(ServiceContext context, NavuNode service, RedeployType

    redeployType, String poolName, String username, String startIp, int cidrmask, String id, boolean

    invertCidr, boolean sync\_alloc).
*   Request:Python:def net\_request(service, svc\_xpath, username, pool\_name, allocation\_name,

    cidrmask, invert\_cidr=False, redeploy\_type="default", sync\_alloc=False, root=None).
*   Non-blocking call to check Response Ready:Java:boolean responseReady(NavuContext context,

    String poolName, String id).
*   Read Response:Java:ConfIPPrefix subnetRead(NavuContext context, String poolName, String

    id)Python:def net\_read(username, root, pool\_name, allocation\_name).

</details>

<details>

<summary>Read the Response to an Allocation Request</summary>

The response to an allocation request comes in the form of operational data written to the path `/ resource-pools/ip-address-pool/allocation/response`. The response container contains a choice with two cases, `ok` and `error`. If the allocation failed, the `error` case will be set and an error message can be found in the leaf `error`. If the allocation succeeded, the `ok` case will be set and the allocated subnet will be written to the leaf subnet and the subnet from which the allocation was made will be written to the leaf `from`. The following CLI interaction shows how to view the status of the current allocation requests.

```
admin@ncs# show resouce-pools
```

The table below (Subnet Allocation) shows that a subnet with a CIDR of 30 has been allocated from the subnet 10.0.0.0/24 in `pool1`.

```
| NAME    | ID   | ERROR | SUBNET        | FROM          |
| ------- | ---- | ----- | ------------- | ------------- |
| `pool1` | `a1` | -     | `10.0.0.0/30` | `10.0.0.0/24` |
```

</details>

<details>

<summary>Automatic Redeployment of Service</summary>

An allocation request may contain references to services that are to be redeployed whenever the status of the allocation changes. The following status changes trigger redeployment.

* Allocation response goes from no case to some case (`ok` or `error`).
* Allocation response goes from one case to the other.
* Allocation response case stays the same but the leaves within the case change. Typically because a reallocation was triggered by configuration changes in the IP pool.

The service references are set in the `allocating-service` leaf-list, for example:

```
admin@ncs# resource-pools ip-address-pool pool1 allocation a1 allocating-service \
/services/vl:loop[name='myservice'] username myuser request subnet-size 30
```

</details>

### Security

The NSO IP Address Allocator requires a username to be configured by the service applications when creating an allocation request. This username will be used to redeploy the service applications once a resource has been allocated. The default NACM rules deny all standard users access to the `/ ralloc:resource-pools` list. These default settings are provided in the (`initial_data/ aaa_init.xml`) file of the Resource Manager package.

### Alarms

There are two alarms associated with the IP Address Allocator:

* **Empty Alarm**: This alarm is raised when the pool is empty, and there are no available IPs that can be allocated.
* **Low Threshold Reached Alarm**: This alarm is raised when the pool is nearing empty, e.g., there are only 10% or fewer separate IPs left in the pool.

### The `ip-allocator-tool` Action

A set of debug and data tools contained in the `rm-action/ip-allocator-tool` action is available to help the admin or support personnel to operate on the RM data. Two parameters in the `ip-allocator-tool` action can be provided: `operation`, `pool`. All the process info and the results will be logged in `ncs-java-vm.log`, and the action itself just returns the result. Here is a list of the valid operation values for the `ip-allocator-tool` action.

* `fix_response_ip`: Scan the IP pool to check if the allocation contains an invalid allocation request ID, and release the allocation from the IP pool, if found. It happens for sync allocation when the device configuration fails after a successful IP allocation and then causes a service transaction to fail. This leaves the IP pool to contain successfully allocated IP while the allocation request response doesn't exist.
* `printIpPool`: Print the current IP pool data in the `ncs-java-vm.log` for debugging purposes.

#### Action Usage Example

Note that when a pool parameter is provided, the operation will be on this specific IP pool.

```
admin@ncs> unhide debug
admin@ncs> request rm-action ip-allocator-tool operation fix_response_ip pool multiService
admin@ncs> request rm-action ip-allocator-tool operation printIpPool pool multiService
```

## NSO Resource Manager Data Models

This section covers the NSO Resource Manager data models.

<details>

<summary>Resource Allocator Model</summary>

```
module resource - allocator {
    namespace "http://tail-f.com/pkg/resource-allocator";
    prefix "ralloc";

    import tailf - common {
        prefix tailf;
    }
    import ietf - inet - types {
        prefix inet;
    }
    organization "Tail-f Systems";
    description
        "This is an API for resource allocators.
    An allocation request is signaled by creating an entry in the
    allocation list.
    The response is signaled by writing a value in the response
    leave(s).The responder is responsible
    for re - deploying the
    allocating owners after writing the result in the response
    leaf.

    We expect a specific allocator package to do the following:
        1. Subscribe to changes in the allocation list and look
    for create operations.
        2. Perform the allocation and respond by writing the result
        into the response leaf, and then invoke the re - deploy
        action of the services pointed to by the owners leaf - list.

    Most allocator packages will want to annotate this model with
    additional pool definition data.
    ";

    revision 2022 - 03 - 11 {
        description
            "support multi-service and synchronous allocation request.";
    }

    revision 2020 - 07 - 29 {
        description
            "1.1
        Enhancements:
            -Add 'redeploy-type'
        option
        for service redeploy action.
        If not provided, the 'default'
        is assumed, where the
        redeploy type is chosen based on NSO version.
        ";
    }
    revision 2015 - 10 - 20 {
        description
            "Initial revision.";
    }
    grouping resource - pool - grouping {
        leaf name {
            type string;
            description
                "The name of the pool";
            tailf: info "Unique name for the pool";
        }
        leaf sync - dryrun {
            tailf: hidden debug;
            config false;
            type empty;
        }
        list allocation {
            key id;
            tailf: info "contains all the details of a resource request made from user";
            leaf id {
                type string;
                description "allocation id";
                tailf: info "allocation id.";
            }
            leaf username {
                description
                    "Authenticated user for invoking the service";
                type string;
                mandatory true;
            }
            leaf - list allocating - service {
                type instance - identifier {
                    require - instance false;
                }
                description
                    "Points to the services that own the resource.";
                tailf: info "Instance identifiers of services that own resource";
            }
            leaf sync - alloc {
                tailf: hidden debug;
                tailf: info "process allocation in synchronous flow";
                type empty;
            }
            leaf redeploy - type {
                description "Service redeploy type:
                default, touch, reactive - re - deploy, re - deploy.
                ";
                type enumeration {
                    enum "default";
                    enum "touch";
                    enum "reactive-re-deploy";
                    enum "re-deploy";
                    enum "no-redeploy";
                }
                default "default";
            }
            container request {
                description
                    "When creating a request for a resource the
                implementing package augments here.
                ";
            }
            container response {
                config false;
                tailf: cdb - oper {
                    tailf: persistent true;
                }
                choice response - choice {
                    case error {
                        leaf error {
                            type string;
                            description
                                "Text describing why the allocation request failed";
                        }
                    }
                    case ok {}
                }
                description
                    "The response to the allocation request.";
            }
        }
    }
    container resource - pools {}
    container rm - action {
        tailf: action sync - alloc {
            tailf: hidden debug;
            tailf: actionpoint sync - alloc - action;
            input {
                leaf pool {
                    type string;
                }
                leaf allocid {
                    type string;
                }
                leaf user {
                    type string;
                }
                leaf cidrmask {
                    type uint8 {
                        range "1..128";
                    }
                }
                leaf invertcidr {
                    type boolean;
                }
                leaf owner {
                    type string;
                }
                leaf subnetstartip {
                    type string;
                }
                leaf dryrun {
                    type boolean;
                    default false;
                }
            }
            output {
                leaf allocated {
                    type string;
                    mandatory true;
                }
                leaf subnet {
                    type string;
                }
            }
        }
        tailf: action sync - alloc - id {
            tailf: actionpoint sync - alloc - id - action;
            input {
                leaf pool {
                    type string;
                }
                leaf allocid {
                    type string;
                }
                leaf user {
                    type string;
                }
                leaf owner {
                    type string;
                }
                leaf requestedId {
                    type int32;
                }
                leaf method {
                    type string;
                    default "firstfree";
                }
                leaf sync {
                    type boolean;
                    default false;
                }
                leaf dryrun {
                    type boolean;
                    default false;
                }
            }
            output {
                leaf allocatedId {
                    type string;
                    mandatory true;
                }
            }
        }
    }
}
```

</details>

<details>

<summary>ID Allocator Model</summary>

```
module id - allocator {
    namespace "http://tail-f.com/pkg/id-allocator";
    prefix idalloc;
    import tailf - common {
        prefix tailf;
    }
    import resource - allocator {
        prefix ralloc;
    }
    include id - allocator - alarms {
        revision - date "2017-02-09";
    }
    organization "Tail-f Systems";
    description
        "This module contains a description of an id allocator for defining pools of id: s.This can
        for instance be used when allocating VLAN ids.
        This module contains configuration schema of the id allocator.For the
        operational schema, please see the id - allocator - oper module.
    ";
    revision 2023 - 11 - 16 {
        description
            "Add action id-allocator-tool.";
    }
    revision 2022 - 03 - 11 {
        description
            "support multi-service and synchronous allocation request.";
    }
    revision 2017 - 08 - 14 {
        description
            "2.2
        Enhancements:
            Removed 'disable', add 'enable'
        for alarms.
        This means that
        if you want alarms you need to enable this explicitly
        now.
        ";
    }
    revision 2017 - 02 - 09 {
        description
            "2.1
        Enhancements:
            Added support
        for alarms
            ";
    }
    revision 2015 - 12 - 28 {
        description "2nd revision. Added support for allocation methods.";
    }
    revision 2015 - 10 - 20 {
        description "Initial revision.";
    }
    grouping range - grouping {
        leaf start {
            type uint32;
            mandatory true;
        }
        leaf end {
            type uint32;
            mandatory true;
            must ". >= ../start" {
                error - message "range end must be greater or equal to range start";
                tailf: dependency "../start";
            }
        }
    }
    // This is the interface
    augment "/ralloc:resource-pools" {
        list id - pool {
            key "name";
            container range {
                description "The range the resource-pool should contain";
                uses range - grouping;
            }
            list exclude {
                tailf: info "list of id resource not available for allocation ";
                key "start end";
                leaf stop - allocation {
                    type boolean;
                    default "false";
                }
                uses range - grouping;
                tailf: cli - suppress - mode;
            }
            uses ralloc: resource - pool - grouping {
                augment "allocation/response/response-choice/ok" {
                    leaf id {
                        type uint32;
                        description "id from pool";
                        tailf: info "id from pool.";
                    }
                }
            }
            container alarms {
                leaf enabled {
                    type empty;
                    description "Set this leaf to enable alarms";
                }
                leaf low - threshold - alarm {
                    type uint8 {
                        range "0 .. 100";
                    }
                    default 10;
                    description "Change the value for when the low threshold alarm is
                    raised.The value describes the percentage IDs left in
                        the pool.The
                    default is to raise the alarm when there
                    are ten(10) percent IDs left in the pool.
                    ";
                }
            }
            description "The state of the id-pool.";
            tailf: info "Id pool";
        }
    }
    //augmenting the request/responses form resource-manager
    augment "/ralloc:resource-pools/id-pool/allocation/request" {
        leaf sync {
            type boolean;
            default "false";
            description "Synchronize allocation with all other allocation
            with same allocation id in other pools ";
            tailf: info "Synchronize allocation id with other pools";
        }
        leaf id {
            type uint32;
            description "The specific id to sync with";
            tailf: info "Request a specific id";
        }
        container method {
            choice method {
                default firstfree;
                case firstfree {
                    leaf firstfree {
                        type empty;
                        description "The default method to allocating a new id
                        is using the first free method.Using this
                        allocation method might mean that an id is reused
                        quickly which might not be what one wants nor is
                        supported in lower layers.
                        ";
                        tailf: info "Default method used to request a new id.";
                    }
                }
                case roundrobin {
                    leaf roundrobin {
                        type empty;
                        description "Pick the next available id using a round
                        robin approach.Earlier used id: s will not be
                        reused until the range is exhausted and allocation
                        restarts from the start of the range again.
                        Note that sync will override round robin.
                        ";
                        tailf: info "Round robin method used to request a new id.";
                    }
                }
            }
        }
    }
    augment "/ralloc:rm-action" {
        tailf: action id - allocator - tool {
            tailf: hidden debug;
            tailf: actionpoint id - allocator - tool - action;
            input {
                leaf pool {
                    type leafref {
                        path "/ralloc:resource-pools/idalloc:id-pool/name";
                    }
                }
                leaf operation {
                    type enumeration {
                        enum printIdPool;
                        enum check_missing_report;
                        enum fix_missing_allocation_id;
                        enum fix_missing_owner;
                        enum fix_missing_allocation;
                        enum fix_response_id;
                        enum persistAll;
                    }
                    mandatory true;
                }
            }
            output {
                leaf result {
                    type string;
                }
            }
        }
    }
}
```

</details>

<details>

<summary>IP Address Allocator Model</summary>

```
module ipaddress - allocator {
    namespace "http://tail-f.com/pkg/ipaddress-allocator";
    prefix ipalloc;
    import tailf - common {
        prefix tailf;
    }
    import ietf - inet - types {
        prefix inet;
    }
    import resource - allocator {
        prefix ralloc;
    }
    include ipaddress - allocator - alarms {
        revision - date "2017-02-09";
    }
    organization "Tail-f Systems";
    description
        "This module contains a description of an IP address allocator for defining
        pools of IPs and allocating addresses from these.
        This module contains configuration schema of the ip allocator.For the
        operational schema, please see the ip - allocator - oper module.
        ";
    revision 2022 - 03 - 11 {
        description
            "support multi-service and synchronous allocation request.";
    }
    revision 2018 - 02 - 27 {
        description
            "Introduce the 'invert' field in the request container that enables
            one to allocate the same size network regardless of the network
            type(IPv4 / IPv6) in a pool by using the inverted cidr.
            ";
    }
    revision 2017 - 08 - 14 {
        description
            "2.2
        Enhancements:
            Removed 'disable', add 'enable'
        for alarms.
        This means that
        if you want alarms you need to enable this explicitly
        now.
        ";
    }
    revision 2017 - 02 - 09 {
        description
            "1.2
        Enhancements:
            Added support
        for alarms
            ";
    }
    revision 2016 - 01 - 29 {
        description
            "1.1
        Enhancements:
            Added support
        for defining pools using IP address ranges.
        ";
    }
    revision 2015 - 10 - 20 {
        description "Initial revision.";
    }
    // This is the interface
    augment "/ralloc:resource-pools" {
        list ip - address - pool {
            tailf: info "IP Address pools";
            key name;
            uses ralloc: resource - pool - grouping {
                augment "allocation/request" {
                    leaf subnet - size {
                        tailf: info "Size of the subnet to be allocated.";
                        type uint8 {
                            range "1..128";
                        }
                        mandatory true;
                    }
                    leaf subnet - start - ip {
                        description
                            "Optional parameter used to request for a particular IP for
                        the allocation(instead of the first available subnet matching the subnet - size).The subnet - start - ip has to be the first IP in the range defined by subnet - size, otherwise the allocation will
                        fail.Ex: subnet - start - ip 10.0 .0 .36 subnet - size 30 gives the
                        equivalent range 10.0 .0 .36 - 10.0 .0 .39, and it 's a valid value.
                        subnet - start - ip 10.0 .0 .36 subnet - size 29 gives the range
                        10.0 .0 .32 - 10.0 .0 .39 and it 's NOT a valid option.";
                        type inet: ip - address;
                    }
                    leaf invert - subnet - size {
                        description
                            "By default subnet-size is considered equal to the cidr, but by
                        setting this leaf the subnet - size will be the\ "inverted\" cidr.
                        I.e: If one sets subnet - size to 8 with this leaf unset 2 ^ 24
                        addresses will be allocated
                        for a IPv4 pool and in a IPv6 pool
                        2 ^ 120 addresses will be allocated.By setting this leaf only
                        2 ^ 8 addresses will be allocated in either a IPv4 or a IPv6
                        pool.
                        ";
                        type empty;
                    }
                }
                augment "allocation/response/response-choice/ok" {
                    leaf subnet {
                        type inet: ip - prefix;
                    }
                    leaf from {
                        type inet: ip - prefix;
                    }
                }
            }
            leaf auto - redeploy {
                tailf: info "Automatically re-deploy services when an IP address is " +
                    "re-allocated";
                type boolean;
                default "true";
            }
            list subnet {
                key "address cidrmask";
                tailf: cli - suppress - mode;
                description
                    "List of subnets belonging to this pool. Subnets may not overlap.";
                must "(contains(address, '.') and cidrmask <= 32) or
                    (contains(address, ':') and cidrmask <= 128)
                " {
                error - message "cidrmask is too long";
            }
            tailf: validate ipa_validate {
                tailf: dependency ".";
            }
            leaf address {
                type inet: ip - address;
            }
            leaf cidrmask {
                type uint8 {
                    range "1..128";
                }
            }
        }
        list exclude {
            key "address cidrmask";
            tailf: cli - suppress - mode;
            description "List of subnets to exclude from this pool. May only " +
                "contains elements that are subsets of elements in the list of " +
                "subnets.";
            tailf: info "List of subnets to exclude from this pool. May only " +
                "contains elements that are subsets of elements in the list of " +
                "subnets.";
            must "(contains(address, '.') and cidrmask <= 32) or
                (contains(address, ':') and cidrmask <= 128)
            " {
            error - message "cidrmask is too long";
        }
        tailf: validate ipa_validate {
            tailf: dependency ".";
        }
        leaf address {
            type inet: ip - address;
        }
        leaf cidrmask {
            type uint8 {
                range "1..128";
            }
        }
    }
    list range {
        key "from to";
        tailf: cli - suppress - mode;
        description
            "List of IP ranges belonging to this pool, inclusive. If your " +
            "pool of IP addresses does not conform to a convenient set of " +
            "subnets it may be easier to describe it as a range. " +
            "Note that the exclude list does not apply to ranges, but of " +
            "course a range may not overlap a subnet entry.";
        tailf: validate ipa_validate {
            tailf: dependency ".";
        }
        leaf from {
            type inet: ip - address - no - zone;
        }
        leaf to {
            type inet: ip - address - no - zone;
        }
        must "(contains(from, '.') and contains(to, '.')) or
            (contains(from, ':') and contains(to, ':'))
        " {
        error - message "IP addresses defining a range must agree on IP version.";
    }
}
container alarms {
    leaf enabled {
        type empty;
        description "Set this leaf to enable alarms";
    }
    leaf low - threshold - alarm {
        type uint8 {
            range "0 .. 100";
        }
        default 10;
        description "Change the value for when the low threshold alarm is
        raised.The value describes the percentage IPs left in
            the pool.The
        default is to raise the alarm when there
        are ten(10) percent IPs left in the pool.
        ";
    }
}
}
}
augment "/ralloc:rm-action" {
    tailf: action ip - allocator - tool {
        tailf: hidden debug;
        tailf: actionpoint ip - allocator - tool - action;
        input {
            leaf pool {
                type leafref {
                    path "/ralloc:resource-pools/ipalloc:ip-address-pool/name";
                }
            }
            leaf operation {
                type enumeration {
                    enum printIpPool;
                    enum fix_response_ip;
                }
                mandatory true;
            }
        }
        output {
            leaf result {
                type string;
            }
        }
    }
}
}
```

</details>

## Further Reading

* The [NSO Packages](https://cisco-tailf.gitbook.io/nso-docs/administration/management/package-mgmt) section in the NSO Administration Guide.&#x20;
* The [AAA Infrastructure](https://cisco-tailf.gitbook.io/nso-docs/administration/management/aaa-infrastructure) section in the NSO Administration Guide.
