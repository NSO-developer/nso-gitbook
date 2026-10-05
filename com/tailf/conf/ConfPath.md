<a id="cls-ConfPath"></a>
# ConfPath

```java
public class com.tailf.conf.ConfPath
    extends com.tailf.conf.InstancePath
```

Types: [InstancePath](InstancePath.md#cls-InstancePath)

Class Representing an KeyPath path.


  String representations e.g `"/n:rootA/nodeB/listC{key1}/leafD"`
  User applications usually needs to construct string representations
  of paths in this way. To construct a `ConfPath` from this
  representation use [`ConfPath#ConfPath(String, Object...)`](ConfPath.md#m-confpath-8a4fe6060eb3)

**Related classes**

- [ConfCdbUpgradePath](ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath)

## Members

**Constructors**:

- [ConfPath()](#m-confpath-7f970cc77a26)
- [ConfPath(Cdb, ConfObject[])](#m-confpath-4b73430ece5c)
- [ConfPath(Cdb, String, Object[])](#m-confpath-f2399b19143b)
- [ConfPath(ConfEBinary)](#m-confpath-9dfd225c2ca2)
- [ConfPath(ConfEList)](#m-confpath-f04d38a4d2b2)
- [ConfPath(ConfObject[])](#m-confpath-a9a205b72c41)
- [ConfPath(ConfPath)](#m-confpath-9ead5ec0063a)
- [ConfPath(Maapi, int, ConfObject[])](#m-confpath-e3b5d7d947e2)
- [ConfPath(Maapi, int, String, Object[])](#m-confpath-517b4240f396)
- [ConfPath(MountIdInterface, ConfObject[])](#m-confpath-ff4ee085d860)
- [ConfPath(MountIdInterface, List<PathElement>)](#m-confpath-c79fb5d41889)
- [ConfPath(MountIdInterface, String, Object[])](#m-confpath-8eb451dafe31)
- [ConfPath(String, Object[])](#m-confpath-8a4fe6060eb3)

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
- [chkDeferred()](#m-chkdeferred-f66dc2317846)
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
- [pop()](#m-pop-1c15fa891a07)
- [popConfObject(List<PathElement>)](#m-popconfobject-12eef6108ea1)
- [quoteByteArray(byte[])](InstancePath.md#m-quotebytearray-1889d341fdce) from InstancePath
- [quoteString(String, boolean)](InstancePath.md#m-quotestring-2ccae847ff76) from InstancePath
- [setMountIdGetter(MountIdInterface)](InstancePath.md#m-setmountidgetter-900228f8453c) from InstancePath
- [toString()](#m-tostring-e9d48c5503ef)
- [toXPathString()](#m-toxpathstring-81906e391643)

## Constructors

<a id="m-confpath-7f970cc77a26"></a>
### ConfPath()

```java
protected ConfPath()
```

<a id="m-confpath-4b73430ece5c"></a>
### ConfPath(Cdb, ConfObject[])

```java
public ConfPath(com.tailf.cdb.Cdb cdb, com.tailf.conf.ConfObject[] kp)
```

Types: [Cdb](../cdb/Cdb.md#cls-Cdb), [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.cdb.Cdb cdb`
- `com.tailf.conf.ConfObject[] kp`

<a id="m-confpath-f2399b19143b"></a>
### ConfPath(Cdb, String, Object[])

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

<a id="m-confpath-9dfd225c2ca2"></a>
### ConfPath(ConfEBinary)

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

<a id="m-confpath-f04d38a4d2b2"></a>
### ConfPath(ConfEList)

```java
public ConfPath(com.tailf.proto.ConfEList o)
```

Types: [ConfEList](../proto/ConfEList.md#cls-ConfEList)

Initialize a ConfPath.
 (*This constructor is rarely used for applications;
 usually for internal uses*)

**Parameters**

- `com.tailf.proto.ConfEList o` - element (reversed) constitute a `ConfPath`

<a id="m-confpath-a9a205b72c41"></a>
### ConfPath(ConfObject[])

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

<a id="m-confpath-9ead5ec0063a"></a>
### ConfPath(ConfPath)

```java
public ConfPath(com.tailf.conf.ConfPath confPath)
```

Types: [ConfPath](ConfPath.md#cls-ConfPath)

**Parameters**

- `com.tailf.conf.ConfPath confPath`

<a id="m-confpath-e3b5d7d947e2"></a>
### ConfPath(Maapi, int, ConfObject[])

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

<a id="m-confpath-517b4240f396"></a>
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

Types: [Maapi](../maapi/Maapi.md#cls-Maapi), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int tid`
- `String fmt`
- `Object[] arguments`

<a id="m-confpath-ff4ee085d860"></a>
### ConfPath(MountIdInterface, ConfObject[])

```java
public ConfPath(com.tailf.conf.MountIdInterface mountIdCb, com.tailf.conf.ConfObject[] kp)
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface), [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.MountIdInterface mountIdCb`
- `com.tailf.conf.ConfObject[] kp`

<a id="m-confpath-c79fb5d41889"></a>
### ConfPath(MountIdInterface, List<PathElement>)

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

<a id="m-confpath-8eb451dafe31"></a>
### ConfPath(MountIdInterface, String, Object[])

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

<a id="m-confpath-8a4fe6060eb3"></a>
### ConfPath(String, Object[])

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

<a id="m-append-0469d86239bd"></a>
### append(String)

```java
public com.tailf.conf.ConfPath append(String s) throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#cls-ConfPath), [ConfException](ConfException.md#cls-ConfException)

Appends suffix path to existing keypath

**Parameters**

- `String s` - path to append

<a id="m-append-bad0f1c29427"></a>
### append(String, List<CSNode>)

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

<a id="m-chkdeferred-f66dc2317846"></a>
### chkDeferred()

```java
protected void chkDeferred()
```

<a id="m-clone-164c86c45e9b"></a>
### clone()

```java
public Object clone()
```

Clones the ConfPath

<a id="m-copyappend-d79220720bf1"></a>
### copyAppend(String)

```java
public com.tailf.conf.ConfPath copyAppend(String s) throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#cls-ConfPath), [ConfException](ConfException.md#cls-ConfException)

CopyAppends to the keypath

**Parameters**

- `String s`

<a id="m-copypop-fcaa7a3deb75"></a>
### copyPop()

```java
public com.tailf.conf.ConfPath copyPop() throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#cls-ConfPath), [ConfException](ConfException.md#cls-ConfException)

Creates a new ConfPath with the current path minus the last
 element including list keys.

<a id="m-pop-1c15fa891a07"></a>
### pop()

```java
public void pop() throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Pops the last element from the path including list keys.

<a id="m-popconfobject-12eef6108ea1"></a>
### popConfObject(List<PathElement>)

```java
protected com.tailf.conf.ConfObject popConfObject(
    java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl
)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject), [PathElement](gen/PathParser/PathElement.md#cls-PathElement)

**Parameters**

- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Default String representation of this path, which is the keypath string
 representation

**Returns:** Default string representation

<a id="m-toxpathstring-81906e391643"></a>
### toXPathString()

```java
public String toXPathString()
```

Returns this path as an XPath string

**Returns:** XPath string representation
