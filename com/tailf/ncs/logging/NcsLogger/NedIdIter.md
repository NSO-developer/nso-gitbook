# NedIdIter <a href="#nediditer-c9ce7eb389da" id="nediditer-c9ce7eb389da"></a>

**Package-private**

```java
static class com.tailf.ncs.logging.NcsLogger.NedIdIter
    implements com.tailf.cdb.CdbDiffIterate
```

Types: [CdbDiffIterate](../../../cdb/CdbDiffIterate.md#cdbdiffiterate-ab6fafeeb31e)

## Members

**Constructors**:

- [NedIdIter\(\)](#nediditer-97d6da7077c5)

**Methods**:

- [iterate\(ConfObject\[\], DiffIterateOperFlag, ConfObject, ConfObject, Object\)](#iterate-d80a566b7e0a)

## Constructors

### NedIdIter() <a href="#nediditer-97d6da7077c5" id="nediditer-97d6da7077c5"></a>

**Package-private**

```java
NedIdIter()
```


## Methods

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

Types: [DiffIterateResultFlag](../../../conf/DiffIterateResultFlag.md#diffiterateresultflag-3bcd05ed3269), [ConfObject](../../../conf/ConfObject.md#confobject-5433616953b2), [DiffIterateOperFlag](../../../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfObject oldValue`
- `com.tailf.conf.ConfObject newValue`
- `Object initstate`
