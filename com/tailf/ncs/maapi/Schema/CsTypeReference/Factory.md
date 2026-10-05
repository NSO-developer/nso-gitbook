# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeReference.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsTypeReference.Builder,com.tailf.ncs.maapi.Schema.CsTypeReference.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-810714948846)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getName()](Builder.md#m-getName-2634b18b4a25) from Builder
- [getNsHash()](Builder.md#m-getNsHash-f6f3e3ae1e6b) from Builder
- [hasName()](Builder.md#m-hasName-bfe6c334e0d1) from Builder
- [initName(int)](Builder.md#m-initName-281e5d2102d4) from Builder
- [setName(Reader)](Builder.md#m-setName-79f9d1263a41) from Builder
- [setName(String)](Builder.md#m-setName-c76ccfcb9f18) from Builder
- [setNsHash(int)](Builder.md#m-setNsHash-856e3c88b24a) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-810714948846" id="m-asReader-810714948846"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeReference.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsTypeReference.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeReference.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeReference.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsTypeReference.Reader constructReader(
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
