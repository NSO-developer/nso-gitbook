# ServiceModificationContextImpl <a href="#servicemodificationcontextimpl-1935e8396cc3" id="servicemodificationcontextimpl-1935e8396cc3"></a>

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

- [ServiceModificationContextImpl\(DpTrans, Dp, ConfEAtom, ConfEList, ConfEObject\)](#servicemodificationcontextimpl-d0eddddd16f2)
- [ServiceModificationContextImpl\(DpTrans, Dp, ConfEAtom, ConfEList, ConfEObject, ServiceOperationType\)](#servicemodificationcontextimpl-be8c23b53fc7)
- [ServiceModificationContextImpl\(DpTrans, Dp, ConfEList\)](#servicemodificationcontextimpl-90b24dd80819)
- [ServiceModificationContextImpl\(DpTrans, Dp, ConfEObject\)](#servicemodificationcontextimpl-767900bccb2e)

## Constructors

### ServiceModificationContextImpl(DpTrans, Dp, ConfEAtom, ConfEList, ConfEObject) <a href="#servicemodificationcontextimpl-d0eddddd16f2" id="servicemodificationcontextimpl-d0eddddd16f2"></a>

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

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [Dp](../Dp.md#dp-64c27347820e), [ConfEAtom](../../proto/ConfEAtom.md#confeatom-9f9d21cb88dd), [ConfEList](../../proto/ConfEList.md#confelist-78fa4ba3b3a8), [ConfEObject](../../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9), [ConfERangeException](../../proto/ConfERangeException.md#conferangeexception-3f566066d5e7)

**Parameters**

- `com.tailf.dp.DpTrans dpTrans`
- `com.tailf.dp.Dp dp`
- `com.tailf.proto.ConfEAtom ectype`
- `com.tailf.proto.ConfEList ePath`
- `com.tailf.proto.ConfEObject eOpaque`

### ServiceModificationContextImpl(DpTrans, Dp, ConfEAtom, ConfEList, ConfEObject, ServiceOperationType) <a href="#servicemodificationcontextimpl-be8c23b53fc7" id="servicemodificationcontextimpl-be8c23b53fc7"></a>

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

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [Dp](../Dp.md#dp-64c27347820e), [ConfEAtom](../../proto/ConfEAtom.md#confeatom-9f9d21cb88dd), [ConfEList](../../proto/ConfEList.md#confelist-78fa4ba3b3a8), [ConfEObject](../../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ServiceOperationType](ServiceOperationType.md#serviceoperationtype-76755b5b3de9), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9), [ConfERangeException](../../proto/ConfERangeException.md#conferangeexception-3f566066d5e7)

**Parameters**

- `com.tailf.dp.DpTrans dpTrans`
- `com.tailf.dp.Dp dp`
- `com.tailf.proto.ConfEAtom ectype`
- `com.tailf.proto.ConfEList ePath`
- `com.tailf.proto.ConfEObject eOpaque`
- `com.tailf.dp.services.ServiceOperationType operation`

### ServiceModificationContextImpl(DpTrans, Dp, ConfEList) <a href="#servicemodificationcontextimpl-90b24dd80819" id="servicemodificationcontextimpl-90b24dd80819"></a>

```java
protected ServiceModificationContextImpl(
    com.tailf.dp.DpTrans dpTrans,
    com.tailf.dp.Dp dp,
    com.tailf.proto.ConfEList eTransTup
)
    throws com.tailf.conf.ConfException, com.tailf.proto.ConfERangeException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [Dp](../Dp.md#dp-64c27347820e), [ConfEList](../../proto/ConfEList.md#confelist-78fa4ba3b3a8), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9), [ConfERangeException](../../proto/ConfERangeException.md#conferangeexception-3f566066d5e7)

**Parameters**

- `com.tailf.dp.DpTrans dpTrans`
- `com.tailf.dp.Dp dp`
- `com.tailf.proto.ConfEList eTransTup`

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

- `ConfException`
- `ConfERangeException`
