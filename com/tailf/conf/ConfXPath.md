# ConfXPath <a href="#cls-ConfXPath" id="cls-ConfXPath"></a>

```java
public class com.tailf.conf.ConfXPath
    extends com.tailf.conf.InstancePath
```

Types: [InstancePath](InstancePath.md#cls-InstancePath)

DATA_CONTAINER - Corresponds to the YANG instance-identifier type.


 Class Representing an XPath path. This class only supports a
 restriction of the XPath 1.0 grammar.

## Members

**Constructors**:

- [ConfXPath(String)](#m-ConfXPath-3168fe5c5a30)
- [ConfXPath(String, MountIdInterface)](#m-ConfXPath-c4fe4eab63ea)

**Fields**:

- [arguments](InstancePath.md#m-arguments) from InstancePath
- [deferred](InstancePath.md#m-deferred) from InstancePath
- [fmt](InstancePath.md#m-fmt) from InstancePath
- [hasSchema](InstancePath.md#m-hasSchema) from InstancePath
- [isRel](InstancePath.md#m-isRel) from InstancePath
- [latestMountId](InstancePath.md#m-latestMountId) from InstancePath
- [mountGetter](InstancePath.md#m-mountGetter) from InstancePath
- [pl](InstancePath.md#m-pl) from InstancePath

**Methods**:

- [chkDeferred()](#m-chkDeferred-f66dc2317846)
- [convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, ArrayList<PathKey>, boolean)](InstancePath.md#m-convertToConfKey-709808909e1b) from InstancePath
- [convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, List<PathKey>, boolean, boolean)](InstancePath.md#m-convertToConfKey-3964b2d32ca6) from InstancePath
- [encode()](InstancePath.md#m-encode-fbae522bba37) from InstancePath
- [encodeIKP()](InstancePath.md#m-encodeIKP-b160b87f6433) from InstancePath
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getCSNode()](InstancePath.md#m-getCSNode-cf7a085aa7f5) from InstancePath
- [getKP()](#m-getKP-45b2f95adae4)
- [getKP(List<PathElement>, boolean, boolean, MountIdInterface)](InstancePath.md#m-getKP-a23f67046fb4) from InstancePath
- [getLatestMountId()](InstancePath.md#m-getLatestMountId-30c9c1f692c7) from InstancePath
- [getMountIdGetter()](InstancePath.md#m-getMountIdGetter-64fcfdb6be8c) from InstancePath
- [hashCode()](#m-hashCode-ef797a217903)
- [isKey()](InstancePath.md#m-isKey-7bdf17ac8255) from InstancePath
- [isParsingDeferred()](InstancePath.md#m-isParsingDeferred-b3b266536326) from InstancePath
- [isRel()](InstancePath.md#m-isRel-dca98ac4de7a) from InstancePath
- [makeKP(ConfObject[])](InstancePath.md#m-makeKP-32258da68c76) from InstancePath
- [parseAppend(String, Object[])](InstancePath.md#m-parseAppend-54d8f4d7c8da) from InstancePath
- [parseAppend(String, Object[], List<CSNode>)](InstancePath.md#m-parseAppend-6e40353c0959) from InstancePath
- [quoteByteArray(byte[])](InstancePath.md#m-quoteByteArray-1889d341fdce) from InstancePath
- [quoteString(String, boolean)](InstancePath.md#m-quoteString-2ccae847ff76) from InstancePath
- [setMountIdGetter(MountIdInterface)](InstancePath.md#m-setMountIdGetter-900228f8453c) from InstancePath
- [toKeyPathString()](#m-toKeyPathString-bcccb457e808)
- [toString()](#m-toString-e9d48c5503ef)
- [toXPathString()](InstancePath.md#m-toXPathString-81906e391643) from InstancePath

## Constructors

### ConfXPath(String) <a href="#m-ConfXPath-3168fe5c5a30" id="m-ConfXPath-3168fe5c5a30"></a>

```java
public ConfXPath(String xpath) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `String xpath`

### ConfXPath(String, MountIdInterface) <a href="#m-ConfXPath-c4fe4eab63ea" id="m-ConfXPath-c4fe4eab63ea"></a>

```java
public ConfXPath(
    String xpath,
    com.tailf.conf.MountIdInterface mountGetter
)
    throws com.tailf.conf.ConfException
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `String xpath`
- `com.tailf.conf.MountIdInterface mountGetter`


## Methods

### chkDeferred() <a href="#m-chkDeferred-f66dc2317846" id="m-chkDeferred-f66dc2317846"></a>

```java
protected void chkDeferred()
```

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### getKP() <a href="#m-getKP-45b2f95adae4" id="m-getKP-45b2f95adae4"></a>

```java
public com.tailf.conf.ConfObject[] getKP()
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

Returns an array of `ConfTag` and `ConfKey`
 objects which represents the path in reverted order.


 This method requires that the path is absolute and that
 the schema prefix for the root element is defined, if not
 a `ConfException` is thrown.


 The `ConfKey` is composed of the proper
 `ConfValue` types which are determined by the
 loaded schema. However, if this the schema information is not available,
 and the type therefore cannot be determined the key elements are
 defaulted to `ConfBinary`.

**Returns:** reverted array representation of this `ConfPath`

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### toKeyPathString() <a href="#m-toKeyPathString-bcccb457e808" id="m-toKeyPathString-bcccb457e808"></a>

```java
public String toKeyPathString()
```

return this path as a keypath string.

**Returns:** keypath string representation

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

return the Default String representation, which is the XPath string
 representation.

**Returns:** default string representation
