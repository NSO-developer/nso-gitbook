<a id="s-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Value.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsType.Value.Builder,com.tailf.ncs.maapi.Schema.CsType.Value.Reader>
```

Types: [Builder](Builder.md#s-Builder), [Reader](Reader.md#s-Reader)

## Members

**Constructors**:

- [Factory()](#s-Factory-1)

**Methods**:

- [asReader()](Builder.md#s-asReader) from Builder
- [asReader(Builder)](#s-asReader)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#s-constructBuilder)
- [constructReader(SegmentReader, int, int, int, short, int)](#s-constructReader)
- [getBits()](Builder.md#s-getBits) from Builder
- [getDecimal64()](Builder.md#s-getDecimal64) from Builder
- [getDisplayHint()](Builder.md#s-getDisplayHint) from Builder
- [getEnum()](Builder.md#s-getEnum) from Builder
- [getIdentity()](Builder.md#s-getIdentity) from Builder
- [getIdref()](Builder.md#s-getIdref) from Builder
- [getList()](Builder.md#s-getList) from Builder
- [getListRestriction()](Builder.md#s-getListRestriction) from Builder
- [getNone()](Builder.md#s-getNone) from Builder
- [getNumber()](Builder.md#s-getNumber) from Builder
- [getString()](Builder.md#s-getString) from Builder
- [getUnion()](Builder.md#s-getUnion) from Builder
- [initBits()](Builder.md#s-initBits) from Builder
- [initDecimal64()](Builder.md#s-initDecimal64) from Builder
- [initDisplayHint()](Builder.md#s-initDisplayHint) from Builder
- [initEnum()](Builder.md#s-initEnum) from Builder
- [initIdentity()](Builder.md#s-initIdentity) from Builder
- [initIdref()](Builder.md#s-initIdref) from Builder
- [initList()](Builder.md#s-initList) from Builder
- [initListRestriction()](Builder.md#s-initListRestriction) from Builder
- [initNone()](Builder.md#s-initNone) from Builder
- [initNumber()](Builder.md#s-initNumber) from Builder
- [initString()](Builder.md#s-initString) from Builder
- [initUnion()](Builder.md#s-initUnion) from Builder
- [isBits()](Builder.md#s-isBits) from Builder
- [isDecimal64()](Builder.md#s-isDecimal64) from Builder
- [isDisplayHint()](Builder.md#s-isDisplayHint) from Builder
- [isEnum()](Builder.md#s-isEnum) from Builder
- [isIdentity()](Builder.md#s-isIdentity) from Builder
- [isIdref()](Builder.md#s-isIdref) from Builder
- [isList()](Builder.md#s-isList) from Builder
- [isListRestriction()](Builder.md#s-isListRestriction) from Builder
- [isNone()](Builder.md#s-isNone) from Builder
- [isNumber()](Builder.md#s-isNumber) from Builder
- [isString()](Builder.md#s-isString) from Builder
- [isUnion()](Builder.md#s-isUnion) from Builder
- [setBits(Reader)](Builder.md#s-setBits) from Builder
- [setDecimal64(Reader)](Builder.md#s-setDecimal64) from Builder
- [setDisplayHint(Reader)](Builder.md#s-setDisplayHint) from Builder
- [setEnum(Reader)](Builder.md#s-setEnum) from Builder
- [setIdentity(Reader)](Builder.md#s-setIdentity) from Builder
- [setIdref(Reader)](Builder.md#s-setIdref) from Builder
- [setList(Reader)](Builder.md#s-setList) from Builder
- [setListRestriction(Reader)](Builder.md#s-setListRestriction) from Builder
- [setNone(Reader)](Builder.md#s-setNone) from Builder
- [setNumber(Reader)](Builder.md#s-setNumber) from Builder
- [setString(Reader)](Builder.md#s-setString) from Builder
- [setUnion(Reader)](Builder.md#s-setUnion) from Builder
- [structSize()](#s-structSize)
- [which()](Builder.md#s-which) from Builder

## Constructors

<a id="s-Factory-1"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="s-asReader"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsType.Value.Builder builder
)
```

Types: [Reader](Reader.md#s-Reader), [Builder](Builder.md#s-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsType.Value.Builder builder`

<a id="s-constructBuilder"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Builder constructBuilder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

Types: [Builder](Builder.md#s-Builder)

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`

<a id="s-constructReader"></a>
### constructReader(SegmentReader, int, int, int, short, int)

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Reader constructReader(
    org.capnproto.SegmentReader segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount,
    int nestingLimit
)
```

Types: [Reader](Reader.md#s-Reader)

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`

<a id="s-structSize"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
