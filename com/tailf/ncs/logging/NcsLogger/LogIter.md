<a id="s-LogIter"></a>
# LogIter

**Package-private**

```java
static class com.tailf.ncs.logging.NcsLogger.LogIter
    implements com.tailf.cdb.CdbDiffIterate
```

Types: [CdbDiffIterate](../../../cdb/CdbDiffIterate.md#s-CdbDiffIterate)

Class make the diffIterate and trigger the Log Level changes to all
 affected Loggers. The iterate() method accumulate all changes and
 stores those in Map that the method fireChanges() will use when all
 the affected loggers will change Levels.

## Members

**Constructors**:

- [LogIter()](#s-LogIter-1)

**Methods**:

- [applyChanges()](#s-applyChanges)
- [clearChanges()](#s-clearChanges)
- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](#s-iterate)

## Constructors

<a id="s-LogIter-1"></a>
### LogIter()

**Package-private**

```java
LogIter()
```


## Methods

<a id="s-applyChanges"></a>
### applyChanges()

```java
public void applyChanges()
```

<a id="s-clearChanges"></a>
### clearChanges()

```java
public void clearChanges()
```

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
