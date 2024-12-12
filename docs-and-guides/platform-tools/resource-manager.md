---
description: Manage resource allocation in NSO.
---

# Resource Manager

## NSO Resource Manager Package <a href="#introduction" id="introduction"></a>

The NSO Resource Manager package contains both an API for generic resource pool handling called the `resource allocator`and the two applications utilizing the API. The applications are the `id- allocator` and the `ipaddress-allocator`, explained in separate sections. This version of NSO Resource Manager is 4.2.8 and was released together with NSO version 6.4.

### Background <a href="#d5e17" id="d5e17"></a>

NSO is often used to provision services in the networking layer. It is not unusual that these services require network-level information that is not (or cannot be) part of the instance data provided by the northbound system, so it needs to be fetched from, and eventually released back to a separate system. A common example of this is IP addresses used for layer-3 VPN services. The orchestrator tool is not aware of the blocks of IP addresses assigned to the network but relies on lower layers to fulfill this need.

Some customers have software systems to manage these types of temporary assets. E.g., for IP-addresses they are usually known as IP Address Management (IPAM) systems. There is a whole industry of solutions for such systems, ranging from simple open-source solutions to entire suites integrated with DNS management. See [IP address management](https://en.wikipedia.org/wiki/IP_address_management) for more on this.

There are customers that either don't have an IPAM system for services that are planned for NSO and are not planning to get one for this single purpose. They usually don't want the operational overhead of another system and/or don't see the need of a separate investment.

These customers are looking for NSO to provide basic resource allocation and lifecycle management for the assets required for services managed by NSO. They appreciate the fact that NSO is not an appropriate platform to provide more advanced features from the IPAM world like capacity planning nor to integrate with DNS and DHCP platforms. This means that the NSO Resource Manager does not compete with full-blown systems, but rather is a complementary feature.

### Overview <a href="#d5e25" id="d5e25"></a>

The NSO Resource Manager interface, the `resource allocator`, provides a generic resource allocation mechanism that works well with services and in a high availability (HA) configuration. Expected is implementations of specific resource allocators implemented as separate NSO packages. A service will then have the possibility to use allocator implementations dedicated to different resources.

The YANG model of the resource allocator (`resource-allocator.yang`) can be augmented with different resource pools, as is the case for the two applications `id-allocator` and `ipaddress-allocator`. Each pool has an allocation list where services are expected to create instances to signal that they request an allocation. Request parameters are stored in the `request` container and the allocation response is written in the `response` container.

Since the allocation request may fail the response container contains a choice where one case is for error and one for success.

Each allocation list entry also contains an `allocating-service` leaf-list. These are instance identifiers that point to the services that requested the resource. These are the services that will be redeployed when the resource has been allocated.

The resource allocation packages should subscribe to several points in this `resource-pool` tree. First, they must detect when a new resource pool is created or deleted. Secondly, they must detect when an allocation request is created or deleted. A package may also augment the pool definition with additional parameters, for example, an IP address allocator may wish to add configuration parameters for defining the available subnets to allocate from, in which case it must also subscribe to changes to these settings.

### Installation <a href="#d5e45" id="d5e45"></a>

The installation of this package is done as with any other package, as described in the [NSO Packages](https://cisco-tailf.gitbook.io/nso-docs/administration/management/package-mgmt) section of the Administration Guide.

### Resource Allocator Data Model <a href="#d5e48" id="d5e48"></a>

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

### HA Considerations <a href="#d5e52" id="d5e52"></a>

Looking at `High Availability` there are two things we need to consider - the allocator state needs to be replicated, and the allocation needs only to be performed on one node.

The easiest way to replicate the state is to write it into CDB-oper and let CDB perform the replication. This is what we do in the `ipaddress-allocator`.

We only want the allocator to allocate addresses on the primary node. Since the allocations are written into CDB they will be visible on both primary and secondary nodes, and the CDB subscriber will be notified on both nodes. In this case, we only want the allocator on the primary node to perform the allocation.

We therefore read the HA mode leaf from CDB to determine which HA mode the current subscriber is running in; if HA mode is not enabled, or if HA mode is enabled and the current node is primary we proceed with the allocation.

### Synchronous Allocation <a href="#d5e60" id="d5e60"></a>

This synchronized allocation API request uses a reactive fast map, so the user can allocate resources and still keep a synchronous interface. It allocates resources in the create callback, at that moment everything we modify in the database is part of the service intent and fast map. We need to guarantee that we have used a stable resource and communicate to other services, which resources we have used. So, during the create callback, we store what we have allocated. Other services that are evaluated within the same transaction which runs subsequent to ours will see allocations, when our service is redeployed, it will not have to create the allocations again.

When an allocation raises an exception in case the pool is exhausted, or if the referenced pool does not exist in the CDB, `commit` will get aborted. Synchronous allocation doesn't require service `re-deploy` to read allocation. The same transaction can read allocation, `commit dry-run` or `get-modification` should show up the allocation details as output.

`Synchronous allocation is only supported through Java and Python APIs provided by resource-manager.`

## NSO ID Allocator Deployment

This section explores deployment information and procedures for the `NSO ID Allocator`. The `NSO Resource ID Allocator` is an extension of the generic resource allocation mechanism called the `NSO Manager`. It can allocate integers which can serve for instance as VLAN identifiers.

### Overview

The `ID Allocator` can host any number of ID pools. Each pool contains a certain number of IDs that can be allocated. They are specified by a range, and potentially broken into several ranges by a list of excluded ranges.

The `ID allocator` YANG models are divided into a configuration data-specific model (`idallocator.yang`), and an operational data-specific model (`id-allocator-oper.yang`). Users of this package will request allocations in the configuration tree. The operational tree serves as an internal data structure of the package.

An ID request can allocate either the lowest possible ID in a pool or a specified (by the user) value, such as 5 or 1000.

Allocation requests can be synchronized between pools. This synchronization is based on the ID of the allocation request itself (such as for instance `allocation1`), the result is that the allocations will have the same allocated value across pools.

### Examples

This section presents some simple use cases of the NSO presented using Cisco-style CLI.

#### Create an ID Pool

The CLI interaction below depicts how it is possible to create a new ID pool and assign it a range of values from 100 to 1000.

```
admin@ncs# resource-pools id-pool pool1 range start 100 end 1000
admin@ncs# commit
```

#### Create an Allocation Request

When a pool has been created, it is possible to create allocation requests on the values handled by a pool. The CLI interaction below shows how to allocate a value in the pool defined above.

```
admin@ncs# resource-pools id-pool pool1 allocation a1 user myuser
admin@ncs# commit
```

At this point, we have a pool with a range of 100 to 1000 and one allocation (100). This is shown in the table below (Pool Range 100-1000).

<table><thead><tr><th width="108">NAME</th><th width="85">START</th><th width="78">END</th><th width="98">START</th><th width="97">END</th><th width="104">START</th><th width="88">END</th><th>ID</th></tr></thead><tbody><tr><td><code>pool1</code></td><td>-</td><td>-</td><td></td><td></td><td><code>101</code></td><td><code>1000</code></td><td><code>100</code></td></tr></tbody></table>

#### Create an Allocation Request Shared by Multiple Services

Allocations can be shared by multiple services by requesting the same allocation ID from all the services. All instance services in the `allocating-service` leaf-list will be redeployed when the resource has been allocated. The CLI interaction below shows how to allocate an ID shared by two services.

```
admin@ncs# resource-pools id-pool pool1 allocation a1 allocating-service \
           /services/vl:loop[name='myservice1'] user myuser
admin@ncs# resource-pools id-pool pool1 allocation a1 allocating-service \
           /services/vl:loop[name='myservice2'] user myuser
admin@ncs# commit
```

The allocation resource gets freed once all allocating services in the `allocating-service` leaf-list delete the allocation request.

#### Create a Synchronized Allocation Request

Allocations can be synchronized between pools by setting `request sync` to `true` when creating each allocation request. The allocation ID, which is `b` in this CLI interaction, determines which allocations will be synchronized across pools.

```
admin@ncs# resource-pools id-pool pool2 range start 100 end 1000
admin@ncs# resource-pools id-pool pool1 allocation b user myuser request sync true
admin@ncs# resource-pools id-pool pool2 allocation b user myuser request sync true
admin@ncs# commit
```

As can be seen in the table below (Synchronized Pools), the allocations `b` (in `pool1` and in `pool2`) are synchronized across pools `pool1` and `pool2` and receive the ID value of 1000 in both pools.

<table><thead><tr><th width="112">NAME</th><th width="88">START</th><th width="79">END</th><th width="85">START</th><th width="77">END</th><th width="95">START</th><th width="78">END</th><th>ID</th></tr></thead><tbody><tr><td><code>pool1</code></td><td>-</td><td>-</td><td></td><td></td><td><code>101</code></td><td><code>999</code></td><td><code>100</code></td></tr><tr><td></td><td>-</td><td>-</td><td></td><td></td><td></td><td></td><td><code>1000</code></td></tr><tr><td><code>pool2</code></td><td>-</td><td>-</td><td></td><td></td><td><code>101</code></td><td><code>999</code></td><td><code>1000</code></td></tr></tbody></table>

#### Update Request ID

The element allocation/request/ID can be created and changed, then the previously allocated ID will be released and a new ID will be allocated depending on the new value of allocation/request/ID. In the case of a delete request/ID, the previously allocated ID will be retained.

```
admin@ncs# set resource-pools id-pool testPool allocation testAlloc username admin
admin@ncs# commit
admin@ncs# set resource-pools id-pool testPool allocation testAlloc request id 150
admin@ncs# commit
admin@ncs# set resource-pools id-pool testPool allocation testAlloc request id 180
admin@ncs# commit
```

#### Request an ID using the Round Robin Method

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

{% hint style="info" %}
Note that the request method is set on a per-request basis. Two different requests may request IDs from the same pool using different request methods.
{% endhint %}

