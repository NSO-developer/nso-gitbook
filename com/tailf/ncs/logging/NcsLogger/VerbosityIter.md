# VerbosityIter <a href="#verbosityiter-e51c846079ee" id="verbosityiter-e51c846079ee"></a>

**Package-private**

```java
static class com.tailf.ncs.logging.NcsLogger.VerbosityIter
    implements com.tailf.cdb.CdbDiffIterate
```

Types: [CdbDiffIterate](../../../cdb/CdbDiffIterate.md#cdbdiffiterate-ab6fafeeb31e)

Class make the diffIterate for exception error verbosity and
 sets Dp defaultErrorVerbosity accordingly.

## Members

**Constructors**:

- [VerbosityIter\(\)](#verbosityiter-cf703d6c61f3)

**Methods**:

- [iterate\(ConfObject\[\], DiffIterateOperFlag, ConfObject, ConfObject, Object\)](#iterate-d80a566b7e0a)

## Constructors

### VerbosityIter() <a href="#verbosityiter-cf703d6c61f3" id="verbosityiter-cf703d6c61f3"></a>

**Package-private**

```java
VerbosityIter()
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
