# Factory <a href="#factory-1787784624e8" id="factory-1787784624e8"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Value.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsType.Value.Builder,com.tailf.ncs.maapi.Schema.CsType.Value.Reader>
```

Types: [Builder](Builder.md#builder-21f09e83781d), [Reader](Reader.md#reader-b2467a96ddff)

## Members

**Constructors**:

- [Factory\(\)](#factory-0e9f9d7f4e84)

**Methods**:

- [asReader\(\)](Builder.md#asreader-b5c0f2a8d115) from Builder
- [asReader\(Builder\)](#asreader-5a2c1b4299d7)
- [constructBuilder\(SegmentBuilder, int, int, int, short\)](#constructbuilder-5a2abf3209f9)
- [constructReader\(SegmentReader, int, int, int, short, int\)](#constructreader-fbce6f4f912a)
- [getBits\(\)](Builder.md#getbits-032b4694ff31) from Builder
- [getDecimal64\(\)](Builder.md#getdecimal64-193bb466ba33) from Builder
- [getDisplayHint\(\)](Builder.md#getdisplayhint-f9cb8b7f487f) from Builder
- [getEnum\(\)](Builder.md#getenum-c3a0d3b9ada8) from Builder
- [getIdentity\(\)](Builder.md#getidentity-249dccdd4d86) from Builder
- [getIdref\(\)](Builder.md#getidref-63813e21dc3f) from Builder
- [getList\(\)](Builder.md#getlist-bb3f8cbe83be) from Builder
- [getListRestriction\(\)](Builder.md#getlistrestriction-ce6c8d137d0a) from Builder
- [getNone\(\)](Builder.md#getnone-e31bfdbffa7f) from Builder
- [getNumber\(\)](Builder.md#getnumber-bb87f37a80c3) from Builder
- [getString\(\)](Builder.md#getstring-4464e45dd212) from Builder
- [getUnion\(\)](Builder.md#getunion-09a450ad6ddb) from Builder
- [initBits\(\)](Builder.md#initbits-2dbfa0aeed3b) from Builder
- [initDecimal64\(\)](Builder.md#initdecimal64-beda8ac08084) from Builder
- [initDisplayHint\(\)](Builder.md#initdisplayhint-9d66c0d147b8) from Builder
- [initEnum\(\)](Builder.md#initenum-e698c3ca924f) from Builder
- [initIdentity\(\)](Builder.md#initidentity-69e2b226e07b) from Builder
- [initIdref\(\)](Builder.md#initidref-b7de2c064443) from Builder
- [initList\(\)](Builder.md#initlist-702c5f37fea8) from Builder
- [initListRestriction\(\)](Builder.md#initlistrestriction-9469f8169fd2) from Builder
- [initNone\(\)](Builder.md#initnone-940281ebc367) from Builder
- [initNumber\(\)](Builder.md#initnumber-22a62d90f621) from Builder
- [initString\(\)](Builder.md#initstring-fce088a7ee00) from Builder
- [initUnion\(\)](Builder.md#initunion-8c18e3f27de0) from Builder
- [isBits\(\)](Builder.md#isbits-fbb2c14b0e4a) from Builder
- [isDecimal64\(\)](Builder.md#isdecimal64-fbfc5a5de098) from Builder
- [isDisplayHint\(\)](Builder.md#isdisplayhint-b573e27dbdd3) from Builder
- [isEnum\(\)](Builder.md#isenum-4f01ba38b65e) from Builder
- [isIdentity\(\)](Builder.md#isidentity-694dbb6ae0ec) from Builder
- [isIdref\(\)](Builder.md#isidref-bb5a2e992bb2) from Builder
- [isList\(\)](Builder.md#islist-c36bce63b506) from Builder
- [isListRestriction\(\)](Builder.md#islistrestriction-be6f3b28620e) from Builder
- [isNone\(\)](Builder.md#isnone-e8a993ad0453) from Builder
- [isNumber\(\)](Builder.md#isnumber-ea698f0863fe) from Builder
- [isString\(\)](Builder.md#isstring-7b1e5678e352) from Builder
- [isUnion\(\)](Builder.md#isunion-6183f968c3e8) from Builder
- [setBits\(Reader\)](Builder.md#setbits-acd0d7796d19) from Builder
- [setDecimal64\(Reader\)](Builder.md#setdecimal64-47a93b37586c) from Builder
- [setDisplayHint\(Reader\)](Builder.md#setdisplayhint-cb6a40b9e298) from Builder
- [setEnum\(Reader\)](Builder.md#setenum-df08facd9fa5) from Builder
- [setIdentity\(Reader\)](Builder.md#setidentity-c71105e683fd) from Builder
- [setIdref\(Reader\)](Builder.md#setidref-3282e311a8e9) from Builder
- [setList\(Reader\)](Builder.md#setlist-5da1821f6d51) from Builder
- [setListRestriction\(Reader\)](Builder.md#setlistrestriction-d82716184c78) from Builder
- [setNone\(Reader\)](Builder.md#setnone-5609f2872612) from Builder
- [setNumber\(Reader\)](Builder.md#setnumber-b57d165bf856) from Builder
- [setString\(Reader\)](Builder.md#setstring-81c550471f9f) from Builder
- [setUnion\(Reader\)](Builder.md#setunion-cede465a72c8) from Builder
- [structSize\(\)](#structsize-1fa68dcadd21)
- [which\(\)](Builder.md#which-0b2d23db5ed0) from Builder

## Constructors

### Factory() <a href="#factory-0e9f9d7f4e84" id="factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#asreader-5a2c1b4299d7" id="asreader-5a2c1b4299d7"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsType.Value.Builder builder
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff), [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsType.Value.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#constructbuilder-5a2abf3209f9" id="constructbuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsType.Value.Reader constructReader(
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
