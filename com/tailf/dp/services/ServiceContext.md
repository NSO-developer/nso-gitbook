# ServiceContext <a href="#cls-ServiceContext" id="cls-ServiceContext"></a>

```java
public interface com.tailf.dp.services.ServiceContext
```

The service context object.
 This class contains methods to get the service and root NavuNodes as
 well as method to set the transaction timeout time.

## Members

**Methods**:

- [getNedIdByDeviceName(String)](#m-getNedIdByDeviceName-11861342f251)
- [getRootNode()](#m-getRootNode-eed9b3c70129)
- [getServiceNode()](#m-getServiceNode-ffc6dd44e182)
- [setTimeout(int)](#m-setTimeout-cbe758ecb5d8)

## Methods

### getNedIdByDeviceName(String) <a href="#m-getNedIdByDeviceName-11861342f251" id="m-getNedIdByDeviceName-11861342f251"></a>

```java
public abstract String getNedIdByDeviceName(String name) throws com.tailf.conf.ConfException
```

Types: [ConfException](../../conf/ConfException.md#cls-ConfException)

**Parameters**

- `String name`

### getRootNode() <a href="#m-getRootNode-eed9b3c70129" id="m-getRootNode-eed9b3c70129"></a>

```java
public abstract com.tailf.navu.NavuNode getRootNode() throws com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#cls-NavuNode), [ConfException](../../conf/ConfException.md#cls-ConfException)

Returns the path root as a NavuNode with the
 NavuContext attached to the ongoing Maapi transaction.

**Returns:** NavuNode An object representing the service path

**Throws**

- `ConfException`

### getServiceNode() <a href="#m-getServiceNode-ffc6dd44e182" id="m-getServiceNode-ffc6dd44e182"></a>

```java
public abstract com.tailf.navu.NavuNode getServiceNode() throws com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#cls-NavuNode), [ConfException](../../conf/ConfException.md#cls-ConfException)

Returns the current service path as a NavuNode with the
 NavuContext attached to the ongoing Maapi transaction.

**Returns:** NavuNode An object representing the service path

**Throws**

- `ConfException`

### setTimeout(int) <a href="#m-setTimeout-cbe758ecb5d8" id="m-setTimeout-cbe758ecb5d8"></a>

```java
public abstract void setTimeout(
    int timeoutSeconds
)
    throws java.io.IOException, com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

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
