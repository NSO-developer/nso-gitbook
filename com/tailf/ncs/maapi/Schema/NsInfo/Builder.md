<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.NsInfo.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getModule()](#s-getModule)
- [getNshash()](#s-getNshash)
- [getPrefix()](#s-getPrefix)
- [getRevision()](#s-getRevision)
- [getRootNodes()](#s-getRootNodes)
- [getTypes()](#s-getTypes)
- [getUri()](#s-getUri)
- [hasModule()](#s-hasModule)
- [hasPrefix()](#s-hasPrefix)
- [hasRevision()](#s-hasRevision)
- [hasRootNodes()](#s-hasRootNodes)
- [hasTypes()](#s-hasTypes)
- [hasUri()](#s-hasUri)
- [initModule(int)](#s-initModule)
- [initPrefix(int)](#s-initPrefix)
- [initRevision(int)](#s-initRevision)
- [initRootNodes(int)](#s-initRootNodes)
- [initTypes(int)](#s-initTypes)
- [initUri(int)](#s-initUri)
- [setModule(Reader)](#s-setModule)
- [setModule(String)](#s-setModule-1)
- [setNshash(int)](#s-setNshash)
- [setPrefix(Reader)](#s-setPrefix)
- [setPrefix(String)](#s-setPrefix-1)
- [setRevision(Reader)](#s-setRevision)
- [setRevision(String)](#s-setRevision-1)
- [setRootNodes(Reader<Reader>)](#s-setRootNodes)
- [setTypes(Reader<Reader>)](#s-setTypes)
- [setUri(Reader)](#s-setUri)
- [setUri(String)](#s-setUri-1)

## Constructors

<a id="s-Builder-1"></a>
### Builder(SegmentBuilder, int, int, int, short)

**Package-private**

```java
Builder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`


## Methods

<a id="s-asReader"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.NsInfo.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getModule"></a>
### getModule()

```java
public final org.capnproto.Text.Builder getModule()
```

<a id="s-getNshash"></a>
### getNshash()

```java
public final int getNshash()
```

<a id="s-getPrefix"></a>
### getPrefix()

```java
public final org.capnproto.Text.Builder getPrefix()
```

<a id="s-getRevision"></a>
### getRevision()

```java
public final org.capnproto.Text.Builder getRevision()
```

<a id="s-getRootNodes"></a>
### getRootNodes()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> getRootNodes()
```

Types: [Builder](../QTag/Builder.md#s-Builder)

<a id="s-getTypes"></a>
### getTypes()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.NamedType.Builder> getTypes()
```

Types: [Builder](../NamedType/Builder.md#s-Builder)

<a id="s-getUri"></a>
### getUri()

```java
public final org.capnproto.Text.Builder getUri()
```

<a id="s-hasModule"></a>
### hasModule()

```java
public final boolean hasModule()
```

<a id="s-hasPrefix"></a>
### hasPrefix()

```java
public final boolean hasPrefix()
```

<a id="s-hasRevision"></a>
### hasRevision()

```java
public final boolean hasRevision()
```

<a id="s-hasRootNodes"></a>
### hasRootNodes()

```java
public final boolean hasRootNodes()
```

<a id="s-hasTypes"></a>
### hasTypes()

```java
public final boolean hasTypes()
```

<a id="s-hasUri"></a>
### hasUri()

```java
public final boolean hasUri()
```

<a id="s-initModule"></a>
### initModule(int)

```java
public final org.capnproto.Text.Builder initModule(int size)
```

**Parameters**

- `int size`

<a id="s-initPrefix"></a>
### initPrefix(int)

```java
public final org.capnproto.Text.Builder initPrefix(int size)
```

**Parameters**

- `int size`

<a id="s-initRevision"></a>
### initRevision(int)

```java
public final org.capnproto.Text.Builder initRevision(int size)
```

**Parameters**

- `int size`

<a id="s-initRootNodes"></a>
### initRootNodes(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> initRootNodes(
    int size
)
```

Types: [Builder](../QTag/Builder.md#s-Builder)

**Parameters**

- `int size`

<a id="s-initTypes"></a>
### initTypes(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.NamedType.Builder> initTypes(
    int size
)
```

Types: [Builder](../NamedType/Builder.md#s-Builder)

**Parameters**

- `int size`

<a id="s-initUri"></a>
### initUri(int)

```java
public final org.capnproto.Text.Builder initUri(int size)
```

**Parameters**

- `int size`

<a id="s-setModule"></a>
### setModule(Reader)

```java
public final void setModule(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="s-setModule-1"></a>
### setModule(String)

```java
public final void setModule(String value)
```

**Parameters**

- `String value`

<a id="s-setNshash"></a>
### setNshash(int)

```java
public final void setNshash(int value)
```

**Parameters**

- `int value`

<a id="s-setPrefix"></a>
### setPrefix(Reader)

```java
public final void setPrefix(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="s-setPrefix-1"></a>
### setPrefix(String)

```java
public final void setPrefix(String value)
```

**Parameters**

- `String value`

<a id="s-setRevision"></a>
### setRevision(Reader)

```java
public final void setRevision(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="s-setRevision-1"></a>
### setRevision(String)

```java
public final void setRevision(String value)
```

**Parameters**

- `String value`

<a id="s-setRootNodes"></a>
### setRootNodes(Reader<Reader>)

```java
public final void setRootNodes(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value
)
```

Types: [Reader](../QTag/Reader.md#s-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value`

<a id="s-setTypes"></a>
### setTypes(Reader<Reader>)

```java
public final void setTypes(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NamedType.Reader> value
)
```

Types: [Reader](../NamedType/Reader.md#s-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NamedType.Reader> value`

<a id="s-setUri"></a>
### setUri(Reader)

```java
public final void setUri(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="s-setUri-1"></a>
### setUri(String)

```java
public final void setUri(String value)
```

**Parameters**

- `String value`
