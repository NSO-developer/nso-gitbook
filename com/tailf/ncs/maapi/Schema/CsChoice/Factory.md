<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsChoice.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsChoice.Builder,com.tailf.ncs.maapi.Schema.CsChoice.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-17674457d941)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getCases()](Builder.md#m-getcases-42abc2944fb1) from Builder
- [getDefCase()](Builder.md#m-getdefcase-593fa181831e) from Builder
- [getHns()](Builder.md#m-gethns-457afaf41ae6) from Builder
- [getHtag()](Builder.md#m-gethtag-3a838d71ddf7) from Builder
- [getMinOccurs()](Builder.md#m-getminoccurs-cac79959dff8) from Builder
- [hasCases()](Builder.md#m-hascases-682cbddafe6a) from Builder
- [initCases(int)](Builder.md#m-initcases-102f13b140b1) from Builder
- [initDefCase()](Builder.md#m-initdefcase-ddb954b8162e) from Builder
- [setCases(Reader<Reader>)](Builder.md#m-setcases-0a50d2d330ee) from Builder
- [setDefCase(Reader)](Builder.md#m-setdefcase-aa1695d9bbde) from Builder
- [setHns(int)](Builder.md#m-sethns-7405e78f40fe) from Builder
- [setHtag(int)](Builder.md#m-sethtag-d40f4d76b210) from Builder
- [setMinOccurs(int)](Builder.md#m-setminoccurs-2cb1f96150f8) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-17674457d941"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.CsChoice.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsChoice.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsChoice.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

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

<a id="m-constructreader-fbce6f4f912a"></a>
### constructReader(SegmentReader, int, int, int, short, int)

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

<a id="m-structsize-1fa68dcadd21"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
