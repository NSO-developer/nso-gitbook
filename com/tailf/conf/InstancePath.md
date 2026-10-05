<a id="cls-InstancePath"></a>
# InstancePath

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
 [`ConfTag`](ConfTag.md#cls-ConfTag)/[`ConfKey`](ConfKey.md#cls-ConfKey) values.


- Instance of [`ConfEList`](../proto/ConfEList.md#cls-ConfEList) - Applications usually does
 not have to deal with paths that are instances of `ConfEList`.
 Constructors that have this type is usually for internal use:
 [`InstancePath#InstancePath(ConfEBinary)`](InstancePath.md#m-instancepath-e673bc5f9e5a),[`InstancePath#InstancePath(ConfEList)`](InstancePath.md#m-instancepath-5f1d4144a5af),
 [`InstancePath#InstancePath(ConfObject[])`](InstancePath.md#m-instancepath-578db36acd1b)
- Reverted array of [`ConfObject`](ConfObject.md#cls-ConfObject) `ConfObject[]`
 where each element is either
 of the type [`ConfTag`](ConfTag.md#cls-ConfTag) or [`ConfKey`](ConfKey.md#cls-ConfKey). To determine which type
 a `instanceof` test is required. Usually the application
 need to deal with this representations in different callback
 implementations and it is always reverted. The library
 invokes the user defined callbacks with this type of representation as
 one of the parameters.

 Application is seldom required to construct such arrays.

**Related classes**

- [ConfPath](ConfPath.md#cls-ConfPath)
- [ConfXPath](ConfXPath.md#cls-ConfXPath)

## Members

**Constructors**:

- [InstancePath(ConfEBinary)](#m-instancepath-e673bc5f9e5a)
- [InstancePath(ConfEList)](#m-instancepath-5f1d4144a5af)
- [InstancePath(ConfObject[])](#m-instancepath-578db36acd1b)
- [InstancePath(MountIdInterface)](#m-instancepath-c47f9e227234)
- [InstancePath(MountIdInterface, ConfObject[])](#m-instancepath-2505c812ffbf)
- [InstancePath(MountIdInterface, List<PathElement>)](#m-instancepath-81d41046b20c)
- [InstancePath(MountIdInterface, String, Object[])](#m-instancepath-01c8746248ca)
- [InstancePath(String, Object[])](#m-instancepath-f1811b7c9fb8)

**Fields**:

- [arguments](#m-arguments)
- [deferred](#m-deferred)
- [fmt](#m-fmt)
- [hasSchema](#m-hasSchema)
- [isRel](#m-isRel)
- [latestMountId](#m-latestMountId)
- [mountGetter](#m-mountGetter)
- [pl](#m-pl)

**Methods**:

- [chkDeferred()](#m-chkdeferred-f66dc2317846)
- [convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, ArrayList<PathKey>, boolean)](#m-converttoconfkey-709808909e1b)
- [convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, List<PathKey>, boolean, boolean)](#m-converttoconfkey-3964b2d32ca6)
- [encode()](#m-encode-fbae522bba37)
- [encodeIKP()](#m-encodeikp-b160b87f6433)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getCSNode()](#m-getcsnode-cf7a085aa7f5)
- [getKP()](#m-getkp-45b2f95adae4)
- [getKP(List<PathElement>, boolean, boolean, MountIdInterface)](#m-getkp-a23f67046fb4)
- [getLatestMountId()](#m-getlatestmountid-30c9c1f692c7)
- [getMountIdGetter()](#m-getmountidgetter-64fcfdb6be8c)
- [hashCode()](#m-hashcode-ef797a217903)
- [isKey()](#m-iskey-7bdf17ac8255)
- [isParsingDeferred()](#m-isparsingdeferred-b3b266536326)
- [isRel()](#m-isrel-dca98ac4de7a)
- [makeKP(ConfObject[])](#m-makekp-32258da68c76)
- [parseAppend(String, Object[])](#m-parseappend-54d8f4d7c8da)
- [parseAppend(String, Object[], List<CSNode>)](#m-parseappend-6e40353c0959)
- [quoteByteArray(byte[])](#m-quotebytearray-1889d341fdce)
- [quoteString(String, boolean)](#m-quotestring-2ccae847ff76)
- [setMountIdGetter(MountIdInterface)](#m-setmountidgetter-900228f8453c)
- [toString()](#m-tostring-e9d48c5503ef)
- [toXPathString()](#m-toxpathstring-81906e391643)

**Nested Types**:

- [OrdinalKey](InstancePath/OrdinalKey.md#cls-OrdinalKey)

## Constructors

<a id="m-instancepath-e673bc5f9e5a"></a>
### InstancePath(ConfEBinary)

```java
public InstancePath(com.tailf.proto.ConfEBinary o) throws com.tailf.conf.ConfException
```

Types: [ConfEBinary](../proto/ConfEBinary.md#cls-ConfEBinary), [ConfException](ConfException.md#cls-ConfException)

Initialize a InstancePath.
 (*This constructor is rarely used for applications; usually
 for internal use*)

**Parameters**

- `com.tailf.proto.ConfEBinary o` - element constitute a `InstancePath`

**Throws**

- `ConfException`

<a id="m-instancepath-5f1d4144a5af"></a>
### InstancePath(ConfEList)

```java
public InstancePath(com.tailf.proto.ConfEList o)
```

Types: [ConfEList](../proto/ConfEList.md#cls-ConfEList)

Initialize a InstancePath.
 (*This constructor is rarely used for applications;
 usually for internal uses*)

**Parameters**

- `com.tailf.proto.ConfEList o` - element (reversed) constitute a `InstancePath`

<a id="m-instancepath-578db36acd1b"></a>
### InstancePath(ConfObject[])

```java
public InstancePath(com.tailf.conf.ConfObject[] kp)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

Initializes a new instance of this class from a given
 reverted ConfObject[] keypath where elements
 is either `ConfTag` or
 `ConfKey`.

**Parameters**

- `com.tailf.conf.ConfObject[] kp` - reverted keypath

<a id="m-instancepath-c47f9e227234"></a>
### InstancePath(MountIdInterface)

```java
protected InstancePath(com.tailf.conf.MountIdInterface mountGetter)
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`

<a id="m-instancepath-2505c812ffbf"></a>
### InstancePath(MountIdInterface, ConfObject[])

```java
public InstancePath(com.tailf.conf.MountIdInterface mountGetter, com.tailf.conf.ConfObject[] kp)
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface), [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`
- `com.tailf.conf.ConfObject[] kp`

<a id="m-instancepath-81d41046b20c"></a>
### InstancePath(MountIdInterface, List<PathElement>)

```java
protected InstancePath(
    com.tailf.conf.MountIdInterface mountGetter,
    java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl
)
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface), [PathElement](gen/PathParser/PathElement.md#cls-PathElement)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`
- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`

<a id="m-instancepath-01c8746248ca"></a>
### InstancePath(MountIdInterface, String, Object[])

```java
protected InstancePath(
    com.tailf.conf.MountIdInterface mountGetter,
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`
- `String fmt`
- `Object[] arguments`

<a id="m-instancepath-f1811b7c9fb8"></a>
### InstancePath(String, Object[])

```java
protected InstancePath(String fmt, Object[] arguments) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

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

<a id="m-arguments"></a>
### arguments

```java
protected Object[] arguments = null;
```

<a id="m-deferred"></a>
### deferred

```java
protected boolean deferred = null;
```

<a id="m-fmt"></a>
### fmt

```java
protected String fmt = null;
```

<a id="m-hasSchema"></a>
### hasSchema

```java
protected boolean hasSchema = null;
```

<a id="m-isRel"></a>
### isRel

```java
protected boolean isRel = null;
```

<a id="m-latestMountId"></a>
### latestMountId

```java
protected java.util.List<String> latestMountId = null;
```

<a id="m-mountGetter"></a>
### mountGetter

```java
protected com.tailf.conf.MountIdInterface mountGetter = null;
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface)

<a id="m-pl"></a>
### pl

```java
protected java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl = null;
```

Types: [PathElement](gen/PathParser/PathElement.md#cls-PathElement)


## Methods

<a id="m-chkdeferred-f66dc2317846"></a>
### chkDeferred()

```java
protected abstract void chkDeferred()
```

<a id="m-converttoconfkey-709808909e1b"></a>
### convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, ArrayList<PathKey>, boolean)

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

Types: [ConfKey](ConfKey.md#cls-ConfKey), [PathElement](gen/PathParser/PathElement.md#cls-PathElement), [ConfTag](ConfTag.md#cls-ConfTag), [PathKey](gen/PathParser/PathKey.md#cls-PathKey), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `StringBuilder currentPath`
- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> currentPl`
- `com.tailf.conf.ConfTag root`
- `com.tailf.conf.ConfTag current`
- `java.util.ArrayList<com.tailf.conf.gen.PathParser.PathKey> keys`
- `boolean displayFormatted`

<a id="m-converttoconfkey-3964b2d32ca6"></a>
### convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, List<PathKey>, boolean, boolean)

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

Types: [ConfKey](ConfKey.md#cls-ConfKey), [PathElement](gen/PathParser/PathElement.md#cls-PathElement), [ConfTag](ConfTag.md#cls-ConfTag), [PathKey](gen/PathParser/PathKey.md#cls-PathKey), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `StringBuilder currentPath`
- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> currentPl`
- `com.tailf.conf.ConfTag root`
- `com.tailf.conf.ConfTag current`
- `java.util.List<com.tailf.conf.gen.PathParser.PathKey> keys`
- `boolean displayFormatted`
- `boolean createPsuedoKey`

<a id="m-encode-fbae522bba37"></a>
### encode()

```java
public com.tailf.proto.ConfEList encode()
```

Types: [ConfEList](../proto/ConfEList.md#cls-ConfEList)

Returns the path encoded as an ConfEList.
 This method is used internally.

**Returns:** ConfEList representation of this path

<a id="m-encodeikp-b160b87f6433"></a>
### encodeIKP()

```java
public com.tailf.proto.ConfEList encodeIKP()
```

Types: [ConfEList](../proto/ConfEList.md#cls-ConfEList)

Returns the path as ConfEList in IKP format.
 This method is used internally.

**Returns:** ConfEList representation of this path

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

<a id="m-getcsnode-cf7a085aa7f5"></a>
### getCSNode()

```java
public com.tailf.maapi.MaapiSchemas.CSNode getCSNode()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

Returns MaapiSchemas node corresponding to the path.
 The path needs to be absolute and MaapiSchemas need to be loaded.

**Returns:** CSNode if the node exists in the schema, null otherwise

<a id="m-getkp-45b2f95adae4"></a>
### getKP()

```java
public com.tailf.conf.ConfObject[] getKP() throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#cls-ConfObject), [ConfException](ConfException.md#cls-ConfException)

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

<a id="m-getkp-a23f67046fb4"></a>
### getKP(List<PathElement>, boolean, boolean, MountIdInterface)

```java
public static final com.tailf.conf.ConfObject[] getKP(
    java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl,
    boolean isRel,
    boolean hasSchema,
    com.tailf.conf.MountIdInterface mountGetter
)
    throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#cls-ConfObject), [PathElement](gen/PathParser/PathElement.md#cls-PathElement), [MountIdInterface](MountIdInterface.md#cls-MountIdInterface), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`
- `boolean isRel`
- `boolean hasSchema`
- `com.tailf.conf.MountIdInterface mountGetter`

<a id="m-getlatestmountid-30c9c1f692c7"></a>
### getLatestMountId()

```java
public java.util.List<String> getLatestMountId()
```

<a id="m-getmountidgetter-64fcfdb6be8c"></a>
### getMountIdGetter()

```java
public com.tailf.conf.MountIdInterface getMountIdGetter()
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface)

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

Returns a hash code value for the path. This method is
 supported for the benefit of hash tables such as those provided by
 `java.util.Hashtable`.

 The hash code is calculated from its component of `ConfTag`
 and `ConfKey`.

**Returns:** a hash code value for this object.

<a id="m-iskey-7bdf17ac8255"></a>
### isKey()

```java
public boolean isKey()
```

<a id="m-isparsingdeferred-b3b266536326"></a>
### isParsingDeferred()

```java
public boolean isParsingDeferred()
```

<a id="m-isrel-dca98ac4de7a"></a>
### isRel()

```java
public boolean isRel()
```

Check if this is a relative path.

**Returns:** true if this is a relative path

<a id="m-makekp-32258da68c76"></a>
### makeKP(ConfObject[])

```java
protected static java.util.List<com.tailf.conf.gen.PathParser.PathElement> makeKP(
    com.tailf.conf.ConfObject[] kp
)
```

Types: [PathElement](gen/PathParser/PathElement.md#cls-PathElement), [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`

<a id="m-parseappend-54d8f4d7c8da"></a>
### parseAppend(String, Object[])

```java
protected final void parseAppend(String format, Object[] args) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `String format`
- `Object[] args`

<a id="m-parseappend-6e40353c0959"></a>
### parseAppend(String, Object[], List<CSNode>)

```java
protected final void parseAppend(
    String format,
    Object[] args,
    java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> pathNodes
)
    throws com.tailf.conf.ConfException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `String format`
- `Object[] args`
- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> pathNodes`

<a id="m-quotebytearray-1889d341fdce"></a>
### quoteByteArray(byte[])

```java
protected static byte[] quoteByteArray(byte[] barr)
```

**Parameters**

- `byte[] barr`

<a id="m-quotestring-2ccae847ff76"></a>
### quoteString(String, boolean)

```java
protected static String quoteString(String str, boolean strictQuotation)
```

**Parameters**

- `String str`
- `boolean strictQuotation`

<a id="m-setmountidgetter-900228f8453c"></a>
### setMountIdGetter(MountIdInterface)

```java
public void setMountIdGetter(
    com.tailf.conf.MountIdInterface mountGetter
)
    throws com.tailf.conf.ConfException
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

<a id="m-toxpathstring-81906e391643"></a>
### toXPathString()

```java
public String toXPathString()
```

Returns this path object as an XPath string.

**Returns:** XPath String representation


## Nested Types

- [OrdinalKey](InstancePath/OrdinalKey.md#cls-OrdinalKey)
