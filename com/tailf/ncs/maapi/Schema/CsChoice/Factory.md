# Factory <a href="#factory-1787784624e8" id="factory-1787784624e8"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsChoice.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsChoice.Builder,com.tailf.ncs.maapi.Schema.CsChoice.Reader>
```

Types: [Builder](Builder.md#builder-21f09e83781d), [Reader](Reader.md#reader-b2467a96ddff)

## Members

**Constructors**:

- [Factory\(\)](#factory-0e9f9d7f4e84)

**Methods**:

- [asReader\(\)](Builder.md#asreader-b5c0f2a8d115) from Builder
- [asReader\(Builder\)](#asreader-17674457d941)
- [constructBuilder\(SegmentBuilder, int, int, int, short\)](#constructbuilder-5a2abf3209f9)
- [constructReader\(SegmentReader, int, int, int, short, int\)](#constructreader-fbce6f4f912a)
- [getCases\(\)](Builder.md#getcases-42abc2944fb1) from Builder
- [getDefCase\(\)](Builder.md#getdefcase-593fa181831e) from Builder
- [getHns\(\)](Builder.md#gethns-457afaf41ae6) from Builder
- [getHtag\(\)](Builder.md#gethtag-3a838d71ddf7) from Builder
- [getMinOccurs\(\)](Builder.md#getminoccurs-cac79959dff8) from Builder
- [hasCases\(\)](Builder.md#hascases-682cbddafe6a) from Builder
- [initCases\(int\)](Builder.md#initcases-102f13b140b1) from Builder
- [initDefCase\(\)](Builder.md#initdefcase-ddb954b8162e) from Builder
- [setCases\(Reader\<Reader\>\)](Builder.md#setcases-0a50d2d330ee) from Builder
- [setDefCase\(Reader\)](Builder.md#setdefcase-aa1695d9bbde) from Builder
- [setHns\(int\)](Builder.md#sethns-7405e78f40fe) from Builder
- [setHtag\(int\)](Builder.md#sethtag-d40f4d76b210) from Builder
- [setMinOccurs\(int\)](Builder.md#setminoccurs-2cb1f96150f8) from Builder
- [structSize\(\)](#structsize-1fa68dcadd21)

## Constructors

### Factory() <a href="#factory-0e9f9d7f4e84" id="factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#asreader-17674457d941" id="asreader-17674457d941"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsChoice.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsChoice.Builder builder
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff), [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsChoice.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#constructbuilder-5a2abf3209f9" id="constructbuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsChoice.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsChoice.Reader constructReader(
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
