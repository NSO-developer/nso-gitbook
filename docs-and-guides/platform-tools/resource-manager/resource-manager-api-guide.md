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

The payloads below demonstrate the Northbound service allocation request using the Resource Manager synchronous and asynchronous flows. The API pulls one IP address from the IPv4 resource pool and sets the returned IP address on the interface IOS1 device. The payloads demonstrate both synchronous and asynchronous flows.

{% code title="Synchronous Flow" %}
```bash
admin@ncs% load merge alloc-sync.xml
[ok]
admin@ncs% commit dry-run
cli {
    local-node {
        data devices {
            device ios1 {
                config {
                    ip {
                        prefix-list {
                            + prefixes sample {
                                + permit 11.1.0.0/32;
                            + }
                            + prefixes sample1 {
                                + permit 11.1.0.1/32;
                            + }
                            + prefixes sample3 {
                                + permit 11.1.0.2/32;
                            + }
                            + prefixes sample4 {
                                + permit 11.1.0.3/32;
                            + }
                        }
                    }
                }
            }
        }
        +allocating-service sync-test-1 {
            + device ios1;
            + pool IPv4;
            + subnet-size 32;
            + ipv4 sample;
        +}
        +allocating-service sync-test-2 {
            + device ios1;
            + pool IPv4;
            + subnet-size 32;
            + ipv4 sample1;
        +}
        +allocating-service sync-test-3 {
            + device ios1;
            + pool IPv4;
            + subnet-size 32;
            + ipv4 sample3;
        +}
        +allocating-service sync-test-4 {
            + device ios1;
            + pool IPv4;
            + subnet-size 32;
            + ipv4 sample4;
        +}
    }
}

```
{% endcode %}

{% code title="Asynchronous Flow" %}
```bash
admin@ncs% load merge alloc-async.xml
[ok]
admin@ncs% commit dry-run
cli {
    local-node {
        data resource-pools {
            + ip-address-pool IPv4 {
                + allocation sample {
                    + username admin;
                    + allocating-service /allocating-service-
                      async[name='async-test'];
                    + redeploy-type default;
                    + request {
                        + subnet-size 32;
                    + }
                + }
            + }
        }
        + allocating-service-async async-test {
            + device ios1;
            + pool IPv4;
            + subnet-size 32;
            + ipv4 sample;
        + }
    }
}

```
{% endcode %}

IPv4 and IPv6 have separate IP pool types; there is no mixed IP pool. You can specify a `prefixlen` parameter for IP pools to allocate a net of a given size. The default value is the maximum prefix length of 32 and 128 for IPv4 and IPv6, respectively.

The following APIs are used in IPv4 and IPv6 allocations.

## IP Allocations

Resource Manager exposes the API calls to request IPv4 and IPv6 subnet allocations from the resource pool. These requests can be synchronous or asynchronous. This topic discusses the APIs for these flows.

The NSO Resource Manager interface and the resource allocator provide a generic resource allocation mechanism that works well with services. Each pool has an allocation list where services are expected to create instances to signal that they request an allocation. The request parameters are stored in the request container, and the allocation response is written in the response container.

The APIs exposed by RM are implemented in Python as well as Java, so the NB user can configure the service to be a Java package or a Python package and call the allocator API as per the implementation. The NB user can also use NSO CLI to make an allocation request to the IP allocator RM package.

### Using Java APIs for IP Allocations

This section covers the Java APIs exposed by the RM package to the NB user to make IP subnet allocation requests.

#### Creating Asynchronous IP Subnet Allocation Requests

The asynchronous subnet allocation requests can be created for a requesting service with:

* The redeploy type set to `default` type or set to `redeployType`.
*   The CIDR mask length can be set to invert the subnet mask length for Boolean

    operations with IP addresses or set not to be able to invert the subnet mask length.
*   Pass the starting IP address of the subnet to the requesting service redeploy type

    (`default`/`redeployType`).

The following are the Java APIs for asynchronous IP allocation requests.

<details>

<summary>Default Asynchronous Request</summary>

The requesting service redeploy type is `default`, and CIDR mask length cannot be inverted for the subnet allocation request. Make sure the `NavuNode` service is the same node you get in service create. This ensures the back pointers are updated correctly and RFM works as intended.

```
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(NavuNode service,
        String poolName,
        String username,
        int cidrmask,
        String id)
```

**API Parameters**

```
| Parameter   | Type       | Description                                           |
|-------------|------------|-----------------------------------------------------------------|
| service     | NavuNode   | NavuNode referencing the requesting service node.               |
| poolName    | String     | Name of the resource pool to request the subnet IP address from.|
| Username    | String     | Name of the user to use when redeploying the requesting service.|
| cidrmask    | Int        | CIDR mask length of the requested subnet.                       |
| id          | String     | Unique allocation ID.                                           |
```

**Example**

```
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;
IPAddressAllocator.subnetRequest(service, poolName, userName, cidrMask,
id);
```

</details>

<details>

<summary>Asynchronous Request with Invert CIDR Flag</summary>

