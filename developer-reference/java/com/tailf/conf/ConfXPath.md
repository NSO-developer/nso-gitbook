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

**Methods**:

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

*Description from* [`InstancePath.hashCode()`](InstancePath.md#hashcode-ef797a217903)

Returns a hash code value for the path. This method is
 supported for the benefit of hash tables such as those provided by
 `java.util.Hashtable`.

 The hash code is calculated from its component of `ConfTag`
 and `ConfKey`.

**Returns:** a hash code value for this object.

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
