<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.NsInfo.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getModule()](#m-getmodule-68694513ccce)
- [getNshash()](#m-getnshash-c5a7631eae00)
- [getPrefix()](#m-getprefix-9268091e0223)
- [getRevision()](#m-getrevision-b0088aa9f0bf)
- [getRootNodes()](#m-getrootnodes-63f2b6255095)
- [getTypes()](#m-gettypes-cbd0de718034)
- [getUri()](#m-geturi-e839fdd3e24c)
- [hasModule()](#m-hasmodule-8a9f381a7ff1)
- [hasPrefix()](#m-hasprefix-ddbc3bbca9c3)
- [hasRevision()](#m-hasrevision-23a5e6a14bd8)
- [hasRootNodes()](#m-hasrootnodes-251070d577eb)
- [hasTypes()](#m-hastypes-5c6311e6f402)
- [hasUri()](#m-hasuri-d455832c8996)
- [initModule(int)](#m-initmodule-6f250f3d4d33)
- [initPrefix(int)](#m-initprefix-e25b609de101)
- [initRevision(int)](#m-initrevision-6d5e3f6a1d81)
- [initRootNodes(int)](#m-initrootnodes-2ddd2d777f31)
- [initTypes(int)](#m-inittypes-a430a792b8dc)
- [initUri(int)](#m-inituri-5c80765ae71e)
- [setModule(Reader)](#m-setmodule-4fd03b9a95b0)
- [setModule(String)](#m-setmodule-b4ace9c56bac)
- [setNshash(int)](#m-setnshash-64dcf506c2e9)
- [setPrefix(Reader)](#m-setprefix-5c58f0bf0784)
- [setPrefix(String)](#m-setprefix-63fe622cb50c)
- [setRevision(Reader)](#m-setrevision-9ccea35c025d)
- [setRevision(String)](#m-setrevision-b079ce2468f4)
- [setRootNodes(Reader<Reader>)](#m-setrootnodes-a8fbf63c1379)
- [setTypes(Reader<Reader>)](#m-settypes-85fe39ddeacf)
- [setUri(Reader)](#m-seturi-456b36112135)
- [setUri(String)](#m-seturi-7906e915939e)

## Constructors

<a id="m-builder-179fba5038bd"></a>
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

<a id="m-asreader-b5c0f2a8d115"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.NsInfo.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getmodule-68694513ccce"></a>
### getModule()

```java
public final org.capnproto.Text.Builder getModule()
```

<a id="m-getnshash-c5a7631eae00"></a>
### getNshash()

```java
public final int getNshash()
```

<a id="m-getprefix-9268091e0223"></a>
### getPrefix()

```java
public final org.capnproto.Text.Builder getPrefix()
```

<a id="m-getrevision-b0088aa9f0bf"></a>
### getRevision()

```java
public final org.capnproto.Text.Builder getRevision()
```

<a id="m-getrootnodes-63f2b6255095"></a>
### getRootNodes()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> getRootNodes()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

<a id="m-gettypes-cbd0de718034"></a>
### getTypes()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.NamedType.Builder> getTypes()
```

Types: [Builder](../NamedType/Builder.md#cls-Builder)

<a id="m-geturi-e839fdd3e24c"></a>
### getUri()

```java
public final org.capnproto.Text.Builder getUri()
```

<a id="m-hasmodule-8a9f381a7ff1"></a>
### hasModule()

```java
public final boolean hasModule()
```

<a id="m-hasprefix-ddbc3bbca9c3"></a>
### hasPrefix()

```java
public final boolean hasPrefix()
```

<a id="m-hasrevision-23a5e6a14bd8"></a>
### hasRevision()

```java
public final boolean hasRevision()
```

<a id="m-hasrootnodes-251070d577eb"></a>
### hasRootNodes()

```java
public final boolean hasRootNodes()
```

<a id="m-hastypes-5c6311e6f402"></a>
### hasTypes()

```java
public final boolean hasTypes()
```

<a id="m-hasuri-d455832c8996"></a>
### hasUri()

```java
public final boolean hasUri()
```

<a id="m-initmodule-6f250f3d4d33"></a>
### initModule(int)

```java
public final org.capnproto.Text.Builder initModule(int size)
```

**Parameters**

- `int size`

<a id="m-initprefix-e25b609de101"></a>
### initPrefix(int)

```java
public final org.capnproto.Text.Builder initPrefix(int size)
```

**Parameters**

- `int size`

<a id="m-initrevision-6d5e3f6a1d81"></a>
### initRevision(int)

```java
public final org.capnproto.Text.Builder initRevision(int size)
```

**Parameters**

- `int size`

<a id="m-initrootnodes-2ddd2d777f31"></a>
### initRootNodes(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> initRootNodes(
    int size
)
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

**Parameters**

- `int size`

<a id="m-inittypes-a430a792b8dc"></a>
### initTypes(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.NamedType.Builder> initTypes(
    int size
)
```

Types: [Builder](../NamedType/Builder.md#cls-Builder)

**Parameters**

- `int size`

<a id="m-inituri-5c80765ae71e"></a>
### initUri(int)

```java
public final org.capnproto.Text.Builder initUri(int size)
```

**Parameters**

- `int size`

<a id="m-setmodule-4fd03b9a95b0"></a>
### setModule(Reader)

```java
public final void setModule(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="m-setmodule-b4ace9c56bac"></a>
### setModule(String)

```java
public final void setModule(String value)
```

**Parameters**

- `String value`

<a id="m-setnshash-64dcf506c2e9"></a>
### setNshash(int)

```java
public final void setNshash(int value)
```

**Parameters**

- `int value`

<a id="m-setprefix-5c58f0bf0784"></a>
### setPrefix(Reader)

```java
public final void setPrefix(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="m-setprefix-63fe622cb50c"></a>
### setPrefix(String)

```java
public final void setPrefix(String value)
```

**Parameters**

- `String value`

<a id="m-setrevision-9ccea35c025d"></a>
### setRevision(Reader)

```java
public final void setRevision(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="m-setrevision-b079ce2468f4"></a>
### setRevision(String)

```java
public final void setRevision(String value)
```

**Parameters**

- `String value`

<a id="m-setrootnodes-a8fbf63c1379"></a>
### setRootNodes(Reader<Reader>)

```java
public final void setRootNodes(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value
)
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value`

<a id="m-settypes-85fe39ddeacf"></a>
### setTypes(Reader<Reader>)

```java
public final void setTypes(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NamedType.Reader> value
)
```

Types: [Reader](../NamedType/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NamedType.Reader> value`

<a id="m-seturi-456b36112135"></a>
### setUri(Reader)

```java
public final void setUri(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="m-seturi-7906e915939e"></a>
### setUri(String)

```java
public final void setUri(String value)
```

**Parameters**

- `String value`
