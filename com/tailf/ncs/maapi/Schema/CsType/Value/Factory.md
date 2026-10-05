# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Value.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsType.Value.Builder,com.tailf.ncs.maapi.Schema.CsType.Value.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-5a2c1b4299d7)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getBits()](Builder.md#m-getBits-032b4694ff31) from Builder
- [getDecimal64()](Builder.md#m-getDecimal64-193bb466ba33) from Builder
- [getDisplayHint()](Builder.md#m-getDisplayHint-f9cb8b7f487f) from Builder
- [getEnum()](Builder.md#m-getEnum-c3a0d3b9ada8) from Builder
- [getIdentity()](Builder.md#m-getIdentity-249dccdd4d86) from Builder
- [getIdref()](Builder.md#m-getIdref-63813e21dc3f) from Builder
- [getList()](Builder.md#m-getList-bb3f8cbe83be) from Builder
- [getListRestriction()](Builder.md#m-getListRestriction-ce6c8d137d0a) from Builder
- [getNone()](Builder.md#m-getNone-e31bfdbffa7f) from Builder
- [getNumber()](Builder.md#m-getNumber-bb87f37a80c3) from Builder
- [getString()](Builder.md#m-getString-4464e45dd212) from Builder
- [getUnion()](Builder.md#m-getUnion-09a450ad6ddb) from Builder
- [initBits()](Builder.md#m-initBits-2dbfa0aeed3b) from Builder
- [initDecimal64()](Builder.md#m-initDecimal64-beda8ac08084) from Builder
- [initDisplayHint()](Builder.md#m-initDisplayHint-9d66c0d147b8) from Builder
- [initEnum()](Builder.md#m-initEnum-e698c3ca924f) from Builder
- [initIdentity()](Builder.md#m-initIdentity-69e2b226e07b) from Builder
- [initIdref()](Builder.md#m-initIdref-b7de2c064443) from Builder
- [initList()](Builder.md#m-initList-702c5f37fea8) from Builder
- [initListRestriction()](Builder.md#m-initListRestriction-9469f8169fd2) from Builder
- [initNone()](Builder.md#m-initNone-940281ebc367) from Builder
- [initNumber()](Builder.md#m-initNumber-22a62d90f621) from Builder
- [initString()](Builder.md#m-initString-fce088a7ee00) from Builder
- [initUnion()](Builder.md#m-initUnion-8c18e3f27de0) from Builder
- [isBits()](Builder.md#m-isBits-fbb2c14b0e4a) from Builder
- [isDecimal64()](Builder.md#m-isDecimal64-fbfc5a5de098) from Builder
- [isDisplayHint()](Builder.md#m-isDisplayHint-b573e27dbdd3) from Builder
- [isEnum()](Builder.md#m-isEnum-4f01ba38b65e) from Builder
- [isIdentity()](Builder.md#m-isIdentity-694dbb6ae0ec) from Builder
- [isIdref()](Builder.md#m-isIdref-bb5a2e992bb2) from Builder
- [isList()](Builder.md#m-isList-c36bce63b506) from Builder
- [isListRestriction()](Builder.md#m-isListRestriction-be6f3b28620e) from Builder
- [isNone()](Builder.md#m-isNone-e8a993ad0453) from Builder
- [isNumber()](Builder.md#m-isNumber-ea698f0863fe) from Builder
- [isString()](Builder.md#m-isString-7b1e5678e352) from Builder
- [isUnion()](Builder.md#m-isUnion-6183f968c3e8) from Builder
- [setBits(Reader)](Builder.md#m-setBits-acd0d7796d19) from Builder
- [setDecimal64(Reader)](Builder.md#m-setDecimal64-47a93b37586c) from Builder
- [setDisplayHint(Reader)](Builder.md#m-setDisplayHint-cb6a40b9e298) from Builder
- [setEnum(Reader)](Builder.md#m-setEnum-df08facd9fa5) from Builder
- [setIdentity(Reader)](Builder.md#m-setIdentity-c71105e683fd) from Builder
- [setIdref(Reader)](Builder.md#m-setIdref-3282e311a8e9) from Builder
- [setList(Reader)](Builder.md#m-setList-5da1821f6d51) from Builder
- [setListRestriction(Reader)](Builder.md#m-setListRestriction-d82716184c78) from Builder
- [setNone(Reader)](Builder.md#m-setNone-5609f2872612) from Builder
- [setNumber(Reader)](Builder.md#m-setNumber-b57d165bf856) from Builder
- [setString(Reader)](Builder.md#m-setString-81c550471f9f) from Builder
- [setUnion(Reader)](Builder.md#m-setUnion-cede465a72c8) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)
- [which()](Builder.md#m-which-0b2d23db5ed0) from Builder

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-5a2c1b4299d7" id="m-asReader-5a2c1b4299d7"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsType.Value.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsType.Value.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsType.Value.Reader constructReader(
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
