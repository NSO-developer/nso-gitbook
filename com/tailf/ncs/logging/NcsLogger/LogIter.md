# LogIter <a href="#cls-LogIter" id="cls-LogIter"></a>

**Package-private**

```java
static class com.tailf.ncs.logging.NcsLogger.LogIter
    implements com.tailf.cdb.CdbDiffIterate
```

Types: [CdbDiffIterate](../../../cdb/CdbDiffIterate.md#cls-CdbDiffIterate)

Class make the diffIterate and trigger the Log Level changes to all
 affected Loggers. The iterate() method accumulate all changes and
 stores those in Map that the method fireChanges() will use when all
 the affected loggers will change Levels.

## Members

**Constructors**:

- [LogIter()](#m-LogIter-2449327a7e19)

**Methods**:

- [applyChanges()](#m-applyChanges-7bfabdfb7bc4)
- [clearChanges()](#m-clearChanges-dfce305f5de6)
- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](#m-iterate-d80a566b7e0a)

## Constructors

### LogIter() <a href="#m-LogIter-2449327a7e19" id="m-LogIter-2449327a7e19"></a>

**Package-private**

```java
LogIter()
```


## Methods

### applyChanges() <a href="#m-applyChanges-7bfabdfb7bc4" id="m-applyChanges-7bfabdfb7bc4"></a>

```java
public void applyChanges()
```

### clearChanges() <a href="#m-clearChanges-dfce305f5de6" id="m-clearChanges-dfce305f5de6"></a>

```java
public void clearChanges()
```

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

Types: [DiffIterateResultFlag](../../../conf/DiffIterateResultFlag.md#cls-DiffIterateResultFlag), [ConfObject](../../../conf/ConfObject.md#cls-ConfObject), [DiffIterateOperFlag](../../../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfObject oldValue`
- `com.tailf.conf.ConfObject newValue`
- `Object initstate`