The requesting service redeploy type is `default`, and the CIDR mask length can be inverted for the subnet allocation request. Make sure the `NavuNode` service is the same node you get in service create. This ensures the back pointers are updated correctly and RFM works as intended.

```
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(NavuNode service,
        String poolName,
        String username,
        int cidrmask,
        String id,
        boolean invertCidr)
```

**API Parameters**

```
| Parameter        | Type        | Description                                                                |
|------------------|------------|--------------------------------------------------------------------|
| Service          | NavuNode   | NavuNode referencing the requesting service node.                  |
| poolName         | String     | Name of the resource pool to request the subnet IP address from.   |
| Username         | String     | Name of the user to use when redeploying the requesting service.   |
| cidrmask         | Int        | CIDR mask length of requested subnet.                              |
| id               | String     | Unique allocation ID.                                              |
| invertCidr       | Boolean    | If boolean value is true, the subnet mask length is inverted.      |

```

**Common Example for the Usage of `subnetRequest` from Service**

The code example below shows that the ⁣`subnetRequest` method can be called from the service by different types parameter values getting from the service object.

```
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;
IPAddressAllocator.subnetRequest(service, poolName, userName, cidrMask,
id, invertCidr.booleanValue());
```

```java
@ServiceCallback(servicePoint = "ipaddress-allocator-test-servicepoint",
    callType = ServiceCBType.CREATE)
public Properties create(ServiceContext context,
                         NavuNode service,
                         NavuNode ncsRoot,
                         Properties opaque)
        throws DpCallbackException {
    LOGGER.info("IPAddressAllocatorTest Servicepoint is triggered");
    try {
        String servicePath = service.getKeyPath();

        CdbSession sess = cdb.startSession(CdbDBType.CDB_OPERATIONAL);
        try {
            String dPath = servicePath + "/deploys";
            int deploys = 1;

            if (sess.exists(dPath)) {
                deploys = (int) ((ConfUInt32) sess.getElem(dPath)).longValue();
            }

            if (sess.exists(servicePath)) { // Will not exist the first time
                sess.setElem(new ConfUInt32(deploys + 1), dPath);
            }

            NavuLeaf size = service.leaf("subnet-size");
            if (!size.exists()) {
                return opaque;
            }

            int subnetSize = (int) ((ConfUInt8) service.leaf("subnet-size").value()).longValue();
            String redeployOption = null;

            if (sess.exists(servicePath + "/redeploy-option")) {
                redeployOption = ConfValue.getStringByValue(
                        servicePath + "/redeploy-option",
                        service.leaf("redeploy-option").value()
                );
            }

            System.out.println("IPAddressAllocatorTest redeployOption: " + redeployOption);

            if (redeployOption == null) {
                IPAddressAllocator.subnetRequest(service, "mypool", "admin", subnetSize, "test");
            } else {
                RedeployType redeployType = RedeployType.from(redeployOption);
                System.out.println("IPAddressAllocatorTest redeployType: " + redeployType);

                IPAddressAllocator.subnetRequest(
                        service, redeployType, "mypool", "admin", subnetSize, "test", false
                );
            }

            boolean error = false;
            boolean allocated = sess.exists(servicePath + "/allocated");
            boolean ready = IPAddressAllocator.responseReady(service.context(), cdb, "mypool", "test");

            if (ready) {
                try {
                    IPAddressAllocator.fromRead(cdb, "mypool", "test");
                } catch (ResourceErrorException e) {
                    LOGGER.info("The allocation has failed");
                    error = true;
                }
            }

            if (ready && !error) {
                if (!allocated) {
                    sess.create(servicePath + "/allocated");
                }
            } else {
                if (allocated) {
                    sess.delete(servicePath + "/allocated");
                }
            }
        } finally {
            sess.endSession();
        }
    } catch (Exception e) {
        throw new DpCallbackException("Cannot create service", e);
    }
    return opaque;
}
```

</details>

<details>

<summary>Asynchronous Request with Invert CIDR Flag and Redeploy Type</summary>

The requesting service redeploy type is `redeployType` and CIDR mask length can be inverted for the subnet allocation request. Make sure the `NavuNode` service is the same node you get in service create. This ensures the back pointers are updated correctly and RFM works as intended.

```
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(NavuNode service,
        RedeployType redeployType,
        String poolName,
        service node
        String username,
        int cidrmask,
        subnet IP address from
        String id,
        boolean invertCidr)
```

**API Parameters**

```
| Parameter    | Type        | Description                                                                |
|--------------|-------------|-------------------------------------------------------------------|
| service      | NavuNode    | NavuNode referencing the requesting service node.                 |
| poolName     | String      | Name of the resource pool to request the subnet IP address from.  |
| username     | String      | Name of the user to use when redeploying the requesting service.  |
| cidrmask     | Int         | CIDR mask length of the requested subnet.                         |
| id           | String      | Unique allocation ID.                                             |
| invertCidr   | Boolean     | If boolean value is true, the subnet mask length is inverted.     |

```

**Example**

```
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;
IPAddressAllocator.subnetRequest(service, redeployType, poolName,
userName, cidrMask, id, invertCidr.booleanValue());
```

