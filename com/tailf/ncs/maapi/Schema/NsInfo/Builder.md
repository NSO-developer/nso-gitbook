# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.NsInfo.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getModule()](#m-getModule-68694513ccce)
- [getNshash()](#m-getNshash-c5a7631eae00)
- [getPrefix()](#m-getPrefix-9268091e0223)
- [getRevision()](#m-getRevision-b0088aa9f0bf)
- [getRootNodes()](#m-getRootNodes-63f2b6255095)
- [getTypes()](#m-getTypes-cbd0de718034)
- [getUri()](#m-getUri-e839fdd3e24c)
- [hasModule()](#m-hasModule-8a9f381a7ff1)
- [hasPrefix()](#m-hasPrefix-ddbc3bbca9c3)
- [hasRevision()](#m-hasRevision-23a5e6a14bd8)
- [hasRootNodes()](#m-hasRootNodes-251070d577eb)
- [hasTypes()](#m-hasTypes-5c6311e6f402)
- [hasUri()](#m-hasUri-d455832c8996)
- [initModule(int)](#m-initModule-6f250f3d4d33)
- [initPrefix(int)](#m-initPrefix-e25b609de101)
- [initRevision(int)](#m-initRevision-6d5e3f6a1d81)
- [initRootNodes(int)](#m-initRootNodes-2ddd2d777f31)
- [initTypes(int)](#m-initTypes-a430a792b8dc)
- [initUri(int)](#m-initUri-5c80765ae71e)
- [setModule(Reader)](#m-setModule-4fd03b9a95b0)
- [setModule(String)](#m-setModule-b4ace9c56bac)
- [setNshash(int)](#m-setNshash-64dcf506c2e9)
- [setPrefix(Reader)](#m-setPrefix-5c58f0bf0784)
- [setPrefix(String)](#m-setPrefix-63fe622cb50c)
- [setRevision(Reader)](#m-setRevision-9ccea35c025d)
- [setRevision(String)](#m-setRevision-b079ce2468f4)
- [setRootNodes(Reader<Reader>)](#m-setRootNodes-a8fbf63c1379)
- [setTypes(Reader<Reader>)](#m-setTypes-85fe39ddeacf)
- [setUri(Reader)](#m-setUri-456b36112135)
- [setUri(String)](#m-setUri-7906e915939e)

## Constructors

### Builder(SegmentBuilder, int, int, int, short) <a href="#m-Builder-179fba5038bd" id="m-Builder-179fba5038bd"></a>

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

### asReader() <a href="#m-asReader-b5c0f2a8d115" id="m-asReader-b5c0f2a8d115"></a>

```java
public final com.tailf.ncs.maapi.Schema.NsInfo.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getModule() <a href="#m-getModule-68694513ccce" id="m-getModule-68694513ccce"></a>

```java
public final org.capnproto.Text.Builder getModule()
```

### getNshash() <a href="#m-getNshash-c5a7631eae00" id="m-getNshash-c5a7631eae00"></a>

```java
public final int getNshash()
```

### getPrefix() <a href="#m-getPrefix-9268091e0223" id="m-getPrefix-9268091e0223"></a>

```java
public final org.capnproto.Text.Builder getPrefix()
```

### getRevision() <a href="#m-getRevision-b0088aa9f0bf" id="m-getRevision-b0088aa9f0bf"></a>

```java
public final org.capnproto.Text.Builder getRevision()
```

### getRootNodes() <a href="#m-getRootNodes-63f2b6255095" id="m-getRootNodes-63f2b6255095"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> getRootNodes()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

### getTypes() <a href="#m-getTypes-cbd0de718034" id="m-getTypes-cbd0de718034"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.NamedType.Builder> getTypes()
```

Types: [Builder](../NamedType/Builder.md#cls-Builder)

### getUri() <a href="#m-getUri-e839fdd3e24c" id="m-getUri-e839fdd3e24c"></a>

```java
public final org.capnproto.Text.Builder getUri()
```

### hasModule() <a href="#m-hasModule-8a9f381a7ff1" id="m-hasModule-8a9f381a7ff1"></a>

```java
public final boolean hasModule()
```

### hasPrefix() <a href="#m-hasPrefix-ddbc3bbca9c3" id="m-hasPrefix-ddbc3bbca9c3"></a>

```java
public final boolean hasPrefix()
```

### hasRevision() <a href="#m-hasRevision-23a5e6a14bd8" id="m-hasRevision-23a5e6a14bd8"></a>

```java
public final boolean hasRevision()
```

### hasRootNodes() <a href="#m-hasRootNodes-251070d577eb" id="m-hasRootNodes-251070d577eb"></a>

```java
public final boolean hasRootNodes()
```

### hasTypes() <a href="#m-hasTypes-5c6311e6f402" id="m-hasTypes-5c6311e6f402"></a>

```java
public final boolean hasTypes()
```

### hasUri() <a href="#m-hasUri-d455832c8996" id="m-hasUri-d455832c8996"></a>

```java
public final boolean hasUri()
```

### initModule(int) <a href="#m-initModule-6f250f3d4d33" id="m-initModule-6f250f3d4d33"></a>

```java
public final org.capnproto.Text.Builder initModule(int size)
```

**Parameters**

- `int size`

### initPrefix(int) <a href="#m-initPrefix-e25b609de101" id="m-initPrefix-e25b609de101"></a>

```java
public final org.capnproto.Text.Builder initPrefix(int size)
```

**Parameters**

- `int size`

### initRevision(int) <a href="#m-initRevision-6d5e3f6a1d81" id="m-initRevision-6d5e3f6a1d81"></a>

```java
public final org.capnproto.Text.Builder initRevision(int size)
```

**Parameters**

- `int size`

### initRootNodes(int) <a href="#m-initRootNodes-2ddd2d777f31" id="m-initRootNodes-2ddd2d777f31"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> initRootNodes(
    int size
)
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

**Parameters**

- `int size`

### initTypes(int) <a href="#m-initTypes-a430a792b8dc" id="m-initTypes-a430a792b8dc"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.NamedType.Builder> initTypes(
    int size
)
```

Types: [Builder](../NamedType/Builder.md#cls-Builder)

**Parameters**

- `int size`

### initUri(int) <a href="#m-initUri-5c80765ae71e" id="m-initUri-5c80765ae71e"></a>

```java
public final org.capnproto.Text.Builder initUri(int size)
```

**Parameters**

- `int size`

### setModule(Reader) <a href="#m-setModule-4fd03b9a95b0" id="m-setModule-4fd03b9a95b0"></a>

```java
public final void setModule(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setModule(String) <a href="#m-setModule-b4ace9c56bac" id="m-setModule-b4ace9c56bac"></a>

```java
public final void setModule(String value)
```

**Parameters**

- `String value`

### setNshash(int) <a href="#m-setNshash-64dcf506c2e9" id="m-setNshash-64dcf506c2e9"></a>

```java
public final void setNshash(int value)
```

**Parameters**

- `int value`

### setPrefix(Reader) <a href="#m-setPrefix-5c58f0bf0784" id="m-setPrefix-5c58f0bf0784"></a>

```java
public final void setPrefix(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setPrefix(String) <a href="#m-setPrefix-63fe622cb50c" id="m-setPrefix-63fe622cb50c"></a>

```java
public final void setPrefix(String value)
```

**Parameters**

- `String value`

### setRevision(Reader) <a href="#m-setRevision-9ccea35c025d" id="m-setRevision-9ccea35c025d"></a>

```java
public final void setRevision(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setRevision(String) <a href="#m-setRevision-b079ce2468f4" id="m-setRevision-b079ce2468f4"></a>

```java
public final void setRevision(String value)
```

**Parameters**

- `String value`

### setRootNodes(Reader<Reader>) <a href="#m-setRootNodes-a8fbf63c1379" id="m-setRootNodes-a8fbf63c1379"></a>

```java
public final void setRootNodes(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value
)
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value`

### setTypes(Reader<Reader>) <a href="#m-setTypes-85fe39ddeacf" id="m-setTypes-85fe39ddeacf"></a>

```java
public final void setTypes(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NamedType.Reader> value
)
```

Types: [Reader](../NamedType/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NamedType.Reader> value`

### setUri(Reader) <a href="#m-setUri-456b36112135" id="m-setUri-456b36112135"></a>

```java
public final void setUri(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setUri(String) <a href="#m-setUri-7906e915939e" id="m-setUri-7906e915939e"></a>

```java
public final void setUri(String value)
```

**Parameters**

- `String value`
