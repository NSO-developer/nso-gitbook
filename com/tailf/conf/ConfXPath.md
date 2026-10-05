# ConfXPath <a href="#confxpath-0180bbe0b500" id="confxpath-0180bbe0b500"></a>

```java
public class com.tailf.conf.ConfXPath
    extends com.tailf.conf.InstancePath
```

Types: [InstancePath](InstancePath.md#instancepath-7694a1545db3)

DATA_CONTAINER - Corresponds to the YANG instance-identifier type.


 Class Representing an XPath path. This class only supports a
 restriction of the XPath 1.0 grammar.

## Members

**Constructors**:

- [ConfXPath\(String\)](#confxpath-3168fe5c5a30)
- [ConfXPath\(String, MountIdInterface\)](#confxpath-c4fe4eab63ea)

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

- [chkDeferred\(\)](#chkdeferred-f66dc2317846)
- [convertToConfKey\(StringBuilder, List\<PathElement\>, ConfTag, ConfTag, ArrayList\<PathKey\>, boolean\)](InstancePath.md#converttoconfkey-709808909e1b) from InstancePath
- [convertToConfKey\(StringBuilder, List\<PathElement\>, ConfTag, ConfTag, List\<PathKey\>, boolean, boolean\)](InstancePath.md#converttoconfkey-3964b2d32ca6) from InstancePath
- [encode\(\)](InstancePath.md#encode-fbae522bba37) from InstancePath
- [encodeIKP\(\)](InstancePath.md#encodeikp-b160b87f6433) from InstancePath
- [equals\(Object\)](#equals-fcd6492e0d6c)
- [getCSNode\(\)](InstancePath.md#getcsnode-cf7a085aa7f5) from InstancePath
- [getKP\(\)](#getkp-45b2f95adae4)
- [getKP\(List\<PathElement\>, boolean, boolean, MountIdInterface\)](InstancePath.md#getkp-a23f67046fb4) from InstancePath
- [getLatestMountId\(\)](InstancePath.md#getlatestmountid-30c9c1f692c7) from InstancePath
- [getMountIdGetter\(\)](InstancePath.md#getmountidgetter-64fcfdb6be8c) from InstancePath
- [hashCode\(\)](#hashcode-ef797a217903)
- [isKey\(\)](InstancePath.md#iskey-7bdf17ac8255) from InstancePath
- [isParsingDeferred\(\)](InstancePath.md#isparsingdeferred-b3b266536326) from InstancePath
- [isRel\(\)](InstancePath.md#isrel-dca98ac4de7a) from InstancePath
- [makeKP\(ConfObject\[\]\)](InstancePath.md#makekp-32258da68c76) from InstancePath
- [parseAppend\(String, Object\[\]\)](InstancePath.md#parseappend-54d8f4d7c8da) from InstancePath
- [parseAppend\(String, Object\[\], List\<CSNode\>\)](InstancePath.md#parseappend-6e40353c0959) from InstancePath
- [quoteByteArray\(byte\[\]\)](InstancePath.md#quotebytearray-1889d341fdce) from InstancePath
- [quoteString\(String, boolean\)](InstancePath.md#quotestring-2ccae847ff76) from InstancePath
- [setMountIdGetter\(MountIdInterface\)](InstancePath.md#setmountidgetter-900228f8453c) from InstancePath
- [toKeyPathString\(\)](#tokeypathstring-bcccb457e808)
- [toString\(\)](#tostring-e9d48c5503ef)
- [toXPathString\(\)](InstancePath.md#toxpathstring-81906e391643) from InstancePath

## Constructors

### ConfXPath(String) <a href="#confxpath-3168fe5c5a30" id="confxpath-3168fe5c5a30"></a>

```java
public ConfXPath(String xpath) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String xpath`

### ConfXPath(String, MountIdInterface) <a href="#confxpath-c4fe4eab63ea" id="confxpath-c4fe4eab63ea"></a>

```java
public ConfXPath(
    String xpath,
    com.tailf.conf.MountIdInterface mountGetter
)
    throws com.tailf.conf.ConfException
```

Types: [MountIdInterface](MountIdInterface.md#mountidinterface-113d1b54dae0), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String xpath`
- `com.tailf.conf.MountIdInterface mountGetter`


## Methods

### chkDeferred() <a href="#chkdeferred-f66dc2317846" id="chkdeferred-f66dc2317846"></a>

```java
protected void chkDeferred()
```

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### getKP() <a href="#getkp-45b2f95adae4" id="getkp-45b2f95adae4"></a>

```java
public com.tailf.conf.ConfObject[] getKP()
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)

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

**Returns:** reverted array representation of this `ConfPath`

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### toKeyPathString() <a href="#tokeypathstring-bcccb457e808" id="tokeypathstring-bcccb457e808"></a>

```java
public String toKeyPathString()
```

return this path as a keypath string.

**Returns:** keypath string representation

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

return the Default String representation, which is the XPath string
 representation.

**Returns:** default string representation
