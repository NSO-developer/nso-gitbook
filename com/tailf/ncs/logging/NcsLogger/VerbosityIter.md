<a id="s-VerbosityIter"></a>
# VerbosityIter

**Package-private**

```java
static class com.tailf.ncs.logging.NcsLogger.VerbosityIter
    implements com.tailf.cdb.CdbDiffIterate
```

Types: [CdbDiffIterate](../../../cdb/CdbDiffIterate.md#s-CdbDiffIterate)

Class make the diffIterate for exception error verbosity and
 sets Dp defaultErrorVerbosity accordingly.

## Members

**Constructors**:

- [VerbosityIter()](#s-VerbosityIter-1)

**Methods**:

- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](#s-iterate)

## Constructors

<a id="s-VerbosityIter-1"></a>
### VerbosityIter()

**Package-private**

```java
VerbosityIter()
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
