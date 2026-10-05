<a id="cls-ConfCdbUpgradePath"></a>
# ConfCdbUpgradePath

```java
public class com.tailf.conf.ConfCdbUpgradePath
    extends com.tailf.conf.ConfPath
```

Types: [ConfPath](ConfPath.md#cls-ConfPath)

Class Representing a KeyPath path.


 This is a simplified variant of [`ConfPath`](ConfPath.md#cls-ConfPath) for use with
 [`CdbUpgradeSession`](../cdb/CdbUpgradeSession.md#cls-CdbUpgradeSession).
 During a cdb upgrade, it may be necessary to migrate data from nodes that
 are about to be deleted. As these nodes are not present in the maapi
 schema, they cannot safely be represented by standard ConfPath objects.

 Instead use ConfCdbUpgradePath which relies only on ConfNamespace instances
 and thus allows deleted paths to be referenced as long as the namespace has
 been reinstalled.

## Members

**Constructors**:

- [ConfCdbUpgradePath(List<PathElement>)](#m-confcdbupgradepath-f58f3d6a1fe9)
- [ConfCdbUpgradePath(String, Object[])](#m-confcdbupgradepath-f5d885884ea7)

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

- [append(String)](#m-append-0469d86239bd)
- [append(String, List<CSNode>)](ConfPath.md#m-append-bad0f1c29427) from ConfPath
- [chkDeferred()](ConfPath.md#m-chkdeferred-f66dc2317846) from ConfPath
- [clone()](#m-clone-164c86c45e9b)
- [convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, ArrayList<PathKey>, boolean)](InstancePath.md#m-converttoconfkey-709808909e1b) from InstancePath
- [convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, List<PathKey>, boolean, boolean)](InstancePath.md#m-converttoconfkey-3964b2d32ca6) from InstancePath
- [copyAppend(String)](#m-copyappend-d79220720bf1)
- [copyPop()](#m-copypop-fcaa7a3deb75)
- [encode()](InstancePath.md#m-encode-fbae522bba37) from InstancePath
- [encodeIKP()](InstancePath.md#m-encodeikp-b160b87f6433) from InstancePath
- [equals(Object)](InstancePath.md#m-equals-fcd6492e0d6c) from InstancePath
- [getCSNode()](InstancePath.md#m-getcsnode-cf7a085aa7f5) from InstancePath
- [getKP()](InstancePath.md#m-getkp-45b2f95adae4) from InstancePath
- [getKP(List<PathElement>, boolean, boolean, MountIdInterface)](InstancePath.md#m-getkp-a23f67046fb4) from InstancePath
- [getLatestMountId()](InstancePath.md#m-getlatestmountid-30c9c1f692c7) from InstancePath
- [getMountIdGetter()](InstancePath.md#m-getmountidgetter-64fcfdb6be8c) from InstancePath
- [hashCode()](InstancePath.md#m-hashcode-ef797a217903) from InstancePath
- [isKey()](InstancePath.md#m-iskey-7bdf17ac8255) from InstancePath
- [isParsingDeferred()](InstancePath.md#m-isparsingdeferred-b3b266536326) from InstancePath
- [isRel()](InstancePath.md#m-isrel-dca98ac4de7a) from InstancePath
- [makeKP(ConfObject[])](InstancePath.md#m-makekp-32258da68c76) from InstancePath
- [parseAppend(String, Object[])](InstancePath.md#m-parseappend-54d8f4d7c8da) from InstancePath
- [parseAppend(String, Object[], List<CSNode>)](InstancePath.md#m-parseappend-6e40353c0959) from InstancePath
- [pop()](ConfPath.md#m-pop-1c15fa891a07) from ConfPath
- [popConfObject(List<PathElement>)](ConfPath.md#m-popconfobject-12eef6108ea1) from ConfPath
- [quoteByteArray(byte[])](InstancePath.md#m-quotebytearray-1889d341fdce) from InstancePath
- [quoteString(String, boolean)](InstancePath.md#m-quotestring-2ccae847ff76) from InstancePath
- [setMountIdGetter(MountIdInterface)](InstancePath.md#m-setmountidgetter-900228f8453c) from InstancePath
- [toString()](ConfPath.md#m-tostring-e9d48c5503ef) from ConfPath
- [toXPathString()](#m-toxpathstring-81906e391643)

## Constructors

<a id="m-confcdbupgradepath-f58f3d6a1fe9"></a>
### ConfCdbUpgradePath(List<PathElement>)

```java
public ConfCdbUpgradePath(java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl)
```

Types: [PathElement](gen/PathParser/PathElement.md#cls-PathElement)

**Parameters**

- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`

<a id="m-confcdbupgradepath-f5d885884ea7"></a>
### ConfCdbUpgradePath(String, Object[])

```java
public ConfCdbUpgradePath(String fmt, Object[] arguments) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `String fmt`
- `Object[] arguments`


## Methods

<a id="m-append-0469d86239bd"></a>
### append(String)

```java
public com.tailf.conf.ConfCdbUpgradePath append(String s) throws com.tailf.conf.ConfException
```

Types: [ConfCdbUpgradePath](ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](ConfException.md#cls-ConfException)

Appends suffix path to existing keypath

**Parameters**

- `String s`

<a id="m-clone-164c86c45e9b"></a>
### clone()

```java
public Object clone()
```

Clones the ConfCdbUpgradePath

<a id="m-copyappend-d79220720bf1"></a>
### copyAppend(String)

```java
public com.tailf.conf.ConfCdbUpgradePath copyAppend(String s) throws com.tailf.conf.ConfException
```

Types: [ConfCdbUpgradePath](ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](ConfException.md#cls-ConfException)

CopyAppends to the keypath

**Parameters**

- `String s`

<a id="m-copypop-fcaa7a3deb75"></a>
### copyPop()

```java
public com.tailf.conf.ConfCdbUpgradePath copyPop() throws com.tailf.conf.ConfException
```

Types: [ConfCdbUpgradePath](ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](ConfException.md#cls-ConfException)

Creates a new ConfCdbUpgradePath with the current path minus the last
 element including list keys.

<a id="m-toxpathstring-81906e391643"></a>
### toXPathString()

```java
public String toXPathString()
```

A ConfCdbUpgradePath cannot be converted to an xpath string as this
 requires access to the schema. This method will always throw an
 exception.
