<a id="s-DryRunResult"></a>
# DryRunResult

```java
public class com.tailf.maapi.DryRunResult
    extends com.tailf.maapi.ApplyResult
    implements Iterable<com.tailf.maapi.DryRunResult.DryRunEntry>
```

Types: [ApplyResult](ApplyResult.md#s-ApplyResult), [DryRunEntry](DryRunResult/DryRunEntry.md#s-DryRunEntry)

Represents a successful invocation of the
 [`Maapi`](Maapi.md#s-Maapi) method.

 The purpose of this class is to represent the result of a transaction
 without actually having committed the changes.

## Members

**Constructors**:

- [DryRunResult(ConfResponse)](#s-DryRunResult-1)

**Methods**:

- [getData()](DryRunResult/DryRunEntry.md#s-getData) from DryRunEntry
- [getFormat()](#s-getFormat)
- [getFormatAsString()](#s-getFormatAsString)
- [getName()](DryRunResult/DryRunEntry.md#s-getName) from DryRunEntry
- [getType()](DryRunResult/DryRunEntry.md#s-getType) from DryRunEntry
- [getTypeAsString()](DryRunResult/DryRunEntry.md#s-getTypeAsString) from DryRunEntry
- [iterator()](#s-iterator)

**Nested Types**:

- [DryRunEntry](DryRunResult/DryRunEntry.md#s-DryRunEntry)
- [Format](DryRunResult/Format.md#s-Format)

## Constructors

<a id="s-DryRunResult-1"></a>
### DryRunResult(ConfResponse)

```java
public DryRunResult(
    com.tailf.conf.ConfResponse result
)
    throws com.tailf.maapi.MaapiException, com.tailf.conf.ConfException
```

Types: [ConfResponse](../conf/ConfResponse.md#s-ConfResponse), [MaapiException](MaapiException.md#s-MaapiException), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfResponse result`


## Methods

<a id="s-getFormat"></a>
### getFormat()

```java
public com.tailf.maapi.DryRunResult.Format getFormat()
```

Types: [Format](DryRunResult/Format.md#s-Format)

Return the format of the dry-run result.

 The format could be any of the following:

 [`Format`](DryRunResult/Format.md#s-Format) means that all changes in the whole data model is
 displayed in NETCONF XML edit-config format.

 [`Format`](DryRunResult/Format.md#s-Format) means that all changes in the whole data model is
 displayed in NCS CLI curly bracket format.

 [`Format`](DryRunResult/Format.md#s-Format) means that all changes in the whole data model
 is displayed in Cisco style CLI format.

 [`Format`](DryRunResult/Format.md#s-Format) means that only changes under
  /devices/device/config is displayed in native device format.

<a id="s-getFormatAsString"></a>
### getFormatAsString()

```java
public String getFormatAsString()
```

Return the format as a string.

<a id="s-iterator"></a>
### iterator()

```java
public java.util.Iterator<com.tailf.maapi.DryRunResult.DryRunEntry> iterator()
```

Types: [DryRunEntry](DryRunResult/DryRunEntry.md#s-DryRunEntry)

Retrieves an iterator from which one could iterate over the
 result.


## Nested Types

- [DryRunEntry](DryRunResult/DryRunEntry.md)
- [Format](DryRunResult/Format.md)
