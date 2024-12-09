---
description: Manage resource allocation in NSO.
---

# Resource Manager

## Introduction <a href="#introduction" id="introduction"></a>

NSO Resource Manager package contains both an API for generic resource pool handling called `resource allocator`, and two applications utilizing the API. The applications are the `id-allocator` and the `ipaddress-allocator`, explained in separate chapters. This version of NSO Resource Manager is 4.2.0 and was released together with NSO version 6.1.

## Background <a href="#d5e17" id="d5e17"></a>

NSO is often used to provision services in the networking layer. It is not unusual that these services require network-level information that is not (or cannot be) part of the instance data provided by the northbound system, so it needs to be fetched from, and eventually released back to a separate system. A common example of this is IP addresses used for layer-3 VPN services. The orchestrator tool is not aware of the blocks of IP addresses assigned to the network but relies on lower layers to fulfill this need.

Some customers have software systems to manage these types of temporary assets. E.g. for IP addresses, they are usually known as IP Address Management (IPAM) systems. There is a whole industry of solutions for such systems, ranging from simple open-source solutions to entire suites integrated with DNS management. See [https://en.wikipedia.org/wiki/IP\_address\_management](https://en.wikipedia.org/wiki/IP_address_management) for more on this.

There are customers that either don't have an IPAM system for services that are planned for NSO and are not planning to get one for this single purpose. They usually don't want the operational overhead of another system and/or don't see the need of a separate investment.

These customers are looking for NSO to provide basic resource allocation and lifecycle management for the assets required for services managed by NSO. They appreciate the fact that NSO is not an appropriate platform to provide more advanced features from the IPAM world like capacity planning nor to integrate with DNS and DHCP platforms. This means that the `NSO Resource Manager` does not compete with full-blown systems, but rather is a complementary feature.

## Overview <a href="#d5e25" id="d5e25"></a>

The `NSO Resource Manager` interface, the `resource allocator`, provides a generic resource allocation mechanism that works well with `services` and in a high availability (HA) configuration. Expected are implementations of specific resource allocators implemented as separate NSO packages. A `service` will then have the possibility to use allocator implementations dedicated to different resources.

The YANG model of the `resource allocator` (`resource-allocator.yang`) can be augmented with different resource pools, as is the case for the two applications `id-allocator` and `ipaddress-allocator`. Each pool has an `allocation` list where services are expected to create instances to signal that they request an allocation. Request parameters are stored in the `request` container and the allocation response is written in the `response` container.

Since the allocation request may fail the response container contains a choice where one case is for error and one for success.

Each allocation list entry also contains an `allocating-service` leaf-list. These are instance identifiers that point to the services that requested the resource. These are the services that will be redeployed when the resource has been allocated.

Resource allocation packages should subscribe to several points in this `resource-pool` tree. First, they must detect when a new resource pool is created or deleted, secondly, they must detect when an allocation request is created or deleted. A package may also augment the pool definition with additional parameters, for example, an IP address allocator may wish to add configuration parameters for defining the available subnets to allocate from, in which case it must also subscribe to changes to these settings.

## Installation <a href="#d5e45" id="d5e45"></a>

Installation of this package is done as with any other package, as described in the [NSO Packages](https://cisco-tailf.gitbook.io/nso-docs/administration/management/package-mgmt) section in the Administration Guide.

## Resource Allocator Data Model <a href="#d5e48" id="d5e48"></a>

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

Looking at `High Availability` there are two things we need to consider - the allocator state needs to be replicated, and the allocation needs only to be performed on one node.

The easiest way to replicate the state is to write it into CDB-oper and let CDB perform the replication. This is what we do in the `ipaddress-allocator`.

We only want the allocator to allocate addresses on the primary node. Since the allocations are written into CDB they will be visible on both primary and secondary nodes, and the CDB subscriber will be notified on both nodes. In this case, we only want the allocator on the primary node to perform the allocation.

We therefore read the HA mode leaf from CDB to determine which HA mode the current subscriber is running in; if HA mode is not enabled, or if HA mode is enabled and the current node is primary we proceed with the allocation.

## Synchronous Allocation <a href="#d5e60" id="d5e60"></a>

This synchronized allocation API request uses a reactive fast map, so the user can allocate resources and still keep a synchronous interface. It allocates resources in the create callback, at that moment everything we modify in the database is part of the service intent and fast map. We need to guarantee that we have used a stable resource and communicate to other services, which resources we have used. So, during the create callback, we store what we have allocated. Other services that are evaluated within the same transaction which runs subsequent to ours will see allocations, when our service is redeployed, it will not have to create the allocations again.

When an allocation raises an exception in case the pool is exhausted, or if the referenced pool does not exist in the CDB, `commit` will get aborted. Synchronous allocation doesn't require service `re-deploy` to read allocation. The same transaction can read allocation, `commit dry-run` or `get-modification` should show up the allocation details as output.

`Synchronous allocation is only supported through Java and Python APIs provided by resource-manager.`
