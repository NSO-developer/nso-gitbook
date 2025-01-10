---
description: Description of the APIs exposed by the Resource Manager package.
---

# Resource Manager API Guide

{% hint style="info" %}
**About this Guide**

This NSO Resource Manager (RM) API Guide describes the APIs exposed by the Resource Manager package that you can use to allocate IPs from the IP resource pool and to allocate the IDs from ID resource pools.

**Intended Audience**

This guide is intended for Cisco advanced services developers, network engineers, and system engineers to install the RM package inside NSO and then utilize the APIs exposed by the RM package to allocate and manage IP subnets and IDs as required by other CFPs installed alongside this RM package inside NSO.

**Additional Documentation**

This documentation requires the reader to have a good understanding of NSO and its usage as described in the following NSO documentation:

* [NSO Installation](https://cisco-tailf.gitbook.io/nso-docs/administration/get-started)
* [NSO Operation and Usage Guide](https://cisco-tailf.gitbook.io/nso-docs/operation-and-usage/get-started)
{% endhint %}

## Resource Manager IP/ID Allocation APIs

The APIs exposed by the Resource Manager package are used to allocate IP subnets and IDs from the IP and ID resource pools respectively by the applications requesting the resources. The APIs help to allocate, update, or deallocate the resources. You can make API calls to the resource pools as long as the pool is not exhausted of the resources. If the pool is exhausted of resources or if the referenced pool does not exist in the database when there is a request, the allocation raises an exception.&#x20;

When a service makes multiple resource allocations from a single pool, the optional ‘name’ parameter allows the service to distinguish the different allocations. By default, the parameter value is an empty string.&#x20;

Resource allocation can be synchronous or asynchronous.

<figure><img src="../../../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

The synchronized allocation API request uses a Reactive-Fast-Map to allocate resources and still manages the interface to look synchronous. This means that as you create any allocation request from Northbound, you can see the allocation results, such as the requested IP subnet/ID in the same transaction. If a NB is making an allocation request, and in the same transaction a configuration is being applied to a specific device, the commit dry run receives the request response, and the response is processed by the RM and the configurations are pushed to the device in the same transaction. Thus, the NB user can see the get modification in the commit dry run.&#x20;

During a resource request, the resource is allocated and stored in the create callback. This allocation is visible to other services that are run in the same or subsequent transactions and therefore avoids the recreation of resource when the service is redeployed. Synchronous allocation does not require service re-deploy to read allocation. The same transaction can read allocation. Commit dry-run or get-modification displays the allocation details as output.

### Example

The following is an example for a Northbound service callback passed with required API parameters for both synchronous and asynchronous IPv4 allocations. The example uses `pool-example` package as a reference. The request describes the details it uses, such as the pool, device. Each allocation has an allocation ID. In the following example, the allocating service pulls one IPv4 address from the IPv4 resource pool. The requesting service then uses this allocated IP address to set the interface address on the device southbound to NSO.

{% code title="NORTHBOUND SERVICE CALLBACK EXAMPLE - SYNC" %}
```python
# NORTHBOUND SERVICE CALLBACK EXAMPLE - SYNC
# ------------------------------------------
class AllocateCallbacks(Service):
    @Service.create
    def cb_create(self, tctx, root, service, proplist):
        self.log.info('AllocateCallbacks create(service=', service._path, ')')
        self.log.info('requested allocation {} from {}'.format(service.device, service.pool))
        
        service_xpath = (
            "/allocating-service-async:allocating-service-async[name='{}']"
        )
        
        propslist = ip_allocator.net_request(
            service,
            service_xpath.format(service.name),
            "admin",
            service.pool,
            service.ipv4,
            service.subnet_size,
            False,
            "default",
            True,
            proplist,
            self.log
        )
        
        # Check
        net = ip_allocator.net_read("admin", root, service.pool, service.ipv4)
        self.log.info('Check n/w create(IP=', net, ')')
        
        if net:
            self.log.info(
                'received device {} ip-address value from {} is ready'.format(
                    service.device, service.pool
                )
            )
            
            template = ncs.template.Template(service)
            vars = ncs.template.Variables()
            vars.add("SERVICE", str(service.ipv4))
            vars.add("DEVICE_NAME", str(service.device))
            vars.add("IP", str(net))
            
            template.apply('device', vars)
        
        return propslist
```
{% endcode %}

{% code title="NORTHBOUND SERVICE CALLBACK EXAMPLE - ASYNC" %}
```python
# NORTHBOUND SERVICE CALLBACK EXAMPLE - ASYNC
# -----------------------------------------------
class AllocateCallbacksAsync(Service):
    @Service.create
    def cb_create(self, tctx, root, service, proplist):
        self.log.info('AllocateCallbacksAsync create(service=', service._path,
        ')')
        self.log.info('requested allocation {} from {}'.format(service.device,
        service.pool))
        async[name='{}']")
        service_xpath = ("/allocating-service-async:allocating-service-
        ip_allocator.net_request(service,
        service_xpath.format(service.name),
        tctx.username,
        service.pool,
        service.ipv4,
        service.subnet_size)
        # Check
        net=ip_allocator.net_read(tctx.username, root, service.pool,
        service.ipv4)
        self.log.info('Check n/w create(IP=', net, ')')
        if net:
            self.log.info('received device {} ip-address value from {} is
            ready'.format(service.device, service.pool))
            template = ncs.template.Template(service)
            vars = ncs.template.Variables()
            vars.add("SERVICE", str(service.ipv4))
            vars.add("DEVICE_NAME", str(service.device))
            vars.add("IP", str(net))
            template.apply('device', vars

```
{% endcode %}
