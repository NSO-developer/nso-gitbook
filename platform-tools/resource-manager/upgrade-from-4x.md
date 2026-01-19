---
description: Migrate from Resource Manager 4.x to 5.
---

# Upgrade from 4.x

Resource Manager 5.0 introduces the `find-id` and `find-ip` actions and thus no longer requires committing the allocation request before a resource is assigned. This approach makes the allocation process fully synchronous, greatly simplifying operation and integration with application code.

However, this change is not backward compatible with existing application/service code:

* You can no longer make an allocation request by directly configuring the Resource Manager data model, e.g. creating `/resource-manager/*-pool/allocation` entry.
* The location of the assigned resource value in the data model has changed to `/resource-manager/*-pool/allocation/resource`.
* The programmatic API has changed to use an interface that returns the requested value directly.
* Resource Manager no longer supports automatically redeploying services.

At the same time, the internal data model has also changed but the upgrade component migrates the data to the new format, preserving existing allocations.

## Upgrade Procedure

Further, we recommend to minimize package changes during migration, focusing solely on Resource Manager-related updates.

## Suggested Code Updates

### Data Model Reliance

If your code currently works directly with the data in `/resource-manager/*-pool/allocation`, you will need to use the new API or `find-id` / `find-ip` actions instead.

Example Python service code that no longer works:

```python
pool = root.resource_manager.id_pool['some-pool']
allocation = pool.allocation.create(allocation_name)
allocation.username = service_user
allocation.allocating_service = service_xpath
allocation.request.oddeven_alloc = 'even'

value = allocation.response.id
if not value:
    # wait for allocation
    return proplist
```

Should be migrated to:

```python
rm_allocator = resource_manager.service.Allocator(service)
value = (rm_allocator.id()
    .pool('some-pool')
    .even()
    .allocate(allocation_name)
)
```

For code outside service callbacks, you can invoke the action directly:

```python
action = root.resource_pools.find_id
args = action.get_input()
args.pool = ['some-pool']
args.allocation_name = allocation_name
args.allocate.create()

result = action(args)
if result.success:
    value = result.resource
```

### Updated Python API

Example Python service code that no longer works:

```python
resource_manager.id_allocator.id_request(
    service,
    service_xpath,
    service_user,
    'some-pool',
    allocation_name,
    oddeven_alloc='even'
)
value = resource_manager.id_allocator.id_read(service_user, root,
                                              'some-pool', allocation_name)
if value is None:
    # wait for allocation
    return proplist
```

Should be migrated to:

```python
rm_allocator = resource_manager.service.Allocator(service)
value = (rm_allocator.id()
    .pool('some-pool')
    .even()
    .allocate(allocation_name)
)
```

### Updated Java API

Example Java service code that no longer works:

```java
IdAllocator.idRequest(service, "some-pool", serviceUser, allocationName, false,
                      IdType.EVEN);

if (IdAllocator.responseReady(service.context(), cdb, "some-pool", allocationName)) {
    long value = IdAllocator.idRead(cdb, "some-pool", allocationName).longValue();
} else {
    /* Wait for allocation */
    return opaque;
}
```

Should be migrated to:

```java
Allocator rm_allocator = Allocator(context);
long value = rm_allocator.id()
    .pool("some-pool")
    .even()
    .allocate(allocationName)
    .bigIntegerValue()
    .longValueExact();
```

### Allocations Using Pool Sync

If your allocations currently make use of the `/resource-pools/id-pool/allocation/request/sync`  feature, you can achieve the same outcome by providing the list of resource pools to the new API.

Example allocation request that no longer works:

```shellscript
admin@ncs(config)# resource-pools id-pool some-pool allocation <allocationName>\
 request sync true
admin@ncs(config)# resource-pools id-pool another-pool allocation <allocationName>\
 request sync true
```

Should be migrated to:

```shellscript
admin@ncs# resource-pools find-id allocation-name <allocationName>\
 pool [ some-pool another-pool ] allocate 
```

### Synchronous Operation

If your service code relies on the asynchronous operation of Resource Manager for anything other than resource allocation by the `id-allocator` or `ip-address-allocator`, you should use [Nano Services](https://nso-docs.cisco.com/guides/development/core-concepts/nano-services).

