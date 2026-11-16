# ServiceModificationContextImpl <a href="#servicemodificationcontextimpl-1935e8396cc3" id="servicemodificationcontextimpl-1935e8396cc3"></a>

```java
public class com.tailf.dp.services.ServiceModificationContextImpl
    implements com.tailf.dp.services.ServiceContext
```

Types: [ServiceContext](ServiceContext.md#servicecontext-f7734df4f22b)

Internal class implementing the service context for PRE/POST MODIFICATION
 callbacks. In this case NavuContext for NavuNodes should always attach
 to the base transaction. In contrast to the transInTrans for fastmap
 CREATE callbacks.

## Members

**Constructors**:

- [ServiceModificationContextImpl\(DpTrans, Dp, ConfEObject\)](#servicemodificationcontextimpl-767900bccb2e)

**Methods**:

- [decodeOpaque\(\)](#decodeopaque-cfd95b67106e)
- [decodeProperties\(ConfEObject\)](#decodeproperties-e711a1ac3d5e)
- [encodeOpaque\(Properties\)](#encodeopaque-afe9d30ef914)
- [getAttachedServiceMaapi\(\)](#getattachedservicemaapi-0663f50f1642)
- [getCurrentDpTrans\(\)](#getcurrentdptrans-ab9b932008b6)
- [getNedIdByDeviceName\(String\)](#getnedidbydevicename-11861342f251)
- [getOperation\(\)](#getoperation-baf0e4738a2a)
- [getRootNode\(\)](#getrootnode-eed9b3c70129)
- [getServiceNode\(\)](#getservicenode-ffc6dd44e182)
- [getServicePath\(\)](#getservicepath-35bb7741ed67)
- [setTimeout\(int\)](#settimeout-cbe758ecb5d8)

## Constructors

### ServiceModificationContextImpl(DpTrans, Dp, ConfEObject) <a href="#servicemodificationcontextimpl-767900bccb2e" id="servicemodificationcontextimpl-767900bccb2e"></a>

```java
public ServiceModificationContextImpl(
    com.tailf.dp.DpTrans dpTrans,
    com.tailf.dp.Dp dp,
    com.tailf.proto.ConfEObject eObject
)
    throws com.tailf.conf.ConfException, com.tailf.proto.ConfERangeException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [Dp](../Dp.md#dp-64c27347820e), [ConfEObject](../../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9), [ConfERangeException](../../proto/ConfERangeException.md#conferangeexception-3f566066d5e7)

Internally used constructor

**Parameters**

- `com.tailf.dp.DpTrans dpTrans` - The current dp transaction
- `com.tailf.dp.Dp dp` - The current dp daemon
- `com.tailf.proto.ConfEObject eObject` - Erlang tuple received over the Dp protocol

**Throws**

- `com.tailf.conf.ConfException`
- `com.tailf.proto.ConfERangeException`


## Methods

### decodeOpaque() <a href="#decodeopaque-cfd95b67106e" id="decodeopaque-cfd95b67106e"></a>

```java
public java.util.Properties decodeOpaque()
```

Internal method to decode the Erlang term representation of a opaque
 to a Properties instance

**Returns:** Properties instance representing the opaque

### decodeProperties(ConfEObject) <a href="#decodeproperties-e711a1ac3d5e" id="decodeproperties-e711a1ac3d5e"></a>

```java
public java.util.Properties decodeProperties(com.tailf.proto.ConfEObject eProperties)
```

Types: [ConfEObject](../../proto/ConfEObject.md#confeobject-2a9c0d03e350)

**Parameters**

- `com.tailf.proto.ConfEObject eProperties`

### encodeOpaque(Properties) <a href="#encodeopaque-afe9d30ef914" id="encodeopaque-afe9d30ef914"></a>

```java
public com.tailf.proto.ConfEObject encodeOpaque(java.util.Properties p)
```

Types: [ConfEObject](../../proto/ConfEObject.md#confeobject-2a9c0d03e350)

Internal method to encode the Properties opaque object to
 Erlang form

**Parameters**

- `java.util.Properties p` - Properties instance representing the opaque

**Returns:** ConfEObject the encoded opaque

### getAttachedServiceMaapi() <a href="#getattachedservicemaapi-0663f50f1642" id="getattachedservicemaapi-0663f50f1642"></a>

```java
public com.tailf.maapi.Maapi getAttachedServiceMaapi()
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Maapi](../../maapi/Maapi.md#maapi-67bcbe89c42e), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

Internal used method to get the a maapi object attached to the correct
 transaction

**Returns:** Maapi attached maapi instance

**Throws**

- `java.io.IOException`
- `com.tailf.conf.ConfException`

### getCurrentDpTrans() <a href="#getcurrentdptrans-ab9b932008b6" id="getcurrentdptrans-ab9b932008b6"></a>

```java
public com.tailf.dp.DpTrans getCurrentDpTrans()
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec)

### getNedIdByDeviceName(String) <a href="#getnedidbydevicename-11861342f251" id="getnedidbydevicename-11861342f251"></a>

```java
public String getNedIdByDeviceName(String name) throws com.tailf.conf.ConfException
```

Types: [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String name`

### getOperation() <a href="#getoperation-baf0e4738a2a" id="getoperation-baf0e4738a2a"></a>

```java
public com.tailf.dp.services.ServiceOperationType getOperation()
```

Types: [ServiceOperationType](ServiceOperationType.md#serviceoperationtype-76755b5b3de9)

Return the operation type for current operation.
 One of [`ServiceOperationType#CREATE`](ServiceOperationType.md#create-146c3c7e4f65),
 [`ServiceOperationType#UPDATE`](ServiceOperationType.md#update-39b73b15811d) or
 [`ServiceOperationType#DELETE`](ServiceOperationType.md#delete-17bb47048092)

**Returns:** ServiceOperationType for current operation

### getRootNode() <a href="#getrootnode-eed9b3c70129" id="getrootnode-eed9b3c70129"></a>

```java
public com.tailf.navu.NavuNode getRootNode() throws com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#navunode-73944820c8db), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

Returns the path root as a NavuNode with the
 NavuContext attached to the ongoing Maapi transaction.

**Returns:** NavuNode An object representing the service path

**Throws**

- `com.tailf.conf.ConfException`

### getServiceNode() <a href="#getservicenode-ffc6dd44e182" id="getservicenode-ffc6dd44e182"></a>

```java
public com.tailf.navu.NavuNode getServiceNode() throws com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#navunode-73944820c8db), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

Returns the current service path as a NavuNode with the
 NavuContext attached to the ongoing Maapi transaction.

**Returns:** NavuNode An object representing the service path

**Throws**

- `com.tailf.conf.ConfException`

### getServicePath() <a href="#getservicepath-35bb7741ed67" id="getservicepath-35bb7741ed67"></a>

```java
public com.tailf.conf.ConfPath getServicePath()
```

Types: [ConfPath](../../conf/ConfPath.md#confpath-327831c6fc7d)

Returns a ConfPath object pointing the current service instance

**Returns:** ConfPath path to the service instance

### setTimeout(int) <a href="#settimeout-cbe758ecb5d8" id="settimeout-cbe758ecb5d8"></a>

```java
public void setTimeout(
    int timeoutSeconds
)
    throws com.tailf.dp.DpCallbackException, java.io.IOException
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

- `java.io.IOException`
- `com.tailf.dp.DpCallbackException`
