# ServiceContext <a href="#servicecontext-f7734df4f22b" id="servicecontext-f7734df4f22b"></a>

```java
public interface com.tailf.dp.services.ServiceContext
```

The service context object.
 This class contains methods to get the service and root NavuNodes as
 well as method to set the transaction timeout time.

## Members

**Methods**:

- [getNedIdByDeviceName\(String\)](#getnedidbydevicename-11861342f251)
- [getRootNode\(\)](#getrootnode-eed9b3c70129)
- [getServiceNode\(\)](#getservicenode-ffc6dd44e182)
- [setTimeout\(int\)](#settimeout-cbe758ecb5d8)

## Methods

### getNedIdByDeviceName(String) <a href="#getnedidbydevicename-11861342f251" id="getnedidbydevicename-11861342f251"></a>

```java
public abstract String getNedIdByDeviceName(String name) throws com.tailf.conf.ConfException
```

Types: [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String name`

### getRootNode() <a href="#getrootnode-eed9b3c70129" id="getrootnode-eed9b3c70129"></a>

```java
public abstract com.tailf.navu.NavuNode getRootNode() throws com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#navunode-73944820c8db), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

Returns the path root as a NavuNode with the
 NavuContext attached to the ongoing Maapi transaction.

**Returns:** NavuNode An object representing the service path

**Throws**

- `ConfException`

### getServiceNode() <a href="#getservicenode-ffc6dd44e182" id="getservicenode-ffc6dd44e182"></a>

```java
public abstract com.tailf.navu.NavuNode getServiceNode() throws com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#navunode-73944820c8db), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

Returns the current service path as a NavuNode with the
 NavuContext attached to the ongoing Maapi transaction.

**Returns:** NavuNode An object representing the service path

**Throws**

- `ConfException`

### setTimeout(int) <a href="#settimeout-cbe758ecb5d8" id="settimeout-cbe758ecb5d8"></a>

```java
public abstract void setTimeout(
    int timeoutSeconds
)
    throws java.io.IOException, com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

The timeout for service calls (pre-modification/create/post-modification)
 can be controlled by /services/global-settings/service-callback-timeout.
 Normally this is set to cover the longest possible execution time for
 any service call. In some rare cases it may still be necessary for a
 a service method to have longer execution time, and then this function
 can be used to extend (or shorten) the timeout for the current
 service invocation. The timeout
 is given in seconds from the point in time when the function is called.

**Parameters**

- `int timeoutSeconds`

**Throws**

- `IOException`
- `DpCallbackException`
