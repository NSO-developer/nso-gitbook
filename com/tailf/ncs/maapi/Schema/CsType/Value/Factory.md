<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Value.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsType.Value.Builder,com.tailf.ncs.maapi.Schema.CsType.Value.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-5a2c1b4299d7)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getBits()](Builder.md#m-getbits-032b4694ff31) from Builder
- [getDecimal64()](Builder.md#m-getdecimal64-193bb466ba33) from Builder
- [getDisplayHint()](Builder.md#m-getdisplayhint-f9cb8b7f487f) from Builder
- [getEnum()](Builder.md#m-getenum-c3a0d3b9ada8) from Builder
- [getIdentity()](Builder.md#m-getidentity-249dccdd4d86) from Builder
- [getIdref()](Builder.md#m-getidref-63813e21dc3f) from Builder
- [getList()](Builder.md#m-getlist-bb3f8cbe83be) from Builder
- [getListRestriction()](Builder.md#m-getlistrestriction-ce6c8d137d0a) from Builder
- [getNone()](Builder.md#m-getnone-e31bfdbffa7f) from Builder
- [getNumber()](Builder.md#m-getnumber-bb87f37a80c3) from Builder
- [getString()](Builder.md#m-getstring-4464e45dd212) from Builder
- [getUnion()](Builder.md#m-getunion-09a450ad6ddb) from Builder
- [initBits()](Builder.md#m-initbits-2dbfa0aeed3b) from Builder
- [initDecimal64()](Builder.md#m-initdecimal64-beda8ac08084) from Builder
- [initDisplayHint()](Builder.md#m-initdisplayhint-9d66c0d147b8) from Builder
- [initEnum()](Builder.md#m-initenum-e698c3ca924f) from Builder
- [initIdentity()](Builder.md#m-initidentity-69e2b226e07b) from Builder
- [initIdref()](Builder.md#m-initidref-b7de2c064443) from Builder
- [initList()](Builder.md#m-initlist-702c5f37fea8) from Builder
- [initListRestriction()](Builder.md#m-initlistrestriction-9469f8169fd2) from Builder
- [initNone()](Builder.md#m-initnone-940281ebc367) from Builder
- [initNumber()](Builder.md#m-initnumber-22a62d90f621) from Builder
- [initString()](Builder.md#m-initstring-fce088a7ee00) from Builder
- [initUnion()](Builder.md#m-initunion-8c18e3f27de0) from Builder
- [isBits()](Builder.md#m-isbits-fbb2c14b0e4a) from Builder
- [isDecimal64()](Builder.md#m-isdecimal64-fbfc5a5de098) from Builder
- [isDisplayHint()](Builder.md#m-isdisplayhint-b573e27dbdd3) from Builder
- [isEnum()](Builder.md#m-isenum-4f01ba38b65e) from Builder
- [isIdentity()](Builder.md#m-isidentity-694dbb6ae0ec) from Builder
- [isIdref()](Builder.md#m-isidref-bb5a2e992bb2) from Builder
- [isList()](Builder.md#m-islist-c36bce63b506) from Builder
- [isListRestriction()](Builder.md#m-islistrestriction-be6f3b28620e) from Builder
- [isNone()](Builder.md#m-isnone-e8a993ad0453) from Builder
- [isNumber()](Builder.md#m-isnumber-ea698f0863fe) from Builder
- [isString()](Builder.md#m-isstring-7b1e5678e352) from Builder
- [isUnion()](Builder.md#m-isunion-6183f968c3e8) from Builder
- [setBits(Reader)](Builder.md#m-setbits-acd0d7796d19) from Builder
- [setDecimal64(Reader)](Builder.md#m-setdecimal64-47a93b37586c) from Builder
- [setDisplayHint(Reader)](Builder.md#m-setdisplayhint-cb6a40b9e298) from Builder
- [setEnum(Reader)](Builder.md#m-setenum-df08facd9fa5) from Builder
- [setIdentity(Reader)](Builder.md#m-setidentity-c71105e683fd) from Builder
- [setIdref(Reader)](Builder.md#m-setidref-3282e311a8e9) from Builder
- [setList(Reader)](Builder.md#m-setlist-5da1821f6d51) from Builder
- [setListRestriction(Reader)](Builder.md#m-setlistrestriction-d82716184c78) from Builder
- [setNone(Reader)](Builder.md#m-setnone-5609f2872612) from Builder
- [setNumber(Reader)](Builder.md#m-setnumber-b57d165bf856) from Builder
- [setString(Reader)](Builder.md#m-setstring-81c550471f9f) from Builder
- [setUnion(Reader)](Builder.md#m-setunion-cede465a72c8) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)
- [which()](Builder.md#m-which-0b2d23db5ed0) from Builder

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-5a2c1b4299d7"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsType.Value.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsType.Value.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
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

<a id="m-structsize-1fa68dcadd21"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
