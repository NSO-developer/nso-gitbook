# ServiceModificationContextImpl <a href="#cls-ServiceModificationContextImpl" id="cls-ServiceModificationContextImpl"></a>

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

- [ServiceModificationContextImpl(DpTrans, Dp, ConfEAtom, ConfEList, ConfEObject)](#m-ServiceModificationContextImpl-d0eddddd16f2)
- [ServiceModificationContextImpl(DpTrans, Dp, ConfEAtom, ConfEList, ConfEObject, ServiceOperationType)](#m-ServiceModificationContextImpl-be8c23b53fc7)
- [ServiceModificationContextImpl(DpTrans, Dp, ConfEList)](#m-ServiceModificationContextImpl-90b24dd80819)
- [ServiceModificationContextImpl(DpTrans, Dp, ConfEObject)](#m-ServiceModificationContextImpl-767900bccb2e)

## Constructors

### ServiceModificationContextImpl(DpTrans, Dp, ConfEAtom, ConfEList, ConfEObject) <a href="#m-ServiceModificationContextImpl-d0eddddd16f2" id="m-ServiceModificationContextImpl-d0eddddd16f2"></a>

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

### ServiceModificationContextImpl(DpTrans, Dp, ConfEAtom, ConfEList, ConfEObject, ServiceOperationType) <a href="#m-ServiceModificationContextImpl-be8c23b53fc7" id="m-ServiceModificationContextImpl-be8c23b53fc7"></a>

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

### ServiceModificationContextImpl(DpTrans, Dp, ConfEList) <a href="#m-ServiceModificationContextImpl-90b24dd80819" id="m-ServiceModificationContextImpl-90b24dd80819"></a>

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

### ServiceModificationContextImpl(DpTrans, Dp, ConfEObject) <a href="#m-ServiceModificationContextImpl-767900bccb2e" id="m-ServiceModificationContextImpl-767900bccb2e"></a>

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
