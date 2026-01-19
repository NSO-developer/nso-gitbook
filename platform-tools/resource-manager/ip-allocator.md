---
description: Manage IP address allocation in NSO.
---

# IP Address Allocator

The NSO Resource Manager IP Address Allocator allocates IP prefixes or individual addresses. It supports IPv4 and IPv6 resources.

## Pool Definition

Each IP address pool is a named configuration item under `/resource-pools/ip-address-pool` and contains a list of subnets used for resource allocation.

```
admin@ncs(config)# resource-pools ip-address-pool some-pool subnet 192.0.2.0 24
admin@ncs(config)# resource-pools ip-address-pool some-pool subnet 2001:db8:: 32
admin@ncs(config)# commit
```

Additionally, non-overlapping exclusion ranges may be defined for a pool. The values from the exclusion ranges are not available for allocation.

```
admin@ncs(config)# resource-pools ip-address-pool some-pool exclude 192.0.2.4 30
admin@ncs(config)# commit
```

```
resource-pools ip-address-pool some-pool
 subnet 192.0.2.0 24
 subnet 2001:db8:: 32
 exclude 192.0.2.4 30
!
```

## Allocate Action

Manual allocation or pre-allocation is possible with the use of the `/resource-pools/find-ip` action. If `allocate` parameter is specified, the allocation is persisted right away. Otherwise, a free resource is returned if found, however, it is **not** allocated.

The request must specify either a specific resource or requested prefix length:

```shell
admin@ncs# resource-pools find-ip allocation-name my-value pool [ some-pool ]\
 resource 192.0.2.1/32
```

```shell
admin@ncs# resource-pools find-ip allocation-name my-value pool [ some-pool ]\
 prefix-length 30
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

Then, create a new IP address allocator request by calling `Allocator.ip()` and configuring a requested prefix length:

```python
my_value_request = rm_allocator.ip().prefix_length(30)
```

If you wish to allocate a specific value (if it is still available), you need to call the `ip()` function with the `request_ip` parameter instead:

```python
my_value_request = rm_allocator.ip(request_ip='192.0.2.1/32')
```

You must also select a resource pool to assign the value from:

```python
my_value_request = rm_allocator.ip().pool('some-pool')
```

Finally, allocate an actual value by calling `allocate()` with the allocation name:

```python
my_value = my_value_request.allocate('my-value') # Returns e.g. '192.0.2.1/32'
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

Then, create a new IP address allocator request by calling `Allocator.ip()` and configuring a requested prefix length:

```java
IpAllocation my_value_request = rm_allocator.ip().prefixLength(30);
```

If you wish to allocate a specific value (if it is still available), you need to call the `ip()` function with the desired value as a parameter instead:

```java
IpAllocation my_value_request = rm_allocator.ip("192.0.2.1/32");
```

You must also select a resource pool to assign the value from:

```java
IdAllocation my_value_request = rm_allocator.ip().pool("some-pool");
```

Finally, allocate an actual value by calling `allocate()` with the allocation name:

```java
ConfObject my_value = my_value_request.allocate("my-value");
// Returns e.g. '192.0.2.1/32'
```
{% endtab %}
{% endtabs %}
