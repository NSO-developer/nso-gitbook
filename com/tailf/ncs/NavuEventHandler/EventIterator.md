<a id="cls-EventIterator"></a>
# EventIterator

```java
protected class com.tailf.ncs.NavuEventHandler.EventIterator
    implements com.tailf.cdb.CdbDiffIterate
```

Types: [CdbDiffIterate](../../cdb/CdbDiffIterate.md#cls-CdbDiffIterate)

## Members

**Constructors**:

- [EventIterator(SocketAddress)](#m-eventiterator-35bf486bdb4e)

**Methods**:

- [close()](#m-close-8107c6dc012b)
- [finish()](#m-finish-8c785ae2e6bb)
- [init()](#m-init-e3919b885d98)
- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](#m-iterate-d80a566b7e0a)

## Constructors

<a id="m-eventiterator-35bf486bdb4e"></a>
### EventIterator(SocketAddress)

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

<a id="m-close-8107c6dc012b"></a>
### close()

```java
public void close()
```

<a id="m-finish-8c785ae2e6bb"></a>
### finish()

```java
public void finish() throws com.tailf.conf.ConfException
```

Types: [ConfException](../../conf/ConfException.md#cls-ConfException)

<a id="m-init-e3919b885d98"></a>
### init()

```java
public void init() throws com.tailf.conf.ConfException
```

Types: [ConfException](../../conf/ConfException.md#cls-ConfException)

<a id="m-iterate-d80a566b7e0a"></a>
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

Types: [DiffIterateResultFlag](../../conf/DiffIterateResultFlag.md#cls-DiffIterateResultFlag), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [DiffIterateOperFlag](../../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfObject oldValue`
- `com.tailf.conf.ConfObject newValue`
- `Object initstate`
