# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsChoice.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsChoice.Builder,com.tailf.ncs.maapi.Schema.CsChoice.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-17674457d941)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getCases()](Builder.md#m-getCases-42abc2944fb1) from Builder
- [getDefCase()](Builder.md#m-getDefCase-593fa181831e) from Builder
- [getHns()](Builder.md#m-getHns-457afaf41ae6) from Builder
- [getHtag()](Builder.md#m-getHtag-3a838d71ddf7) from Builder
- [getMinOccurs()](Builder.md#m-getMinOccurs-cac79959dff8) from Builder
- [hasCases()](Builder.md#m-hasCases-682cbddafe6a) from Builder
- [initCases(int)](Builder.md#m-initCases-102f13b140b1) from Builder
- [initDefCase()](Builder.md#m-initDefCase-ddb954b8162e) from Builder
- [setCases(Reader<Reader>)](Builder.md#m-setCases-0a50d2d330ee) from Builder
- [setDefCase(Reader)](Builder.md#m-setDefCase-aa1695d9bbde) from Builder
- [setHns(int)](Builder.md#m-setHns-7405e78f40fe) from Builder
- [setHtag(int)](Builder.md#m-setHtag-d40f4d76b210) from Builder
- [setMinOccurs(int)](Builder.md#m-setMinOccurs-2cb1f96150f8) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-17674457d941" id="m-asReader-17674457d941"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsChoice.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsChoice.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsChoice.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsChoice.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsChoice.Reader constructReader(
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
