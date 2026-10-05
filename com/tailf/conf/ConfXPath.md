<a id="s-ConfXPath"></a>
# ConfXPath

```java
public class com.tailf.conf.ConfXPath
    extends com.tailf.conf.InstancePath
```

Types: [InstancePath](InstancePath.md#s-InstancePath)

DATA_CONTAINER - Corresponds to the YANG instance-identifier type.


 Class Representing an XPath path. This class only supports a
 restriction of the XPath 1.0 grammar.

## Members

**Constructors**:

- [ConfXPath(String)](#s-ConfXPath-1)
- [ConfXPath(String, MountIdInterface)](#s-ConfXPath-2)

**Fields**:

- [arguments](InstancePath.md#s-arguments) from InstancePath
- [deferred](InstancePath.md#s-deferred) from InstancePath
- [fmt](InstancePath.md#s-fmt) from InstancePath
- [hasSchema](InstancePath.md#s-hasSchema) from InstancePath
- [isRel](InstancePath.md#s-isRel) from InstancePath
- [latestMountId](InstancePath.md#s-latestMountId) from InstancePath
- [mountGetter](InstancePath.md#s-mountGetter) from InstancePath
- [pl](InstancePath.md#s-pl) from InstancePath

**Methods**:

- [chkDeferred()](#s-chkDeferred)
- [convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, ArrayList<PathKey>, boolean)](InstancePath.md#s-convertToConfKey) from InstancePath
- [convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, List<PathKey>, boolean, boolean)](InstancePath.md#s-convertToConfKey-1) from InstancePath
- [encode()](InstancePath.md#s-encode) from InstancePath
- [encodeIKP()](InstancePath.md#s-encodeIKP) from InstancePath
- [equals(Object)](#s-equals)
- [getCSNode()](InstancePath.md#s-getCSNode) from InstancePath
- [getKP()](#s-getKP)
- [getKP(List<PathElement>, boolean, boolean, MountIdInterface)](InstancePath.md#s-getKP-1) from InstancePath
- [getLatestMountId()](InstancePath.md#s-getLatestMountId) from InstancePath
- [getMountIdGetter()](InstancePath.md#s-getMountIdGetter) from InstancePath
- [hashCode()](#s-hashCode)
- [isKey()](InstancePath.md#s-isKey) from InstancePath
- [isParsingDeferred()](InstancePath.md#s-isParsingDeferred) from InstancePath
- [isRel()](InstancePath.md#s-isRel-1) from InstancePath
- [makeKP(ConfObject[])](InstancePath.md#s-makeKP) from InstancePath
- [parseAppend(String, Object[])](InstancePath.md#s-parseAppend) from InstancePath
- [parseAppend(String, Object[], List<CSNode>)](InstancePath.md#s-parseAppend-1) from InstancePath
- [quoteByteArray(byte[])](InstancePath.md#s-quoteByteArray) from InstancePath
- [quoteString(String, boolean)](InstancePath.md#s-quoteString) from InstancePath
- [setMountIdGetter(MountIdInterface)](InstancePath.md#s-setMountIdGetter) from InstancePath
- [toKeyPathString()](#s-toKeyPathString)
- [toString()](#s-toString)
- [toXPathString()](InstancePath.md#s-toXPathString) from InstancePath

## Constructors

<a id="s-ConfXPath-1"></a>
### ConfXPath(String)

```java
public ConfXPath(String xpath) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `String xpath`

<a id="s-ConfXPath-2"></a>
### ConfXPath(String, MountIdInterface)

```java
public ConfXPath(
    String xpath,
    com.tailf.conf.MountIdInterface mountGetter
)
    throws com.tailf.conf.ConfException
```

Types: [MountIdInterface](MountIdInterface.md#s-MountIdInterface), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `String xpath`
- `com.tailf.conf.MountIdInterface mountGetter`


## Methods

<a id="s-chkDeferred"></a>
### chkDeferred()

```java
protected void chkDeferred()
```

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

<a id="s-getKP"></a>
### getKP()

```java
public com.tailf.conf.ConfObject[] getKP()
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

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

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-toKeyPathString"></a>
### toKeyPathString()

```java
public String toKeyPathString()
```

return this path as a keypath string.

**Returns:** keypath string representation

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

return the Default String representation, which is the XPath string
 representation.

**Returns:** default string representation
