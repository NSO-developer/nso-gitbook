# Factory <a href="#factory-1787784624e8" id="factory-1787784624e8"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Meta.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.Cs.Meta.Builder,com.tailf.ncs.maapi.Schema.Cs.Meta.Reader>
```

Types: [Builder](Builder.md#builder-21f09e83781d), [Reader](Reader.md#reader-b2467a96ddff)

## Members

**Constructors**:

- [Factory\(\)](#factory-0e9f9d7f4e84)

**Methods**:

- [asReader\(\)](Builder.md#asreader-b5c0f2a8d115) from Builder
- [asReader\(Builder\)](#asreader-1ca430c3c281)
- [constructBuilder\(SegmentBuilder, int, int, int, short\)](#constructbuilder-5a2abf3209f9)
- [constructReader\(SegmentReader, int, int, int, short, int\)](#constructreader-fbce6f4f912a)
- [getList\(\)](Builder.md#getlist-bb3f8cbe83be) from Builder
- [getNone\(\)](Builder.md#getnone-e31bfdbffa7f) from Builder
- [hasList\(\)](Builder.md#haslist-3712d7ce73ac) from Builder
- [initList\(int\)](Builder.md#initlist-619d59db076f) from Builder
- [isList\(\)](Builder.md#islist-c36bce63b506) from Builder
- [isNone\(\)](Builder.md#isnone-e8a993ad0453) from Builder
- [setList\(Reader\<Reader\>\)](Builder.md#setlist-a943e0056004) from Builder
- [setNone\(Void\)](Builder.md#setnone-46764db867d5) from Builder
- [structSize\(\)](#structsize-1fa68dcadd21)
- [which\(\)](Builder.md#which-0b2d23db5ed0) from Builder

## Constructors

### Factory() <a href="#factory-0e9f9d7f4e84" id="factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#asreader-1ca430c3c281" id="asreader-1ca430c3c281"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Meta.Reader asReader(
    com.tailf.ncs.maapi.Schema.Cs.Meta.Builder builder
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff), [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `com.tailf.ncs.maapi.Schema.Cs.Meta.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#constructbuilder-5a2abf3209f9" id="constructbuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Meta.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.Cs.Meta.Reader constructReader(
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
