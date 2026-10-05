# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.NsInfo.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.NsInfo.Builder,com.tailf.ncs.maapi.Schema.NsInfo.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-9fa45dcc6d2d)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getModule()](Builder.md#m-getModule-68694513ccce) from Builder
- [getNshash()](Builder.md#m-getNshash-c5a7631eae00) from Builder
- [getPrefix()](Builder.md#m-getPrefix-9268091e0223) from Builder
- [getRevision()](Builder.md#m-getRevision-b0088aa9f0bf) from Builder
- [getRootNodes()](Builder.md#m-getRootNodes-63f2b6255095) from Builder
- [getTypes()](Builder.md#m-getTypes-cbd0de718034) from Builder
- [getUri()](Builder.md#m-getUri-e839fdd3e24c) from Builder
- [hasModule()](Builder.md#m-hasModule-8a9f381a7ff1) from Builder
- [hasPrefix()](Builder.md#m-hasPrefix-ddbc3bbca9c3) from Builder
- [hasRevision()](Builder.md#m-hasRevision-23a5e6a14bd8) from Builder
- [hasRootNodes()](Builder.md#m-hasRootNodes-251070d577eb) from Builder
- [hasTypes()](Builder.md#m-hasTypes-5c6311e6f402) from Builder
- [hasUri()](Builder.md#m-hasUri-d455832c8996) from Builder
- [initModule(int)](Builder.md#m-initModule-6f250f3d4d33) from Builder
- [initPrefix(int)](Builder.md#m-initPrefix-e25b609de101) from Builder
- [initRevision(int)](Builder.md#m-initRevision-6d5e3f6a1d81) from Builder
- [initRootNodes(int)](Builder.md#m-initRootNodes-2ddd2d777f31) from Builder
- [initTypes(int)](Builder.md#m-initTypes-a430a792b8dc) from Builder
- [initUri(int)](Builder.md#m-initUri-5c80765ae71e) from Builder
- [setModule(Reader)](Builder.md#m-setModule-4fd03b9a95b0) from Builder
- [setModule(String)](Builder.md#m-setModule-b4ace9c56bac) from Builder
- [setNshash(int)](Builder.md#m-setNshash-64dcf506c2e9) from Builder
- [setPrefix(Reader)](Builder.md#m-setPrefix-5c58f0bf0784) from Builder
- [setPrefix(String)](Builder.md#m-setPrefix-63fe622cb50c) from Builder
- [setRevision(Reader)](Builder.md#m-setRevision-9ccea35c025d) from Builder
- [setRevision(String)](Builder.md#m-setRevision-b079ce2468f4) from Builder
- [setRootNodes(Reader<Reader>)](Builder.md#m-setRootNodes-a8fbf63c1379) from Builder
- [setTypes(Reader<Reader>)](Builder.md#m-setTypes-85fe39ddeacf) from Builder
- [setUri(Reader)](Builder.md#m-setUri-456b36112135) from Builder
- [setUri(String)](Builder.md#m-setUri-7906e915939e) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-9fa45dcc6d2d" id="m-asReader-9fa45dcc6d2d"></a>

```java
public final com.tailf.ncs.maapi.Schema.NsInfo.Reader asReader(
    com.tailf.ncs.maapi.Schema.NsInfo.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.NsInfo.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.NsInfo.Builder constructBuilder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

Types: [Builder](Builder.md#cls-Builder)

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`

### constructReader(SegmentReader, int, int, int, short, int) <a href="#m-constructReader-fbce6f4f912a" id="m-constructReader-fbce6f4f912a"></a>

```java
public final com.tailf.ncs.maapi.Schema.NsInfo.Reader constructReader(
    org.capnproto.SegmentReader segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount,
    int nestingLimit
)
```

Types: [Reader](Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`

### structSize() <a href="#m-structSize-1fa68dcadd21" id="m-structSize-1fa68dcadd21"></a>

```java
public final org.capnproto.StructSize structSize()
```
