---
description: Manage numeric ID allocation in NSO.
---

# ID Allocator

The NSO Resource Manager ID Allocator allocates integer numbers. These numbers can serve as various identifiers, such as VLAN IDs, either directly or through some mapping transformation.

Additional features:

* Supports odd and even parity for allocation, which produces an odd or even number, as requested.

## Pool Definition

Each ID pool is a named configuration item under `/resource-pools/id-pool` and is defined by the `range start` and `range end` parameters. The two parameters specify the first and the last available value in the pool. The pool may consist of a single value, when the two parameters are the same.

```
admin@ncs(config)# resource-pools id-pool some-pool range start 1 end 1000
admin@ncs(config)# commit
```

Additionally, non-overlapping exclusion ranges may be defined for a pool. The values from the exclusion ranges are not available for allocation.

```
admin@ncs(config)# resource-pools id-pool some-pool exclude range 110 120
admin@ncs(config)# resource-pools id-pool some-pool exclude range 170 170
admin@ncs(config)# commit
```

```
resource-pools id-pool some-pool
 range start 100
 range end 199
 exclude 110 120
 exclude 170 170
```

## Allocate Action

Manual allocation or pre-allocation is possible with the use of the `/resource-pools/find-id` action. If `allocate` parameter is specified, the allocation is persisted right away. Otherwise, a free resource is returned if found, however, it is **not** allocated.

```shell
admin@ncs# resource-pools find-id allocation-name my-value pool [ some-pool ]
```

See [#allocation-options](./#allocation-options "mention") for more options.

## Allocate by API

{% tabs %}
{% tab title="Python" %}
For service use, Resource Manager exposes the  `resource_manager.service.Allocator` class.

First, import and create an instance of the `Allocator`, supplying the `service`  object as provided by the service callback (e.g. `cb_create`):

```python
from resource_manager.service import Allocator
```

```python
rm_allocator = Allocator(service)
```

Then, create a new ID allocator request by calling `Allocator.id()`:

```python
my_value_request = rm_allocator.id()
```

If you wish to allocate a specific value (if it is still available), you need to call the `id()` function with the `request_id` parameter instead:

```python
my_value_request = rm_allocator.id(request_id=5)
```

You must also select at least one resource pool to assign the value from:

```python
my_value_request = rm_allocator.id().pool('some-pool')
# or
my_value_request = rm_allocator.id().pool(['some-pool'])
```

You can further configure the request using a fluent interface, e.g.:

```python
my_value_request = my_value_request.even()
```

Finally, allocate an actual value by calling `allocate()` with the allocation name:

```python
my_value = my_value_request.allocate('my-value') # Returns e.g. 5
```
{% endtab %}

{% tab title="Java" %}
For service use, Resource Manager exposes the `com.tailf.resourcemanager.Allocator` class.

First, import and create an instance of the `Allocator`, supplying the `context`  object as provided by the service callback (e.g. `create`):

```java
import com.tailf.resourcemanager.*;
```

```java
Allocator rm_allocator = Allocator(context);
```

Then, create a new ID allocator request by calling `Allocator.id()`:

```java
IdAllocation my_value_request = rm_allocator.id();
```

If you wish to allocate a specific value (if it is still available), you need to call the `id()` function with the desired value as a parameter instead:

```java
IdAllocation my_value_request = rm_allocator.id(5);
```

You must also select at least one resource pool to assign the value from:

```java
IdAllocation my_value_request = rm_allocator.id().pool("some-pool");
// or
IdAllocation my_value_request = rm_allocator.id().pool(List.of("some-pool"));
```

You can further configure the request using a fluent interface, e.g.:

```java
my_value_request = my_value_request.even();
```

Finally, allocate an actual value by calling `allocate()` with the allocation name:

```java
ConfUInt64 my_value = my_value_request.allocate("my-value"); // Returns e.g. 5
```
{% endtab %}
{% endtabs %}

## Odd/Even Allocation

ID Allocator supports an additional `parity` allocation option that ensures the assigned value is odd or even. This feature caters to environments that require greater control of the ID assignment.

To enable this functionality, provide the `parity odd` or `parity even` option to the `find-id` action, or select the `odd()` or `even()` function when creating a request programmatically. For example:

```python
odd_value = rm_allocator.id().pool("some-pool").odd().allocate("my-odd")
```

This type of allocation also supports additional alarms in case pool resources are running low (if alarms are enabled for the pool):

* `id-pool-odd-exhausted` and `id-pool-even-exhausted`: Raised when no more odd or even resources are available in the pool.
* `id-pool-odd-low-threshold-reached` and `id-pool-even-low-threshold-reached`: Raised when available odd or even resources fall below configured percentage.

The low threshold percentage can be configured per resource pool, under `alarms`.

```
resource-pools id-pool some-pool
 range start 100
 range end 199
 alarms low-threshold-odd-alarm 20
 alarms low-threshold-even-alarm 20
```
