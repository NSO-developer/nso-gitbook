# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.NsInfo.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getModule\(\)](#getmodule-68694513ccce)
- [getNshash\(\)](#getnshash-c5a7631eae00)
- [getPrefix\(\)](#getprefix-9268091e0223)
- [getRevision\(\)](#getrevision-b0088aa9f0bf)
- [getRootNodes\(\)](#getrootnodes-63f2b6255095)
- [getTypes\(\)](#gettypes-cbd0de718034)
- [getUri\(\)](#geturi-e839fdd3e24c)
- [hasModule\(\)](#hasmodule-8a9f381a7ff1)
- [hasPrefix\(\)](#hasprefix-ddbc3bbca9c3)
- [hasRevision\(\)](#hasrevision-23a5e6a14bd8)
- [hasRootNodes\(\)](#hasrootnodes-251070d577eb)
- [hasTypes\(\)](#hastypes-5c6311e6f402)
- [hasUri\(\)](#hasuri-d455832c8996)
- [initModule\(int\)](#initmodule-6f250f3d4d33)
- [initPrefix\(int\)](#initprefix-e25b609de101)
- [initRevision\(int\)](#initrevision-6d5e3f6a1d81)
- [initRootNodes\(int\)](#initrootnodes-2ddd2d777f31)
- [initTypes\(int\)](#inittypes-a430a792b8dc)
- [initUri\(int\)](#inituri-5c80765ae71e)
- [setModule\(Reader\)](#setmodule-4fd03b9a95b0)
- [setModule\(String\)](#setmodule-b4ace9c56bac)
- [setNshash\(int\)](#setnshash-64dcf506c2e9)
- [setPrefix\(Reader\)](#setprefix-5c58f0bf0784)
- [setPrefix\(String\)](#setprefix-63fe622cb50c)
- [setRevision\(Reader\)](#setrevision-9ccea35c025d)
- [setRevision\(String\)](#setrevision-b079ce2468f4)
- [setRootNodes\(Reader\<Reader\>\)](#setrootnodes-a8fbf63c1379)
- [setTypes\(Reader\<Reader\>\)](#settypes-85fe39ddeacf)
- [setUri\(Reader\)](#seturi-456b36112135)
- [setUri\(String\)](#seturi-7906e915939e)

## Constructors

### Builder(SegmentBuilder, int, int, int, short) <a href="#builder-179fba5038bd" id="builder-179fba5038bd"></a>

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

### asReader() <a href="#asreader-b5c0f2a8d115" id="asreader-b5c0f2a8d115"></a>

```java
public final com.tailf.ncs.maapi.Schema.NsInfo.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getModule() <a href="#getmodule-68694513ccce" id="getmodule-68694513ccce"></a>

```java
public final org.capnproto.Text.Builder getModule()
```

### getNshash() <a href="#getnshash-c5a7631eae00" id="getnshash-c5a7631eae00"></a>

```java
public final int getNshash()
```

### getPrefix() <a href="#getprefix-9268091e0223" id="getprefix-9268091e0223"></a>

```java
public final org.capnproto.Text.Builder getPrefix()
```

### getRevision() <a href="#getrevision-b0088aa9f0bf" id="getrevision-b0088aa9f0bf"></a>

```java
public final org.capnproto.Text.Builder getRevision()
```

### getRootNodes() <a href="#getrootnodes-63f2b6255095" id="getrootnodes-63f2b6255095"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> getRootNodes()
```

Types: [Builder](../QTag/Builder.md#builder-21f09e83781d)

### getTypes() <a href="#gettypes-cbd0de718034" id="gettypes-cbd0de718034"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.NamedType.Builder> getTypes()
```

Types: [Builder](../NamedType/Builder.md#builder-21f09e83781d)

### getUri() <a href="#geturi-e839fdd3e24c" id="geturi-e839fdd3e24c"></a>

```java
public final org.capnproto.Text.Builder getUri()
```

### hasModule() <a href="#hasmodule-8a9f381a7ff1" id="hasmodule-8a9f381a7ff1"></a>

```java
public final boolean hasModule()
```

### hasPrefix() <a href="#hasprefix-ddbc3bbca9c3" id="hasprefix-ddbc3bbca9c3"></a>

```java
public final boolean hasPrefix()
```

### hasRevision() <a href="#hasrevision-23a5e6a14bd8" id="hasrevision-23a5e6a14bd8"></a>

```java
public final boolean hasRevision()
```

### hasRootNodes() <a href="#hasrootnodes-251070d577eb" id="hasrootnodes-251070d577eb"></a>

```java
public final boolean hasRootNodes()
```

### hasTypes() <a href="#hastypes-5c6311e6f402" id="hastypes-5c6311e6f402"></a>

```java
public final boolean hasTypes()
```

### hasUri() <a href="#hasuri-d455832c8996" id="hasuri-d455832c8996"></a>

```java
public final boolean hasUri()
```

### initModule(int) <a href="#initmodule-6f250f3d4d33" id="initmodule-6f250f3d4d33"></a>

```java
public final org.capnproto.Text.Builder initModule(int size)
```

**Parameters**

- `int size`

### initPrefix(int) <a href="#initprefix-e25b609de101" id="initprefix-e25b609de101"></a>

```java
public final org.capnproto.Text.Builder initPrefix(int size)
```

**Parameters**

- `int size`

### initRevision(int) <a href="#initrevision-6d5e3f6a1d81" id="initrevision-6d5e3f6a1d81"></a>

```java
public final org.capnproto.Text.Builder initRevision(int size)
```

**Parameters**

- `int size`

### initRootNodes(int) <a href="#initrootnodes-2ddd2d777f31" id="initrootnodes-2ddd2d777f31"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> initRootNodes(
    int size
)
```

Types: [Builder](../QTag/Builder.md#builder-21f09e83781d)

**Parameters**

- `int size`

### initTypes(int) <a href="#inittypes-a430a792b8dc" id="inittypes-a430a792b8dc"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.NamedType.Builder> initTypes(
    int size
)
```

Types: [Builder](../NamedType/Builder.md#builder-21f09e83781d)

**Parameters**

- `int size`

### initUri(int) <a href="#inituri-5c80765ae71e" id="inituri-5c80765ae71e"></a>

```java
public final org.capnproto.Text.Builder initUri(int size)
```

**Parameters**

- `int size`

### setModule(Reader) <a href="#setmodule-4fd03b9a95b0" id="setmodule-4fd03b9a95b0"></a>

```java
public final void setModule(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setModule(String) <a href="#setmodule-b4ace9c56bac" id="setmodule-b4ace9c56bac"></a>

```java
public final void setModule(String value)
```

**Parameters**

- `String value`

### setNshash(int) <a href="#setnshash-64dcf506c2e9" id="setnshash-64dcf506c2e9"></a>

```java
public final void setNshash(int value)
```

**Parameters**

- `int value`

### setPrefix(Reader) <a href="#setprefix-5c58f0bf0784" id="setprefix-5c58f0bf0784"></a>

```java
public final void setPrefix(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setPrefix(String) <a href="#setprefix-63fe622cb50c" id="setprefix-63fe622cb50c"></a>

```java
public final void setPrefix(String value)
```

**Parameters**

- `String value`

### setRevision(Reader) <a href="#setrevision-9ccea35c025d" id="setrevision-9ccea35c025d"></a>

```java
public final void setRevision(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setRevision(String) <a href="#setrevision-b079ce2468f4" id="setrevision-b079ce2468f4"></a>

```java
public final void setRevision(String value)
```

**Parameters**

- `String value`

### setRootNodes(Reader&lt;Reader&gt;) <a href="#setrootnodes-a8fbf63c1379" id="setrootnodes-a8fbf63c1379"></a>

```java
public final void setRootNodes(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value
)
```

Types: [Reader](../QTag/Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value`

### setTypes(Reader&lt;Reader&gt;) <a href="#settypes-85fe39ddeacf" id="settypes-85fe39ddeacf"></a>

```java
public final void setTypes(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NamedType.Reader> value
)
```

Types: [Reader](../NamedType/Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NamedType.Reader> value`

### setUri(Reader) <a href="#seturi-456b36112135" id="seturi-456b36112135"></a>

```java
public final void setUri(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setUri(String) <a href="#seturi-7906e915939e" id="seturi-7906e915939e"></a>

```java
public final void setUri(String value)
```

**Parameters**

- `String value`
