<a id="s-ServiceContextImpl"></a>
# ServiceContextImpl

```java
public class com.tailf.dp.services.ServiceContextImpl
    implements com.tailf.dp.services.ServiceContext
```

Types: [ServiceContext](ServiceContext.md#s-ServiceContext)

**Related classes**

- [NanoServiceContextImpl](NanoServiceContextImpl.md#s-NanoServiceContextImpl)
- [ServiceModificationContextImpl](ServiceModificationContextImpl.md#s-ServiceModificationContextImpl)

## Members

**Constructors**:

- [ServiceContextImpl()](#s-ServiceContextImpl-1)
- [ServiceContextImpl(DpTrans, Dp, ConfEList, ServiceOperationType)](#s-ServiceContextImpl-2)
- [ServiceContextImpl(DpTrans, Dp, ConfEList, ServiceOperationType, ConfEList, ConfELong)](#s-ServiceContextImpl-3)
- [ServiceContextImpl(DpTrans, Dp, ConfEObject, ServiceOperationType)](#s-ServiceContextImpl-4)
- [ServiceContextImpl(DpTrans, Dp, ConfPath, int, ConfEObject, ServiceOperationType)](#s-ServiceContextImpl-5)

**Fields**:

- [attachedServiceMaapi](#s-attachedServiceMaapi)
- [currentDp](#s-currentDp)
- [currentDpTrans](#s-currentDpTrans)
- [currentPath](#s-currentPath)
- [eOpaque](#s-eOpaque)
- [nbase](#s-nbase)
- [nContext](#s-nContext)
- [ncsHash](#s-ncsHash)
- [operation](#s-operation)
- [transInTrans](#s-transInTrans)

**Methods**:

- [decodeOpaque()](#s-decodeOpaque)
- [decodeProperties(ConfEObject)](#s-decodeProperties)
- [detachServiceTrans()](#s-detachServiceTrans)
- [encodeOpaque(Properties)](#s-encodeOpaque)
- [getAttachedServiceMaapi()](#s-getAttachedServiceMaapi)
- [getCurrentDpTrans()](#s-getCurrentDpTrans)
- [getNedIdByDeviceName(String)](#s-getNedIdByDeviceName)
- [getOperation()](#s-getOperation)
- [getRootNode()](#s-getRootNode)
- [getServiceNode()](#s-getServiceNode)
- [getServicePath()](#s-getServicePath)
- [setTimeout(int)](#s-setTimeout)

## Constructors

<a id="s-ServiceContextImpl-1"></a>
### ServiceContextImpl()

```java
protected ServiceContextImpl()
```

Internal constructor

<a id="s-ServiceContextImpl-2"></a>
### ServiceContextImpl(DpTrans, Dp, ConfEList, ServiceOperationType)

```java
protected ServiceContextImpl(
    com.tailf.dp.DpTrans dpTrans,
    com.tailf.dp.Dp dp,
    com.tailf.proto.ConfEList eTransTup,
    com.tailf.dp.services.ServiceOperationType operation
)
    throws com.tailf.conf.ConfException, com.tailf.proto.ConfERangeException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [Dp](../Dp.md#s-Dp), [ConfEList](../../proto/ConfEList.md#s-ConfEList), [ServiceOperationType](ServiceOperationType.md#s-ServiceOperationType), [ConfException](../../conf/ConfException.md#s-ConfException), [ConfERangeException](../../proto/ConfERangeException.md#s-ConfERangeException)

**Parameters**

- `com.tailf.dp.DpTrans dpTrans`
- `com.tailf.dp.Dp dp`
- `com.tailf.proto.ConfEList eTransTup`
- `com.tailf.dp.services.ServiceOperationType operation`

<a id="s-ServiceContextImpl-3"></a>
### ServiceContextImpl(DpTrans, Dp, ConfEList, ServiceOperationType, ConfEList, ConfELong)

```java
protected ServiceContextImpl(
    com.tailf.dp.DpTrans dpTrans,
    com.tailf.dp.Dp dp,
    com.tailf.proto.ConfEList eTransTup,
    com.tailf.dp.services.ServiceOperationType operation,
    com.tailf.proto.ConfEList ePath,
    com.tailf.proto.ConfELong eTInT
)
    throws com.tailf.conf.ConfException, com.tailf.proto.ConfERangeException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [Dp](../Dp.md#s-Dp), [ConfEList](../../proto/ConfEList.md#s-ConfEList), [ServiceOperationType](ServiceOperationType.md#s-ServiceOperationType), [ConfELong](../../proto/ConfELong.md#s-ConfELong), [ConfException](../../conf/ConfException.md#s-ConfException), [ConfERangeException](../../proto/ConfERangeException.md#s-ConfERangeException)

**Parameters**

- `com.tailf.dp.DpTrans dpTrans`
- `com.tailf.dp.Dp dp`
- `com.tailf.proto.ConfEList eTransTup`
- `com.tailf.dp.services.ServiceOperationType operation`
- `com.tailf.proto.ConfEList ePath`
- `com.tailf.proto.ConfELong eTInT`

<a id="s-ServiceContextImpl-4"></a>
### ServiceContextImpl(DpTrans, Dp, ConfEObject, ServiceOperationType)

```java
public ServiceContextImpl(
    com.tailf.dp.DpTrans dpTrans,
    com.tailf.dp.Dp dp,
    com.tailf.proto.ConfEObject eObject,
    com.tailf.dp.services.ServiceOperationType operation
)
    throws com.tailf.conf.ConfException, com.tailf.proto.ConfERangeException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [Dp](../Dp.md#s-Dp), [ConfEObject](../../proto/ConfEObject.md#s-ConfEObject), [ServiceOperationType](ServiceOperationType.md#s-ServiceOperationType), [ConfException](../../conf/ConfException.md#s-ConfException), [ConfERangeException](../../proto/ConfERangeException.md#s-ConfERangeException)

Internally called constructor to create a ServiceContext

**Parameters**

- `com.tailf.dp.DpTrans dpTrans` - The current dp transaction
- `com.tailf.dp.Dp dp` - The current dp daemon
- `com.tailf.proto.ConfEObject eObject` - Erlang tuple received over the Dp protocol
- `com.tailf.dp.services.ServiceOperationType operation`

**Throws**

- `ConfException`
- `ConfERangeException`

<a id="s-ServiceContextImpl-5"></a>
### ServiceContextImpl(DpTrans, Dp, ConfPath, int, ConfEObject, ServiceOperationType)

```java
protected ServiceContextImpl(
    com.tailf.dp.DpTrans dpTrans,
    com.tailf.dp.Dp dp,
    com.tailf.conf.ConfPath path,
    int transInTrans,
    com.tailf.proto.ConfEObject eOpaque,
    com.tailf.dp.services.ServiceOperationType operation
)
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [Dp](../Dp.md#s-Dp), [ConfPath](../../conf/ConfPath.md#s-ConfPath), [ConfEObject](../../proto/ConfEObject.md#s-ConfEObject), [ServiceOperationType](ServiceOperationType.md#s-ServiceOperationType)

The actual setup or a ServiceContext
 This method sets up the NavuContext that is used for NavuObjects.
 This setup is therefore sensitive to the transInTrans id given
 from Ncs over the dp protocol. If the transInTrans id > 0 this implies
 that this is a fastmap transaction, and that this transaction should
 be attached. Otherwise, if the transInTrans == -1 this is an external
 service or a pre/post Modification invocation and hence the
 dp transaction itself should be used

**Parameters**

- `com.tailf.dp.DpTrans dpTrans`
- `com.tailf.dp.Dp dp`
- `com.tailf.conf.ConfPath path`
- `int transInTrans`
- `com.tailf.proto.ConfEObject eOpaque` - List of atom,string>
- `com.tailf.dp.services.ServiceOperationType operation`


## Fields

<a id="s-attachedServiceMaapi"></a>
### attachedServiceMaapi

```java
protected com.tailf.maapi.Maapi attachedServiceMaapi = null;
```

Types: [Maapi](../../maapi/Maapi.md#s-Maapi)

<a id="s-currentDp"></a>
### currentDp

```java
protected com.tailf.dp.Dp currentDp = null;
```

Types: [Dp](../Dp.md#s-Dp)

<a id="s-currentDpTrans"></a>
### currentDpTrans

```java
protected com.tailf.dp.DpTrans currentDpTrans = null;
```

Types: [DpTrans](../DpTrans.md#s-DpTrans)

<a id="s-currentPath"></a>
### currentPath

```java
protected com.tailf.conf.ConfPath currentPath = null;
```

Types: [ConfPath](../../conf/ConfPath.md#s-ConfPath)

<a id="s-eOpaque"></a>
### eOpaque

```java
protected com.tailf.proto.ConfEObject eOpaque = null;
```

Types: [ConfEObject](../../proto/ConfEObject.md#s-ConfEObject)

<a id="s-nbase"></a>
### nbase

```java
protected com.tailf.navu.NavuContainer nbase = null;
```

Types: [NavuContainer](../../navu/NavuContainer.md#s-NavuContainer)

<a id="s-nContext"></a>
### nContext

```java
protected com.tailf.navu.NavuContext nContext = null;
```

Types: [NavuContext](../../navu/NavuContext.md#s-NavuContext)

<a id="s-ncsHash"></a>
### ncsHash

```java
protected static Integer ncsHash = null;
```

<a id="s-operation"></a>
### operation

```java
protected com.tailf.dp.services.ServiceOperationType operation = null;
```

Types: [ServiceOperationType](ServiceOperationType.md#s-ServiceOperationType)

<a id="s-transInTrans"></a>
### transInTrans

```java
protected int transInTrans = null;
```


## Methods

<a id="s-decodeOpaque"></a>
### decodeOpaque()

```java
public java.util.Properties decodeOpaque()
```

Internal method to decode the Erlang term representation of a opaque
 to a Properties instance

**Returns:** Properties instance representing the opaque

<a id="s-decodeProperties"></a>
### decodeProperties(ConfEObject)

```java
public java.util.Properties decodeProperties(com.tailf.proto.ConfEObject eProperties)
```

Types: [ConfEObject](../../proto/ConfEObject.md#s-ConfEObject)

**Parameters**

- `com.tailf.proto.ConfEObject eProperties`

<a id="s-detachServiceTrans"></a>
### detachServiceTrans()

```java
public void detachServiceTrans()
```

<a id="s-encodeOpaque"></a>
### encodeOpaque(Properties)

```java
public com.tailf.proto.ConfEObject encodeOpaque(java.util.Properties p)
```

Types: [ConfEObject](../../proto/ConfEObject.md#s-ConfEObject)

Internal method to encode the Properties opaque object to
 Erlang form

**Parameters**

- `java.util.Properties p` - Properties instance representing the opaque

**Returns:** ConfEObject the encoded opaque

<a id="s-getAttachedServiceMaapi"></a>
### getAttachedServiceMaapi()

```java
public com.tailf.maapi.Maapi getAttachedServiceMaapi() throws java.io.IOException, com.tailf.conf.ConfException
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Maapi](../../maapi/Maapi.md#s-Maapi), [ConfException](../../conf/ConfException.md#s-ConfException)

Internal used method to get the a maapi object attached to the correct
 transaction

**Returns:** Maapi attached maapi instance

**Throws**

- `IOException`
- `ConfException`

<a id="s-getCurrentDpTrans"></a>
### getCurrentDpTrans()

```java
public com.tailf.dp.DpTrans getCurrentDpTrans()
```

Types: [DpTrans](../DpTrans.md#s-DpTrans)

<a id="s-getNedIdByDeviceName"></a>
### getNedIdByDeviceName(String)

```java
public String getNedIdByDeviceName(String name) throws com.tailf.conf.ConfException
```

Types: [ConfException](../../conf/ConfException.md#s-ConfException)

**Parameters**

- `String name`

<a id="s-getOperation"></a>
### getOperation()

```java
public com.tailf.dp.services.ServiceOperationType getOperation()
```

Types: [ServiceOperationType](ServiceOperationType.md#s-ServiceOperationType)

Return the operation type for current operation.
 One of [`ServiceOperationType`](ServiceOperationType.md#s-ServiceOperationType),
 [`ServiceOperationType`](ServiceOperationType.md#s-ServiceOperationType) or
 [`ServiceOperationType`](ServiceOperationType.md#s-ServiceOperationType)

**Returns:** ServiceOperationType for current operation

<a id="s-getRootNode"></a>
### getRootNode()

```java
public com.tailf.navu.NavuNode getRootNode() throws com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#s-NavuNode), [ConfException](../../conf/ConfException.md#s-ConfException)

Returns the path root as a NavuNode with the
 NavuContext attached to the ongoing Maapi transaction.

**Returns:** NavuNode An object representing the service path

**Throws**

- `ConfException`

<a id="s-getServiceNode"></a>
### getServiceNode()

```java
public com.tailf.navu.NavuNode getServiceNode() throws com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#s-NavuNode), [ConfException](../../conf/ConfException.md#s-ConfException)

Returns the current service path as a NavuNode with the
 NavuContext attached to the ongoing Maapi transaction.

**Returns:** NavuNode An object representing the service path

**Throws**

- `ConfException`

<a id="s-getServicePath"></a>
### getServicePath()

```java
public com.tailf.conf.ConfPath getServicePath()
```

Types: [ConfPath](../../conf/ConfPath.md#s-ConfPath)

Returns a ConfPath object pointing the current service instance

**Returns:** ConfPath path to the service instance

<a id="s-setTimeout"></a>
### setTimeout(int)

```java
public void setTimeout(
    int timeoutSeconds
)
    throws com.tailf.dp.DpCallbackException, java.io.IOException
```

Types: [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

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
