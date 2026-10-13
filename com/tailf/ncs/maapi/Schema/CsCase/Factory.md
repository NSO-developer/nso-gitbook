# Factory <a href="#factory-1787784624e8" id="factory-1787784624e8"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsCase.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsCase.Builder,com.tailf.ncs.maapi.Schema.CsCase.Reader>
```

Types: [Builder](Builder.md#builder-21f09e83781d), [Reader](Reader.md#reader-b2467a96ddff)

## Members

**Constructors**:

- [Factory\(\)](#factory-0e9f9d7f4e84)

**Methods**:

- [asReader\(\)](Builder.md#asreader-b5c0f2a8d115) from Builder
- [asReader\(Builder\)](#asreader-c95af3b17623)
- [constructBuilder\(SegmentBuilder, int, int, int, short\)](#constructbuilder-5a2abf3209f9)
- [constructReader\(SegmentReader, int, int, int, short, int\)](#constructreader-fbce6f4f912a)
- [getChoices\(\)](Builder.md#getchoices-818fb3fccb86) from Builder
- [getHns\(\)](Builder.md#gethns-457afaf41ae6) from Builder
- [getHtag\(\)](Builder.md#gethtag-3a838d71ddf7) from Builder
- [getNodes\(\)](Builder.md#getnodes-0d0e9b3adfd1) from Builder
- [hasChoices\(\)](Builder.md#haschoices-6534dc5f2f55) from Builder
- [hasNodes\(\)](Builder.md#hasnodes-0c3a4b7d62ab) from Builder
- [initChoices\(int\)](Builder.md#initchoices-6d6ca0d6d87e) from Builder
- [initNodes\(int\)](Builder.md#initnodes-ae27813ecc84) from Builder
- [setChoices\(Reader\<Reader\>\)](Builder.md#setchoices-6c56beb14596) from Builder
- [setHns\(int\)](Builder.md#sethns-7405e78f40fe) from Builder
- [setHtag\(int\)](Builder.md#sethtag-d40f4d76b210) from Builder
- [setNodes\(Reader\<Reader\>\)](Builder.md#setnodes-1a7a637d61d9) from Builder
- [structSize\(\)](#structsize-1fa68dcadd21)

## Constructors

### Factory() <a href="#factory-0e9f9d7f4e84" id="factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#asreader-c95af3b17623" id="asreader-c95af3b17623"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsCase.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsCase.Builder builder
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff), [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsCase.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#constructbuilder-5a2abf3209f9" id="constructbuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsCase.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsCase.Reader constructReader(
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
