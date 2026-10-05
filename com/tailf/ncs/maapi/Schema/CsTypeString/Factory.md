# Factory <a href="#factory-1787784624e8" id="factory-1787784624e8"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeString.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsTypeString.Builder,com.tailf.ncs.maapi.Schema.CsTypeString.Reader>
```

Types: [Builder](Builder.md#builder-21f09e83781d), [Reader](Reader.md#reader-b2467a96ddff)

## Members

**Constructors**:

- [Factory()](#factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#asreader-72d454c9d11f)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#constructreader-fbce6f4f912a)
- [getInvertMatch()](Builder.md#getinvertmatch-323126ccbf2f) from Builder
- [getPattern()](Builder.md#getpattern-b471c55bbd3b) from Builder
- [getRanges()](Builder.md#getranges-c1cd383e54a0) from Builder
- [hasPattern()](Builder.md#haspattern-e3fe48944019) from Builder
- [hasRanges()](Builder.md#hasranges-77bc63fe4ea8) from Builder
- [initPattern(int)](Builder.md#initpattern-6928d503a051) from Builder
- [initRanges(int)](Builder.md#initranges-d04c09762bd6) from Builder
- [setInvertMatch(boolean)](Builder.md#setinvertmatch-e00cbbce7115) from Builder
- [setPattern(Reader)](Builder.md#setpattern-e1a344734fbf) from Builder
- [setPattern(String)](Builder.md#setpattern-15104080a7b1) from Builder
- [setRanges(Reader<Reader>)](Builder.md#setranges-69bbcdb47f71) from Builder
- [structSize()](#structsize-1fa68dcadd21)

## Constructors

### Factory() <a href="#factory-0e9f9d7f4e84" id="factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#asreader-72d454c9d11f" id="asreader-72d454c9d11f"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeString.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsTypeString.Builder builder
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff), [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeString.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#constructbuilder-5a2abf3209f9" id="constructbuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeString.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsTypeString.Reader constructReader(
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
