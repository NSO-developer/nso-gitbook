# DryRunResult <a href="#cls-DryRunResult" id="cls-DryRunResult"></a>

```java
public class com.tailf.maapi.DryRunResult
    extends com.tailf.maapi.ApplyResult
    implements Iterable<com.tailf.maapi.DryRunResult.DryRunEntry>
```

Types: [ApplyResult](ApplyResult.md#cls-ApplyResult), [DryRunEntry](DryRunResult/DryRunEntry.md#cls-DryRunEntry)

Represents a successful invocation of the
 [`Maapi#applyTransParams(int, boolean, CommitParams)`](Maapi.md#m-applyTransParams-6c20b7896663) method.

 The purpose of this class is to represent the result of a transaction
 without actually having committed the changes.

## Members

**Constructors**:

- [DryRunResult(ConfResponse)](#m-DryRunResult-91936489d995)

**Methods**:

- [getData()](DryRunResult/DryRunEntry.md#m-getData-8ef0e36ab01b) from DryRunEntry
- [getFormat()](#m-getFormat-8617415c2f83)
- [getFormatAsString()](#m-getFormatAsString-e50e8059b9b9)
- [getName()](DryRunResult/DryRunEntry.md#m-getName-2634b18b4a25) from DryRunEntry
- [getType()](DryRunResult/DryRunEntry.md#m-getType-5a52f6f0d4c1) from DryRunEntry
- [getTypeAsString()](DryRunResult/DryRunEntry.md#m-getTypeAsString-ea437139f174) from DryRunEntry
- [iterator()](#m-iterator-188aa52d1f86)

**Nested Types**:

- [DryRunEntry](DryRunResult/DryRunEntry.md#cls-DryRunEntry)
- [Format](DryRunResult/Format.md#cls-Format)

## Constructors

### DryRunResult(ConfResponse) <a href="#m-DryRunResult-91936489d995" id="m-DryRunResult-91936489d995"></a>

```java
public DryRunResult(
    com.tailf.conf.ConfResponse result
)
    throws com.tailf.maapi.MaapiException, com.tailf.conf.ConfException
```

Types: [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse), [MaapiException](MaapiException.md#cls-MaapiException), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfResponse result`


## Methods

### getFormat() <a href="#m-getFormat-8617415c2f83" id="m-getFormat-8617415c2f83"></a>

```java
public com.tailf.maapi.DryRunResult.Format getFormat()
```

Types: [Format](DryRunResult/Format.md#cls-Format)

Return the format of the dry-run result.

 The format could be any of the following:

 [`Format#XML`](DryRunResult/Format.md#m-XML) means that all changes in the whole data model is
 displayed in NETCONF XML edit-config format.

 [`Format#CLI`](DryRunResult/Format.md#m-CLI) means that all changes in the whole data model is
 displayed in NCS CLI curly bracket format.

 [`Format#CLI_C`](DryRunResult/Format.md#m-CLI_C) means that all changes in the whole data model
 is displayed in Cisco style CLI format.

 [`Format#NATIVE`](DryRunResult/Format.md#m-NATIVE) means that only changes under
  /devices/device/config is displayed in native device format.

### getFormatAsString() <a href="#m-getFormatAsString-e50e8059b9b9" id="m-getFormatAsString-e50e8059b9b9"></a>

```java
public String getFormatAsString()
```

Return the format as a string.

### iterator() <a href="#m-iterator-188aa52d1f86" id="m-iterator-188aa52d1f86"></a>

```java
public java.util.Iterator<com.tailf.maapi.DryRunResult.DryRunEntry> iterator()
```

Types: [DryRunEntry](DryRunResult/DryRunEntry.md#cls-DryRunEntry)

Retrieves an iterator from which one could iterate over the
 result.


## Nested Types

- [DryRunEntry](DryRunResult/DryRunEntry.md#cls-DryRunEntry)
- [Format](DryRunResult/Format.md#cls-Format)
