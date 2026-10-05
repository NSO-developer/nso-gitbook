<a id="s-AlarmDispatcher"></a>
# AlarmDispatcher

```java
protected class com.tailf.ncs.alarmman.consumer.AlarmSourceCentral.AlarmDispatcher
    implements com.tailf.cdb.CdbDiffIterate, AutoCloseable
```

Types: [CdbDiffIterate](../../../../cdb/CdbDiffIterate.md#s-CdbDiffIterate)

This class implements an alarm dispatching  function.

## Members

**Constructors**:

- [AlarmDispatcher(SocketAddress)](#s-AlarmDispatcher-1)

**Methods**:

- [close()](#s-close)
- [finish()](#s-finish)
- [init()](#s-init)
- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](#s-iterate)

## Constructors

<a id="s-AlarmDispatcher-1"></a>
### AlarmDispatcher(SocketAddress)

```java
public AlarmDispatcher(
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../../../../conf/ConfException.md#s-ConfException)

**Parameters**

- `java.net.SocketAddress address`


## Methods

<a id="s-close"></a>
### close()

```java
public void close()
```

<a id="s-finish"></a>
### finish()

```java
public void finish() throws com.tailf.conf.ConfException
```

Types: [ConfException](../../../../conf/ConfException.md#s-ConfException)

<a id="s-init"></a>
### init()

```java
public void init() throws com.tailf.conf.ConfException
```

Types: [ConfException](../../../../conf/ConfException.md#s-ConfException)

<a id="s-iterate"></a>
### iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)

```java
public com.tailf.conf.DiffIterateResultFlag iterate(
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfObject oldValue,
    com.tailf.conf.ConfObject newValue,
    Object initstate
)
```

Types: [DiffIterateResultFlag](../../../../conf/DiffIterateResultFlag.md#s-DiffIterateResultFlag), [ConfObject](../../../../conf/ConfObject.md#s-ConfObject), [DiffIterateOperFlag](../../../../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfObject oldValue`
- `com.tailf.conf.ConfObject newValue`
- `Object initstate`
