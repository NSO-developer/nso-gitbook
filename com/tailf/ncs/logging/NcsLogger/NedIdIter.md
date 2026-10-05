<a id="s-NedIdIter"></a>
# NedIdIter

**Package-private**

```java
static class com.tailf.ncs.logging.NcsLogger.NedIdIter
    implements com.tailf.cdb.CdbDiffIterate
```

Types: [CdbDiffIterate](../../../cdb/CdbDiffIterate.md#s-CdbDiffIterate)

## Members

**Constructors**:

- [NedIdIter()](#s-NedIdIter-1)

**Methods**:

- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](#s-iterate)

## Constructors

<a id="s-NedIdIter-1"></a>
### NedIdIter()

**Package-private**

```java
NedIdIter()
```


## Methods

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

Types: [DiffIterateResultFlag](../../../conf/DiffIterateResultFlag.md#s-DiffIterateResultFlag), [ConfObject](../../../conf/ConfObject.md#s-ConfObject), [DiffIterateOperFlag](../../../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfObject oldValue`
- `com.tailf.conf.ConfObject newValue`
- `Object initstate`
