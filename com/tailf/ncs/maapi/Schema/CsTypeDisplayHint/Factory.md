<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder,com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-ae13a30c9383)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getDisplayHint()](Builder.md#m-getdisplayhint-f9cb8b7f487f) from Builder
- [hasDisplayHint()](Builder.md#m-hasdisplayhint-a0d050b8aab0) from Builder
- [initDisplayHint(int)](Builder.md#m-initdisplayhint-c16e1e013565) from Builder
- [setDisplayHint(byte[])](Builder.md#m-setdisplayhint-a6a8c5e2aab1) from Builder
- [setDisplayHint(Reader)](Builder.md#m-setdisplayhint-29d7604e3fc3) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-ae13a30c9383"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

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

<a id="m-constructreader-fbce6f4f912a"></a>
### constructReader(SegmentReader, int, int, int, short, int)

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

<a id="m-structsize-1fa68dcadd21"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
