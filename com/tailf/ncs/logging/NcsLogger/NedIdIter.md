<a id="cls-NedIdIter"></a>
# NedIdIter

**Package-private**

```java
static class com.tailf.ncs.logging.NcsLogger.NedIdIter
    implements com.tailf.cdb.CdbDiffIterate
```

Types: [CdbDiffIterate](../../../cdb/CdbDiffIterate.md#cls-CdbDiffIterate)

## Members

**Constructors**:

- [NedIdIter()](#m-nediditer-97d6da7077c5)

**Methods**:

- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](#m-iterate-d80a566b7e0a)

## Constructors

<a id="m-nediditer-97d6da7077c5"></a>
### NedIdIter()

**Package-private**

```java
NedIdIter()
```


## Methods

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

Types: [DiffIterateResultFlag](../../../conf/DiffIterateResultFlag.md#cls-DiffIterateResultFlag), [ConfObject](../../../conf/ConfObject.md#cls-ConfObject), [DiffIterateOperFlag](../../../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfObject oldValue`
- `com.tailf.conf.ConfObject newValue`
- `Object initstate`
