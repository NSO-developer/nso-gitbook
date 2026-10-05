# InstancePath <a href="#instancepath-7694a1545db3" id="instancepath-7694a1545db3"></a>

```java
public abstract class com.tailf.conf.InstancePath
```

Class Representing an path. A Path can be either a schema path
 or an instance path. A schema path points to an element in the
 model while an instance path points to an element in the
 instantiated model.


 The difference is that in the instance tree both elements and
 data values are needed to point out a instance element.


 There are several ways to represent a path which are supported by
 this class. The two most important being as a String or as a array of
 [`ConfTag`](ConfTag.md#conftag-73757b87bc93)/[`ConfKey`](ConfKey.md#confkey-e4e1ca98e867) values.


- Instance of [`ConfEList`](../proto/ConfEList.md#confelist-78fa4ba3b3a8) - Applications usually does
 not have to deal with paths that are instances of `ConfEList`.
 Constructors that have this type is usually for internal use:
 [`InstancePath(ConfEBinary)`](InstancePath.md#instancepath-e673bc5f9e5a),[`InstancePath(ConfEList)`](InstancePath.md#instancepath-5f1d4144a5af),
 [`InstancePath(ConfObject[])`](InstancePath.md#instancepath-578db36acd1b)
- Reverted array of [`ConfObject`](ConfObject.md#confobject-5433616953b2) `ConfObject[]`
 where each element is either
 of the type [`ConfTag`](ConfTag.md#conftag-73757b87bc93) or [`ConfKey`](ConfKey.md#confkey-e4e1ca98e867). To determine which type
 a `instanceof` test is required. Usually the application
 need to deal with this representations in different callback
 implementations and it is always reverted. The library
 invokes the user defined callbacks with this type of representation as
 one of the parameters.

 Application is seldom required to construct such arrays.

**Related classes**

- [ConfPath](ConfPath.md#confpath-327831c6fc7d)
- [ConfXPath](ConfXPath.md#confxpath-0180bbe0b500)

## Members

**Constructors**:

- [InstancePath(ConfEBinary)](#instancepath-e673bc5f9e5a)
- [InstancePath(ConfEList)](#instancepath-5f1d4144a5af)
- [InstancePath(ConfObject[])](#instancepath-578db36acd1b)
- [InstancePath(MountIdInterface)](#instancepath-c47f9e227234)
- [InstancePath(MountIdInterface, ConfObject[])](#instancepath-2505c812ffbf)
- [InstancePath(MountIdInterface, List<PathElement>)](#instancepath-81d41046b20c)
- [InstancePath(MountIdInterface, String, Object[])](#instancepath-01c8746248ca)
- [InstancePath(String, Object[])](#instancepath-f1811b7c9fb8)

**Fields**:

- [arguments](#arguments-28ffa3c54d2c)
- [deferred](#deferred-c2f16a111685)
- [fmt](#fmt-94d3250bd2b9)
- [hasSchema](#hasschema-a8c91f825ecf)
- [isRel](#isrel-6f5c045b2036)
- [latestMountId](#latestmountid-7642d01fb3f1)
- [mountGetter](#mountgetter-a3d01f18a1ec)
- [pl](#pl-952ffda3e648)

**Methods**:

- [chkDeferred()](#chkdeferred-f66dc2317846)
- [convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, ArrayList<PathKey>, boolean)](#converttoconfkey-709808909e1b)
- [convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, List<PathKey>, boolean, boolean)](#converttoconfkey-3964b2d32ca6)
- [encode()](#encode-fbae522bba37)
- [encodeIKP()](#encodeikp-b160b87f6433)
- [equals(Object)](#equals-fcd6492e0d6c)
- [getCSNode()](#getcsnode-cf7a085aa7f5)
- [getKP()](#getkp-45b2f95adae4)
- [getKP(List<PathElement>, boolean, boolean, MountIdInterface)](#getkp-a23f67046fb4)
- [getLatestMountId()](#getlatestmountid-30c9c1f692c7)
- [getMountIdGetter()](#getmountidgetter-64fcfdb6be8c)
- [hashCode()](#hashcode-ef797a217903)
- [isKey()](#iskey-7bdf17ac8255)
- [isParsingDeferred()](#isparsingdeferred-b3b266536326)
- [isRel()](#isrel-dca98ac4de7a)
- [makeKP(ConfObject[])](#makekp-32258da68c76)
- [parseAppend(String, Object[])](#parseappend-54d8f4d7c8da)
- [parseAppend(String, Object[], List<CSNode>)](#parseappend-6e40353c0959)
- [quoteByteArray(byte[])](#quotebytearray-1889d341fdce)
- [quoteString(String, boolean)](#quotestring-2ccae847ff76)
- [setMountIdGetter(MountIdInterface)](#setmountidgetter-900228f8453c)
- [toString()](#tostring-e9d48c5503ef)
- [toXPathString()](#toxpathstring-81906e391643)

**Nested Types**:

- [OrdinalKey](InstancePath/OrdinalKey.md#ordinalkey-366c6ce27fe2)

## Constructors

### InstancePath(ConfEBinary) <a href="#instancepath-e673bc5f9e5a" id="instancepath-e673bc5f9e5a"></a>

```java
public InstancePath(com.tailf.proto.ConfEBinary o) throws com.tailf.conf.ConfException
```

Types: [ConfEBinary](../proto/ConfEBinary.md#confebinary-57adaf095772), [ConfException](ConfException.md#confexception-baeaab99f7f9)

Initialize a InstancePath.
 (*This constructor is rarely used for applications; usually
 for internal use*)

**Parameters**

- `com.tailf.proto.ConfEBinary o` - element constitute a `InstancePath`

**Throws**

- `ConfException`

### InstancePath(ConfEList) <a href="#instancepath-5f1d4144a5af" id="instancepath-5f1d4144a5af"></a>

```java
public InstancePath(com.tailf.proto.ConfEList o)
```

Types: [ConfEList](../proto/ConfEList.md#confelist-78fa4ba3b3a8)

Initialize a InstancePath.
 (*This constructor is rarely used for applications;
 usually for internal uses*)

**Parameters**

- `com.tailf.proto.ConfEList o` - element (reversed) constitute a `InstancePath`

### InstancePath(ConfObject[]) <a href="#instancepath-578db36acd1b" id="instancepath-578db36acd1b"></a>

```java
public InstancePath(com.tailf.conf.ConfObject[] kp)
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)

Initializes a new instance of this class from a given
 reverted ConfObject[] keypath where elements
 is either `ConfTag` or
 `ConfKey`.

**Parameters**

- `com.tailf.conf.ConfObject[] kp` - reverted keypath

### InstancePath(MountIdInterface) <a href="#instancepath-c47f9e227234" id="instancepath-c47f9e227234"></a>

```java
protected InstancePath(com.tailf.conf.MountIdInterface mountGetter)
```

Types: [MountIdInterface](MountIdInterface.md#mountidinterface-113d1b54dae0)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`

### InstancePath(MountIdInterface, ConfObject[]) <a href="#instancepath-2505c812ffbf" id="instancepath-2505c812ffbf"></a>

```java
public InstancePath(com.tailf.conf.MountIdInterface mountGetter, com.tailf.conf.ConfObject[] kp)
```

Types: [MountIdInterface](MountIdInterface.md#mountidinterface-113d1b54dae0), [ConfObject](ConfObject.md#confobject-5433616953b2)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`
- `com.tailf.conf.ConfObject[] kp`

### InstancePath(MountIdInterface, List&lt;PathElement&gt;) <a href="#instancepath-81d41046b20c" id="instancepath-81d41046b20c"></a>

```java
protected InstancePath(
    com.tailf.conf.MountIdInterface mountGetter,
    java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl
)
```

Types: [MountIdInterface](MountIdInterface.md#mountidinterface-113d1b54dae0), [PathElement](gen/PathParser/PathElement.md#pathelement-30082145995b)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`
- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`

### InstancePath(MountIdInterface, String, Object[]) <a href="#instancepath-01c8746248ca" id="instancepath-01c8746248ca"></a>

```java
protected InstancePath(
    com.tailf.conf.MountIdInterface mountGetter,
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException
```

Types: [MountIdInterface](MountIdInterface.md#mountidinterface-113d1b54dae0), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`
- `String fmt`
- `Object[] arguments`

### InstancePath(String, Object[]) <a href="#instancepath-f1811b7c9fb8" id="instancepath-f1811b7c9fb8"></a>

```java
protected InstancePath(String fmt, Object[] arguments) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Construct a `InstancePath` from a string path representation
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


## Fields

### arguments <a href="#arguments-28ffa3c54d2c" id="arguments-28ffa3c54d2c"></a>

```java
protected Object[] arguments = null;
```

### deferred <a href="#deferred-c2f16a111685" id="deferred-c2f16a111685"></a>

```java
protected boolean deferred = null;
```

### fmt <a href="#fmt-94d3250bd2b9" id="fmt-94d3250bd2b9"></a>

```java
protected String fmt = null;
```

### hasSchema <a href="#hasschema-a8c91f825ecf" id="hasschema-a8c91f825ecf"></a>

```java
protected boolean hasSchema = null;
```

### isRel <a href="#isrel-6f5c045b2036" id="isrel-6f5c045b2036"></a>

```java
protected boolean isRel = null;
```

### latestMountId <a href="#latestmountid-7642d01fb3f1" id="latestmountid-7642d01fb3f1"></a>

```java
protected java.util.List<String> latestMountId = null;
```

### mountGetter <a href="#mountgetter-a3d01f18a1ec" id="mountgetter-a3d01f18a1ec"></a>

```java
protected com.tailf.conf.MountIdInterface mountGetter = null;
```

Types: [MountIdInterface](MountIdInterface.md#mountidinterface-113d1b54dae0)

### pl <a href="#pl-952ffda3e648" id="pl-952ffda3e648"></a>

```java
protected java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl = null;
```

Types: [PathElement](gen/PathParser/PathElement.md#pathelement-30082145995b)


## Methods

### chkDeferred() <a href="#chkdeferred-f66dc2317846" id="chkdeferred-f66dc2317846"></a>

```java
protected abstract void chkDeferred()
```

### convertToConfKey(StringBuilder, List&lt;PathElement&gt;, ConfTag, ConfTag, ArrayList&lt;PathKey&gt;, boolean) <a href="#converttoconfkey-709808909e1b" id="converttoconfkey-709808909e1b"></a>

```java
protected com.tailf.conf.ConfKey convertToConfKey(
    StringBuilder currentPath,
    java.util.List<com.tailf.conf.gen.PathParser.PathElement> currentPl,
    com.tailf.conf.ConfTag root,
    com.tailf.conf.ConfTag current,
    java.util.ArrayList<com.tailf.conf.gen.PathParser.PathKey> keys,
    boolean displayFormatted
)
    throws com.tailf.conf.ConfException
```

Types: [ConfKey](ConfKey.md#confkey-e4e1ca98e867), [PathElement](gen/PathParser/PathElement.md#pathelement-30082145995b), [ConfTag](ConfTag.md#conftag-73757b87bc93), [PathKey](gen/PathParser/PathKey.md#pathkey-a9b70d1850aa), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `StringBuilder currentPath`
- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> currentPl`
- `com.tailf.conf.ConfTag root`
- `com.tailf.conf.ConfTag current`
- `java.util.ArrayList<com.tailf.conf.gen.PathParser.PathKey> keys`
- `boolean displayFormatted`

### convertToConfKey(StringBuilder, List&lt;PathElement&gt;, ConfTag, ConfTag, List&lt;PathKey&gt;, boolean, boolean) <a href="#converttoconfkey-3964b2d32ca6" id="converttoconfkey-3964b2d32ca6"></a>

```java
protected com.tailf.conf.ConfKey convertToConfKey(
    StringBuilder currentPath,
    java.util.List<com.tailf.conf.gen.PathParser.PathElement> currentPl,
    com.tailf.conf.ConfTag root,
    com.tailf.conf.ConfTag current,
    java.util.List<com.tailf.conf.gen.PathParser.PathKey> keys,
    boolean displayFormatted,
    boolean createPsuedoKey
)
    throws com.tailf.conf.ConfException
```

Types: [ConfKey](ConfKey.md#confkey-e4e1ca98e867), [PathElement](gen/PathParser/PathElement.md#pathelement-30082145995b), [ConfTag](ConfTag.md#conftag-73757b87bc93), [PathKey](gen/PathParser/PathKey.md#pathkey-a9b70d1850aa), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `StringBuilder currentPath`
- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> currentPl`
- `com.tailf.conf.ConfTag root`
- `com.tailf.conf.ConfTag current`
- `java.util.List<com.tailf.conf.gen.PathParser.PathKey> keys`
- `boolean displayFormatted`
- `boolean createPsuedoKey`

### encode() <a href="#encode-fbae522bba37" id="encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEList encode()
```

Types: [ConfEList](../proto/ConfEList.md#confelist-78fa4ba3b3a8)

Returns the path encoded as an ConfEList.
 This method is used internally.

**Returns:** ConfEList representation of this path

### encodeIKP() <a href="#encodeikp-b160b87f6433" id="encodeikp-b160b87f6433"></a>

```java
public com.tailf.proto.ConfEList encodeIKP()
```

Types: [ConfEList](../proto/ConfEList.md#confelist-78fa4ba3b3a8)

Returns the path as ConfEList in IKP format.
 This method is used internally.

**Returns:** ConfEList representation of this path

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### getCSNode() <a href="#getcsnode-cf7a085aa7f5" id="getcsnode-cf7a085aa7f5"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getCSNode()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

Returns MaapiSchemas node corresponding to the path.
 The path needs to be absolute and MaapiSchemas need to be loaded.

**Returns:** CSNode if the node exists in the schema, null otherwise

### getKP() <a href="#getkp-45b2f95adae4" id="getkp-45b2f95adae4"></a>

```java
public com.tailf.conf.ConfObject[] getKP() throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2), [ConfException](ConfException.md#confexception-baeaab99f7f9)

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

**Returns:** reverted array representation of this `InstancePath`

**Throws**

- `ConfException` - If schema information is not loaded,
         the path is not valid or the parsed path
         has no namespace information.

### getKP(List&lt;PathElement&gt;, boolean, boolean, MountIdInterface) <a href="#getkp-a23f67046fb4" id="getkp-a23f67046fb4"></a>

```java
public static final com.tailf.conf.ConfObject[] getKP(
    java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl,
    boolean isRel,
    boolean hasSchema,
    com.tailf.conf.MountIdInterface mountGetter
)
    throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2), [PathElement](gen/PathParser/PathElement.md#pathelement-30082145995b), [MountIdInterface](MountIdInterface.md#mountidinterface-113d1b54dae0), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`
- `boolean isRel`
- `boolean hasSchema`
- `com.tailf.conf.MountIdInterface mountGetter`

### getLatestMountId() <a href="#getlatestmountid-30c9c1f692c7" id="getlatestmountid-30c9c1f692c7"></a>

```java
public java.util.List<String> getLatestMountId()
```

### getMountIdGetter() <a href="#getmountidgetter-64fcfdb6be8c" id="getmountidgetter-64fcfdb6be8c"></a>

```java
public com.tailf.conf.MountIdInterface getMountIdGetter()
```

Types: [MountIdInterface](MountIdInterface.md#mountidinterface-113d1b54dae0)

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

Returns a hash code value for the path. This method is
 supported for the benefit of hash tables such as those provided by
 `java.util.Hashtable`.

 The hash code is calculated from its component of `ConfTag`
 and `ConfKey`.

**Returns:** a hash code value for this object.

### isKey() <a href="#iskey-7bdf17ac8255" id="iskey-7bdf17ac8255"></a>

```java
public boolean isKey()
```

### isParsingDeferred() <a href="#isparsingdeferred-b3b266536326" id="isparsingdeferred-b3b266536326"></a>

```java
public boolean isParsingDeferred()
```

### isRel() <a href="#isrel-dca98ac4de7a" id="isrel-dca98ac4de7a"></a>

```java
public boolean isRel()
```

Check if this is a relative path.

**Returns:** true if this is a relative path

### makeKP(ConfObject[]) <a href="#makekp-32258da68c76" id="makekp-32258da68c76"></a>

```java
protected static java.util.List<com.tailf.conf.gen.PathParser.PathElement> makeKP(
    com.tailf.conf.ConfObject[] kp
)
```

Types: [PathElement](gen/PathParser/PathElement.md#pathelement-30082145995b), [ConfObject](ConfObject.md#confobject-5433616953b2)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`

### parseAppend(String, Object[]) <a href="#parseappend-54d8f4d7c8da" id="parseappend-54d8f4d7c8da"></a>

```java
protected final void parseAppend(String format, Object[] args) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String format`
- `Object[] args`

### parseAppend(String, Object[], List&lt;CSNode&gt;) <a href="#parseappend-6e40353c0959" id="parseappend-6e40353c0959"></a>

```java
protected final void parseAppend(
    String format,
    Object[] args,
    java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> pathNodes
)
    throws com.tailf.conf.ConfException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String format`
- `Object[] args`
- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> pathNodes`

### quoteByteArray(byte[]) <a href="#quotebytearray-1889d341fdce" id="quotebytearray-1889d341fdce"></a>

```java
protected static byte[] quoteByteArray(byte[] barr)
```

**Parameters**

- `byte[] barr`

### quoteString(String, boolean) <a href="#quotestring-2ccae847ff76" id="quotestring-2ccae847ff76"></a>

```java
protected static String quoteString(String str, boolean strictQuotation)
```

**Parameters**

- `String str`
- `boolean strictQuotation`

### setMountIdGetter(MountIdInterface) <a href="#setmountidgetter-900228f8453c" id="setmountidgetter-900228f8453c"></a>

```java
public void setMountIdGetter(
    com.tailf.conf.MountIdInterface mountGetter
)
    throws com.tailf.conf.ConfException
```

Types: [MountIdInterface](MountIdInterface.md#mountidinterface-113d1b54dae0), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

### toXPathString() <a href="#toxpathstring-81906e391643" id="toxpathstring-81906e391643"></a>

```java
public String toXPathString()
```

Returns this path object as an XPath string.

**Returns:** XPath String representation


## Nested Types

- [OrdinalKey](InstancePath/OrdinalKey.md#ordinalkey-366c6ce27fe2)
