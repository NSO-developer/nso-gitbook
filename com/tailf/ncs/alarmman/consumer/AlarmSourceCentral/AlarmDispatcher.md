# AlarmDispatcher <a href="#alarmdispatcher-46e75216df0e" id="alarmdispatcher-46e75216df0e"></a>

```java
protected class com.tailf.ncs.alarmman.consumer.AlarmSourceCentral.AlarmDispatcher
    implements com.tailf.cdb.CdbDiffIterate, AutoCloseable
```

Types: [CdbDiffIterate](../../../../cdb/CdbDiffIterate.md#cdbdiffiterate-ab6fafeeb31e)

This class implements an alarm dispatching  function.

## Members

**Constructors**:

- [AlarmDispatcher\(SocketAddress\)](#alarmdispatcher-613c7e189e3f)

**Methods**:

- [close\(\)](#close-8107c6dc012b)
- [finish\(\)](#finish-8c785ae2e6bb)
- [init\(\)](#init-e3919b885d98)
- [iterate\(ConfObject\[\], DiffIterateOperFlag, ConfObject, ConfObject, Object\)](#iterate-d80a566b7e0a)

## Constructors

### AlarmDispatcher(SocketAddress) <a href="#alarmdispatcher-613c7e189e3f" id="alarmdispatcher-613c7e189e3f"></a>

```java
public AlarmDispatcher(
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../../../../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `java.net.SocketAddress address`


## Methods

### close() <a href="#close-8107c6dc012b" id="close-8107c6dc012b"></a>

```java
public void close()
```

### finish() <a href="#finish-8c785ae2e6bb" id="finish-8c785ae2e6bb"></a>

```java
public void finish() throws com.tailf.conf.ConfException
```

Types: [ConfException](../../../../conf/ConfException.md#confexception-baeaab99f7f9)

### init() <a href="#init-e3919b885d98" id="init-e3919b885d98"></a>

```java
public void init() throws com.tailf.conf.ConfException
```

Types: [ConfException](../../../../conf/ConfException.md#confexception-baeaab99f7f9)

### iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object) <a href="#iterate-d80a566b7e0a" id="iterate-d80a566b7e0a"></a>

```java
public com.tailf.conf.DiffIterateResultFlag iterate(
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfObject oldValue,
    com.tailf.conf.ConfObject newValue,
    Object initstate
)
```

Types: [DiffIterateResultFlag](../../../../conf/DiffIterateResultFlag.md#diffiterateresultflag-3bcd05ed3269), [ConfObject](../../../../conf/ConfObject.md#confobject-5433616953b2), [DiffIterateOperFlag](../../../../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfObject oldValue`
- `com.tailf.conf.ConfObject newValue`
- `Object initstate`
