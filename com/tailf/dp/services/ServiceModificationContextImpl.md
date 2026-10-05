<a id="s-ServiceModificationContextImpl"></a>
# ServiceModificationContextImpl

```java
public class com.tailf.dp.services.ServiceModificationContextImpl
    extends com.tailf.dp.services.ServiceContextImpl
```

Types: [ServiceContextImpl](ServiceContextImpl.md#s-ServiceContextImpl)

Internal class implementing the service context for PRE/POST MODIFICATION
 callbacks. In this case NavuContext for NavuNodes should always attach
 to the base transaction. In contrast to the transInTrans for fastmap
 CREATE callbacks.

## Members

**Constructors**:

- [ServiceModificationContextImpl(DpTrans, Dp, ConfEAtom, ConfEList, ConfEObject)](#s-ServiceModificationContextImpl-1)
- [ServiceModificationContextImpl(DpTrans, Dp, ConfEAtom, ConfEList, ConfEObject, ServiceOperationType)](#s-ServiceModificationContextImpl-2)
- [ServiceModificationContextImpl(DpTrans, Dp, ConfEList)](#s-ServiceModificationContextImpl-3)
- [ServiceModificationContextImpl(DpTrans, Dp, ConfEObject)](#s-ServiceModificationContextImpl-4)

**Fields**:

- [attachedServiceMaapi](ServiceContextImpl.md#s-attachedServiceMaapi) from ServiceContextImpl
- [currentDp](ServiceContextImpl.md#s-currentDp) from ServiceContextImpl
- [currentDpTrans](ServiceContextImpl.md#s-currentDpTrans) from ServiceContextImpl
- [currentPath](ServiceContextImpl.md#s-currentPath) from ServiceContextImpl
- [eOpaque](ServiceContextImpl.md#s-eOpaque) from ServiceContextImpl
- [nbase](ServiceContextImpl.md#s-nbase) from ServiceContextImpl
- [nContext](ServiceContextImpl.md#s-nContext) from ServiceContextImpl
- [ncsHash](ServiceContextImpl.md#s-ncsHash) from ServiceContextImpl
- [operation](ServiceContextImpl.md#s-operation) from ServiceContextImpl
- [transInTrans](ServiceContextImpl.md#s-transInTrans) from ServiceContextImpl

**Methods**:

- [decodeOpaque()](ServiceContextImpl.md#s-decodeOpaque) from ServiceContextImpl
- [decodeProperties(ConfEObject)](ServiceContextImpl.md#s-decodeProperties) from ServiceContextImpl
- [detachServiceTrans()](ServiceContextImpl.md#s-detachServiceTrans) from ServiceContextImpl
- [encodeOpaque(Properties)](ServiceContextImpl.md#s-encodeOpaque) from ServiceContextImpl
- [getAttachedServiceMaapi()](ServiceContextImpl.md#s-getAttachedServiceMaapi) from ServiceContextImpl
- [getCurrentDpTrans()](ServiceContextImpl.md#s-getCurrentDpTrans) from ServiceContextImpl
- [getNedIdByDeviceName(String)](ServiceContextImpl.md#s-getNedIdByDeviceName) from ServiceContextImpl
- [getOperation()](ServiceContextImpl.md#s-getOperation) from ServiceContextImpl
- [getRootNode()](ServiceContextImpl.md#s-getRootNode) from ServiceContextImpl
- [getServiceNode()](ServiceContextImpl.md#s-getServiceNode) from ServiceContextImpl
- [getServicePath()](ServiceContextImpl.md#s-getServicePath) from ServiceContextImpl
- [setTimeout(int)](ServiceContextImpl.md#s-setTimeout) from ServiceContextImpl

## Constructors

<a id="s-ServiceModificationContextImpl-1"></a>
### ServiceModificationContextImpl(DpTrans, Dp, ConfEAtom, ConfEList, ConfEObject)

```java
protected ServiceModificationContextImpl(
    com.tailf.dp.DpTrans dpTrans,
    com.tailf.dp.Dp dp,
    com.tailf.proto.ConfEAtom ectype,
    com.tailf.proto.ConfEList ePath,
    com.tailf.proto.ConfEObject eOpaque
)
    throws com.tailf.conf.ConfException, com.tailf.proto.ConfERangeException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [Dp](../Dp.md#s-Dp), [ConfEAtom](../../proto/ConfEAtom.md#s-ConfEAtom), [ConfEList](../../proto/ConfEList.md#s-ConfEList), [ConfEObject](../../proto/ConfEObject.md#s-ConfEObject), [ConfException](../../conf/ConfException.md#s-ConfException), [ConfERangeException](../../proto/ConfERangeException.md#s-ConfERangeException)

**Parameters**

- `com.tailf.dp.DpTrans dpTrans`
- `com.tailf.dp.Dp dp`
- `com.tailf.proto.ConfEAtom ectype`
- `com.tailf.proto.ConfEList ePath`
- `com.tailf.proto.ConfEObject eOpaque`

<a id="s-ServiceModificationContextImpl-2"></a>
### ServiceModificationContextImpl(DpTrans, Dp, ConfEAtom, ConfEList, ConfEObject, ServiceOperationType)

```java
protected ServiceModificationContextImpl(
    com.tailf.dp.DpTrans dpTrans,
    com.tailf.dp.Dp dp,
    com.tailf.proto.ConfEAtom ectype,
    com.tailf.proto.ConfEList ePath,
    com.tailf.proto.ConfEObject eOpaque,
    com.tailf.dp.services.ServiceOperationType operation
)
    throws com.tailf.conf.ConfException, com.tailf.proto.ConfERangeException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [Dp](../Dp.md#s-Dp), [ConfEAtom](../../proto/ConfEAtom.md#s-ConfEAtom), [ConfEList](../../proto/ConfEList.md#s-ConfEList), [ConfEObject](../../proto/ConfEObject.md#s-ConfEObject), [ServiceOperationType](ServiceOperationType.md#s-ServiceOperationType), [ConfException](../../conf/ConfException.md#s-ConfException), [ConfERangeException](../../proto/ConfERangeException.md#s-ConfERangeException)

**Parameters**

- `com.tailf.dp.DpTrans dpTrans`
- `com.tailf.dp.Dp dp`
- `com.tailf.proto.ConfEAtom ectype`
- `com.tailf.proto.ConfEList ePath`
- `com.tailf.proto.ConfEObject eOpaque`
- `com.tailf.dp.services.ServiceOperationType operation`

<a id="s-ServiceModificationContextImpl-3"></a>
### ServiceModificationContextImpl(DpTrans, Dp, ConfEList)

```java
protected ServiceModificationContextImpl(
    com.tailf.dp.DpTrans dpTrans,
    com.tailf.dp.Dp dp,
    com.tailf.proto.ConfEList eTransTup
)
    throws com.tailf.conf.ConfException, com.tailf.proto.ConfERangeException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [Dp](../Dp.md#s-Dp), [ConfEList](../../proto/ConfEList.md#s-ConfEList), [ConfException](../../conf/ConfException.md#s-ConfException), [ConfERangeException](../../proto/ConfERangeException.md#s-ConfERangeException)

**Parameters**

- `com.tailf.dp.DpTrans dpTrans`
- `com.tailf.dp.Dp dp`
- `com.tailf.proto.ConfEList eTransTup`

<a id="s-ServiceModificationContextImpl-4"></a>
### ServiceModificationContextImpl(DpTrans, Dp, ConfEObject)

```java
public ServiceModificationContextImpl(
    com.tailf.dp.DpTrans dpTrans,
    com.tailf.dp.Dp dp,
    com.tailf.proto.ConfEObject eObject
)
    throws com.tailf.conf.ConfException, com.tailf.proto.ConfERangeException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [Dp](../Dp.md#s-Dp), [ConfEObject](../../proto/ConfEObject.md#s-ConfEObject), [ConfException](../../conf/ConfException.md#s-ConfException), [ConfERangeException](../../proto/ConfERangeException.md#s-ConfERangeException)

Internally used constructor

**Parameters**

- `com.tailf.dp.DpTrans dpTrans` - The current dp transaction
- `com.tailf.dp.Dp dp` - The current dp daemon
- `com.tailf.proto.ConfEObject eObject` - Erlang tuple received over the Dp protocol

**Throws**

- `ConfException`
- `ConfERangeException`
