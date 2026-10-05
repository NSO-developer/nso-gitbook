# ConfPath <a href="#cls-ConfPath" id="cls-ConfPath"></a>

```java
public class com.tailf.conf.ConfPath
    extends com.tailf.conf.InstancePath
```

Types: [InstancePath](InstancePath.md#cls-InstancePath)

Class Representing an KeyPath path.


  String representations e.g `"/n:rootA/nodeB/listC{key1}/leafD"`
  User applications usually needs to construct string representations
  of paths in this way. To construct a `ConfPath` from this
  representation use [`ConfPath(String, Object...)`](ConfPath.md#m-ConfPath-8a4fe6060eb3)

**Related classes**

- [ConfCdbUpgradePath](ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath)

## Members

**Constructors**:

- [ConfPath()](#m-ConfPath-7f970cc77a26)
- [ConfPath(Cdb, ConfObject[])](#m-ConfPath-4b73430ece5c)
- [ConfPath(Cdb, String, Object[])](#m-ConfPath-f2399b19143b)
- [ConfPath(ConfEBinary)](#m-ConfPath-9dfd225c2ca2)
- [ConfPath(ConfEList)](#m-ConfPath-f04d38a4d2b2)
- [ConfPath(ConfObject[])](#m-ConfPath-a9a205b72c41)
- [ConfPath(ConfPath)](#m-ConfPath-9ead5ec0063a)
- [ConfPath(Maapi, int, ConfObject[])](#m-ConfPath-e3b5d7d947e2)
- [ConfPath(Maapi, int, String, Object[])](#m-ConfPath-517b4240f396)
- [ConfPath(MountIdInterface, ConfObject[])](#m-ConfPath-ff4ee085d860)
- [ConfPath(MountIdInterface, List<PathElement>)](#m-ConfPath-c79fb5d41889)
- [ConfPath(MountIdInterface, String, Object[])](#m-ConfPath-8eb451dafe31)
- [ConfPath(String, Object[])](#m-ConfPath-8a4fe6060eb3)

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
- [append(String, List<CSNode>)](#m-append-bad0f1c29427)
- [chkDeferred()](#m-chkDeferred-f66dc2317846)
- [clone()](#m-clone-164c86c45e9b)
- [convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, ArrayList<PathKey>, boolean)](InstancePath.md#m-convertToConfKey-709808909e1b) from InstancePath
- [convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, List<PathKey>, boolean, boolean)](InstancePath.md#m-convertToConfKey-3964b2d32ca6) from InstancePath
- [copyAppend(String)](#m-copyAppend-d79220720bf1)
- [copyPop()](#m-copyPop-fcaa7a3deb75)
- [encode()](InstancePath.md#m-encode-fbae522bba37) from InstancePath
- [encodeIKP()](InstancePath.md#m-encodeIKP-b160b87f6433) from InstancePath
- [equals(Object)](InstancePath.md#m-equals-fcd6492e0d6c) from InstancePath
- [getCSNode()](InstancePath.md#m-getCSNode-cf7a085aa7f5) from InstancePath
- [getKP()](InstancePath.md#m-getKP-45b2f95adae4) from InstancePath
- [getKP(List<PathElement>, boolean, boolean, MountIdInterface)](InstancePath.md#m-getKP-a23f67046fb4) from InstancePath
- [getLatestMountId()](InstancePath.md#m-getLatestMountId-30c9c1f692c7) from InstancePath
- [getMountIdGetter()](InstancePath.md#m-getMountIdGetter-64fcfdb6be8c) from InstancePath
- [hashCode()](InstancePath.md#m-hashCode-ef797a217903) from InstancePath
- [isKey()](InstancePath.md#m-isKey-7bdf17ac8255) from InstancePath
- [isParsingDeferred()](InstancePath.md#m-isParsingDeferred-b3b266536326) from InstancePath
- [isRel()](InstancePath.md#m-isRel-dca98ac4de7a) from InstancePath
- [makeKP(ConfObject[])](InstancePath.md#m-makeKP-32258da68c76) from InstancePath
- [parseAppend(String, Object[])](InstancePath.md#m-parseAppend-54d8f4d7c8da) from InstancePath
- [parseAppend(String, Object[], List<CSNode>)](InstancePath.md#m-parseAppend-6e40353c0959) from InstancePath
- [pop()](#m-pop-1c15fa891a07)
- [popConfObject(List<PathElement>)](#m-popConfObject-12eef6108ea1)
- [quoteByteArray(byte[])](InstancePath.md#m-quoteByteArray-1889d341fdce) from InstancePath
- [quoteString(String, boolean)](InstancePath.md#m-quoteString-2ccae847ff76) from InstancePath
- [setMountIdGetter(MountIdInterface)](InstancePath.md#m-setMountIdGetter-900228f8453c) from InstancePath
- [toString()](#m-toString-e9d48c5503ef)
- [toXPathString()](#m-toXPathString-81906e391643)

## Constructors

### ConfPath() <a href="#m-ConfPath-7f970cc77a26" id="m-ConfPath-7f970cc77a26"></a>

```java
protected ConfPath()
```

### ConfPath(Cdb, ConfObject[]) <a href="#m-ConfPath-4b73430ece5c" id="m-ConfPath-4b73430ece5c"></a>

```java
public ConfPath(com.tailf.cdb.Cdb cdb, com.tailf.conf.ConfObject[] kp)
```

Types: [Cdb](../cdb/Cdb.md#cls-Cdb), [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.cdb.Cdb cdb`
- `com.tailf.conf.ConfObject[] kp`

### ConfPath(Cdb, String, Object[]) <a href="#m-ConfPath-f2399b19143b" id="m-ConfPath-f2399b19143b"></a>

```java
public ConfPath(
    com.tailf.cdb.Cdb cdb,
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException
```

Types: [Cdb](../cdb/Cdb.md#cls-Cdb), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.cdb.Cdb cdb`
- `String fmt`
- `Object[] arguments`

### ConfPath(ConfEBinary) <a href="#m-ConfPath-9dfd225c2ca2" id="m-ConfPath-9dfd225c2ca2"></a>

```java
public ConfPath(com.tailf.proto.ConfEBinary o) throws com.tailf.conf.ConfException
```

Types: [ConfEBinary](../proto/ConfEBinary.md#cls-ConfEBinary), [ConfException](ConfException.md#cls-ConfException)

Initialize a ConfPath.
 (*This constructor is rarely used for applications; usually
 for internal use*)

**Parameters**

- `com.tailf.proto.ConfEBinary o` - element constitute a `ConfPath`

**Throws**

- `ConfException`

### ConfPath(ConfEList) <a href="#m-ConfPath-f04d38a4d2b2" id="m-ConfPath-f04d38a4d2b2"></a>

```java
public ConfPath(com.tailf.proto.ConfEList o)
```

Types: [ConfEList](../proto/ConfEList.md#cls-ConfEList)

Initialize a ConfPath.
 (*This constructor is rarely used for applications;
 usually for internal uses*)

**Parameters**

- `com.tailf.proto.ConfEList o` - element (reversed) constitute a `ConfPath`

### ConfPath(ConfObject[]) <a href="#m-ConfPath-a9a205b72c41" id="m-ConfPath-a9a205b72c41"></a>

```java
public ConfPath(com.tailf.conf.ConfObject[] kp)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

Initializes a new instance of this class from a given
 reverted ConfObject[] keypath where elements
 is either `ConfTag` or
 `ConfKey`.

**Parameters**

- `com.tailf.conf.ConfObject[] kp` - reverted keypath

### ConfPath(ConfPath) <a href="#m-ConfPath-9ead5ec0063a" id="m-ConfPath-9ead5ec0063a"></a>

```java
public ConfPath(com.tailf.conf.ConfPath confPath)
```

Types: [ConfPath](ConfPath.md#cls-ConfPath)

**Parameters**

- `com.tailf.conf.ConfPath confPath`

### ConfPath(Maapi, int, ConfObject[]) <a href="#m-ConfPath-e3b5d7d947e2" id="m-ConfPath-e3b5d7d947e2"></a>

```java
public ConfPath(
    com.tailf.maapi.Maapi maapi,
    int tid,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi), [ConfObject](ConfObject.md#cls-ConfObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int tid`
- `com.tailf.conf.ConfObject[] kp`

### ConfPath(Maapi, int, String, Object[]) <a href="#m-ConfPath-517b4240f396" id="m-ConfPath-517b4240f396"></a>

```java
public ConfPath(
    com.tailf.maapi.Maapi maapi,
    int tid,
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int tid`
- `String fmt`
- `Object[] arguments`

### ConfPath(MountIdInterface, ConfObject[]) <a href="#m-ConfPath-ff4ee085d860" id="m-ConfPath-ff4ee085d860"></a>

```java
public ConfPath(com.tailf.conf.MountIdInterface mountIdCb, com.tailf.conf.ConfObject[] kp)
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface), [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.MountIdInterface mountIdCb`
- `com.tailf.conf.ConfObject[] kp`

### ConfPath(MountIdInterface, List<PathElement>) <a href="#m-ConfPath-c79fb5d41889" id="m-ConfPath-c79fb5d41889"></a>

```java
public ConfPath(
    com.tailf.conf.MountIdInterface mountGetter,
    java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl
)
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface), [PathElement](gen/PathParser/PathElement.md#cls-PathElement)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`
- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`

### ConfPath(MountIdInterface, String, Object[]) <a href="#m-ConfPath-8eb451dafe31" id="m-ConfPath-8eb451dafe31"></a>

```java
public ConfPath(
    com.tailf.conf.MountIdInterface mountIdCb,
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.MountIdInterface mountIdCb`
- `String fmt`
- `Object[] arguments`

### ConfPath(String, Object[]) <a href="#m-ConfPath-8a4fe6060eb3" id="m-ConfPath-8a4fe6060eb3"></a>

```java
public ConfPath(String fmt, Object[] arguments) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Construct a `ConfPath` from a string path representation
 and of optional arguments.


 The path is expressed as a format string
 that could contain fixed text
 with zero to many embedded format specifiers.


 For each specifier one argument in the variable argument list is
 expected.

 format specifiers in the Java API is:


- %d - requiring an integer parameter (type int) to be substituted.
- %s - requiring a java.lang.String parameter to be substituted.
- %x - requiring subclasses of type com.tailf.conf.ConfValue to be
 substituted.

**Parameters**

- `String fmt` - path string representation
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException`


## Methods

### append(String) <a href="#m-append-0469d86239bd" id="m-append-0469d86239bd"></a>

```java
public com.tailf.conf.ConfPath append(String s) throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#cls-ConfPath), [ConfException](ConfException.md#cls-ConfException)

Appends suffix path to existing keypath

**Parameters**

- `String s` - path to append

### append(String, List<CSNode>) <a href="#m-append-bad0f1c29427" id="m-append-bad0f1c29427"></a>

```java
public com.tailf.conf.ConfPath append(
    String s,
    java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> pathNodes
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#cls-ConfPath), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [ConfException](ConfException.md#cls-ConfException)

Appends suffix path to existing keypath

**Parameters**

- `String s` - path to append
- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> pathNodes` - sorted list of all `CSNode` objects
        contained in the resulting `ConfPath` object
        after appending s. This list is used as a cache to speedup
        `ConfPath` construction.

### chkDeferred() <a href="#m-chkDeferred-f66dc2317846" id="m-chkDeferred-f66dc2317846"></a>

```java
protected void chkDeferred()
```

### clone() <a href="#m-clone-164c86c45e9b" id="m-clone-164c86c45e9b"></a>

```java
public Object clone()
```

Clones the ConfPath

### copyAppend(String) <a href="#m-copyAppend-d79220720bf1" id="m-copyAppend-d79220720bf1"></a>

```java
public com.tailf.conf.ConfPath copyAppend(String s) throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#cls-ConfPath), [ConfException](ConfException.md#cls-ConfException)

CopyAppends to the keypath

**Parameters**

- `String s`

### copyPop() <a href="#m-copyPop-fcaa7a3deb75" id="m-copyPop-fcaa7a3deb75"></a>

```java
public com.tailf.conf.ConfPath copyPop() throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#cls-ConfPath), [ConfException](ConfException.md#cls-ConfException)

Creates a new ConfPath with the current path minus the last
 element including list keys.

### pop() <a href="#m-pop-1c15fa891a07" id="m-pop-1c15fa891a07"></a>

```java
public void pop() throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Pops the last element from the path including list keys.

### popConfObject(List<PathElement>) <a href="#m-popConfObject-12eef6108ea1" id="m-popConfObject-12eef6108ea1"></a>

```java
protected com.tailf.conf.ConfObject popConfObject(
    java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl
)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject), [PathElement](gen/PathParser/PathElement.md#cls-PathElement)

**Parameters**

- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Default String representation of this path, which is the keypath string
 representation

**Returns:** Default string representation

### toXPathString() <a href="#m-toXPathString-81906e391643" id="m-toXPathString-81906e391643"></a>

```java
public String toXPathString()
```

Returns this path as an XPath string

**Returns:** XPath string representation
