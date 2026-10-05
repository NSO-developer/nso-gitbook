<a id="s-ConfCdbUpgradePath"></a>
# ConfCdbUpgradePath

```java
public class com.tailf.conf.ConfCdbUpgradePath
    extends com.tailf.conf.ConfPath
```

Types: [ConfPath](ConfPath.md#s-ConfPath)

Class Representing a KeyPath path.


 This is a simplified variant of [`ConfPath`](ConfPath.md#s-ConfPath) for use with
 [`CdbUpgradeSession`](../cdb/CdbUpgradeSession.md#s-CdbUpgradeSession).
 During a cdb upgrade, it may be necessary to migrate data from nodes that
 are about to be deleted. As these nodes are not present in the maapi
 schema, they cannot safely be represented by standard ConfPath objects.

 Instead use ConfCdbUpgradePath which relies only on ConfNamespace instances
 and thus allows deleted paths to be referenced as long as the namespace has
 been reinstalled.

## Members

**Constructors**:

- [ConfCdbUpgradePath(List<PathElement>)](#s-ConfCdbUpgradePath-1)
- [ConfCdbUpgradePath(String, Object[])](#s-ConfCdbUpgradePath-2)

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

- [append(String)](#s-append)
- [append(String, List<CSNode>)](ConfPath.md#s-append-1) from ConfPath
- [chkDeferred()](ConfPath.md#s-chkDeferred) from ConfPath
- [clone()](#s-clone)
- [convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, ArrayList<PathKey>, boolean)](InstancePath.md#s-convertToConfKey) from InstancePath
- [convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, List<PathKey>, boolean, boolean)](InstancePath.md#s-convertToConfKey-1) from InstancePath
- [copyAppend(String)](#s-copyAppend)
- [copyPop()](#s-copyPop)
- [encode()](InstancePath.md#s-encode) from InstancePath
- [encodeIKP()](InstancePath.md#s-encodeIKP) from InstancePath
- [equals(Object)](InstancePath.md#s-equals) from InstancePath
- [getCSNode()](InstancePath.md#s-getCSNode) from InstancePath
- [getKP()](InstancePath.md#s-getKP) from InstancePath
- [getKP(List<PathElement>, boolean, boolean, MountIdInterface)](InstancePath.md#s-getKP-1) from InstancePath
- [getLatestMountId()](InstancePath.md#s-getLatestMountId) from InstancePath
- [getMountIdGetter()](InstancePath.md#s-getMountIdGetter) from InstancePath
- [hashCode()](InstancePath.md#s-hashCode) from InstancePath
- [isKey()](InstancePath.md#s-isKey) from InstancePath
- [isParsingDeferred()](InstancePath.md#s-isParsingDeferred) from InstancePath
- [isRel()](InstancePath.md#s-isRel-1) from InstancePath
- [makeKP(ConfObject[])](InstancePath.md#s-makeKP) from InstancePath
- [parseAppend(String, Object[])](InstancePath.md#s-parseAppend) from InstancePath
- [parseAppend(String, Object[], List<CSNode>)](InstancePath.md#s-parseAppend-1) from InstancePath
- [pop()](ConfPath.md#s-pop) from ConfPath
- [popConfObject(List<PathElement>)](ConfPath.md#s-popConfObject) from ConfPath
- [quoteByteArray(byte[])](InstancePath.md#s-quoteByteArray) from InstancePath
- [quoteString(String, boolean)](InstancePath.md#s-quoteString) from InstancePath
- [setMountIdGetter(MountIdInterface)](InstancePath.md#s-setMountIdGetter) from InstancePath
- [toString()](ConfPath.md#s-toString) from ConfPath
- [toXPathString()](#s-toXPathString)

## Constructors

<a id="s-ConfCdbUpgradePath-1"></a>
### ConfCdbUpgradePath(List<PathElement>)

```java
public ConfCdbUpgradePath(java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl)
```

Types: [PathElement](gen/PathParser/PathElement.md#s-PathElement)

**Parameters**

- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`

<a id="s-ConfCdbUpgradePath-2"></a>
### ConfCdbUpgradePath(String, Object[])

```java
public ConfCdbUpgradePath(String fmt, Object[] arguments) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `String fmt`
- `Object[] arguments`


## Methods

<a id="s-append"></a>
### append(String)

```java
public com.tailf.conf.ConfCdbUpgradePath append(String s) throws com.tailf.conf.ConfException
```

Types: [ConfCdbUpgradePath](ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](ConfException.md#s-ConfException)

Appends suffix path to existing keypath

**Parameters**

- `String s`

<a id="s-clone"></a>
### clone()

```java
public Object clone()
```

Clones the ConfCdbUpgradePath

<a id="s-copyAppend"></a>
### copyAppend(String)

```java
public com.tailf.conf.ConfCdbUpgradePath copyAppend(String s) throws com.tailf.conf.ConfException
```

Types: [ConfCdbUpgradePath](ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](ConfException.md#s-ConfException)

CopyAppends to the keypath

**Parameters**

- `String s`

<a id="s-copyPop"></a>
### copyPop()

```java
public com.tailf.conf.ConfCdbUpgradePath copyPop() throws com.tailf.conf.ConfException
```

Types: [ConfCdbUpgradePath](ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](ConfException.md#s-ConfException)

Creates a new ConfCdbUpgradePath with the current path minus the last
 element including list keys.

<a id="s-toXPathString"></a>
### toXPathString()

```java
public String toXPathString()
```

A ConfCdbUpgradePath cannot be converted to an xpath string as this
 requires access to the schema. This method will always throw an
 exception.
