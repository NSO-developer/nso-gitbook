# InstancePath <a href="#cls-InstancePath" id="cls-InstancePath"></a>

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
 [`InstancePath(ConfEBinary)`](InstancePath.md#m-InstancePath-e673bc5f9e5a),[`InstancePath(ConfEList)`](InstancePath.md#m-InstancePath-5f1d4144a5af),
 [`InstancePath(ConfObject[])`](InstancePath.md#m-InstancePath-578db36acd1b)
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

- [InstancePath(ConfEBinary)](#m-InstancePath-e673bc5f9e5a)
- [InstancePath(ConfEList)](#m-InstancePath-5f1d4144a5af)
- [InstancePath(ConfObject[])](#m-InstancePath-578db36acd1b)
- [InstancePath(MountIdInterface)](#m-InstancePath-c47f9e227234)
- [InstancePath(MountIdInterface, ConfObject[])](#m-InstancePath-2505c812ffbf)
- [InstancePath(MountIdInterface, List<PathElement>)](#m-InstancePath-81d41046b20c)
- [InstancePath(MountIdInterface, String, Object[])](#m-InstancePath-01c8746248ca)
- [InstancePath(String, Object[])](#m-InstancePath-f1811b7c9fb8)

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

- [chkDeferred()](#m-chkDeferred-f66dc2317846)
- [convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, ArrayList<PathKey>, boolean)](#m-convertToConfKey-709808909e1b)
- [convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, List<PathKey>, boolean, boolean)](#m-convertToConfKey-3964b2d32ca6)
- [encode()](#m-encode-fbae522bba37)
- [encodeIKP()](#m-encodeIKP-b160b87f6433)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getCSNode()](#m-getCSNode-cf7a085aa7f5)
- [getKP()](#m-getKP-45b2f95adae4)
- [getKP(List<PathElement>, boolean, boolean, MountIdInterface)](#m-getKP-a23f67046fb4)
- [getLatestMountId()](#m-getLatestMountId-30c9c1f692c7)
- [getMountIdGetter()](#m-getMountIdGetter-64fcfdb6be8c)
- [hashCode()](#m-hashCode-ef797a217903)
- [isKey()](#m-isKey-7bdf17ac8255)
- [isParsingDeferred()](#m-isParsingDeferred-b3b266536326)
- [isRel()](#m-isRel-dca98ac4de7a)
- [makeKP(ConfObject[])](#m-makeKP-32258da68c76)
- [parseAppend(String, Object[])](#m-parseAppend-54d8f4d7c8da)
- [parseAppend(String, Object[], List<CSNode>)](#m-parseAppend-6e40353c0959)
- [quoteByteArray(byte[])](#m-quoteByteArray-1889d341fdce)
- [quoteString(String, boolean)](#m-quoteString-2ccae847ff76)
- [setMountIdGetter(MountIdInterface)](#m-setMountIdGetter-900228f8453c)
- [toString()](#m-toString-e9d48c5503ef)
- [toXPathString()](#m-toXPathString-81906e391643)

**Nested Types**:

- [OrdinalKey](InstancePath/OrdinalKey.md#cls-OrdinalKey)

## Constructors

### InstancePath(ConfEBinary) <a href="#m-InstancePath-e673bc5f9e5a" id="m-InstancePath-e673bc5f9e5a"></a>

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

### InstancePath(ConfEList) <a href="#m-InstancePath-5f1d4144a5af" id="m-InstancePath-5f1d4144a5af"></a>

```java
public InstancePath(com.tailf.proto.ConfEList o)
```

Types: [ConfEList](../proto/ConfEList.md#cls-ConfEList)

Initialize a InstancePath.
 (*This constructor is rarely used for applications;
 usually for internal uses*)

**Parameters**

- `com.tailf.proto.ConfEList o` - element (reversed) constitute a `InstancePath`

### InstancePath(ConfObject[]) <a href="#m-InstancePath-578db36acd1b" id="m-InstancePath-578db36acd1b"></a>

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

### InstancePath(MountIdInterface) <a href="#m-InstancePath-c47f9e227234" id="m-InstancePath-c47f9e227234"></a>

```java
protected InstancePath(com.tailf.conf.MountIdInterface mountGetter)
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`

### InstancePath(MountIdInterface, ConfObject[]) <a href="#m-InstancePath-2505c812ffbf" id="m-InstancePath-2505c812ffbf"></a>

```java
public InstancePath(com.tailf.conf.MountIdInterface mountGetter, com.tailf.conf.ConfObject[] kp)
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface), [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`
- `com.tailf.conf.ConfObject[] kp`

### InstancePath(MountIdInterface, List<PathElement>) <a href="#m-InstancePath-81d41046b20c" id="m-InstancePath-81d41046b20c"></a>

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

### InstancePath(MountIdInterface, String, Object[]) <a href="#m-InstancePath-01c8746248ca" id="m-InstancePath-01c8746248ca"></a>

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

### InstancePath(String, Object[]) <a href="#m-InstancePath-f1811b7c9fb8" id="m-InstancePath-f1811b7c9fb8"></a>

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

### arguments <a href="#m-arguments" id="m-arguments"></a>

```java
protected Object[] arguments = null;
```

### deferred <a href="#m-deferred" id="m-deferred"></a>

```java
protected boolean deferred = null;
```

### fmt <a href="#m-fmt" id="m-fmt"></a>

```java
protected String fmt = null;
```

### hasSchema <a href="#m-hasSchema" id="m-hasSchema"></a>

```java
protected boolean hasSchema = null;
```

### isRel <a href="#m-isRel" id="m-isRel"></a>

```java
protected boolean isRel = null;
```

### latestMountId <a href="#m-latestMountId" id="m-latestMountId"></a>

```java
protected java.util.List<String> latestMountId = null;
```

### mountGetter <a href="#m-mountGetter" id="m-mountGetter"></a>

```java
protected com.tailf.conf.MountIdInterface mountGetter = null;
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface)

### pl <a href="#m-pl" id="m-pl"></a>

```java
protected java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl = null;
```

Types: [PathElement](gen/PathParser/PathElement.md#cls-PathElement)


## Methods

### chkDeferred() <a href="#m-chkDeferred-f66dc2317846" id="m-chkDeferred-f66dc2317846"></a>

```java
protected abstract void chkDeferred()
```

### convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, ArrayList<PathKey>, boolean) <a href="#m-convertToConfKey-709808909e1b" id="m-convertToConfKey-709808909e1b"></a>

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

### convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, List<PathKey>, boolean, boolean) <a href="#m-convertToConfKey-3964b2d32ca6" id="m-convertToConfKey-3964b2d32ca6"></a>

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

### encode() <a href="#m-encode-fbae522bba37" id="m-encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEList encode()
```

Types: [ConfEList](../proto/ConfEList.md#cls-ConfEList)

Returns the path encoded as an ConfEList.
 This method is used internally.

**Returns:** ConfEList representation of this path

### encodeIKP() <a href="#m-encodeIKP-b160b87f6433" id="m-encodeIKP-b160b87f6433"></a>

```java
public com.tailf.proto.ConfEList encodeIKP()
```

Types: [ConfEList](../proto/ConfEList.md#cls-ConfEList)

Returns the path as ConfEList in IKP format.
 This method is used internally.

**Returns:** ConfEList representation of this path

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### getCSNode() <a href="#m-getCSNode-cf7a085aa7f5" id="m-getCSNode-cf7a085aa7f5"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getCSNode()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

Returns MaapiSchemas node corresponding to the path.
 The path needs to be absolute and MaapiSchemas need to be loaded.

**Returns:** CSNode if the node exists in the schema, null otherwise

### getKP() <a href="#m-getKP-45b2f95adae4" id="m-getKP-45b2f95adae4"></a>

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

### getKP(List<PathElement>, boolean, boolean, MountIdInterface) <a href="#m-getKP-a23f67046fb4" id="m-getKP-a23f67046fb4"></a>

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

### getLatestMountId() <a href="#m-getLatestMountId-30c9c1f692c7" id="m-getLatestMountId-30c9c1f692c7"></a>

```java
public java.util.List<String> getLatestMountId()
```

### getMountIdGetter() <a href="#m-getMountIdGetter-64fcfdb6be8c" id="m-getMountIdGetter-64fcfdb6be8c"></a>

```java
public com.tailf.conf.MountIdInterface getMountIdGetter()
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface)

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

Returns a hash code value for the path. This method is
 supported for the benefit of hash tables such as those provided by
 `java.util.Hashtable`.

 The hash code is calculated from its component of `ConfTag`
 and `ConfKey`.

**Returns:** a hash code value for this object.

### isKey() <a href="#m-isKey-7bdf17ac8255" id="m-isKey-7bdf17ac8255"></a>

```java
public boolean isKey()
```

### isParsingDeferred() <a href="#m-isParsingDeferred-b3b266536326" id="m-isParsingDeferred-b3b266536326"></a>

```java
public boolean isParsingDeferred()
```

### isRel() <a href="#m-isRel-dca98ac4de7a" id="m-isRel-dca98ac4de7a"></a>

```java
public boolean isRel()
```

Check if this is a relative path.

**Returns:** true if this is a relative path

### makeKP(ConfObject[]) <a href="#m-makeKP-32258da68c76" id="m-makeKP-32258da68c76"></a>

```java
protected static java.util.List<com.tailf.conf.gen.PathParser.PathElement> makeKP(
    com.tailf.conf.ConfObject[] kp
)
```

Types: [PathElement](gen/PathParser/PathElement.md#cls-PathElement), [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`

### parseAppend(String, Object[]) <a href="#m-parseAppend-54d8f4d7c8da" id="m-parseAppend-54d8f4d7c8da"></a>

```java
protected final void parseAppend(String format, Object[] args) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `String format`
- `Object[] args`

### parseAppend(String, Object[], List<CSNode>) <a href="#m-parseAppend-6e40353c0959" id="m-parseAppend-6e40353c0959"></a>

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

### quoteByteArray(byte[]) <a href="#m-quoteByteArray-1889d341fdce" id="m-quoteByteArray-1889d341fdce"></a>

```java
protected static byte[] quoteByteArray(byte[] barr)
```

**Parameters**

- `byte[] barr`

### quoteString(String, boolean) <a href="#m-quoteString-2ccae847ff76" id="m-quoteString-2ccae847ff76"></a>

```java
protected static String quoteString(String str, boolean strictQuotation)
```

**Parameters**

- `String str`
- `boolean strictQuotation`

### setMountIdGetter(MountIdInterface) <a href="#m-setMountIdGetter-900228f8453c" id="m-setMountIdGetter-900228f8453c"></a>

```java
public void setMountIdGetter(
    com.tailf.conf.MountIdInterface mountGetter
)
    throws com.tailf.conf.ConfException
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

### toXPathString() <a href="#m-toXPathString-81906e391643" id="m-toXPathString-81906e391643"></a>

```java
public String toXPathString()
```

Returns this path object as an XPath string.

**Returns:** XPath String representation


## Nested Types

- [OrdinalKey](InstancePath/OrdinalKey.md#cls-OrdinalKey)
