<a id="cls-VerbosityIter"></a>
# VerbosityIter

**Package-private**

```java
static class com.tailf.ncs.logging.NcsLogger.VerbosityIter
    implements com.tailf.cdb.CdbDiffIterate
```

Types: [CdbDiffIterate](../../../cdb/CdbDiffIterate.md#cls-CdbDiffIterate)

Class make the diffIterate for exception error verbosity and
 sets Dp defaultErrorVerbosity accordingly.

## Members

**Constructors**:

- [VerbosityIter()](#m-verbosityiter-cf703d6c61f3)

**Methods**:

- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](#m-iterate-d80a566b7e0a)

## Constructors

<a id="m-verbosityiter-cf703d6c61f3"></a>
### VerbosityIter()

**Package-private**

```java
VerbosityIter()
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
