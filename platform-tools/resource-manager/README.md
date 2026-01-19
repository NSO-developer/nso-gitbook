---
description: Manage resource allocation in NSO.
icon: scanner-touchscreen
---

# Resource Manager (5.0)

The NSO Resource Manager implements assignment of individual resources, such as VLAN numbers or IP addresses, from a pool of values defined in NSO. Since the implementation and pool definitions live in NSO, it presents a simple, lightweight alternative to integrating with external purpose-built systems.

The package provides support for management of two types of resources out of the box:

* [id-allocator.md](id-allocator.md "mention") for numeric resources, such as VLANs.
* [ip-allocator.md](ip-allocator.md "mention") for managing IP addresses and prefixes.

{% hint style="info" %}
The latest version of NSO Resource Manager is 5.0. It is recommended to always upgrade to the latest version of the package to access new features and stay up to date with security updates.
{% endhint %}

## Introduction <a href="#d5e17" id="d5e17"></a>

NSO is often used to provision services in the networking layer. It is not unusual that these services require network-level information that is not, or cannot be, part of the initial instance data provided by, say, the northbound system. The values need to be fetched from, and eventually released back to, a central system. Common examples are IP addresses used for various VPN services. The northbound system is not aware of the blocks of IP addresses assigned to the network but relies on lower layers to find the right values.

Some deployments have software systems to manage these types of dynamically-assigned assets. For example, IP addresses are traditionally managed in separate IP Address Management (IPAM) systems. These systems range from simple open-source solutions to entire suites integrated with DNS management. See [IP address management](https://en.wikipedia.org/wiki/IP_address_management) for more information.

However, reliance on an external IPAM directly in the provisioning path brings many challenges:

1. Real-time dependency on the IPAM system; requires the IPAM to be up and reachable to provision the network.
2. Complex integration workflow that must handle allocation and deallocation; connecting to the external system, retrying in case of transient failures, deciding when to give up when IPAM becomes unreachable, and so on.
3. Hard to test and change (develop) the solution as it requires a separate IPAM instance.

Having the ability to allocate resources inside NSO allows you to create better service abstractions, expressing as much network config as possible with as little service config as possible. It allows you to remove IP addresses and IDs from service inputs and other "cruft". Ideally, the topmost service expresses only customer-relevant intent.

The service should either allocate any resource provided to it, or if nothing is provided, find an available resource and use that. Either way, it needs to make sure that the necessary resources are allocated and not colliding with others. With the NSO Resource Manager, the service can directly manage the resource allocation lifecycle in a simple way.

{% hint style="info" %}
In case integration with an external IPAM is required, it is still possible to retain most of the benefits of using the NSO Resource Manager; the external IPAM allocates a block of resources to NSO Resource Manager, which then sub-allocates the resources from this block. If individual allocations need to be propagated back to IPAM, that can then be done either asynchronously or as the last step of provisioning.
{% endhint %}

## Installation <a href="#d5e45" id="d5e45"></a>

The installation consists of downloading, extracting, and installing the Resource Manager package, as described in the [NSO Packages](https://nso-docs.cisco.com/guides/administration/management/package-mgmt) section of the Administration Guide.

## Overview of Operation <a href="#d5e25" id="d5e25"></a>

The NSO Resource Manager defines a top-level `resource-pools` data model. Each allocation mechanism extends this data model with its particular resource type, such as IP or ID resource pools, and provides the logic for allocating individual resources.

Typically an administrator configures available resources as one or more pools of a given type, then  services and other clients create allocation requests. Assigned resources are stored in the `allocation` list of each resource pool.

Suppose there is an ID resource pool for VLAN assignment:

```
resource-pools id-pool vlans
 range start 100
 range end 199
!
```

Usually the allocation happens in service mapping code, through programmatic API. However, you can manually allocate a new resource from a pool using the corresponding `find-*` helper action. For ID allocation, the action is `find-id`:

```sh
admin@ncs# resource-pools find-id allocation-name my_first_id\
 pool [ vlans ] allocate 
success true
resource 100
message Resource found
```

This same mechanism can be used to pre-allocate or reserve resources. The unique `allocation-name` is a way to refer to a specific allocation request. It allows a service to find its pre-allocated value, as well as obtain the same resource across service redeploys.

Since the allocation request may fail, such as when there are no resources left in the pool, the action response contains the `success` leaf and, in case of successful allocation, the assigned resource. &#x20;

Upon allocating a resource, the `allocation` list of the resource pool is updated:

```
resource-pools id-pool vlans
 range start 100
 range end 199
 allocation my_first_id
  resource 100
 !
!
```

When used programmatically as part of service provisioning, each allocation entry will also contain an `allocating-service` leaf-list, making it easier to correlate resources with their respective services. See individual allocation mechanisms for detailed use of the programmatic API.

### Allocation Options

When performing an allocation using the allocation action or programmatic API, you can specify multiple resource pools. The pools must be of the same type. The allocation procedure then tries to allocate the same resource in all the specified pools.

A pool can also define an allocation method for resources. If unspecified, the default is the "first-free" method, due to historical reasons. This method tries to reuse the lowest available resources first, which usually results in quick reuse of just-released resources and thus minimizes fragmentation. In scenarios, where this is undesirable, "sequential" (round-robin) allocation method allocates resources one-by-one, minimizing reuse instead. For example:

```
resource-pools id-pool vlans
 range start 100
 range end 199
 allocation-method sequential
!
```

Some allocator mechanisms also provide additional options, such as the possibility of ID allocator to allocate only odd or even values.

Options for all allocation requests (regardless of allocating mechanism):

* `allocation-name`: Unique name for the allocation.
* `pool`: A pool to allocate resources from. Some mechanisms support specifying multiple pools.
* `resource`: The desired resource value to allocate. May be unspecified to assign automatically.

### Deallocation <a href="#d5e52" id="d5e52"></a>

To release resources back to the pool, you must delete the entry in the `allocation` list. This is necessary for manually allocated resources; for service-allocated resources that use the programmatic API, this is done automatically by the FASTMAP algorithm on service removal.

Example of manually releasing resources:

```
admin@ncs(config)# no resource-pools id-pool vlans allocation my_first_id
admin@ncs(config)# commit
```

## Alarms <a href="#d5e52" id="d5e52"></a>

As the resource pool may run out of available resources, Resource Manager may raise an alarm if a pool has alarms configured:

* `pool-exhausted`: This alarm is raised when the pool is empty, that is, there are no available resources left for further allocation and the next request is likely to fail (unless resources are deallocated in the mean time).
* `pool-low-threshold-reached`: This alarm is raised when the pool is nearing the configured limit, such as only 10% or fewer resources left in the pool.

Enable alarms and configure low threshold for the pool under pool's `alarms` container. For example:

```
resource-pools id-pool vlans
 range start 100
 range end 199
 alarms enabled
 alarms low-threshold-alarm 10
!
```

## General Considerations <a href="#d5e52" id="d5e52"></a>

The Resource Manager is designed to be safe for use in High Availability NSO setups.

Since version 5.0, it uses a purely synchronous interface, allowing for simple usage directly from service create callbacks.

Using the programmatic API requires that a service package references the Resource Manager code. This is achieved by specifying the Resource Manager as a required package in the `package-meta-data.xml` file:

```
  <required-package>
    <name>resource-manager</name>
  </required-package>
```

Consult the included example for a working service package that performs allocation using the programmatic API.
