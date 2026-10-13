# ConfPath <a href="#confpath-327831c6fc7d" id="confpath-327831c6fc7d"></a>

```java
public class com.tailf.conf.ConfPath
    extends com.tailf.conf.InstancePath
```

Types: [InstancePath](InstancePath.md#instancepath-7694a1545db3)

Class Representing an KeyPath path.


  String representations e.g `"/n:rootA/nodeB/listC{key1}/leafD"`
  User applications usually needs to construct string representations
  of paths in this way. To construct a `ConfPath` from this
  representation use [`ConfPath(String, Object...)`](ConfPath.md#confpath-8a4fe6060eb3)

**Related classes**

- [ConfCdbUpgradePath](ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5)

## Members

**Constructors**:

- [ConfPath\(\)](#confpath-7f970cc77a26)
- [ConfPath\(Cdb, ConfObject\[\]\)](#confpath-4b73430ece5c)
- [ConfPath\(Cdb, String, Object\[\]\)](#confpath-f2399b19143b)
- [ConfPath\(ConfEBinary\)](#confpath-9dfd225c2ca2)
- [ConfPath\(ConfEList\)](#confpath-f04d38a4d2b2)
- [ConfPath\(ConfObject\[\]\)](#confpath-a9a205b72c41)
- [ConfPath\(ConfPath\)](#confpath-9ead5ec0063a)
- [ConfPath\(Maapi, int, ConfObject\[\]\)](#confpath-e3b5d7d947e2)
- [ConfPath\(Maapi, int, String, Object\[\]\)](#confpath-517b4240f396)
- [ConfPath\(MountIdInterface, ConfObject\[\]\)](#confpath-ff4ee085d860)
- [ConfPath\(MountIdInterface, List\<PathElement\>\)](#confpath-c79fb5d41889)
- [ConfPath\(MountIdInterface, String, Object\[\]\)](#confpath-8eb451dafe31)
- [ConfPath\(String, Object\[\]\)](#confpath-8a4fe6060eb3)

**Fields**:

- [arguments](InstancePath.md#arguments-28ffa3c54d2c) from InstancePath
- [deferred](InstancePath.md#deferred-c2f16a111685) from InstancePath
- [fmt](InstancePath.md#fmt-94d3250bd2b9) from InstancePath
- [hasSchema](InstancePath.md#hasschema-a8c91f825ecf) from InstancePath
- [isRel](InstancePath.md#isrel-6f5c045b2036) from InstancePath
- [latestMountId](InstancePath.md#latestmountid-7642d01fb3f1) from InstancePath
- [mountGetter](InstancePath.md#mountgetter-a3d01f18a1ec) from InstancePath
- [pl](InstancePath.md#pl-952ffda3e648) from InstancePath

**Methods**:

- [append\(String\)](#append-0469d86239bd)
- [append\(String, List\<CSNode\>\)](#append-bad0f1c29427)
- [chkDeferred\(\)](#chkdeferred-f66dc2317846)
- [clone\(\)](#clone-164c86c45e9b)
- [convertToConfKey\(StringBuilder, List\<PathElement\>, ConfTag, ConfTag, ArrayList\<PathKey\>, boolean\)](InstancePath.md#converttoconfkey-709808909e1b) from InstancePath
- [convertToConfKey\(StringBuilder, List\<PathElement\>, ConfTag, ConfTag, List\<PathKey\>, boolean, boolean\)](InstancePath.md#converttoconfkey-3964b2d32ca6) from InstancePath
- [copyAppend\(String\)](#copyappend-d79220720bf1)
- [copyPop\(\)](#copypop-fcaa7a3deb75)
- [encode\(\)](InstancePath.md#encode-fbae522bba37) from InstancePath
- [encodeIKP\(\)](InstancePath.md#encodeikp-b160b87f6433) from InstancePath
- [equals\(Object\)](InstancePath.md#equals-fcd6492e0d6c) from InstancePath
- [getCSNode\(\)](InstancePath.md#getcsnode-cf7a085aa7f5) from InstancePath
- [getKP\(\)](InstancePath.md#getkp-45b2f95adae4) from InstancePath
- [getKP\(List\<PathElement\>, boolean, boolean, MountIdInterface\)](InstancePath.md#getkp-a23f67046fb4) from InstancePath
- [getLatestMountId\(\)](InstancePath.md#getlatestmountid-30c9c1f692c7) from InstancePath
- [getMountIdGetter\(\)](InstancePath.md#getmountidgetter-64fcfdb6be8c) from InstancePath
- [hashCode\(\)](InstancePath.md#hashcode-ef797a217903) from InstancePath
- [isKey\(\)](InstancePath.md#iskey-7bdf17ac8255) from InstancePath
- [isParsingDeferred\(\)](InstancePath.md#isparsingdeferred-b3b266536326) from InstancePath
- [isRel\(\)](InstancePath.md#isrel-dca98ac4de7a) from InstancePath
- [makeKP\(ConfObject\[\]\)](InstancePath.md#makekp-32258da68c76) from InstancePath
- [parseAppend\(String, Object\[\]\)](InstancePath.md#parseappend-54d8f4d7c8da) from InstancePath
- [parseAppend\(String, Object\[\], List\<CSNode\>\)](InstancePath.md#parseappend-6e40353c0959) from InstancePath
- [pop\(\)](#pop-1c15fa891a07)
- [popConfObject\(List\<PathElement\>\)](#popconfobject-12eef6108ea1)
- [quoteByteArray\(byte\[\]\)](InstancePath.md#quotebytearray-1889d341fdce) from InstancePath
- [quoteString\(String, boolean\)](InstancePath.md#quotestring-2ccae847ff76) from InstancePath
- [setMountIdGetter\(MountIdInterface\)](InstancePath.md#setmountidgetter-900228f8453c) from InstancePath
- [toString\(\)](#tostring-e9d48c5503ef)
- [toXPathString\(\)](#toxpathstring-81906e391643)

## Constructors

### ConfPath() <a href="#confpath-7f970cc77a26" id="confpath-7f970cc77a26"></a>

```java
protected ConfPath()
```

### ConfPath(Cdb, ConfObject[]) <a href="#confpath-4b73430ece5c" id="confpath-4b73430ece5c"></a>

```java
public ConfPath(com.tailf.cdb.Cdb cdb, com.tailf.conf.ConfObject[] kp)
```

Types: [Cdb](../cdb/Cdb.md#cdb-cb7fc41768c9), [ConfObject](ConfObject.md#confobject-5433616953b2)

**Parameters**

- `com.tailf.cdb.Cdb cdb`
- `com.tailf.conf.ConfObject[] kp`

### ConfPath(Cdb, String, Object[]) <a href="#confpath-f2399b19143b" id="confpath-f2399b19143b"></a>

```java
public ConfPath(
    com.tailf.cdb.Cdb cdb,
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException
```

Types: [Cdb](../cdb/Cdb.md#cdb-cb7fc41768c9), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.cdb.Cdb cdb`
- `String fmt`
- `Object[] arguments`

### ConfPath(ConfEBinary) <a href="#confpath-9dfd225c2ca2" id="confpath-9dfd225c2ca2"></a>

```java
public ConfPath(com.tailf.proto.ConfEBinary o) throws com.tailf.conf.ConfException
```

Types: [ConfEBinary](../proto/ConfEBinary.md#confebinary-57adaf095772), [ConfException](ConfException.md#confexception-baeaab99f7f9)

Initialize a ConfPath.
 (*This constructor is rarely used for applications; usually
 for internal use*)

**Parameters**

- `com.tailf.proto.ConfEBinary o` - element constitute a `ConfPath`

**Throws**

- `ConfException`

### ConfPath(ConfEList) <a href="#confpath-f04d38a4d2b2" id="confpath-f04d38a4d2b2"></a>

```java
public ConfPath(com.tailf.proto.ConfEList o)
```

Types: [ConfEList](../proto/ConfEList.md#confelist-78fa4ba3b3a8)

Initialize a ConfPath.
 (*This constructor is rarely used for applications;
 usually for internal uses*)

**Parameters**

- `com.tailf.proto.ConfEList o` - element (reversed) constitute a `ConfPath`

### ConfPath(ConfObject[]) <a href="#confpath-a9a205b72c41" id="confpath-a9a205b72c41"></a>

```java
public ConfPath(com.tailf.conf.ConfObject[] kp)
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)

Initializes a new instance of this class from a given
 reverted ConfObject[] keypath where elements
 is either `ConfTag` or
 `ConfKey`.

**Parameters**

- `com.tailf.conf.ConfObject[] kp` - reverted keypath

### ConfPath(ConfPath) <a href="#confpath-9ead5ec0063a" id="confpath-9ead5ec0063a"></a>

```java
public ConfPath(com.tailf.conf.ConfPath confPath)
```

Types: [ConfPath](ConfPath.md#confpath-327831c6fc7d)

**Parameters**

- `com.tailf.conf.ConfPath confPath`

### ConfPath(Maapi, int, ConfObject[]) <a href="#confpath-e3b5d7d947e2" id="confpath-e3b5d7d947e2"></a>

```java
public ConfPath(
    com.tailf.maapi.Maapi maapi,
    int tid,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../maapi/Maapi.md#maapi-67bcbe89c42e), [ConfObject](ConfObject.md#confobject-5433616953b2), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int tid`
- `com.tailf.conf.ConfObject[] kp`

### ConfPath(Maapi, int, String, Object[]) <a href="#confpath-517b4240f396" id="confpath-517b4240f396"></a>

```java
public ConfPath(
    com.tailf.maapi.Maapi maapi,
    int tid,
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../maapi/Maapi.md#maapi-67bcbe89c42e), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int tid`
- `String fmt`
- `Object[] arguments`

### ConfPath(MountIdInterface, ConfObject[]) <a href="#confpath-ff4ee085d860" id="confpath-ff4ee085d860"></a>

```java
public ConfPath(com.tailf.conf.MountIdInterface mountIdCb, com.tailf.conf.ConfObject[] kp)
```

Types: [MountIdInterface](MountIdInterface.md#mountidinterface-113d1b54dae0), [ConfObject](ConfObject.md#confobject-5433616953b2)

**Parameters**

- `com.tailf.conf.MountIdInterface mountIdCb`
- `com.tailf.conf.ConfObject[] kp`

### ConfPath(MountIdInterface, List&lt;PathElement&gt;) <a href="#confpath-c79fb5d41889" id="confpath-c79fb5d41889"></a>

```java
public ConfPath(
    com.tailf.conf.MountIdInterface mountGetter,
    java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl
)
```

Types: [MountIdInterface](MountIdInterface.md#mountidinterface-113d1b54dae0), [PathElement](gen/PathParser/PathElement.md#pathelement-30082145995b)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`
- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`

### ConfPath(MountIdInterface, String, Object[]) <a href="#confpath-8eb451dafe31" id="confpath-8eb451dafe31"></a>

```java
public ConfPath(
    com.tailf.conf.MountIdInterface mountIdCb,
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException
```

Types: [MountIdInterface](MountIdInterface.md#mountidinterface-113d1b54dae0), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.MountIdInterface mountIdCb`
- `String fmt`
- `Object[] arguments`

### ConfPath(String, Object[]) <a href="#confpath-8a4fe6060eb3" id="confpath-8a4fe6060eb3"></a>

```java
public ConfPath(String fmt, Object[] arguments) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

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

### append(String) <a href="#append-0469d86239bd" id="append-0469d86239bd"></a>

```java
public com.tailf.conf.ConfPath append(String s) throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#confpath-327831c6fc7d), [ConfException](ConfException.md#confexception-baeaab99f7f9)

Appends suffix path to existing keypath

**Parameters**

- `String s` - path to append

### append(String, List&lt;CSNode&gt;) <a href="#append-bad0f1c29427" id="append-bad0f1c29427"></a>

```java
public com.tailf.conf.ConfPath append(
    String s,
    java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> pathNodes
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#confpath-327831c6fc7d), [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [ConfException](ConfException.md#confexception-baeaab99f7f9)

Appends suffix path to existing keypath

**Parameters**

- `String s` - path to append
- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> pathNodes` - sorted list of all `CSNode` objects
        contained in the resulting `ConfPath` object
        after appending s. This list is used as a cache to speedup
        `ConfPath` construction.

### chkDeferred() <a href="#chkdeferred-f66dc2317846" id="chkdeferred-f66dc2317846"></a>

```java
protected void chkDeferred()
```

### clone() <a href="#clone-164c86c45e9b" id="clone-164c86c45e9b"></a>

```java
public Object clone()
```

Clones the ConfPath

### copyAppend(String) <a href="#copyappend-d79220720bf1" id="copyappend-d79220720bf1"></a>

```java
public com.tailf.conf.ConfPath copyAppend(String s) throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#confpath-327831c6fc7d), [ConfException](ConfException.md#confexception-baeaab99f7f9)

CopyAppends to the keypath

**Parameters**

- `String s`

### copyPop() <a href="#copypop-fcaa7a3deb75" id="copypop-fcaa7a3deb75"></a>

```java
public com.tailf.conf.ConfPath copyPop() throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#confpath-327831c6fc7d), [ConfException](ConfException.md#confexception-baeaab99f7f9)

Creates a new ConfPath with the current path minus the last
 element including list keys.

### pop() <a href="#pop-1c15fa891a07" id="pop-1c15fa891a07"></a>

```java
public void pop() throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Pops the last element from the path including list keys.

### popConfObject(List&lt;PathElement&gt;) <a href="#popconfobject-12eef6108ea1" id="popconfobject-12eef6108ea1"></a>

```java
protected com.tailf.conf.ConfObject popConfObject(
    java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl
)
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2), [PathElement](gen/PathParser/PathElement.md#pathelement-30082145995b)

**Parameters**

- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Default String representation of this path, which is the keypath string
 representation

**Returns:** Default string representation

### toXPathString() <a href="#toxpathstring-81906e391643" id="toxpathstring-81906e391643"></a>

```java
public String toXPathString()
```

Returns this path as an XPath string

**Returns:** XPath string representation
