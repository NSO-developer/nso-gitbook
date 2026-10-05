<a id="s-InstancePath"></a>
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
 [`ConfTag`](ConfTag.md#s-ConfTag)/[`ConfKey`](ConfKey.md#s-ConfKey) values.


- Instance of [`ConfEList`](../proto/ConfEList.md#s-ConfEList) - Applications usually does
 not have to deal with paths that are instances of `ConfEList`.
 Constructors that have this type is usually for internal use:
 [`InstancePath`](InstancePath.md#s-InstancePath),[`InstancePath`](InstancePath.md#s-InstancePath),
 [`InstancePath`](InstancePath.md#s-InstancePath)
- Reverted array of [`ConfObject`](ConfObject.md#s-ConfObject) `ConfObject[]`
 where each element is either
 of the type [`ConfTag`](ConfTag.md#s-ConfTag) or [`ConfKey`](ConfKey.md#s-ConfKey). To determine which type
 a `instanceof` test is required. Usually the application
 need to deal with this representations in different callback
 implementations and it is always reverted. The library
 invokes the user defined callbacks with this type of representation as
 one of the parameters.

 Application is seldom required to construct such arrays.

**Related classes**

- [ConfPath](ConfPath.md#s-ConfPath)
- [ConfXPath](ConfXPath.md#s-ConfXPath)

## Members

**Constructors**:

- [InstancePath(ConfEBinary)](#s-InstancePath-1)
- [InstancePath(ConfEList)](#s-InstancePath-2)
- [InstancePath(ConfObject[])](#s-InstancePath-3)
- [InstancePath(MountIdInterface)](#s-InstancePath-4)
- [InstancePath(MountIdInterface, ConfObject[])](#s-InstancePath-5)
- [InstancePath(MountIdInterface, List<PathElement>)](#s-InstancePath-6)
- [InstancePath(MountIdInterface, String, Object[])](#s-InstancePath-7)
- [InstancePath(String, Object[])](#s-InstancePath-8)

**Fields**:

- [arguments](#s-arguments)
- [deferred](#s-deferred)
- [fmt](#s-fmt)
- [hasSchema](#s-hasSchema)
- [isRel](#s-isRel)
- [latestMountId](#s-latestMountId)
- [mountGetter](#s-mountGetter)
- [pl](#s-pl)

**Methods**:

- [chkDeferred()](#s-chkDeferred)
- [convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, ArrayList<PathKey>, boolean)](#s-convertToConfKey)
- [convertToConfKey(StringBuilder, List<PathElement>, ConfTag, ConfTag, List<PathKey>, boolean, boolean)](#s-convertToConfKey-1)
- [encode()](#s-encode)
- [encodeIKP()](#s-encodeIKP)
- [equals(Object)](#s-equals)
- [getCSNode()](#s-getCSNode)
- [getKP()](#s-getKP)
- [getKP(List<PathElement>, boolean, boolean, MountIdInterface)](#s-getKP-1)
- [getLatestMountId()](#s-getLatestMountId)
- [getMountIdGetter()](#s-getMountIdGetter)
- [hashCode()](#s-hashCode)
- [isKey()](#s-isKey)
- [isParsingDeferred()](#s-isParsingDeferred)
- [isRel()](#s-isRel-1)
- [makeKP(ConfObject[])](#s-makeKP)
- [parseAppend(String, Object[])](#s-parseAppend)
- [parseAppend(String, Object[], List<CSNode>)](#s-parseAppend-1)
- [quoteByteArray(byte[])](#s-quoteByteArray)
- [quoteString(String, boolean)](#s-quoteString)
- [setMountIdGetter(MountIdInterface)](#s-setMountIdGetter)
- [toString()](#s-toString)
- [toXPathString()](#s-toXPathString)

**Nested Types**:

- [OrdinalKey](InstancePath/OrdinalKey.md#s-OrdinalKey)

## Constructors

<a id="s-InstancePath-1"></a>
### InstancePath(ConfEBinary)

```java
public InstancePath(com.tailf.proto.ConfEBinary o) throws com.tailf.conf.ConfException
```

Types: [ConfEBinary](../proto/ConfEBinary.md#s-ConfEBinary), [ConfException](ConfException.md#s-ConfException)

Initialize a InstancePath.
 (*This constructor is rarely used for applications; usually
 for internal use*)

**Parameters**

- `com.tailf.proto.ConfEBinary o` - element constitute a `InstancePath`

**Throws**

- `ConfException`

<a id="s-InstancePath-2"></a>
### InstancePath(ConfEList)

```java
public InstancePath(com.tailf.proto.ConfEList o)
```

Types: [ConfEList](../proto/ConfEList.md#s-ConfEList)

Initialize a InstancePath.
 (*This constructor is rarely used for applications;
 usually for internal uses*)

**Parameters**

- `com.tailf.proto.ConfEList o` - element (reversed) constitute a `InstancePath`

<a id="s-InstancePath-3"></a>
### InstancePath(ConfObject[])

```java
public InstancePath(com.tailf.conf.ConfObject[] kp)
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

Initializes a new instance of this class from a given
 reverted ConfObject[] keypath where elements
 is either `ConfTag` or
 `ConfKey`.

**Parameters**

- `com.tailf.conf.ConfObject[] kp` - reverted keypath

<a id="s-InstancePath-4"></a>
### InstancePath(MountIdInterface)

```java
protected InstancePath(com.tailf.conf.MountIdInterface mountGetter)
```

Types: [MountIdInterface](MountIdInterface.md#s-MountIdInterface)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`

<a id="s-InstancePath-5"></a>
### InstancePath(MountIdInterface, ConfObject[])

```java
public InstancePath(com.tailf.conf.MountIdInterface mountGetter, com.tailf.conf.ConfObject[] kp)
```

Types: [MountIdInterface](MountIdInterface.md#s-MountIdInterface), [ConfObject](ConfObject.md#s-ConfObject)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`
- `com.tailf.conf.ConfObject[] kp`

<a id="s-InstancePath-6"></a>
### InstancePath(MountIdInterface, List<PathElement>)

```java
protected InstancePath(
    com.tailf.conf.MountIdInterface mountGetter,
    java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl
)
```

Types: [MountIdInterface](MountIdInterface.md#s-MountIdInterface), [PathElement](gen/PathParser/PathElement.md#s-PathElement)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`
- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`

<a id="s-InstancePath-7"></a>
### InstancePath(MountIdInterface, String, Object[])

```java
protected InstancePath(
    com.tailf.conf.MountIdInterface mountGetter,
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException
```

Types: [MountIdInterface](MountIdInterface.md#s-MountIdInterface), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`
- `String fmt`
- `Object[] arguments`

<a id="s-InstancePath-8"></a>
### InstancePath(String, Object[])

```java
protected InstancePath(String fmt, Object[] arguments) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

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

<a id="s-arguments"></a>
### arguments

```java
protected Object[] arguments = null;
```

<a id="s-deferred"></a>
### deferred

```java
protected boolean deferred = null;
```

<a id="s-fmt"></a>
### fmt

```java
protected String fmt = null;
```

<a id="s-hasSchema"></a>
### hasSchema

```java
protected boolean hasSchema = null;
```

<a id="s-isRel"></a>
### isRel

```java
protected boolean isRel = null;
```

<a id="s-latestMountId"></a>
### latestMountId

```java
protected java.util.List<String> latestMountId = null;
```

<a id="s-mountGetter"></a>
### mountGetter

```java
protected com.tailf.conf.MountIdInterface mountGetter = null;
```

Types: [MountIdInterface](MountIdInterface.md#s-MountIdInterface)

<a id="s-pl"></a>
### pl

```java
protected java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl = null;
```

Types: [PathElement](gen/PathParser/PathElement.md#s-PathElement)


## Methods

<a id="s-chkDeferred"></a>
### chkDeferred()

```java
protected abstract void chkDeferred()
```

<a id="s-convertToConfKey"></a>
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

Types: [ConfKey](ConfKey.md#s-ConfKey), [PathElement](gen/PathParser/PathElement.md#s-PathElement), [ConfTag](ConfTag.md#s-ConfTag), [PathKey](gen/PathParser/PathKey.md#s-PathKey), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `StringBuilder currentPath`
- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> currentPl`
- `com.tailf.conf.ConfTag root`
- `com.tailf.conf.ConfTag current`
- `java.util.ArrayList<com.tailf.conf.gen.PathParser.PathKey> keys`
- `boolean displayFormatted`

<a id="s-convertToConfKey-1"></a>
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

Types: [ConfKey](ConfKey.md#s-ConfKey), [PathElement](gen/PathParser/PathElement.md#s-PathElement), [ConfTag](ConfTag.md#s-ConfTag), [PathKey](gen/PathParser/PathKey.md#s-PathKey), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `StringBuilder currentPath`
- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> currentPl`
- `com.tailf.conf.ConfTag root`
- `com.tailf.conf.ConfTag current`
- `java.util.List<com.tailf.conf.gen.PathParser.PathKey> keys`
- `boolean displayFormatted`
- `boolean createPsuedoKey`

<a id="s-encode"></a>
### encode()

```java
public com.tailf.proto.ConfEList encode()
```

Types: [ConfEList](../proto/ConfEList.md#s-ConfEList)

Returns the path encoded as an ConfEList.
 This method is used internally.

**Returns:** ConfEList representation of this path

<a id="s-encodeIKP"></a>
### encodeIKP()

```java
public com.tailf.proto.ConfEList encodeIKP()
```

Types: [ConfEList](../proto/ConfEList.md#s-ConfEList)

Returns the path as ConfEList in IKP format.
 This method is used internally.

**Returns:** ConfEList representation of this path

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

<a id="s-getCSNode"></a>
### getCSNode()

```java
public com.tailf.maapi.MaapiSchemas.CSNode getCSNode()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

Returns MaapiSchemas node corresponding to the path.
 The path needs to be absolute and MaapiSchemas need to be loaded.

**Returns:** CSNode if the node exists in the schema, null otherwise

<a id="s-getKP"></a>
### getKP()

```java
public com.tailf.conf.ConfObject[] getKP() throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#s-ConfObject), [ConfException](ConfException.md#s-ConfException)

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

<a id="s-getKP-1"></a>
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

Types: [ConfObject](ConfObject.md#s-ConfObject), [PathElement](gen/PathParser/PathElement.md#s-PathElement), [MountIdInterface](MountIdInterface.md#s-MountIdInterface), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`
- `boolean isRel`
- `boolean hasSchema`
- `com.tailf.conf.MountIdInterface mountGetter`

<a id="s-getLatestMountId"></a>
### getLatestMountId()

```java
public java.util.List<String> getLatestMountId()
```

<a id="s-getMountIdGetter"></a>
### getMountIdGetter()

```java
public com.tailf.conf.MountIdInterface getMountIdGetter()
```

Types: [MountIdInterface](MountIdInterface.md#s-MountIdInterface)

<a id="s-hashCode"></a>
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

<a id="s-isKey"></a>
### isKey()

```java
public boolean isKey()
```

<a id="s-isParsingDeferred"></a>
### isParsingDeferred()

```java
public boolean isParsingDeferred()
```

<a id="s-isRel-1"></a>
### isRel()

```java
public boolean isRel()
```

Check if this is a relative path.

**Returns:** true if this is a relative path

<a id="s-makeKP"></a>
### makeKP(ConfObject[])

```java
protected static java.util.List<com.tailf.conf.gen.PathParser.PathElement> makeKP(
    com.tailf.conf.ConfObject[] kp
)
```

Types: [PathElement](gen/PathParser/PathElement.md#s-PathElement), [ConfObject](ConfObject.md#s-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`

<a id="s-parseAppend"></a>
### parseAppend(String, Object[])

```java
protected final void parseAppend(String format, Object[] args) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `String format`
- `Object[] args`

<a id="s-parseAppend-1"></a>
### parseAppend(String, Object[], List<CSNode>)

```java
protected final void parseAppend(
    String format,
    Object[] args,
    java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> pathNodes
)
    throws com.tailf.conf.ConfException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `String format`
- `Object[] args`
- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> pathNodes`

<a id="s-quoteByteArray"></a>
### quoteByteArray(byte[])

```java
protected static byte[] quoteByteArray(byte[] barr)
```

**Parameters**

- `byte[] barr`

<a id="s-quoteString"></a>
### quoteString(String, boolean)

```java
protected static String quoteString(String str, boolean strictQuotation)
```

**Parameters**

- `String str`
- `boolean strictQuotation`

<a id="s-setMountIdGetter"></a>
### setMountIdGetter(MountIdInterface)

```java
public void setMountIdGetter(
    com.tailf.conf.MountIdInterface mountGetter
)
    throws com.tailf.conf.ConfException
```

Types: [MountIdInterface](MountIdInterface.md#s-MountIdInterface), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

<a id="s-toXPathString"></a>
### toXPathString()

```java
public String toXPathString()
```

Returns this path object as an XPath string.

**Returns:** XPath String representation


## Nested Types

- [OrdinalKey](InstancePath/OrdinalKey.md)
