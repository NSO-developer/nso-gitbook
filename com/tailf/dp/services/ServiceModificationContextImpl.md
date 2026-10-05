<a id="cls-ServiceModificationContextImpl"></a>
# ServiceModificationContextImpl

```java
public class com.tailf.dp.services.ServiceModificationContextImpl
    extends com.tailf.dp.services.ServiceContextImpl
```

Internal class implementing the service context for PRE/POST MODIFICATION
 callbacks. In this case NavuContext for NavuNodes should always attach
 to the base transaction. In contrast to the transInTrans for fastmap
 CREATE callbacks.

## Members

**Constructors**:

- [ServiceModificationContextImpl(DpTrans, Dp, ConfEAtom, ConfEList, ConfEObject)](#m-servicemodificationcontextimpl-d0eddddd16f2)
- [ServiceModificationContextImpl(DpTrans, Dp, ConfEAtom, ConfEList, ConfEObject, ServiceOperationType)](#m-servicemodificationcontextimpl-be8c23b53fc7)
- [ServiceModificationContextImpl(DpTrans, Dp, ConfEList)](#m-servicemodificationcontextimpl-90b24dd80819)
- [ServiceModificationContextImpl(DpTrans, Dp, ConfEObject)](#m-servicemodificationcontextimpl-767900bccb2e)

## Constructors

<a id="m-servicemodificationcontextimpl-d0eddddd16f2"></a>
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

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [Dp](../Dp.md#cls-Dp), [ConfEAtom](../../proto/ConfEAtom.md#cls-ConfEAtom), [ConfEList](../../proto/ConfEList.md#cls-ConfEList), [ConfEObject](../../proto/ConfEObject.md#cls-ConfEObject), [ConfException](../../conf/ConfException.md#cls-ConfException), [ConfERangeException](../../proto/ConfERangeException.md#cls-ConfERangeException)

**Parameters**

- `com.tailf.dp.DpTrans dpTrans`
- `com.tailf.dp.Dp dp`
- `com.tailf.proto.ConfEAtom ectype`
- `com.tailf.proto.ConfEList ePath`
- `com.tailf.proto.ConfEObject eOpaque`

<a id="m-servicemodificationcontextimpl-be8c23b53fc7"></a>
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

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [Dp](../Dp.md#cls-Dp), [ConfEAtom](../../proto/ConfEAtom.md#cls-ConfEAtom), [ConfEList](../../proto/ConfEList.md#cls-ConfEList), [ConfEObject](../../proto/ConfEObject.md#cls-ConfEObject), [ServiceOperationType](ServiceOperationType.md#cls-ServiceOperationType), [ConfException](../../conf/ConfException.md#cls-ConfException), [ConfERangeException](../../proto/ConfERangeException.md#cls-ConfERangeException)

**Parameters**

- `com.tailf.dp.DpTrans dpTrans`
- `com.tailf.dp.Dp dp`
- `com.tailf.proto.ConfEAtom ectype`
- `com.tailf.proto.ConfEList ePath`
- `com.tailf.proto.ConfEObject eOpaque`
- `com.tailf.dp.services.ServiceOperationType operation`

<a id="m-servicemodificationcontextimpl-90b24dd80819"></a>
### ServiceModificationContextImpl(DpTrans, Dp, ConfEList)

```java
protected ServiceModificationContextImpl(
    com.tailf.dp.DpTrans dpTrans,
    com.tailf.dp.Dp dp,
    com.tailf.proto.ConfEList eTransTup
)
    throws com.tailf.conf.ConfException, com.tailf.proto.ConfERangeException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [Dp](../Dp.md#cls-Dp), [ConfEList](../../proto/ConfEList.md#cls-ConfEList), [ConfException](../../conf/ConfException.md#cls-ConfException), [ConfERangeException](../../proto/ConfERangeException.md#cls-ConfERangeException)

**Parameters**

- `com.tailf.dp.DpTrans dpTrans`
- `com.tailf.dp.Dp dp`
- `com.tailf.proto.ConfEList eTransTup`

<a id="m-servicemodificationcontextimpl-767900bccb2e"></a>
### ServiceModificationContextImpl(DpTrans, Dp, ConfEObject)

```java
public ServiceModificationContextImpl(
    com.tailf.dp.DpTrans dpTrans,
    com.tailf.dp.Dp dp,
    com.tailf.proto.ConfEObject eObject
)
    throws com.tailf.conf.ConfException, com.tailf.proto.ConfERangeException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [Dp](../Dp.md#cls-Dp), [ConfEObject](../../proto/ConfEObject.md#cls-ConfEObject), [ConfException](../../conf/ConfException.md#cls-ConfException), [ConfERangeException](../../proto/ConfERangeException.md#cls-ConfERangeException)

Internally used constructor

**Parameters**

- `com.tailf.dp.DpTrans dpTrans` - The current dp transaction
- `com.tailf.dp.Dp dp` - The current dp daemon
- `com.tailf.proto.ConfEObject eObject` - Erlang tuple received over the Dp protocol

**Throws**

- `ConfException`
- `ConfERangeException`
