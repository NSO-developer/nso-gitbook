<a id="s-ConfPath"></a>
# ConfPath

```java
public class com.tailf.conf.ConfPath
    extends com.tailf.conf.InstancePath
```

Types: [InstancePath](InstancePath.md#s-InstancePath)

Class Representing an KeyPath path.


  String representations e.g `"/n:rootA/nodeB/listC{key1}/leafD"`
  User applications usually needs to construct string representations
  of paths in this way. To construct a `ConfPath` from this
  representation use [`ConfPath`](ConfPath.md#s-ConfPath)

**Related classes**

- [ConfCdbUpgradePath](ConfCdbUpgradePath.md#s-ConfCdbUpgradePath)

## Members

**Constructors**:

- [ConfPath()](#s-ConfPath-1)
- [ConfPath(Cdb, ConfObject[])](#s-ConfPath-2)
- [ConfPath(Cdb, String, Object[])](#s-ConfPath-3)
- [ConfPath(ConfEBinary)](#s-ConfPath-4)
- [ConfPath(ConfEList)](#s-ConfPath-5)
- [ConfPath(ConfObject[])](#s-ConfPath-6)
- [ConfPath(ConfPath)](#s-ConfPath-7)
- [ConfPath(Maapi, int, ConfObject[])](#s-ConfPath-8)
- [ConfPath(Maapi, int, String, Object[])](#s-ConfPath-9)
- [ConfPath(MountIdInterface, ConfObject[])](#s-ConfPath-10)
- [ConfPath(MountIdInterface, List<PathElement>)](#s-ConfPath-11)
- [ConfPath(MountIdInterface, String, Object[])](#s-ConfPath-12)
- [ConfPath(String, Object[])](#s-ConfPath-13)

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
- [append(String, List<CSNode>)](#s-append-1)
- [chkDeferred()](#s-chkDeferred)
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
- [pop()](#s-pop)
- [popConfObject(List<PathElement>)](#s-popConfObject)
- [quoteByteArray(byte[])](InstancePath.md#s-quoteByteArray) from InstancePath
- [quoteString(String, boolean)](InstancePath.md#s-quoteString) from InstancePath
- [setMountIdGetter(MountIdInterface)](InstancePath.md#s-setMountIdGetter) from InstancePath
- [toString()](#s-toString)
- [toXPathString()](#s-toXPathString)

## Constructors

<a id="s-ConfPath-1"></a>
### ConfPath()

```java
protected ConfPath()
```

<a id="s-ConfPath-2"></a>
### ConfPath(Cdb, ConfObject[])

```java
public ConfPath(com.tailf.cdb.Cdb cdb, com.tailf.conf.ConfObject[] kp)
```

Types: [Cdb](../cdb/Cdb.md#s-Cdb), [ConfObject](ConfObject.md#s-ConfObject)

**Parameters**

- `com.tailf.cdb.Cdb cdb`
- `com.tailf.conf.ConfObject[] kp`

<a id="s-ConfPath-3"></a>
### ConfPath(Cdb, String, Object[])

```java
public ConfPath(
    com.tailf.cdb.Cdb cdb,
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException
```

Types: [Cdb](../cdb/Cdb.md#s-Cdb), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.cdb.Cdb cdb`
- `String fmt`
- `Object[] arguments`

<a id="s-ConfPath-4"></a>
### ConfPath(ConfEBinary)

```java
public ConfPath(com.tailf.proto.ConfEBinary o) throws com.tailf.conf.ConfException
```

Types: [ConfEBinary](../proto/ConfEBinary.md#s-ConfEBinary), [ConfException](ConfException.md#s-ConfException)

Initialize a ConfPath.
 (*This constructor is rarely used for applications; usually
 for internal use*)

**Parameters**

- `com.tailf.proto.ConfEBinary o` - element constitute a `ConfPath`

**Throws**

- `ConfException`

<a id="s-ConfPath-5"></a>
### ConfPath(ConfEList)

```java
public ConfPath(com.tailf.proto.ConfEList o)
```

Types: [ConfEList](../proto/ConfEList.md#s-ConfEList)

Initialize a ConfPath.
 (*This constructor is rarely used for applications;
 usually for internal uses*)

**Parameters**

- `com.tailf.proto.ConfEList o` - element (reversed) constitute a `ConfPath`

<a id="s-ConfPath-6"></a>
### ConfPath(ConfObject[])

```java
public ConfPath(com.tailf.conf.ConfObject[] kp)
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

Initializes a new instance of this class from a given
 reverted ConfObject[] keypath where elements
 is either `ConfTag` or
 `ConfKey`.

**Parameters**

- `com.tailf.conf.ConfObject[] kp` - reverted keypath

<a id="s-ConfPath-7"></a>
### ConfPath(ConfPath)

```java
public ConfPath(com.tailf.conf.ConfPath confPath)
```

Types: [ConfPath](ConfPath.md#s-ConfPath)

**Parameters**

- `com.tailf.conf.ConfPath confPath`

<a id="s-ConfPath-8"></a>
### ConfPath(Maapi, int, ConfObject[])

```java
public ConfPath(
    com.tailf.maapi.Maapi maapi,
    int tid,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../maapi/Maapi.md#s-Maapi), [ConfObject](ConfObject.md#s-ConfObject), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int tid`
- `com.tailf.conf.ConfObject[] kp`

<a id="s-ConfPath-9"></a>
### ConfPath(Maapi, int, String, Object[])

```java
public ConfPath(
    com.tailf.maapi.Maapi maapi,
    int tid,
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../maapi/Maapi.md#s-Maapi), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int tid`
- `String fmt`
- `Object[] arguments`

<a id="s-ConfPath-10"></a>
### ConfPath(MountIdInterface, ConfObject[])

```java
public ConfPath(com.tailf.conf.MountIdInterface mountIdCb, com.tailf.conf.ConfObject[] kp)
```

Types: [MountIdInterface](MountIdInterface.md#s-MountIdInterface), [ConfObject](ConfObject.md#s-ConfObject)

**Parameters**

- `com.tailf.conf.MountIdInterface mountIdCb`
- `com.tailf.conf.ConfObject[] kp`

<a id="s-ConfPath-11"></a>
### ConfPath(MountIdInterface, List<PathElement>)

```java
public ConfPath(
    com.tailf.conf.MountIdInterface mountGetter,
    java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl
)
```

Types: [MountIdInterface](MountIdInterface.md#s-MountIdInterface), [PathElement](gen/PathParser/PathElement.md#s-PathElement)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`
- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`

<a id="s-ConfPath-12"></a>
### ConfPath(MountIdInterface, String, Object[])

```java
public ConfPath(
    com.tailf.conf.MountIdInterface mountIdCb,
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException
```

Types: [MountIdInterface](MountIdInterface.md#s-MountIdInterface), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.MountIdInterface mountIdCb`
- `String fmt`
- `Object[] arguments`

<a id="s-ConfPath-13"></a>
### ConfPath(String, Object[])

```java
public ConfPath(String fmt, Object[] arguments) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

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

<a id="s-append"></a>
### append(String)

```java
public com.tailf.conf.ConfPath append(String s) throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#s-ConfPath), [ConfException](ConfException.md#s-ConfException)

Appends suffix path to existing keypath

**Parameters**

- `String s` - path to append

<a id="s-append-1"></a>
### append(String, List<CSNode>)

```java
public com.tailf.conf.ConfPath append(
    String s,
    java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> pathNodes
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#s-ConfPath), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [ConfException](ConfException.md#s-ConfException)

Appends suffix path to existing keypath

**Parameters**

- `String s` - path to append
- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> pathNodes` - sorted list of all `CSNode` objects
        contained in the resulting `ConfPath` object
        after appending s. This list is used as a cache to speedup
        `ConfPath` construction.

<a id="s-chkDeferred"></a>
### chkDeferred()

```java
protected void chkDeferred()
```

<a id="s-clone"></a>
### clone()

```java
public Object clone()
```

Clones the ConfPath

<a id="s-copyAppend"></a>
### copyAppend(String)

```java
public com.tailf.conf.ConfPath copyAppend(String s) throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#s-ConfPath), [ConfException](ConfException.md#s-ConfException)

CopyAppends to the keypath

**Parameters**

- `String s`

<a id="s-copyPop"></a>
### copyPop()

```java
public com.tailf.conf.ConfPath copyPop() throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#s-ConfPath), [ConfException](ConfException.md#s-ConfException)

Creates a new ConfPath with the current path minus the last
 element including list keys.

<a id="s-pop"></a>
### pop()

```java
public void pop() throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Pops the last element from the path including list keys.

<a id="s-popConfObject"></a>
### popConfObject(List<PathElement>)

```java
protected com.tailf.conf.ConfObject popConfObject(
    java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl
)
```

Types: [ConfObject](ConfObject.md#s-ConfObject), [PathElement](gen/PathParser/PathElement.md#s-PathElement)

**Parameters**

- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Default String representation of this path, which is the keypath string
 representation

**Returns:** Default string representation

<a id="s-toXPathString"></a>
### toXPathString()

```java
public String toXPathString()
```

Returns this path as an XPath string

**Returns:** XPath string representation
