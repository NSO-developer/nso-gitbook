# DryRunResult <a href="#dryrunresult-28828490822f" id="dryrunresult-28828490822f"></a>

```java
public class com.tailf.maapi.DryRunResult
    extends com.tailf.maapi.ApplyResult
    implements Iterable<com.tailf.maapi.DryRunResult.DryRunEntry>
```

Types: [ApplyResult](ApplyResult.md#applyresult-77b049ed4f17), [DryRunEntry](DryRunResult/DryRunEntry.md#dryrunentry-2d08ec41ae5c)

Represents a successful invocation of the
 [`Maapi#applyTransParams(int, boolean, CommitParams)`](Maapi.md#applytransparams-6c20b7896663) method.

 The purpose of this class is to represent the result of a transaction
 without actually having committed the changes.

## Members

**Constructors**:

- [DryRunResult(ConfResponse)](#dryrunresult-91936489d995)

**Methods**:

- [getData()](DryRunResult/DryRunEntry.md#getdata-8ef0e36ab01b) from DryRunEntry
- [getFormat()](#getformat-8617415c2f83)
- [getFormatAsString()](#getformatasstring-e50e8059b9b9)
- [getName()](DryRunResult/DryRunEntry.md#getname-2634b18b4a25) from DryRunEntry
- [getType()](DryRunResult/DryRunEntry.md#gettype-5a52f6f0d4c1) from DryRunEntry
- [getTypeAsString()](DryRunResult/DryRunEntry.md#gettypeasstring-ea437139f174) from DryRunEntry
- [iterator()](#iterator-188aa52d1f86)

**Nested Types**:

- [DryRunEntry](DryRunResult/DryRunEntry.md#dryrunentry-2d08ec41ae5c)
- [Format](DryRunResult/Format.md#format-7125142f5ce6)

## Constructors

### DryRunResult(ConfResponse) <a href="#dryrunresult-91936489d995" id="dryrunresult-91936489d995"></a>

```java
public DryRunResult(
    com.tailf.conf.ConfResponse result
)
    throws com.tailf.maapi.MaapiException, com.tailf.conf.ConfException
```

Types: [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfResponse result`


## Methods

### getFormat() <a href="#getformat-8617415c2f83" id="getformat-8617415c2f83"></a>

```java
public com.tailf.maapi.DryRunResult.Format getFormat()
```

Types: [Format](DryRunResult/Format.md#format-7125142f5ce6)

Return the format of the dry-run result.

 The format could be any of the following:

 [`Format#XML`](DryRunResult/Format.md#xml-b65914d05936) means that all changes in the whole data model is
 displayed in NETCONF XML edit-config format.

 [`Format#CLI`](DryRunResult/Format.md#cli-0d593b2cecc2) means that all changes in the whole data model is
 displayed in NCS CLI curly bracket format.

 [`Format#CLI_C`](DryRunResult/Format.md#cli_c-c2e13684a7a3) means that all changes in the whole data model
 is displayed in Cisco style CLI format.

 [`Format#NATIVE`](DryRunResult/Format.md#native-18aeb3ecd16f) means that only changes under
  /devices/device/config is displayed in native device format.

### getFormatAsString() <a href="#getformatasstring-e50e8059b9b9" id="getformatasstring-e50e8059b9b9"></a>

```java
public String getFormatAsString()
```

Return the format as a string.

### iterator() <a href="#iterator-188aa52d1f86" id="iterator-188aa52d1f86"></a>

```java
public java.util.Iterator<com.tailf.maapi.DryRunResult.DryRunEntry> iterator()
```

Types: [DryRunEntry](DryRunResult/DryRunEntry.md#dryrunentry-2d08ec41ae5c)

Retrieves an iterator from which one could iterate over the
 result.


## Nested Types

- [DryRunEntry](DryRunResult/DryRunEntry.md#dryrunentry-2d08ec41ae5c)
- [Format](DryRunResult/Format.md#format-7125142f5ce6)
