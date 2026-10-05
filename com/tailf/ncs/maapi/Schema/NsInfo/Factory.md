# Factory <a href="#factory-1787784624e8" id="factory-1787784624e8"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.NsInfo.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.NsInfo.Builder,com.tailf.ncs.maapi.Schema.NsInfo.Reader>
```

Types: [Builder](Builder.md#builder-21f09e83781d), [Reader](Reader.md#reader-b2467a96ddff)

## Members

**Constructors**:

- [Factory()](#factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#asreader-9fa45dcc6d2d)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#constructreader-fbce6f4f912a)
- [getModule()](Builder.md#getmodule-68694513ccce) from Builder
- [getNshash()](Builder.md#getnshash-c5a7631eae00) from Builder
- [getPrefix()](Builder.md#getprefix-9268091e0223) from Builder
- [getRevision()](Builder.md#getrevision-b0088aa9f0bf) from Builder
- [getRootNodes()](Builder.md#getrootnodes-63f2b6255095) from Builder
- [getTypes()](Builder.md#gettypes-cbd0de718034) from Builder
- [getUri()](Builder.md#geturi-e839fdd3e24c) from Builder
- [hasModule()](Builder.md#hasmodule-8a9f381a7ff1) from Builder
- [hasPrefix()](Builder.md#hasprefix-ddbc3bbca9c3) from Builder
- [hasRevision()](Builder.md#hasrevision-23a5e6a14bd8) from Builder
- [hasRootNodes()](Builder.md#hasrootnodes-251070d577eb) from Builder
- [hasTypes()](Builder.md#hastypes-5c6311e6f402) from Builder
- [hasUri()](Builder.md#hasuri-d455832c8996) from Builder
- [initModule(int)](Builder.md#initmodule-6f250f3d4d33) from Builder
- [initPrefix(int)](Builder.md#initprefix-e25b609de101) from Builder
- [initRevision(int)](Builder.md#initrevision-6d5e3f6a1d81) from Builder
- [initRootNodes(int)](Builder.md#initrootnodes-2ddd2d777f31) from Builder
- [initTypes(int)](Builder.md#inittypes-a430a792b8dc) from Builder
- [initUri(int)](Builder.md#inituri-5c80765ae71e) from Builder
- [setModule(Reader)](Builder.md#setmodule-4fd03b9a95b0) from Builder
- [setModule(String)](Builder.md#setmodule-b4ace9c56bac) from Builder
- [setNshash(int)](Builder.md#setnshash-64dcf506c2e9) from Builder
- [setPrefix(Reader)](Builder.md#setprefix-5c58f0bf0784) from Builder
- [setPrefix(String)](Builder.md#setprefix-63fe622cb50c) from Builder
- [setRevision(Reader)](Builder.md#setrevision-9ccea35c025d) from Builder
- [setRevision(String)](Builder.md#setrevision-b079ce2468f4) from Builder
- [setRootNodes(Reader<Reader>)](Builder.md#setrootnodes-a8fbf63c1379) from Builder
- [setTypes(Reader<Reader>)](Builder.md#settypes-85fe39ddeacf) from Builder
- [setUri(Reader)](Builder.md#seturi-456b36112135) from Builder
- [setUri(String)](Builder.md#seturi-7906e915939e) from Builder
- [structSize()](#structsize-1fa68dcadd21)

## Constructors

### Factory() <a href="#factory-0e9f9d7f4e84" id="factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#asreader-9fa45dcc6d2d" id="asreader-9fa45dcc6d2d"></a>

```java
public final com.tailf.ncs.maapi.Schema.NsInfo.Reader asReader(
    com.tailf.ncs.maapi.Schema.NsInfo.Builder builder
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff), [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `com.tailf.ncs.maapi.Schema.NsInfo.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#constructbuilder-5a2abf3209f9" id="constructbuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.NsInfo.Builder constructBuilder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

Types: [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`

### constructReader(SegmentReader, int, int, int, short, int) <a href="#constructreader-fbce6f4f912a" id="constructreader-fbce6f4f912a"></a>

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

Types: [Reader](Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`

### structSize() <a href="#structsize-1fa68dcadd21" id="structsize-1fa68dcadd21"></a>

```java
public final org.capnproto.StructSize structSize()
```
