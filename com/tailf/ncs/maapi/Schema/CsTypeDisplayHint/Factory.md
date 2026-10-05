# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder,com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-ae13a30c9383)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getDisplayHint()](Builder.md#m-getDisplayHint-f9cb8b7f487f) from Builder
- [hasDisplayHint()](Builder.md#m-hasDisplayHint-a0d050b8aab0) from Builder
- [initDisplayHint(int)](Builder.md#m-initDisplayHint-c16e1e013565) from Builder
- [setDisplayHint(byte[])](Builder.md#m-setDisplayHint-a6a8c5e2aab1) from Builder
- [setDisplayHint(Reader)](Builder.md#m-setDisplayHint-29d7604e3fc3) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-ae13a30c9383" id="m-asReader-ae13a30c9383"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader constructReader(
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
