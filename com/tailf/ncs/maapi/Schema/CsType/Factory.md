# Factory <a href="#factory-1787784624e8" id="factory-1787784624e8"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsType.Builder,com.tailf.ncs.maapi.Schema.CsType.Reader>
```

Types: [Builder](Builder.md#builder-21f09e83781d), [Reader](Reader.md#reader-b2467a96ddff)

## Members

**Constructors**:

- [Factory()](#factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#asreader-11797013b2fb)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#constructreader-fbce6f4f912a)
- [getName()](Builder.md#getname-2634b18b4a25) from Builder
- [getNs()](Builder.md#getns-59b97eae2a4a) from Builder
- [getParent()](Builder.md#getparent-45c1b196ed70) from Builder
- [getValue()](Builder.md#getvalue-d93864668c40) from Builder
- [hasName()](Builder.md#hasname-bfe6c334e0d1) from Builder
- [initName(int)](Builder.md#initname-281e5d2102d4) from Builder
- [initParent()](Builder.md#initparent-42003b75a7dd) from Builder
- [initValue()](Builder.md#initvalue-a7755fffc529) from Builder
- [setName(Reader)](Builder.md#setname-79f9d1263a41) from Builder
- [setName(String)](Builder.md#setname-c76ccfcb9f18) from Builder
- [setNs(int)](Builder.md#setns-3c6980dbfd35) from Builder
- [setParent(Reader)](Builder.md#setparent-9ed68f47e1db) from Builder
- [structSize()](#structsize-1fa68dcadd21)

## Constructors

### Factory() <a href="#factory-0e9f9d7f4e84" id="factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#asreader-11797013b2fb" id="asreader-11797013b2fb"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsType.Builder builder
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff), [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsType.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#constructbuilder-5a2abf3209f9" id="constructbuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsType.Reader constructReader(
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
