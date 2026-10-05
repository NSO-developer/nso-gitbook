<a id="cls-LogIter"></a>
# LogIter

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

- [LogIter()](#m-logiter-2449327a7e19)

**Methods**:

- [applyChanges()](#m-applychanges-7bfabdfb7bc4)
- [clearChanges()](#m-clearchanges-dfce305f5de6)
- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](#m-iterate-d80a566b7e0a)

## Constructors

<a id="m-logiter-2449327a7e19"></a>
### LogIter()

**Package-private**

```java
LogIter()
```


## Methods

<a id="m-applychanges-7bfabdfb7bc4"></a>
### applyChanges()

```java
public void applyChanges()
```

<a id="m-clearchanges-dfce305f5de6"></a>
### clearChanges()

```java
public void clearChanges()
```

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
