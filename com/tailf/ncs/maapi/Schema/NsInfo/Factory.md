<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.NsInfo.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.NsInfo.Builder,com.tailf.ncs.maapi.Schema.NsInfo.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-9fa45dcc6d2d)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getModule()](Builder.md#m-getmodule-68694513ccce) from Builder
- [getNshash()](Builder.md#m-getnshash-c5a7631eae00) from Builder
- [getPrefix()](Builder.md#m-getprefix-9268091e0223) from Builder
- [getRevision()](Builder.md#m-getrevision-b0088aa9f0bf) from Builder
- [getRootNodes()](Builder.md#m-getrootnodes-63f2b6255095) from Builder
- [getTypes()](Builder.md#m-gettypes-cbd0de718034) from Builder
- [getUri()](Builder.md#m-geturi-e839fdd3e24c) from Builder
- [hasModule()](Builder.md#m-hasmodule-8a9f381a7ff1) from Builder
- [hasPrefix()](Builder.md#m-hasprefix-ddbc3bbca9c3) from Builder
- [hasRevision()](Builder.md#m-hasrevision-23a5e6a14bd8) from Builder
- [hasRootNodes()](Builder.md#m-hasrootnodes-251070d577eb) from Builder
- [hasTypes()](Builder.md#m-hastypes-5c6311e6f402) from Builder
- [hasUri()](Builder.md#m-hasuri-d455832c8996) from Builder
- [initModule(int)](Builder.md#m-initmodule-6f250f3d4d33) from Builder
- [initPrefix(int)](Builder.md#m-initprefix-e25b609de101) from Builder
- [initRevision(int)](Builder.md#m-initrevision-6d5e3f6a1d81) from Builder
- [initRootNodes(int)](Builder.md#m-initrootnodes-2ddd2d777f31) from Builder
- [initTypes(int)](Builder.md#m-inittypes-a430a792b8dc) from Builder
- [initUri(int)](Builder.md#m-inituri-5c80765ae71e) from Builder
- [setModule(Reader)](Builder.md#m-setmodule-4fd03b9a95b0) from Builder
- [setModule(String)](Builder.md#m-setmodule-b4ace9c56bac) from Builder
- [setNshash(int)](Builder.md#m-setnshash-64dcf506c2e9) from Builder
- [setPrefix(Reader)](Builder.md#m-setprefix-5c58f0bf0784) from Builder
- [setPrefix(String)](Builder.md#m-setprefix-63fe622cb50c) from Builder
- [setRevision(Reader)](Builder.md#m-setrevision-9ccea35c025d) from Builder
- [setRevision(String)](Builder.md#m-setrevision-b079ce2468f4) from Builder
- [setRootNodes(Reader<Reader>)](Builder.md#m-setrootnodes-a8fbf63c1379) from Builder
- [setTypes(Reader<Reader>)](Builder.md#m-settypes-85fe39ddeacf) from Builder
- [setUri(Reader)](Builder.md#m-seturi-456b36112135) from Builder
- [setUri(String)](Builder.md#m-seturi-7906e915939e) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-9fa45dcc6d2d"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.NsInfo.Reader asReader(
    com.tailf.ncs.maapi.Schema.NsInfo.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.NsInfo.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

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

<a id="m-constructreader-fbce6f4f912a"></a>
### constructReader(SegmentReader, int, int, int, short, int)

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

<a id="m-structsize-1fa68dcadd21"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
