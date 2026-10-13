# LogIter <a href="#logiter-ecede56df6fd" id="logiter-ecede56df6fd"></a>

**Package-private**

```java
static class com.tailf.ncs.logging.NcsLogger.LogIter
    implements com.tailf.cdb.CdbDiffIterate
```

Types: [CdbDiffIterate](../../../cdb/CdbDiffIterate.md#cdbdiffiterate-ab6fafeeb31e)

Class make the diffIterate and trigger the Log Level changes to all
 affected Loggers. The iterate() method accumulate all changes and
 stores those in Map that the method fireChanges() will use when all
 the affected loggers will change Levels.

## Members

**Constructors**:

- [LogIter\(\)](#logiter-2449327a7e19)

**Methods**:

- [applyChanges\(\)](#applychanges-7bfabdfb7bc4)
- [clearChanges\(\)](#clearchanges-dfce305f5de6)
- [iterate\(ConfObject\[\], DiffIterateOperFlag, ConfObject, ConfObject, Object\)](#iterate-d80a566b7e0a)

## Constructors

### LogIter() <a href="#logiter-2449327a7e19" id="logiter-2449327a7e19"></a>

**Package-private**

```java
LogIter()
```


## Methods

### applyChanges() <a href="#applychanges-7bfabdfb7bc4" id="applychanges-7bfabdfb7bc4"></a>

```java
public void applyChanges()
```

### clearChanges() <a href="#clearchanges-dfce305f5de6" id="clearchanges-dfce305f5de6"></a>

```java
public void clearChanges()
```

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
