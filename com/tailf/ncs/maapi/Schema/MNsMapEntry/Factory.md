# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMapEntry.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder,com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-4e0a650997b2)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getModname()](Builder.md#m-getModname-40cd7f77aac9) from Builder
- [getNs()](Builder.md#m-getNs-59b97eae2a4a) from Builder
- [getNsHash()](Builder.md#m-getNsHash-f6f3e3ae1e6b) from Builder
- [getPrefix()](Builder.md#m-getPrefix-9268091e0223) from Builder
- [getXmlns()](Builder.md#m-getXmlns-e2c0fd08466b) from Builder
- [hasModname()](Builder.md#m-hasModname-fdd47b76b94a) from Builder
- [hasNs()](Builder.md#m-hasNs-9cd343037be1) from Builder
- [hasPrefix()](Builder.md#m-hasPrefix-ddbc3bbca9c3) from Builder
- [hasXmlns()](Builder.md#m-hasXmlns-3eb601ca5705) from Builder
- [initModname(int)](Builder.md#m-initModname-adbe25a612a2) from Builder
- [initNs(int)](Builder.md#m-initNs-594e96675702) from Builder
- [initPrefix(int)](Builder.md#m-initPrefix-e25b609de101) from Builder
- [initXmlns(int)](Builder.md#m-initXmlns-17805c1c0d5c) from Builder
- [setModname(Reader)](Builder.md#m-setModname-fe28ed5ab65b) from Builder
- [setModname(String)](Builder.md#m-setModname-885ff7e8e342) from Builder
- [setNs(Reader)](Builder.md#m-setNs-dcd01c91436e) from Builder
- [setNs(String)](Builder.md#m-setNs-510adfcd3e70) from Builder
- [setNsHash(int)](Builder.md#m-setNsHash-856e3c88b24a) from Builder
- [setPrefix(Reader)](Builder.md#m-setPrefix-5c58f0bf0784) from Builder
- [setPrefix(String)](Builder.md#m-setPrefix-63fe622cb50c) from Builder
- [setXmlns(Reader)](Builder.md#m-setXmlns-333e49621e27) from Builder
- [setXmlns(String)](Builder.md#m-setXmlns-8666c0c76ee9) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-4e0a650997b2" id="m-asReader-4e0a650997b2"></a>

```java
public final com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader asReader(
    com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader constructReader(
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
