# EventIterator <a href="#cls-EventIterator" id="cls-EventIterator"></a>

```java
protected class com.tailf.ncs.NavuEventHandler.EventIterator
    implements com.tailf.cdb.CdbDiffIterate
```

Types: [CdbDiffIterate](../../cdb/CdbDiffIterate.md#cls-CdbDiffIterate)

## Members

**Constructors**:

- [EventIterator(SocketAddress)](#m-EventIterator-35bf486bdb4e)

**Methods**:

- [close()](#m-close-8107c6dc012b)
- [finish()](#m-finish-8c785ae2e6bb)
- [init()](#m-init-e3919b885d98)
- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](#m-iterate-d80a566b7e0a)

## Constructors

### EventIterator(SocketAddress) <a href="#m-EventIterator-35bf486bdb4e" id="m-EventIterator-35bf486bdb4e"></a>

```java
public EventIterator(
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../../conf/ConfException.md#cls-ConfException)

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

Types: [ConfException](../../conf/ConfException.md#cls-ConfException)

### init() <a href="#m-init-e3919b885d98" id="m-init-e3919b885d98"></a>

```java
public void init() throws com.tailf.conf.ConfException
```

Types: [ConfException](../../conf/ConfException.md#cls-ConfException)

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

Types: [DiffIterateResultFlag](../../conf/DiffIterateResultFlag.md#cls-DiffIterateResultFlag), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [DiffIterateOperFlag](../../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfObject oldValue`
- `com.tailf.conf.ConfObject newValue`
- `Object initstate`
