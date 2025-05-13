---
description: Description of the APIs exposed by the Resource Manager package.
---

# Resource Manager API Guide (4.2.11)

***

**About this Guide**

This NSO Resource Manager (RM) API Guide describes the APIs exposed by the Resource Manager package that you can use to allocate IPs from the IP resource pool and to allocate the IDs from ID resource pools.

**Intended Audience**

This guide is intended for Cisco advanced services developers, network engineers, and system engineers to install the RM package inside NSO and then utilize the APIs exposed by the RM package to allocate and manage IP subnets and IDs as required by other CFPs installed alongside this RM package inside NSO.

**Additional Documentation**

This documentation requires the reader to have a good understanding of NSO and its usage as described in the following NSO documentation:

* [NSO Installation](https://cisco-tailf.gitbook.io/nso-docs/guides/administration/installation-and-deployment)
* [NSO Operation and Usage Guide](https://cisco-tailf.gitbook.io/nso-docs/guides/operation-and-usage/get-started)

***

## Resource Manager IP/ID Allocation APIs

The APIs exposed by the Resource Manager package are used to allocate IP subnets and IDs from the IP and ID resource pools respectively by the applications requesting the resources. The APIs help to allocate, update, or deallocate the resources. You can make API calls to the resource pools as long as the pool is not exhausted of the resources. If the pool is exhausted of resources or if the referenced pool does not exist in the database when there is a request, the allocation raises an exception. The APIs also support allocating Odd or Even IDs from the resource pools, provided that the pool has available resources.&#x20;

When a service makes multiple resource allocations from a single pool, the optional ‘name’ parameter allows the service to distinguish the different allocations. By default, the parameter value is an empty string.&#x20;

Resource allocation can be synchronous or asynchronous.

<figure><img src="../../../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

The synchronized allocation API request uses a Reactive-Fast-Map to allocate resources and still manages the interface to look synchronous. This means that as you create any allocation request from Northbound, you can see the allocation results, such as the requested IP subnet/ID in the same transaction. If a NB is making an allocation request, and in the same transaction a configuration is being applied to a specific device, the commit dry run receives the request response, and the response is processed by the RM and the configurations are pushed to the device in the same transaction. Thus, the NB user can see the get modification in the commit dry run.&#x20;

During a resource request, the resource is allocated and stored in the create callback. This allocation is visible to other services that are run in the same or subsequent transactions and therefore avoids the recreation of resource when the service is redeployed. Synchronous allocation does not require service re-deploy to read allocation. The same transaction can read allocation. Commit dry-run or get-modification displays the allocation details as output.

### Example

The following is an example for a Northbound service callback passed with required API parameters for both synchronous and asynchronous IPv4 allocations. The example uses `pool-example` package as a reference. The request describes the details it uses, such as the pool, device. Each allocation has an allocation ID. In the following example, the allocating service pulls one IPv4 address from the IPv4 resource pool. The requesting service then uses this allocated IP address to set the interface address on the device southbound to NSO.

<details>

<summary>Northbound Service Callback Example: Sync</summary>

{% code title="Northbound Service Callback Example - Sync" %}
```python
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

</details>

<details>

<summary>Northbound Service Callback Example: Async</summary>

{% code title="Northbound Service Callback Example - Async" %}
```python
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

</details>

The payloads below demonstrate the Northbound service allocation request using the Resource Manager synchronous and asynchronous flows. The API pulls one IP address from the IPv4 resource pool and sets the returned IP address on the interface IOS1 device. The payloads demonstrate both synchronous and asynchronous flows.

<details>

<summary>Synchronous Flow</summary>

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

</details>

<details>

<summary>Asynchronous Flow</summary>

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

</details>

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

```java
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(NavuNode service,
        String poolName,
        String username,
        int cidrmask,
        String id)
```

**API Parameters**

```
| Parameter   | Type       | Description                                                     |
|-------------|------------|-----------------------------------------------------------------|
| service     | NavuNode   | NavuNode referencing the requesting service node.               |
| poolName    | String     | Name of the resource pool to request the subnet IP address from.|
| Username    | String     | Name of the user to use when redeploying the requesting service.|
| cidrmask    | Int        | CIDR mask length of the requested subnet.                       |
| id          | String     | Unique allocation ID.                                           |
```

**Example**

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

IPAddressAllocator.subnetRequest(service, poolName, userName, cidrMask,
id);
```

</details>

<details>

<summary>Asynchronous Request with Invert CIDR Flag</summary>

The requesting service redeploy type is `default`, and the CIDR mask length can be inverted for the subnet allocation request. Make sure the `NavuNode` service is the same node you get in service create. This ensures the back pointers are updated correctly and RFM works as intended.

```java
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
| Parameter        | Type       | Description                                                        |
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

```java
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

```java
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
| Parameter    | Type        | Description                                                       |
|--------------|-------------|-------------------------------------------------------------------|
| service      | NavuNode    | NavuNode referencing the requesting service node.                 |
| poolName     | String      | Name of the resource pool to request the subnet IP address from.  |
| username     | String      | Name of the user to use when redeploying the requesting service.  |
| cidrmask     | Int         | CIDR mask length of the requested subnet.                         |
| id           | String      | Unique allocation ID.                                             |
| invertCidr   | Boolean     | If boolean value is true, the subnet mask length is inverted.     |
```

**Example**

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

IPAddressAllocator.subnetRequest(service, redeployType, poolName,
userName, cidrMask, id, invertCidr.booleanValue());
```

</details>

<details>

<summary>Asynchronous Request with Specific Start IP Address</summary>

Pass a `startIP` value to the default type of the requesting service redeploy. The subnet IP address begins with the provided IP address. Make sure that the `NavuNode` service is the same node you get in service create. This ensures that the back pointers are updated correctly and that the RFM works as intended.

```java
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
| Parameter     | Type        | Description                                                        |
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

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

IPAddressAllocator.subnetRequest(service, poolName, userName, startIp,
cidrMask, id, invertCidr.booleanValue());
```

</details>

<details>

<summary>Asynchronous Request with Specific Start IP Address and Re-deploy Type</summary>

Pass a `startIP` value to the `redeployType` of the requesting service redeploy. The subnet IP address begins with the provided IP address. Make sure that the NavuNode service is the same node you get in service create. This ensures that the back pointers are updated correctly and that the RFM works as intended.

```java
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
| Parameter   | Type       | Description                                                       |
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

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

IPAddressAllocator.subnetRequest(service, redeployType, poolName,
userName, startIp, cidrMask, id, invertCidr.booleanValue());
```

</details>

<details>

<summary>Asynchronous Request with Service Context</summary>

Create an asynchronous IP subnet allocation request with requesting service redeploy type as default and CIDR mask length cannot be inverted for the subnet allocation request. Make sure to use the service context you get in the service create callback. This method takes any `NavuNode`, should you need it.

```java
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
| Parameter   | Type       | Description                                                      |
|-------------|------------|------------------------------------------------------------------|
| service     | NavuNode   | NavuNode referencing the requesting service node.                |
| poolName    | String     | Name of the resource pool to request the subnet IP address from. |
| username    | string     | Name of the user to use when redeploying the requesting service. |
| cidrmask    | Int        | CIDR mask length of the requested subnet.                        |
| id          | String     | Unique allocation ID.                                            |
```

**Example**

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

IPAddressAllocator.subnetRequest(context, service, poolName, userName,
cidrMask, id);
```

</details>

<details>

<summary>Asynchronous Request with Context and Re-deploy Type</summary>

Create an asynchronous IP subnet allocation request with requesting service redeploy type as `redeployType` and CIDR mask length can be inverted for the subnet allocation request. Make sure to use the service context you get in the service create callback. This method takes any `NavuNode`, should you need it.

```java
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
| Parameter   | Type           | Description                                                                   |
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

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

IPAddressAllocator.subnetRequest(context, service, redeployType,
poolName, userName, cidrMask, id, invertCidr.booleanValue());
```

</details>

<details>

<summary>Asynchronous Request with Context and Specific Start IP</summary>

Pass a `startIP` value to the requesting service redeploy type, default. The subnet IP address begins with the provided IP address. CIDR mask length cannot be inverted for the subnet allocation request. Make sure to use the service context you get in the service create callback.

```java
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(ServiceContext context,
        NavuNode service,
        String poolName,
        String username,
        String startIp,
        int cidrmask,
        String id,
        boolean invertCidr)
```

**API Parameters**

```
| Parameter   | Type           | Description                                                                   |
|-------------|----------------|-------------------------------------------------------------------------------|
| Context     | ServiceContext | ServiceContext referencing the requesting context the service was invoked in. |
| service     | NavuNode       | NavuNode referencing the requesting service node.                             |
| poolName    | String         | Name of the resource pool to request the subnet IP address from.              |
| username    | String         | Name of the user to use when redeploying the requesting service.              |
| startIP     | String         | Starting IP address for the requested subnet.                                 |
| cidrmask    | Int            | CIDR mask length of the requested subnet.                                     |
| id          | String         | Unique allocation ID.                                                         |
| invertCidr  | Boolean        | If boolean value is true, the subnet mask length is inverted.                 |
```

**Example**

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

IPAddressAllocator.subnetRequest(context, service, poolName, userName,
startIp, cidrMask, id, invertCidr.booleanValue());
```

</details>

<details>

<summary>Asynchronous Request with Specific Start IP, Context, Invert CIDR and Re-deploy Type</summary>

Pass a `startIP` value to the requesting service redeploy type, `redeployType`. The subnet IP address begins with the provided IP address. CIDR mask length can be inverted for the subnet allocation request. Make sure to use the service context you get in the service create callback.

```java
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(ServiceContext context,
        NavuNode service,
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
| Parameter   | Type           | Description                                                                   |
|-------------|----------------|-------------------------------------------------------------------------------|
| Context     | ServiceContext | ServiceContext referencing the requesting context the service was invoked in. |
| service     | NavuNode       | NavuNode referencing the requesting service node.                             |
| poolName    | String         | Name of the resource pool to request the subnet IP address from.              |
| username    | String         | Name of the user to use when redeploying the requesting service.              |
| startIP     | String         | Starting IP address for the requested subnet.                                 |
| cidrmask    | Int            | CIDR mask length of the requested subnet.                                     |
| id          | String         | Unique allocation ID.                                                         |
| invertCidr  | Boolean        | If boolean value is true, the subnet mask length is inverted.                 |
```

**Example**

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

IPAddressAllocator.subnetRequest(context, service, redeployType,
poolName, userName, startIp, cidrMask, id, invertCidr.booleanValue());
```

</details>

{% hint style="info" %}
**Common Exceptions Raised by Java APIs for Allocation Not Successful**

* The API throws the following exception error if the requested resource pool does not exist: `ResourceErrorException`
* The API throws the following exception error if the requested resource pool is exhausted: `AddressPoolException`
* The API throws the following exception error if the requested netmask is invalid: `InvalidNetmaskException`
{% endhint %}

#### Creating Synchronous or Asynchronous IP Subnet Allocation Requests

The `sync_alloc` parameter in the API determines if the allocation request is for a synchronous or asynchronous mode. Set the `sync_alloc` parameter to true for synchronous flow.

The subnet allocation requests can be created for a requesting service with:

* The redeploy type set to default type or `redeployType` type.
* The CIDR mask length can be set to invert the subnet mask length for Boolean operations with IP addresses or set to not be able to invert the subnet mask length.
* Pass the starting IP address of the subnet to the requesting service redeploy type (`default`/`redeploytype`).

The following are the Java APIs for synchronous or asynchronous IP allocation requests.

<details>

<summary>Default Java API for IP Subnet Allocation Request</summary>

The requesting service redeploy type is default and CIDR mask length can be inverted for the subnet allocation request. Set sync\_alloc to true to make a synchronous allocation request with commit dry-run support. Make sure the NavuNode service is the same node you get in service create. This ensures the back pointers are updated correctly and RFM works as intended.

```java
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(NavuNode service,
        String poolName,
        String username,
        int cidrmask,
        String id,
        boolean invertCidr,
        boolean sync_alloc)
```

**API Parameters**

```
| Parameter    | Type     | Description                                                       |
|--------------|----------|-------------------------------------------------------------------|
| service      | NavuNode | NavuNode referencing the requesting service node.                 |
| poolName     | String   | Name of the resource pool to request the subnet IP address from.  |
| username     | String   | Name of the user to use when redeploying the requesting service.  |
| cidrmask     | Int      | CIDR mask length of the requested subnet.                         |
| id           | String   | Unique allocation ID.                                             |
| invertCidr   | Boolean  | Set value to true to invert the subnet mask length.               |
| sync_alloc   | Boolean  | Set value to true to make a synchronous allocation request.       |
```

**Example**

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

IPAddressAllocator.subnetRequest(service, poolName, userName, cidrMask,
id, invertCidr.booleanValue(), testSync.booleanValue());
```

</details>

<details>

<summary>Java API for IP Subnet Allocation Request with Redeploy Type</summary>

The requesting service redeploy type is `redeployType` and CIDR mask length can be inverted for the subnet allocation request. Set sync\_alloc to true to make a synchronous allocation request with commit dry-run support. Make sure the `NavuNode` service is the same node you get in service create. This ensures the back pointers are updated correctly and RFM works as intended.

```java
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(NavuNode service, 
        RedeployType redeployType, 
        String poolName,
        String username,
        int cidrmask,
        String id,
        boolean invertCidr,
        boolean sync_alloc)
```

**API Parameters**

```
| Parameter   | Type     | Description                                                        |
|-------------|----------|--------------------------------------------------------------------|
| service     | NavuNode | NavuNode referencing the requesting service node.                  |
| poolName    | String   | Name of the resource pool to request the subnet IP address from.   |
| username    | String   | Name of the user to use when redeploying the requesting service.   |
| cidrmask    | Int      | CIDR mask length of the requested subnet.                          |
| id          | String   | Unique allocation ID.                                              |
| invertCidr  | Boolean  | Set value to true to invert the subnet mask length.                |
| sync_alloc  | Boolean  | Set value to true to make a synchronous allocation request.        |
```

**Example**

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

IPAddressAllocator.subnetRequest(service, redeployType, poolName,
userName, cidrMask, id, invertCidr.booleanValue(),
testSync.booleanValue());
```

</details>

<details>

<summary>Java API for IP Subnet Allocation Request with Start IP Address</summary>

Pass a `startIP` value to the requesting service redeploy type, default. The subnet IP address begins with the provided IP address. Set `sync_alloc` to `true` to make a synchronous allocation request with commit dry-run support. Make sure that the `NavuNode` service is the same node you get in service create. This ensures that the back pointers are updated correctly and that the RFM works as intended.

```java
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(NavuNode service,
    String poolName,
    String username,
    String startIp,
    int cidrmask,
    String id,
    boolean invertCidr,
    boolean sync_alloc)
```

**API Parameters**

```
| Parameter     | Type       | Description                                                      |
|---------------|------------|------------------------------------------------------------------|
| service       | NavuNode   | NavuNode referencing the requesting service node.                |
| poolName      | String     | Name of the resource pool to request the subnet IP address from. |
| username      | string     | Name of the user to use when redeploying the requesting service. |
| cidrmask      | Int        | CIDR mask length of the requested subnet.                        |
| id            | String     | Unique allocation ID.                                            |
| invertCidr    | Boolean    | Set value to true to invert the subnet mask length.              |
| sync_alloc    | Boolean    | Set value to true to make a synchronous allocation request.      |
```

**Example**

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

IPAddressAllocator.subnetRequest(service, poolName, userName, startIp,
cidrMask, id, invertCidr.booleanValue(), testSync.booleanValue());
```

</details>

<details>

<summary>Java API for IP Subnet Allocation Request with Redeploy type, Start IP address and CIDR Mask</summary>

Pass a `startIP` value to the `redeployType` of the requesting service redeploy. The subnet IP address begins with the provided IP address. Set sync to `true` to make a synchronous allocation request with commit dry-run support. Make sure that the `NavuNode` service is the same node you get in service create. This ensures that the back pointers are updated correctly and that the RFM works as intended.

```java
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(NavuNode service,
        RedeployType redeployType,
        String poolName,
        String username,
        String startIp,
        int cidrmask,
        String id,
        boolean invertCidr,
        boolean sync_alloc)
```

**API Parameters**

```
| Parameter     | Type       | Description                                                      |
|---------------|------------|------------------------------------------------------------------|
| service       | NavuNode   | NavuNode referencing the requesting service node.                |
| poolName      | String     | Name of the resource pool to request the subnet IP address from. |
| username      | String     | Name of the user to use when redeploying the requesting service. |
| startIP       | String     | Starting IP address for the subnet allocation request.           |
| cidrmask      | Int        | CIDR mask length of the requested subnet.                        |
| id            | String     | Unique allocation ID.                                            |
| invertCidr    | Boolean    | Set value to true to invert the subnet mask length.              |
| sync_alloc    | Boolean    | Set value to true to make a synchronous allocation request.      |
```

**Example**

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

IPAddressAllocator.subnetRequest(service, redeployType, poolName,
userName, startIp, cidrMask, id, invertCidr.booleanValue(),
testSync.booleanValue());
```

</details>

<details>

<summary>Java API for IP Subnet Allocation Request with Service Context</summary>

Create an IP subnet allocation request with requesting service redeploy type as default and CIDR mask length cannot be inverted for the subnet allocation request. Make sure to use the service context you get in the service create callback. Set sync to `true` to make a synchronous allocation request with commit dry-run support.

```java
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(ServiceContext context,
        NavuNode service,
        String poolName,
        String username,
        int cidrmask,
        String id,
        boolean invertCidr,
        boolean sync_alloc)
```

**API Parameters**

```
| Parameter      | Type           | Description                                                                    |
|----------------|----------------|--------------------------------------------------------------------------------|
| Context        | ServiceContext | ServiceContext referencing the requesting context the service was invoked in.  |
| service        | NavuNode       | NavuNode referencing the requesting service node.                              |
| poolName       | String         | Name of the resource pool to request the subnet IP address from.               |
| username       | String         | Name of the user to use when redeploying the requesting service.               |
| startIP        | String         | Starting IP address for the subnet allocation request.                         |
| cidrmask       | Int            | CIDR mask length of the requested subnet.                                      |
| id             | String         | Unique allocation ID.                                                          |
| invertCidr     | Boolean        | Set value to true to invert the subnet mask length.                            |
| sync_alloc     | Boolean        | Set value to true to make a synchronous allocation request.                    |
```

**Example**

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

IPAddressAllocator.subnetRequest(context, service, poolName, userName,
cidrMask, id, invertCidr.booleanValue(), testSync.booleanValue());
```

</details>

<details>

<summary>Java API for IP Subnet Allocation Request with Service Context and Redeploy Type</summary>

Create an IP subnet allocation request with requesting service redeploy type as `redeployType` and CIDR mask length can be inverted for the subnet allocation request. Set sync to `true` to make a synchronous allocation request with commit dry-run support. Make sure to use the service context you get in the service create callback.

```java
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(ServiceContext context,
        NavuNode service,
        RedeployType redeployType,
        String poolName,
        String username,
        int cidrmask,
        String id,
        boolean invertCidr,
        boolean sync_alloc)
```

**API Parameter**

```
| Parameter      | Type           | Description                                                                     |
|----------------|----------------|---------------------------------------------------------------------------------|
| Context        | ServiceContext | ServiceContext referencing the requesting context the service was invoked in.   |
| service        | NavuNode       | NavuNode referencing the requesting service node.                               |
| poolName       | String         | Name of the resource pool to request the subnet IP address from.                |
| username       | String         | Name of the user to use when redeploying the requesting service.                |
| cidrmask       | Int            | CIDR mask length of the requested subnet.                                       |
| id             | String         | Unique allocation ID.                                                           |
| invertCidr     | Boolean        | Set value to true to invert the subnet mask length.                             |
| sync_alloc     | Boolean        | Set value to true to make a synchronous allocation request.                     |
```

**Example**

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

IPAddressAllocator.subnetRequest(context, service, redeployType,
poolName, userName, cidrMask, id, invertCidr.booleanValue(),
testSync.booleanValue());
```

</details>

<details>

<summary>Java API for IP Subnet Allocation Request with Service Context and Start IP Address</summary>

Pass a `startIP` value to the requesting service redeploy type, default. The subnet IP address begins with the provided IP address. CIDR mask length can be inverted for the subnet allocation request. Set sync to `true` to make a synchronous allocation request with commit dry-run support. Make sure to use the service context you get in the service create callback.

```java
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(ServiceContext context,
        NavuNode service,
        String poolName,
        String username,
        String startIp,
        int cidrmask,
        String id,
        boolean invertCidr,
        boolean sync_alloc)
```

**API Parameters**

```
| Parameter   | Type           | Description                                                                   |
|-------------|----------------|-------------------------------------------------------------------------------|
| Context     | ServiceContext | ServiceContext referencing the requesting context the service was invoked in. |
| service     | NavuNode       | NavuNode referencing the requesting service node.                             |
| poolName    | String         | Name of the resource pool to request the subnet IP address from.              |
| username    | String         | Name of the user to use when redeploying the requesting service.              |
| startIP     | String         | Starting IP address of the IP subnet allocation request.                      |
| cidrmask    | Int            | CIDR mask length of the requested subnet.                                     |
| id          | String         | Unique allocation ID.                                                         |
| invertCidr  | Boolean        | Set value to true to invert the subnet mask length.                           |
| sync_alloc  | Boolean        | Set value to true to make a synchronous allocation request.                   |
```

**Example**

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

IPAddressAllocator.subnetRequest(context, service, poolName, userName,
startIp, cidrMask, id, invertCidr.booleanValue(),
testSync.booleanValue());
```

</details>

<details>

<summary>Java API for IP Subnet Allocation Request with Service Context and Start IP Address and Redeploy-type</summary>

Pass a `startIP` value to the requesting service redeploy type, `redeployType`. The subnet IP address begins with the provided IP address. CIDR mask length can be inverted for the subnet allocation request. Set sync to `true` to make a synchronous allocation request with commit dry-run support. Make sure to use the service context you get in the service create callback.

```java
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(ServiceContext context,
        NavuNode service,
        RedeployType redeployType,
        String poolName,
        String username,
        String startIp,
        int cidrmask,
        String id,
        boolean invertCidr,
        boolean sync_alloc)
```

**API Parameters**

```
| Parameter       | Type           | Description                                                                   |
|-----------------|----------------|-------------------------------------------------------------------------------|
| Context         | ServiceContext | ServiceContext referencing the requesting context the service was invoked in. |
| service         | NavuNode       | NavuNode referencing the requesting service node.                             |
| poolName        | String         | Name of the resource pool to request the subnet IP address from.              |
| username        | String         | Name of the user to use when redeploying the requesting service.              |
| startIP         | String         | Starting IP address of the IP subnet allocation request.                      |
| cidrmask        | Int            | CIDR mask length of the requested subnet.                                     |
| id              | String         | Unique allocation ID.                                                         |
| invertCidr      | Boolean        | Set value to true to invert the subnet mask length.                           |
| sync_alloc      | Boolean        | Set value to true to make a synchronous allocation request.                   |
```

**Example**

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

IPAddressAllocator.subnetRequest(context, service, redeployType,
poolName, userName, startIp, cidrMask, id, invertCidr.booleanValue(),
testSync.booleanValue());
```

</details>

{% hint style="info" %}
**Common Exceptions Raised by Java APIs for Allocation Not Successful**

* The API throws the following exception error if the requested resource pool does not exist: `ResourceErrorException`
* The API throws the following exception error if the requested resource pool is exhausted: `AddressPoolException`
* The API throws the following exception error if the requested netmask is invalid: `InvalidNetmaskException`
{% endhint %}

#### Verifying Responses for IP Allocations – Java APIs

Once the requesting service requests allocation through an API call, you can verify if the corresponding response is ready. The responses return the properties based on the request.

The following APIs help you to check if the response for the allocation request is ready.

<details>

<summary>Java API to Check Allocation Request Using CDB Context</summary>

```java
boolean com.tailf.pkg.ipaddressallocator.IPAddressAllocator. 
    responseReady(NavuContext context,
        Cdb cdb,
        String poolName,
        String id)
```

**API Parameters**

```
| Parameter   | Type         | Description                                           |
|-------------|--------------|-------------------------------------------------------|
| Context     | NavuContext  | A NavuContext for the transaction.                    |
| Cdb         | database     | A database resource.                                  |
| poolName    | String       | Name of the resource pool the request was created in. |
| id          | String       | Unique allocation ID for the allocation request.      |
```

**Example**

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

ready = IPAddressAllocator.responseReady(service.context(),cdb, poolName,
id);

returns True or False
```

**Response**

Returns `true` if a response for the allocation is ready.

</details>

<details>

<summary>Java API to Check Allocation Request Without Using CDB Context</summary>

The following API is recommended to verify responses for IP allocations.

```java
boolean com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    responseReady(NavuContext context,
        String poolName,
        String id)
```

**API Parameters**

```
| Parameter   | Type         | Description                                           |
|-------------|--------------|-------------------------------------------------------|
| Context     | NavuContext  | A NavuContext for the transaction.                    |
| poolName    | String       | Name of the resource pool the request was created in. |
| id          | String       | Unique allocation ID for the allocation request.      |
```

**Example**

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

ready = IPAddressAllocator.responseReady(service.context(), poolName,
id);

returns True or False
```

**Response**

Returns `true` if a response for the allocation is ready.

</details>

{% hint style="info" %}
**Common Exceptions Raised by Java APIs for Errors**

* `ResourceErrorException`: If the allocation has failed, the request does not exist, or the pool does not exist.
* `ConfException`: When there are format errors in the API request call.
* `IOException`: When the I/O operations fail or are interrupted.
{% endhint %}

#### Reading IP Allocation Responses for Java APIs

The following API reads the allocated IP subnet from the resource pool once the allocation request response is ready.

<details>

<summary>Subnet Read Java API to Read Allocation Using CDB Context</summary>

```java
ConfIPPrefix
com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRead(Cdb cdb,
        String poolName,
        String id)
```

**API Parameter**

```
| Parameter   | Type     | Description                                           |
|-------------|----------|-------------------------------------------------------|
| cdb         | Database | A database resource.                                  |
| poolName    | String   | Name of the resource pool the request was created in. |
| id          | String   | Unique allocation ID for the allocation request.      |
```

**Example**

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

allocatedIP = IPAddressAllocator.subnetRead(cdb, poolName, id);

returns allocated IP subnet
```

**Response**

The API returns the allocated subnet IP.

</details>

<details>

<summary>From Read Java API to Read Allocation Using CDB Context</summary>

```java
ConfIPPrefix com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    fromRead(Cdb cdb,
        String poolName,
        String id)
```

**API Parameters**

```
| Parameter   | Type     | Description                                           |
|-------------|----------|-------------------------------------------------------|
| cdb         | Database | A database resource.                                  |
| poolName    | String   | Name of the resource pool the request was created in. |
| id          | String   | Unique allocation ID for the allocation request.      |
```

**Example**

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

allocatedIP = IPAddressAllocator.fromRead(cdb, poolName, id);

returns allocated IP subnet
```

**Response**

Returns the subnet from which the IP allocation was made.

</details>

<details>

<summary>New Subnet Read Java API to Read Allocation</summary>

The following is the recommended API to read the allocated IP.

```java
ConfIPPrefix com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRead(NavuContext context,
        String poolName,
        String id)
```

**API Parameters**

```
| Parameter   | Type     | Description                                           |
|-------------|----------|-------------------------------------------------------|
| cdb         | Database | A database resource.                                  |
| poolName    | String   | Name of the resource pool the request was created in. |
| id          | String   | Unique allocation ID for the allocation request.      |
```

**Example**

```java
import com.tailf.pkg.ipaddressallocator.IPAddressAllocator;

allocatedIP = IPAddressAllocator.subnetRead(service.context(), poolName,
id);

returns allocated IP subnet
```

**Response**

Returns the allocated subnet for the IP.

</details>

### Using Java APIs for Non-service IP Allocations

This non-service IP address allocation API is created from Resource Manager 4.2.11.

<details>

<summary><code>subnetRequest()</code></summary>

This API is used to request subnet from the IP address pool.

```java
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRequest(Maapi maapi,
        int th,
        RedeployType redeployType,
        String poolName,
        String username,
        String startIp
        int cidrmask,
        String id,
        Boolean invertCidr,
        Boolean sync_alloc
        )
```

**API Parameters**

```
| Parameter     | Type     | Description                                                         |
|---------------|----------|---------------------------------------------------------------------|
| maapi         | Maapi    | Maapi Object.                                                       |
| th            | int      | Transaction handle.                                                 |
| poolName      | String   | Name of the resource pool to request the subnet IP address from.    |
| Username      | String   | Name of the user to use when redeploying the requesting service.    |
| cidrmask      | Int      | CIDR mask length of the requested subnet.                           |
| invertCidr    | Boolean  | If boolean value is true, the subnet mask length is inverted.       |
| id            | String   | Unique allocation ID.                                               |
| sync_alloc    | Boolean  | Set value to true to make a synchronous allocation request.         | 
                             By default, it is false (asynchronous).                             |
```

**Example**

```java
NavuContainer loop = (NavuContainer) service;
    Maapi maapi = service.context().getMaapi();
    int th = service.context().getMaapiHandle();
        ConfBuf devName = (ConfBuf) loop.leaf("device").value();
        IPAddressAllocator.subnetRequest(maapi, th, RedeployType.DEFAULT, poolName, "admin", null,
    32, allocationName, false, false);
        if (IPAddressAllocator.responseReady(maapi, th, poolName, allocationName)) {
            LOGGER.debug("responseReady for ipaddress is true.");
            ConfIPPrefix subnet = IPAddressAllocator.subnetRead(maapi, th, poolName, allocationName);
            LOGGER.debug(String.format("subnetRead maapi.Got the value for subnet : %s ",
    subnet.getAddress()));
```

</details>

<details>

<summary><code>subnetRead()</code></summary>

This API is used to read the allocated subnet from the IP address pool.

```java
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    subnetRead(Maapi maapi,
        int th,
        String poolName,
        String allocationName
        )
```

**API Parameters**

```
| Parameter       | Type   | Description                                                      |
|-----------------|--------|------------------------------------------------------------------|
| maapi           | Maapi  | Maapi Object.                                                    |
| th              | int    | Transaction handle.                                              |
| poolName        | String | Name of the resource pool to request the subnet IP address from. |
| allocationName  | String | Allocation name used to read allocated ID.                       |
```

**Example**

```java
NavuContainer loop = (NavuContainer) service;
    Maapi maapi = service.context().getMaapi();
    int th = service.context().getMaapiHandle();
        ConfBuf devName = (ConfBuf) loop.leaf("device").value();
        IPAddressAllocator.subnetRequest(maapi, th, RedeployType.DEFAULT, poolName, "admin", null,
    32, allocationName, false, false);
        if (IPAddressAllocator.responseReady(maapi, th, poolName, allocationName)) {
            LOGGER.debug("responseReady for ipaddress is true.");
            ConfIPPrefix subnet = IPAddressAllocator.subnetRead(maapi, th, poolName, allocationName);
            LOGGER.debug(String.format("subnetRead maapi.Got the value for subnet : %s ",
subnet.getAddress()));
```

</details>

<details>

<summary><code>responseReady()</code></summary>

This API is used to check if the response is ready in case of an async subnet request.

```java
void com.tailf.pkg.ipaddressallocator.IPAddressAllocator.
    responseReady(Maapi maapi,
        int th,
        String poolName,
        String allocationName,
    )
```

**API Parameters**

```
| Parameter       | Type   | Description                                                   |
|-----------------|--------|-------------------------------------------------------------------|
| maapi           | Maapi  | Maapi Object.                                                     |
| th              | int    | Transaction handle.                                               |
| poolName        | String | Name of the resource pool to request the subnet IP address from.  |
| allocationName  | String | Allocation Name.                                                  |
```

**Example**

```java
NavuContainer loop = (NavuContainer) service;
    Maapi maapi = service.context().getMaapi();
    int th = service.context().getMaapiHandle();
        ConfBuf devName = (ConfBuf) loop.leaf("device").value();
        IPAddressAllocator.subnetRequest(maapi, th, RedeployType.DEFAULT, poolName, "admin", null,
    32, allocationName, false, false);
        if (IPAddressAllocator.responseReady(maapi, th, poolName, allocationName)) {
            LOGGER.debug("responseReady for ipaddress is true.");
            ConfIPPrefix subnet = IPAddressAllocator.subnetRead(maapi, th, poolName, allocationName);
            LOGGER.debug(String.format("subnetRead maapi.Got the value for subnet : %s ",
    subnet.getAddress()));
```

</details>

{% hint style="info" %}
**Common Exceptions Raised by Java APIs for Errors**

* `ResourceErrorException`: If the allocation has failed, the request does not exist, or the pool does not exist.
* `ResourceWaitException`: If the allocation is not ready.
{% endhint %}

### Using Python APIs for IP Allocations

#### Creating Python APIs for IP Allocations

The RM package exposes Python APIs to manage allocation for IP subnet from the resource pool.

Below is the list of Python APIs exposed by the RM package.

<details>

<summary>Default Python API for IP Subnet Allocation Request</summary>

The following API is used to create an allocation request for an IP address from a resource pool.

Use the API definition `net_request` found in the module `resource_manager.ipaddress_allocator`.

The `net_request` function is designed to create an allocation request for a network. It takes several arguments, including the requesting service, username, pool name, allocation name, CIDR mask (size of the network), and optional parameters such as `invert_cidr`, `redeploy_type`, `sync_alloc`, and `root`. After calling this function, you need to call `net_read` to read the allocated IP from the subnet.

```python
def net_request (service,
    svc_xpath,
    username,
    pool_name,
    allocation_name,
    cidrmask,
    invert_cidr=False,
    redeploy_type="default",
    sync_alloc=False,
    root=None)
```

**API Parameters**

```
| Parameter        | Type     | Description                                                                                              |
|------------------|----------|----------------------------------------------------------------------------------------------------------|
| service          |          | The requesting service node.                                                                             |
| svc_xpath        | String   | XPath to the requesting service.                                                                         |
| username         | String   | Name of the user to use when redeploying the requesting service.                                         |
| pool_name        | Int      | Name of the resource pool to make the allocation request from.                                           |
| allocation_name  | String   | Unique allocation name.                                                                                  |
| cidrmask         |          | Size of the network.                                                                                     |
| invert_cidr      | Boolean  |                                                                                                          |
| redeploy_type    |          | Service redeploy action. Available options: default, touch, re-deploy, reactive-re-deploy, no-redeploy.  |
| sync_alloc       | Boolean  | Allocation type, whether synchronous or asynchronous. By default, it is asynchronous.                    |
| Root             |          | Root node. If sync is set to true, you must provide a root node.                                         |
```

**Example**

```python
import resource_manager.ipaddress_allocator as ip_allocator

# Define pool and allocation names
pool_name = "The Pool"
allocation_name = "Unique allocation name"
sync_alloc_name = "Unique synchronous allocation name"

# Asynchronous network allocation
# This will try to allocate a network of size 24 from the pool named 'The Pool'
# using the allocation name: 'Unique allocation name'
ip_allocator.net_request(
    service,
    "/services/vl:loop-python[name='%s']" % (service.name),
    tctx.username,
    pool_name,
    allocation_name,
    24
)

# Synchronous network allocation
# This will try to allocate a network of size 24 from the pool named 'The Pool'
# using the allocation name: 'Unique synchronous allocation name'
ip_allocator.net_request(
    service,
    "/services/vl:loop-python[name='%s']" % (service.name),
    tctx.username,
    pool_name,
    sync_alloc_name,
    24,
    sync=True,
    root=root
)
```

</details>

<details>

<summary>Python API for IP Subnet Allocation Request with Start IP Address</summary>

The following API is used to create a static allocation request for an IP address from a resource pool. Use the API definition `net_request_static` found in the module `resource_manager.ipaddress_allocator`.

The `net_request_static` function extends the functionality of `net_request` to allow for the static allocation of network resources, specifically addressing individual IP addresses within a subnet. In addition to the parameters used in `net_request`, it also accepts `subnet_start_ip`, which specifies the starting IP address of the requested subnet. This function provides a way to allocate specific IP addresses within a network pool, useful for scenarios where certain IP addresses need to be reserved or managed independently. The function maintains similar error handling and package requirements as `net_request`, ensuring consistency in network resource management.

```python
def net_request_static(service,
    svc_xpath,
    username,
    pool_name,
    allocation_name,
    subnet_start_ip,
    cidrmask,
    invert_cidr=False,
    redeploy_type="default",
    sync_alloc=False,
    root=None)
```

**API Parameters**

```
| Parameter        | Type     | Description                                                                                             |
|------------------|----------|---------------------------------------------------------------------------------------------------------|
| service          |          | The requesting service node.                                                                            |
| svc_xpath        | String   | XPath to the requesting service.                                                                        |
| username         | String   | Name of the user to use when redeploying the requesting service.                                        |
| pool_name        | Int      | Name of the resource pool to make the allocation request from.                                          |
| allocation_name  | String   | Unique allocation name.                                                                                 |
| cidrmask         |          | Size of the network.                                                                                    |
| invert_cidr      | Boolean  | Whether to invert the CIDR.                                                                             |
| redeploy_type    |          | Service Redeploy action. Available options: default, touch, re-deploy, reactive-re-deploy, no-redeploy. |
| sync_alloc       | Boolean  | Allocation type, whether synchronous or asynchronous. By default, it is asynchronous.                   |
| root             |          | Root node. If `sync` is set to true, you must provide a root node.                                      |
```

**Example**

```python
import resource_manager.ipaddress_allocator as ip_allocator

# Define pool and allocation names
pool_name = "The Pool"
allocation_name = "Unique allocation name"
sync_alloc_name = "Unique synchronous allocation name"

# Asynchronous static IP allocation
# This will try to allocate the address 10.0.0.8 with a CIDR mask of 32
# from the pool named 'The Pool', using the allocation name: 'Unique allocation name'
ip_allocator.net_request_static(
    service,
    "/services/vl:loop-python[name='%s']" % (service.name),
    tctx.username,
    pool_name,
    allocation_name,
    "10.0.0.8",
    32
)

# Synchronous static IP allocation
# This will try to allocate the address 10.0.0.9 with a CIDR mask of 32
# from the pool named 'The Pool', using the allocation name: 'Unique synchronous allocation name'
ip_allocator.net_request_static(
    service,
    "/services/vl:loop-python[name='%s']" % (service.name),
    tctx.username,
    pool_name,
    sync_alloc_name,
    "10.0.0.9",
    32,
    sync=True,
    root=root
)
```

</details>

<details>

<summary>Reading the Allocated IP Subnet Once the Allocation is Ready</summary>

Use the API definition `net_read` found in the module `resource_manager.ipaddress_allocator` to read the allocated subnet IP. The `net_read` function retrieves the allocated network from the specified pool and allocation name. It takes the username, root node for the current transaction, pool name, and allocation name as parameters. The function interacts with the `rm_alloc` module to read the allocated network, returning it if available or None if not ready. It's important to note that the function should be used to ensure that the response subnet is received in the current transaction, avoiding aborts or failures during the commit.

```python
def net_read(username,
    root,
    pool_name,
    allocation_name)
```

**API Parameters**

```
| Parameter        | Type    | Description                                                          |
|------------------|---------|----------------------------------------------------------------------|
| username         | String  | Name of the user to use when redeploying the requesting service.     |
| root             |         | A maagic root for the current transaction.                           |
| pool_name        | String  | Name of the resource pool to make the allocation request from.       |
| allocation_name  | String  | Unique allocation name.                                              |
```

**Example**

```python
# After requesting allocation, we check if IP is allocated.
net = ip_allocator.net_read(
    tctx.username,
    root,
    pool_name,
    allocation_name
)

if not net:
    self.log.info("Alloc not ready")
    return

print("net = %s" % (net))
```

</details>

### Using Python APIs for Non-Service IP Allocations

#### Creating Python APIs for IP Allocations

The RM package exposes Python APIs to manage non-service allocation for IP subnet from the resource pool. Below is the list of Python APIs exposed by the RM package.

<details>

<summary>Non-Service Python API for IP Subnet Allocation Request</summary>

The following API is used to create an allocation request for an IP address from a resource pool. Use the API definition `net_request_tr` found in the module `resource_manager.ipaddress_allocator`.

The `net_request_tr` function is designed to create a non-service allocation request for a network. It takes several arguments, including the requesting tr ( transaction backend) , username, pool name, allocation name, CIDR mask (size of the network), and optional parameters such as `invert_cidr`, `redeploy_type`, `sync_alloc`, and `root`. After calling this function, you need to call `net_read` to read the allocated IP from the subnet.

```python
def net_request_tr (tr,
    username,
    pool_name,
    allocation_name,
    cidrmask,
    invert_cidr=False,
    redeploy_type="default",
    sync_alloc=False,
    root=None)
```

**API Parameters**

```
| Parameter       | Type     | Description                                                                                         |
|-----------------|----------|-----------------------------------------------------------------------------------------------------|
| tr              |          | The transaction backend.                                                                            |
| username        | String   | Name of the user to use when redeploying the requesting service.                                    |
| pool_name       | Int      | Name of the resource pool to make the allocation request from.                                      |
| allocation_name | String   | Unique allocation name.                                                                             |
| cidrmask        |          | Size of the network.                                                                                |
| invert_cidr     | Boolean  |                                                                                                     |
| sync_alloc      | Boolean  | Set value to true to make a synchronous allocation request. By default, it is false (asynchronous). |
```

**Example**

```python
import resource_manager.ipaddress_allocator as ip_allocator

pool_name = "The Pool"
allocation_name = "Unique allocation name"
sync_alloc_name = "Unique synchronous allocation name"

# This will try to asynchronously allocate the network of size 24 from the pool named 'The Pool'
# using allocation name: 'Unique allocation name'
ip_allocator.net_request_tr(
    maagic.get_trans(root),
    tctx.username,
    pool_name,
    alloc_name,
    service.cidr_length,
    False,
    "default",
    False,
    None
)

# This will try to synchronously allocate the network of size 24 from the pool named 'The Pool'
# using allocation name: 'Unique synchronous allocation name'
ip_allocator.net_request_tr(
    maagic.get_trans(root),
    tctx.username,
    pool_name,
    alloc_name,
    service.cidr_length,
    False,
    "default",
    True,
    None
)
```

</details>

## ID Allocations

RM package exposes APIs to manage ID allocation from the ID resource pool. The APIs are available to request ID, check if the allocation is ready and also to read the allocation once ready.

### Using JAVA APIs for ID Allocations – Asynchronous Old APIs

The following are the asynchronous old Java APIs for ID allocation from the RM resource pool.

<details>

<summary>Default Java API for ID Allocation Request</summary>

The following API is used to create or update an ID allocation request with service redeploy type as default.

```java
idRequest(NavuNode service,
    String poolName,
    String username,
    String id,
    boolean sync_pool,
    long requestedId)
```

**API Parameters**

```
| Parameter    | Type      | Description                                                               |
|--------------|-----------|---------------------------------------------------------------------------|
| Service      | NavuNode  | NavuNode referencing the requesting service node.                         |
| poolName     | String    | Name of the resource pool to request the allocation ID from.              |
| Username     | String    | Name of the user to use when redeploying the requesting service.          |
| id           | String    | Unique allocation ID.                                                     |
| sync_pool    | Boolean   | Sync allocations with the ID value across pools.                          |
| Requested ID | Int       | Request the specific ID to be allocated.                                  |
```

**Example**

```java
import com.tailf.pkg.idallocator.IdAllocator;
IdAllocator.idRequest(service, poolName, userName, id,
test_with_sync.booleanValue(), requestId);
```

</details>

<details>

<summary>Java API for ID Allocation Request with Redeploy Type</summary>

The following API is used to create or update an IP allocation request with requesting service redeploy type as `redeployType`.

```java
idRequest(NavuNode service, RedeployType redeployType,
    String poolName,
    String username,
    String id,
    boolean sync_pool,
    long requestedId)
```

**API Parameters**

```
| Parameter      | Type      | Description                                                                  |
|----------------|-----------|------------------------------------------------------------------------------|
| Service        | NavuNode  | NavuNode referencing the requesting service node.                            |
| redeployType   |           | The available options are: Default, Redeploytype, Touch, Reactive-re-deploy. |
| poolName       | String    | Name of the resource pool to request the allocation ID from.                 |
| Username       | String    | Name of the user to use when redeploying the requesting service.             |
| ID             | String    | Unique allocation ID.                                                        |
| sync_pool      | Boolean   | Sync allocations with the ID value across pools.                             |
| Requested ID   | Int       | Request the specific ID to be allocated.                                     |
```

**Example**

```java
import com.tailf.pkg.idallocator.IdAllocator;

IdAllocator.idRequest(service, redeployType, poolName, userName, id,
test_with_sync.booleanValue(), requestId);
```

</details>

<details>

<summary>Java API for ID Allocation Request with Service Context</summary>

The following API is used to create or update an ID allocation request with requesting service redeploy type as `default`.

```java
idRequest(ServiceContext context,
    NavuNode service,
    String poolName,
    String username,
    String id,
    boolean sync_pool,
    long requestedId)
```

**API Parameters**

```
| Parameter    | Type          | Description                                                                  |
|--------------|---------------|------------------------------------------------------------------------------|
| context      | ServiceContext| Context referencing the requesting context that the service was invoked in.  |
| service      | NavuNode      | NavuNode referencing the requesting service node.                            |
| poolName     | String        | Name of the resource pool to request the allocation ID from.                 |
| Username     | String        | Name of the user to use when redeploying the requesting service.             |
| ID           | String        | Unique allocation ID.                                                        |
| sync_pool    | Boolean       | Sync allocations with the ID value across pools.                             |
| Requested ID | Int           | Request the specific ID to be allocated.                                     |
```

**Example**

```java
import com.tailf.pkg.idallocator.IdAllocator;

IdAllocator.idRequest(context, service, poolName, userName, id,
test_with_sync.booleanValue(), requestId);
```

</details>

<details>

<summary>Java API for ID Allocation Request with Service Context and OddEven Allocation</summary>

The following API is used to create or update an ID allocation request with requesting service redeploy type as `default`.

```java
idRequest(ServiceContext context,
    NavuNode service,
    String poolName,
    String username,
    String id,
    boolean sync_pool,
    IdType oddeven_alloc)
```

**API Parameters**

```
| Parameter     | Type          | Description                                                                  |
|---------------|---------------|------------------------------------------------------------------------------|
| context       | ServiceContext| Context referencing the requesting context that the service was invoked in.  |
| service       | NavuNode      | NavuNode referencing the requesting service node.                            |
| poolName      | String        | Name of the resource pool to request the allocation ID from.                 |
| Username      | String        | Name of the user to use when redeploying the requesting service.             |
| ID            | String        | Unique allocation ID.                                                        |
| sync_pool     | Boolean       | Sync allocations with the ID value across pools.                             |
| oddeven_alloc | IdType        | Request the odd or even ID to be allocated.                                  |
```

**Example**

```java
import com.tailf.pkg.idallocator.IdAllocator;

IdAllocator.idRequest(context, service, poolName, userName, id,
test_with_sync.booleanValue(), oddeven_alloc);
```

</details>

<details>

<summary>Java API for ID Allocation Request with Service Context and Redeploy Type</summary>

Use the following API to create or update an ID allocation request with the requesting service redeploy type as `redeployType`.

```java
idRequest(ServiceContext
    context,
    NavuNode service,
    RedeployType redeployType,
    String poolName,
    String username,
    String id,
    boolean sync_pool,
    long requestedId)
```

**API Parameter**

```
| Parameter    | Type          | Description                                                                                                     |
|--------------|---------------|-----------------------------------------------------------------------------------------------------------------|
| context      | ServiceContext| Context referencing the requesting context that the service was invoked in.                                     |
| service      | NavuNode      | NavuNode referencing the requesting service node.                                                               |
| redeployType |               | Service redeploy action. The available options are: default, touch, re-deploy, reactive-re-deploy, no-redeploy. |
| poolName     | String        | Name of the resource pool to request the allocation ID from.                                                    |
| username     | String        | Name of the user to use when redeploying the requesting service.                                                |
| id           | String        | Unique allocation ID.                                                                                           |
| sync_pool    | Boolean       | Sync allocations with the ID value across pools.                                                                |
| requestedId  | Int           | Request the specific ID to be allocated.                                                                        |
```

**Example**

```java
import com.tailf.pkg.idallocator.IdAllocator;

IdAllocator.idRequest(context, service, redeployType, poolName, userName,
id, test_with_sync.booleanValue(), requestId);
```

</details>

<details>

<summary>Java API for ID Allocation Request with Service Context, Redeploy Type and OddEven Allocation</summary>

Use the following API to create or update an ID allocation request with the requesting service redeploy type as `redeployType`.

```java
idRequest(ServiceContext
    context,
    NavuNode service,
    RedeployType redeployType,
    String poolName,
    String username,
    String id,
    boolean sync_pool,
    boolean sync_alloc,
    IdType oddeven_alloc)
```

**API Parameter**

```
| Parameter    | Type          | Description                                                                                                     |
|--------------|---------------|-----------------------------------------------------------------------------------------------------------------|
| context      | ServiceContext| Context referencing the requesting context that the service was invoked in.                                     |
| service      | NavuNode      | NavuNode referencing the requesting service node.                                                               |
| redeployType |               | Service redeploy action. The available options are: default, touch, re-deploy, reactive-re-deploy, no-redeploy. |
| poolName     | String        | Name of the resource pool to request the allocation ID from.                                                    |
| username     | String        | Name of the user to use when redeploying the requesting service.                                                |
| id           | String        | Unique allocation ID.                                                                                           |
| sync_pool    | Boolean       | Sync allocations with the ID value across pools.                                                                |
| sync_alloc   | Int           | Request the specific ID to be allocated.                                                                        |
| oddeven_alloc| IdType        | Request the odd or even ID to be allocated.                                                                     |
```

**Example**

```java
import com.tailf.pkg.idallocator.IdAllocator;

IdAllocator.idRequest(context, service, redeployType, poolName, userName,
id, test_with_sync.booleanValue(), oddeven_alloc);
```

</details>

### Using JAVA APIs for Non-Service ID Allocations

The following API is used to create or update an ID allocation request with non-service.

<details>

<summary><code>idRequest()</code></summary>

This `idRequest()` method takes maapi object and transaction handle (`th`) as a parameter instead of `ServiceContext` object.

```java
idRequest(Maapi maapi,
    int th,
    String poolName,
    String username,
    String id,
    boolean sync_pool,
    long requestedId,
    boolean sync_alloc)
```

**API Parameter**

```
| Parameter   | Type   | Description                                                               |
|-------------|--------|---------------------------------------------------------------------------|
| maapi       | Maapi  | Maapi object.                                                             |
| th          | int    | Transaction handle.                                                       |
| poolName    | String | Name of the resource pool to request the allocation ID from.              |
| Username    | String | Name of the user to use when redeploying the requesting service.          |
| id          | String | Unique allocation ID.                                                     |
| sync_pool   | Boolean| Sync allocations with the ID value across pools.                          |
| requestedId | Int    | Request the specific ID to be allocated.                                  |
| sync_alloc  | Boolean| If the boolean value is true, the allocation is synchronous.              |
```

**Example**

```java
NavuContainer loop = (NavuContainer) service;
Maapi maapi = service.context().getMaapi();
int th = service.context().getMaapiHandle();
ConfBuf devName = (ConfBuf) loop.leaf("device").value();
String poolName = loop.leaf("pool").value().toString();
String username = "admin";
String allocationName = loop.leaf("allocation-name").value().toString();
ConfBool sync = (ConfBool) loop.leaf("sync").value();

LOGGER.debug("doMaapiCreate() , service Name = " + allocationName);

long requestedId = loop.leaf("requestedId").exists()
    ? ((ConfUInt32) loop.leaf("requestedId").value()).longValue()
    : -1L;

/* Create resource allocation request. */
LOGGER.debug(String.format("id allocation Requesting %s , allocationName %s , requestedId %d",
    poolName, allocationName, requestedId));

IdAllocator.idRequest(maapi, th, poolName, username, allocationName, sync.booleanValue(),
    requestedId, false);

try {
    if (IdAllocator.responseReady(maapi, th, poolName, allocationName)) {
        LOGGER.debug(String.format("responseReady maapi True. allocationName %s.",
            allocationName));
        ConfUInt32 id = IdAllocator.idRead(maapi, th, poolName, allocationName);
        LOGGER.debug(String.format("idRead maapi: We got the id: %s.", id.longValue()));
    }
```

</details>

<details>

<summary><code>idRequest() with oddeven_alloc</code></summary>

This `idRequest()` method takes maapi object and transaction handle (`th`) as a parameter instead of `ServiceContext` object.

```java
idRequest(Maapi maapi,
    int th,
    String poolName,
    String username,
    String id,
    boolean sync_pool,
    boolean sync_alloc,
    IdType oddeven_alloc)
```

**API Parameter**

```
| Parameter    | Type   | Description                                                               |
|--------------|--------|---------------------------------------------------------------------------|
| maapi        | Maapi  | Maapi object.                                                             |
| th           | int    | Transaction handle.                                                       |
| poolName     | String | Name of the resource pool to request the allocation ID from.              |
| Username     | String | Name of the user to use when redeploying the requesting service.          |
| id           | String | Unique allocation ID.                                                     |
| sync_pool    | Boolean| Sync allocations with the ID value across pools.                          |
| sync_alloc   | Boolean| If the boolean value is true, the allocation is synchronous.              |
| oddeven_alloc| IdType | Request the odd or even ID to be allocated.                               |
```

**Example**

```java
NavuContainer loop = (NavuContainer) service;
Maapi maapi = service.context().getMaapi();
int th = service.context().getMaapiHandle();
ConfBuf devName = (ConfBuf) loop.leaf("device").value();
String poolName = loop.leaf("pool").value().toString();
String username = "admin";
String allocationName = loop.leaf("allocation-name").value().toString();
ConfBool sync = (ConfBool) loop.leaf("sync").value();
String oddevenStr = ConfValue.getStringByValue(servicePath + "/oddeven-alloc", service.leaf("oddeven-alloc").value());
IdType oddeven_alloc = IdType.from(oddevenStr);

LOGGER.debug("doMaapiCreate() , service Name = " + allocationName);

/* Create resource allocation request. */
LOGGER.debug(String.format("id allocation Requesting %s , allocationName %s , requestedId %d",
    poolName, allocationName, requestedId));

IdAllocator.idRequest(maapi, th, poolName, username, allocationName, sync.booleanValue(),
    false, oddeven_alloc);

try {
    if (IdAllocator.responseReady(maapi, th, poolName, allocationName)) {
        LOGGER.debug(String.format("responseReady maapi True. allocationName %s.",
            allocationName));
        ConfUInt32 id = IdAllocator.idRead(maapi, th, poolName, allocationName);
        LOGGER.debug(String.format("idRead maapi: We got the id: %s.", id.longValue()));
    }
```

</details>

<details>

<summary><code>idRead()</code></summary>

The following API is used to read the allocated ID.

```java
idRead(Maapi maapi,
    int th,
    String poolName,
    String allocationName,
)
```

**API Parameters**

```
| Parameter     | Type   | Description                                                   |
|---------------|--------|---------------------------------------------------------------|
| maapi         | Maapi  | Maapi object.                                                 |
| th            | int    | Transaction handle.                                           |
| poolName      | String | Name of the resource pool to request the allocation ID from.  |
| allocationName| String | Allocation name.                                              |
```

**Example**

```java
NavuContainer loop = (NavuContainer) service;
Maapi maapi = service.context().getMaapi();
int th = service.context().getMaapiHandle();
ConfBuf devName = (ConfBuf) loop.leaf("device").value();
String poolName = loop.leaf("pool").value().toString();
String username = "admin";
String allocationName = loop.leaf("allocation-name").value().toString();
ConfBool sync = (ConfBool) loop.leaf("sync").value();

LOGGER.debug("doMaapiCreate() , service Name = " + allocationName);

long requestedId = loop.leaf("requestedId").exists() ?
    ((ConfUInt32) loop.leaf("requestedId").value()).longValue() : -1L;

/* Create resource allocation request. */
LOGGER.debug(String.format("id allocation Requesting %s , allocationName %s , requestedId %d", 
    poolName, allocationName, requestedId));

IdAllocator.idRequest(maapi, th, poolName, username, allocationName, sync.booleanValue(), 
    requestedId, false);

try {
    if (IdAllocator.responseReady(maapi, th, poolName, allocationName)) {
        LOGGER.debug(String.format("responseReady maapi True. allocationName %s.", 
            allocationName));
        
        ConfUInt32 id = IdAllocator.idRead(maapi, th, poolName, allocationName);
        LOGGER.debug(String.format("idRead maapi: We got the id: %s.", id.longValue()));
    }
}
```

</details>

<details>

<summary><code>responseReady()</code></summary>

The following API is used to check whether the response is ready after the ID request in case of an asynchronous allocation request.

```java
responseReady(Maapi maapi,
    int th,
    String poolName,
    String allocationName,
    )
```

**API Parameters**

```
| Parameter       | Type     | Description                                                    |
|-----------------|----------|----------------------------------------------------------------|
| maapi           | Maapi    | Maapi object.                                                  |
| th              | int      | Transaction handle.                                            |
| poolName        | String   | Name of the resource pool to request the allocation ID from.   |
| allocationName  | String   | Allocation Name.                                               |
```

**Example**

```java
NavuContainer loop = (NavuContainer) service;
Maapi maapi = service.context().getMaapi();
int th = service.context().getMaapiHandle();
ConfBuf devName = (ConfBuf) loop.leaf("device").value();
String poolName = loop.leaf("pool").value().toString();
String username = "admin";
String allocationName = loop.leaf("allocation-name").value().toString();
ConfBool sync = (ConfBool) loop.leaf("sync").value();
LOGGER.debug("doMaapiCreate() , service Name = " + allocationName);

long requestedId = loop.leaf("requestedId").exists()
    ? ((ConfUInt32) loop.leaf("requestedId").value()).longValue()
    : -1L;

/* Create resource allocation request. */
LOGGER.debug(String.format("id allocation Requesting %s , allocationName %s , requestedId %d",
    poolName, allocationName, requestedId));

IdAllocator.idRequest(maapi, th, poolName, username, allocationName, sync.booleanValue(),
    requestedId, false);

try {
    if (IdAllocator.responseReady(maapi, th, poolName, allocationName)) {
        LOGGER.debug(String.format("responseReady maapi True. allocationName %s.", allocationName));
        ConfUInt32 id = IdAllocator.idRead(maapi, th, poolName, allocationName);
        LOGGER.debug(String.format("idRead maapi: We got the id: %s.", id.longValue()));
    }
```

</details>

{% hint style="info" %}
**Common Exceptions Raised by Java APIs for Errors**

* The API may throw the below exception if no pool resource exists for the requested allocation: `ResourceErrorException`.
* The API may throw the below exception if the ID request conflicts with another allocation or does not match the previous allocation in case of multiple owner requests: `AllocationException`.&#x20;
{% endhint %}

### Verifying Responses for ID Allocations – Java APIs

RM package exposes `responseReady` Java API to verify if the ID allocation request is ready or not.

The following APIs are used to verify if the response is ready for an ID allocation request.

<details>

<summary>Java API to Check ID Allocation Ready Using CDB Context</summary>

```java
boolean responseReady
    (NavuContext context, 
    Cdb cdb,
    String poolName, 
    String id)
```

**API Parameters**

```
| Parameter | Type        | Description                                                 |
|-----------|-------------|-------------------------------------------------------------|
| context   | NavuContext | A NavuContext for the current transition.                   |
| poolName  | Str         | Name of the resource pool to request the allocation ID from.|
| cdb       | database    | The resource database.                                      |
| id        | String      | Unique allocation ID.                                       |
```

**Example**

```java
import com.tailf.pkg.idallocator.IdAllocator;

ready = IdAllocator.responseReady(service.context(), cdb, poolName, id);
returns True or False
```

</details>

<details>

<summary>Java API to Check ID Allocation Ready Without Using CDB Context</summary>

```java
boolean responseReady
    (NavuContext context, 
    String poolName, 
    String id)
```

**API Parameters**

```
| Parameter   | Type         | Description                                                 |
|-------------|--------------|-------------------------------------------------------------|
| NavuContext |              | A NavuContext For the current transition.                   |
| poolName    | Str          | Name of the resource pool to request the allocation ID from.|
| ID          |              | Unique allocation ID.                                       |
```

**Example**

```java
import com.tailf.pkg.idallocator.IdAllocator;

ready = IdAllocator.responseReady(service.context(), poolName, id);
returns True or False
```

**Response**

The API returns a `true` value if a response for the allocation is ready.

</details>

{% hint style="info" %}
**Common Exceptions Raised by Java APIs for Errors**

* The API may throw the below exception if no pool resource exists for the requested allocation: `ResourceException`.
* The API may throw the below exception when there are format errors in the API request call: `ConfException`.
* The API may throw the below exception when the I/O operations fail or are interrupted: `IOException`.
{% endhint %}

### Reading ID Allocation Responses for Java APIs

The following API reads information about specific allocation requests made by the API call. The response returns the allocated ID from the ID pool.

<details>

<summary>Java API to Read ID Allocation Once Ready Using CDB Context</summary>

The following API is used to verify the response for an asynchronous ID allocation request.

```java
ConfUInt32 idRead
    (Cdb cdb,
    String poolName, 
    String id)
```

**API Parameters**

```
| Parameter | Type   | Description                                                  |
|-----------|--------|--------------------------------------------------------------|
| cdb       | Cdb    | A database resource.                                         |
| poolName  | Str    | Name of the resource pool to request the allocation ID from. |
| ID        | String | Unique allocation ID.                                        |
```

**Example**

```java
import com.tailf.pkg.idallocator.IdAllocator;

allocatedID = IdAllocator.idRead(cdb, poolName, id);

returns allocated ID
```

</details>

<details>

<summary>Java API to Read ID Allocation Once Ready Without Using CDB Context</summary>

```java
ConfUInt32 idRead
    (NavuContext context, 
    String poolName, 
    String id)
```

**API Parameters**

```
| Parameter  | Type        | Description                                                  |
|------------|-------------|--------------------------------------------------------------|
| context    | NavuContext | A Navu context for the current transaction.                  |
| poolName   | String      | Name of the resource pool to request the allocation ID from. |
| ID         | String      | Unique allocation ID.                                        |
```

**Example**

```java
import com.tailf.pkg.idallocator.IdAllocator;

allocatedID = IdAllocator.idRead(service.context(), poolName, id);

returns allocated ID
```

</details>

### Using JAVA APIs for ID Allocations – Synchronous/Asynchronous New APIs

The following are the synchronous/asynchronous new Java APIs exposed by the RM package for ID allocation from the resource pool.

<details>

<summary>Java API for ID Allocation Request Using Service Context</summary>

The following API is used to verify the response for a synchronous or asynchronous ID allocation request.

```java
idRequest(ServiceContext context,
    NavuNode service,
    RedeployType redeployType,
    String poolName,
    String username,
    String id,
    boolean sync_pool,
    long requestedId,boolean
    sync_alloc)
```

**API Parameter**

```
| Parameter    | Type          | Description                                                                  |
|--------------|---------------|------------------------------------------------------------------------------|
| context      | ServiceContext| A context referencing the requesting context the service was invoked in.     |
| service      | NavuNode      | Navu node referencing the requesting service node.                           |
| redeployType |               | Service redeploy action.                                                     |
| poolName     | String        | Name of the resource pool to request the allocation ID from.                 |
| username     | String        |                                                                              |
| id           | String        | Unique allocation ID.                                                        |
| sync_pool    | Boolean       | Sync allocations with the ID value across pools.                             |
| requestedId  | Int           | A specific ID to be requested.                                               |
| sync_alloc   | Boolean       | If the boolean value is true, the allocation is synchronous.                 |
```

**Example**

```java
import com.tailf.pkg.idallocator.IdAllocator;

IdAllocator.idRequest(context, service, redeployType, poolName, userName,
id, test_with_sync.booleanValue(), requestId, syncAlloc.booleanValue());
```

</details>

<details>

<summary>Default Java API for ID Allocation Request</summary>

The following API is used to verify the response for a synchronous or asynchronous ID allocation request.

```java
idRequest(NavuNode service,
    RedeployType redeployType,
    String poolName,
    String username,
    String id,
    boolean sync_pool,
    long requestedId,
    boolean sync_alloc)
```

**API Parameters**

```
| Parameter     | Type       | Description                                                                                       |
|---------------|------------|---------------------------------------------------------------------------------------------------|
| service       | NavuNode   | Navu node referencing the requesting service node.                                                |
| redeployType  |            | Service redeploy action. Options are: default, touch, re-deploy, reactive-re-deploy, no-redeploy. |
| poolName      | String     | Name of the resource pool to request the allocation ID from.                                      |
| username      | String     |                                                                                                   |
| id            | String     | Unique allocation ID.                                                                             |
| sync_pool     | Boolean    | Sync allocations with the ID value across pools.                                                  |
| requestedId   | Int        | A specific ID to be requested.                                                                    |
| sync_alloc    | Boolean    | Synchronous allocation.                                                                           | 
```

**Example**

```java
import com.tailf.pkg.idallocator.IdAllocator;

IdAllocator.idRequest(service, redeployType, poolName, userName, id,
test_with_sync.booleanValue(), requestId, syncAlloc.booleanValue());
```

</details>

</details>

<details>

<summary>Default Java API for ID Allocation Request with Odd/Even Allocation</summary>

The following API is used to verify the response for a synchronous or asynchronous ID allocation request with additional parameter i.e., oddeven_alloc

```java
idRequest(NavuNode service,
    String poolName,
    String username,
    String id,
    boolean sync_pool,
    IdType oddeven_alloc)
```

**API Parameters**

```
| Parameter     | Type       | Description                                                                                       |
|---------------|------------|---------------------------------------------------------------------------------------------------|
| service       | NavuNode   | Navu node referencing the requesting service node.                                                |
| poolName      | String     | Name of the resource pool to request the allocation ID from.                                      |
| username      | String     |                                                                                                   |
| id            | String     | Unique allocation ID.                                                                             |
| sync_pool     | Boolean    | Sync allocations with the ID value across pools.                                                  |
| oddeven_alloc | IdType     | Request the odd or even ID to be allocated.                                                       |
```

**Example**

```java
import com.tailf.pkg.idallocator.IdAllocator;

IdAllocator.idRequest(service, poolName, userName, id,
test_with_sync.booleanValue(), oddeven_alloc);
```

</details>

{% hint style="info" %}
**Common Exceptions Raised by Java APIs for Errors**

* The API may throw the below exception if no pool resource exists for the requested allocation: `ResourceErrorException`.
* The API may throw the below exception if the ID request conflicts with another allocation or does not match the previous allocation in case of multiple owner requests: `AllocationException`.
{% endhint %}

### Using Python APIs for ID Allocations

The RM package also exposed Python APIs to request ID allocation from a resource pool. The below APIs are Python APIs exposed by RM for ID allocation.

<details>

<summary>Python API for Default ID Allocation Request</summary>

Use the module `resource_manager.id_allocator`.

The `id_request` function is used to create an allocation request for an ID. It takes several arguments including the service, service xpath, username, pool name, allocation name, sync flag, requested ID (optional), redeploy type (optional), alloc sync flag (optional), root (optional) and oddeve_alloc(optional).

```python
id_request(service, 
    svc_xpath, 
    username,
    pool_name, 
    allocation_name,
    sync_pool,
    requested_id=-1,
    redeploy_type="default",
    sync_alloc=False, 
    root=None,
    oddeven_alloc="default"):
```

**API Parameters**

```
| Parameter      | Type     | Description                                                                                            |
|----------------|----------|--------------------------------------------------------------------------------------------------------|
| service        |          | The requesting service node.                                                                           |
| svc_xpath      | Str      | XPath to the requesting service.                                                                       |
| username       | Str      | Name of the user to use when redeploying the requesting service.                                       |
| pool_name      | Str      | Name of the resource pool to make the allocation request from.                                         |
| allocation_name| Str      | Unique allocation name.                                                                                |
| sync_pool      | Boolean  | Sync allocations with this name across the pool.                                                       |
| requested_id   | Int      | A specific ID to be requested.                                                                         |
| redeploy_type  |          | Service redeploy action. Available options: default, touch, re-deploy, reactive-re-deploy, no-redeploy.|
| sync_alloc     | Boolean  | Allocation type, whether synchronous or asynchronous. By default, it is asynchronous.                  |
| root           |          | Root node. If sync is set to true, you must provide a root node.                                       |
| oddeven_alloc  | IdType   | A specific Odd/Even ID to be requested.                                                                |
```

Example

```python
import resource_manager.id_allocator as id_allocator

pool_name = "The Pool"
allocation_name = "Unique allocation name"

# This will try to allocate the value 20 from the pool named 'The Pool'
# using allocation name: 'Unique allocation name'
# It will allocate the id asynchronously from the pool ‘The Pool’
id_allocator.id_request(
    service,
    "/services/vl:loop-python[name='%s']" % (service.name),
    tctx.username,
    pool_name,
    allocation_name,
    False,
    20,
    oddeven_alloc
)

# The below will allocate the id synchronously from the pool ‘The Pool’
id_allocator.id_request(
    service,
    "/services/vl:loop-python[name='%s']" % (service.name),
    tctx.username,
    pool_name,
    allocation_name,
    True,
    20,
    oddeven_alloc
)

vlan_id = id_allocator.id_read(tctx.username, root, 'vlan-pool', service.name)
if vlan_id is None:
    self.log.info(f"Allocation not ready...")
    return propList

self.log.info(f"Allocation is ready: {vlan_id}")
service.vlan_id = vlan_id
```

</details>

<details>

<summary>Python API to Read Allocated ID Once the Allocation is Ready</summary>

Use the API definition `id_read` found in the module `resource_manager.id_allocator` to read the allocated ID.

The `id_read` function is designed to return the allocated ID or none if the ID is not yet available. It first tries to look up the ID in the current transaction using the provided `root` , `pool_name` and `allocation_name`. If the ID is available in the current transaction, it returns the ID. If there is an error, it raises a `LookupError`. If the ID is not available in the current transaction, it calls `id_read_async` to asynchronously retrieve the ID.

```python
id_read(username, root, pool_name, allocation_name)
```

**API Parameters**

```
| Parameter       | Type  | Description                                                                 |
|-----------------|-------|-----------------------------------------------------------------------------|
| username        | Str   | Name of the user to use when redeploying the requesting service.            |
| Root            |       | A maagic root for the current transaction.                                  |
| pool_name       | Str   | Name of the resource pool to make the allocation request from.              |
| allocation_name | Str   | Unique allocation name.                                                     |
```

**Example**

```python
# After requesting allocation, we check if the allocated ID is available
id = id_allocator.id_read(tctx.username, root, pool_name, allocation_name)
    if not id:
        self.log.info("Alloc not ready")
        return
    print ("id = %d" % (id))
```

</details>

### Using Python APIs for Non-Service ID Allocation

The RM package also exposes Python APIs to request ID allocation from a resource pool by passing the maapi object and transaction handle instead of the service.  The below APIs are Python APIs for non-service ID allocation.

Use the `module resource_manager.id_allocator`.

<details>

<summary><code>id_request_tr</code></summary>

The `id_request_tr` function is used to create an allocation request for an ID. It takes several arguments including the tr, username, pool name, allocation name, sync flag, requested ID (optional), redeploy type (optional), alloc sync flag (optional), root (optional) and oddeven_alloc(optional).

```python
id_request_tr(tr, username, 
    pool_name,
    allocation_name,
    sync_pool,
    requested_id=-1,
    redeploy_type="default",
    sync_alloc=False, 
    root=None,
    oddeven_alloc="default"):
```

**API Parameters**

```
| Parameter       | Type        | Description                                                                                         |
|-----------------|-------------|-----------------------------------------------------------------------------------------------------|
| tr              | Transaction | Transaction backend object.                                                                         |
| username        | Str         | Name of the user to use when redeploying the requesting service.                                    |
| pool_name       | Str         | Name of the resource pool to make the allocation request from.                                      |
| allocation_name | Str         | Unique allocation name.                                                                             |
| sync_pool       | Boolean     | Sync allocations with this name across the pool.                                                    |
| requested_id    | Int         | A specific ID to be requested.                                                                      |
| sync_alloc      | Boolean     | Set value to true to make a synchronous allocation request. By default, it is false (asynchronous). |
| oddeven_alloc   | IdType      | A specific Odd/Even ID to be requested.                                                             |
```

**Example**

```python
@Service.create
def cb_create(self, tctx, root, service, proplist):
    self.log.info('LoopTrService create(service=', service._path, ')')
    pool_name = service.pool
    alloc_name = service.allocation_name if service.allocation_name else service.name
    id_allocator.id_request_tr(
        maagic.get_trans(root),
        tctx.username,
        pool_name,
        alloc_name,
        False,
        -1,
        "default",
        False,
        root,
        oddeven_alloc
    )
    id = id_allocator.id_read(tctx.username, root, pool_name, alloc_name)
    if not id:
        self.log.info("Alloc1 not ready")
        return
    self.log.info('LoopTrService id = %s' % (id))
```

</details>

## Troubleshoot & Debug

**Set the Java Debug**

```bash
admin@ncs% set java-vm java-logging logger com.tailf.pkg level level-debug
```

**Check the Log File**

RM processing logs are in the file `ncs-java-vm.log`. Here is the example RM API entry point msg called from the services:

```log
IPAddressAllocator Did-140-Worker-95:
- subnetRequest()
  poolName = multiService
  cidrmask = 32
  id = multiTest
  sync_alloc = false

IdAllocator Did-139-Worker-94:
- idRequest
  id = multiTest
  poolName = multiService
  requestedId = -1
  sync_pool = false
  sync_alloc = true
```

**Use the RM Action Tool**

{% code title="Example" %}
```bash
admin@ncs> request rm-action id-allocator-tool operation printIdPool pool multiService
```
{% endcode %}

{% code title="Example" %}
```bash
admin@ncs> request rm-action ip-allocator-tool operation fix_response_ip pool multiService
```
{% endcode %}