</details>

<details>

<summary>Asynchronous Request with Specific Start IP Address</summary>

Pass a `startIP` value to the default type of the requesting service redeploy. The subnet IP address begins with the provided IP address. Make sure that the `NavuNode` service is the same node you get in service create. This ensures that the back pointers are updated correctly and that the RFM works as intended.

```
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(NavuNode service,
        String poolName,
        String username,
        String startIp,
        int cidrmask,
        String id,
        boolean invertCidr)
```

**API Parameters**

```
| Parameter     | Type        | Description                                                                 |
|---------------|-------------|--------------------------------------------------------------------|
| service       | NavuNode    | NavuNode referencing the requesting service node.                  |
| poolName      | String      | Name of the resource pool to request the subnet IP address from.   |
| username      | String      | Name of the user to use when redeploying the requesting service.   |
| startIP       | String      | Starting IP address for the requested subnet.                      |
| cidrmask      | Int         | CIDR mask length of the requested subnet.                          |
| id            | String      | Unique allocation ID.                                              |
| invertCidr    | Boolean     | If boolean value is true, the subnet mask length is inverted.      |
```

**Example**

```
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;
IPAddressAllocator.subnetRequest(service, poolName, userName, startIp,
cidrMask, id, invertCidr.booleanValue());
```

</details>

<details>

<summary>Asynchronous Request with Specific Start IP Address and Re-deploy Type</summary>

Pass a `startIP` value to the `redeployType` of the requesting service redeploy. The subnet IP address begins with the provided IP address. Make sure that the NavuNode service is the same node you get in service create. This ensures that the back pointers are updated correctly and that the RFM works as intended.

```
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(NavuNode service,
        RedeployType redeployType,
        String poolName,
        String username,
        String startIp,
        int cidrmask,
        String id,
        boolean invertCidr)
```

**API Parameters**

```
| Parameter   | Type       | Description                                                                 |
|-------------|------------|-------------------------------------------------------------------|
| service     | NavuNode   | NavuNode referencing the requesting service node.                 |
| poolName    | String     | Name of the resource pool to request the subnet IP address from.  |
| username    | string     | Name of the user to use when redeploying the requesting service.  |
| startIP     | String     | Starting IP address for the requested subnet.                     |
| cidrmask    | Int        | CIDR mask length of the requested subnet.                         |
| id          | String     | Unique allocation ID.                                             |
| invertCidr  | Boolean    | If boolean value is true, the subnet mask length is inverted.     |
```

**Example**

```
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;
IPAddressAllocator.subnetRequest(service, redeployType, poolName,
userName, startIp, cidrMask, id, invertCidr.booleanValue());
```

</details>

<details>

<summary>Asynchronous Request with Service Context</summary>

Create an asynchronous IP subnet allocation request with requesting service redeploy type as default and CIDR mask length cannot be inverted for the subnet allocation request. Make sure to use the service context you get in the service create callback. This method takes any `NavuNode`, should you need it.

```
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(ServiceContext context,
        NavuNode service,
        String poolName,
        String username,
        int cidrmask,
        String id)
```

**API Parameters**

```
| Parameter   | Type       | Description                                                                 |
|-------------|------------|------------------------------------------------------------------|
| service     | NavuNode   | NavuNode referencing the requesting service node.                |
| poolName    | String     | Name of the resource pool to request the subnet IP address from. |
| username    | string     | Name of the user to use when redeploying the requesting service. |
| cidrmask    | Int        | CIDR mask length of the requested subnet.                        |
| id          | String     | Unique allocation ID.                                            |
```

**Example**

```
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;
IPAddressAllocator.subnetRequest(context, service, poolName, userName,
cidrMask, id);
```

</details>

<details>

<summary>Asynchronous Request with Context and Re-deploy Type</summary>

Create an asynchronous IP subnet allocation request with requesting service redeploy type as `redeployType` and CIDR mask length can be inverted for the subnet allocation request. Make sure to use the service context you get in the service create callback. This method takes any `NavuNode`, should you need it.

```
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(ServiceContext context,
        NavuNode service,
        RedeployType redeployType,
        String poolName,
        String username,
        int cidrmask,
        String id,
        boolean invertCidr)
```

**API Parameters**

```
| Parameter   | Type           | Description                                                                 |
|-------------|----------------|-------------------------------------------------------------------------------|
| Context     | ServiceContext | ServiceContext referencing the requesting context the service was invoked in. |
| service     | NavuNode       | NavuNode referencing the requesting service node.                             |
| poolName    | String         | Name of the resource pool to request the subnet IP address from.              |
| username    | String         | Name of the user to use when redeploying the requesting service.              |
| cidrmask    | Int            | CIDR mask length of the requested subnet.                                     |
| id          | String         | Unique allocation ID.                                                         |
| invertCidr  | Boolean        | If the boolean value is true, the subnet mask length is inverted.             |
```

**Example**

```
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;
IPAddressAllocator.subnetRequest(context, service, redeployType,
poolName, userName, cidrMask, id, invertCidr.booleanValue());
```

</details>
