# AlarmDispatcher <a href="#cls-AlarmDispatcher" id="cls-AlarmDispatcher"></a>

```java
protected class com.tailf.ncs.alarmman.consumer.AlarmSourceCentral.AlarmDispatcher
    implements com.tailf.cdb.CdbDiffIterate, AutoCloseable
```

Types: [CdbDiffIterate](../../../../cdb/CdbDiffIterate.md#cls-CdbDiffIterate)

This class implements an alarm dispatching  function.

## Members

**Constructors**:

- [AlarmDispatcher(SocketAddress)](#m-AlarmDispatcher-613c7e189e3f)

**Methods**:

- [close()](#m-close-8107c6dc012b)
- [finish()](#m-finish-8c785ae2e6bb)
- [init()](#m-init-e3919b885d98)
- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](#m-iterate-d80a566b7e0a)

## Constructors

### AlarmDispatcher(SocketAddress) <a href="#m-AlarmDispatcher-613c7e189e3f" id="m-AlarmDispatcher-613c7e189e3f"></a>

```java
public AlarmDispatcher(
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../../../../conf/ConfException.md#cls-ConfException)

**Parameters**

- `java.net.SocketAddress address`


## Methods

### close() <a href="#m-close-8107c6dc012b" id="m-close-8107c6dc012b"></a>

```java
public void close()
```

### finish() <a href="#m-finish-8c785ae2e6bb" id="m-finish-8c785ae2e6bb"></a>

```java
public void finish() throws com.tailf.conf.ConfException
```

Types: [ConfException](../../../../conf/ConfException.md#cls-ConfException)

### init() <a href="#m-init-e3919b885d98" id="m-init-e3919b885d98"></a>

```java
public void init() throws com.tailf.conf.ConfException
```

Types: [ConfException](../../../../conf/ConfException.md#cls-ConfException)

### iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object) <a href="#m-iterate-d80a566b7e0a" id="m-iterate-d80a566b7e0a"></a>

```java
public com.tailf.conf.DiffIterateResultFlag iterate(
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfObject oldValue,
    com.tailf.conf.ConfObject newValue,
    Object initstate
)
```

Types: [DiffIterateResultFlag](../../../../conf/DiffIterateResultFlag.md#cls-DiffIterateResultFlag), [ConfObject](../../../../conf/ConfObject.md#cls-ConfObject), [DiffIterateOperFlag](../../../../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfObject oldValue`
- `com.tailf.conf.ConfObject newValue`
- `Object initstate`
