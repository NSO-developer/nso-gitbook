# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Value.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getBits\(\)](#getbits-032b4694ff31)
- [getDecimal64\(\)](#getdecimal64-193bb466ba33)
- [getDisplayHint\(\)](#getdisplayhint-f9cb8b7f487f)
- [getEnum\(\)](#getenum-c3a0d3b9ada8)
- [getIdentity\(\)](#getidentity-249dccdd4d86)
- [getIdref\(\)](#getidref-63813e21dc3f)
- [getList\(\)](#getlist-bb3f8cbe83be)
- [getListRestriction\(\)](#getlistrestriction-ce6c8d137d0a)
- [getNone\(\)](#getnone-e31bfdbffa7f)
- [getNumber\(\)](#getnumber-bb87f37a80c3)
- [getString\(\)](#getstring-4464e45dd212)
- [getUnion\(\)](#getunion-09a450ad6ddb)
- [initBits\(\)](#initbits-2dbfa0aeed3b)
- [initDecimal64\(\)](#initdecimal64-beda8ac08084)
- [initDisplayHint\(\)](#initdisplayhint-9d66c0d147b8)
- [initEnum\(\)](#initenum-e698c3ca924f)
- [initIdentity\(\)](#initidentity-69e2b226e07b)
- [initIdref\(\)](#initidref-b7de2c064443)
- [initList\(\)](#initlist-702c5f37fea8)
- [initListRestriction\(\)](#initlistrestriction-9469f8169fd2)
- [initNone\(\)](#initnone-940281ebc367)
- [initNumber\(\)](#initnumber-22a62d90f621)
- [initString\(\)](#initstring-fce088a7ee00)
- [initUnion\(\)](#initunion-8c18e3f27de0)
- [isBits\(\)](#isbits-fbb2c14b0e4a)
- [isDecimal64\(\)](#isdecimal64-fbfc5a5de098)
- [isDisplayHint\(\)](#isdisplayhint-b573e27dbdd3)
- [isEnum\(\)](#isenum-4f01ba38b65e)
- [isIdentity\(\)](#isidentity-694dbb6ae0ec)
- [isIdref\(\)](#isidref-bb5a2e992bb2)
- [isList\(\)](#islist-c36bce63b506)
- [isListRestriction\(\)](#islistrestriction-be6f3b28620e)
- [isNone\(\)](#isnone-e8a993ad0453)
- [isNumber\(\)](#isnumber-ea698f0863fe)
- [isString\(\)](#isstring-7b1e5678e352)
- [isUnion\(\)](#isunion-6183f968c3e8)
- [setBits\(Reader\)](#setbits-acd0d7796d19)
- [setDecimal64\(Reader\)](#setdecimal64-47a93b37586c)
- [setDisplayHint\(Reader\)](#setdisplayhint-cb6a40b9e298)
- [setEnum\(Reader\)](#setenum-df08facd9fa5)
- [setIdentity\(Reader\)](#setidentity-c71105e683fd)
- [setIdref\(Reader\)](#setidref-3282e311a8e9)
- [setList\(Reader\)](#setlist-5da1821f6d51)
- [setListRestriction\(Reader\)](#setlistrestriction-d82716184c78)
- [setNone\(Reader\)](#setnone-5609f2872612)
- [setNumber\(Reader\)](#setnumber-b57d165bf856)
- [setString\(Reader\)](#setstring-81c550471f9f)
- [setUnion\(Reader\)](#setunion-cede465a72c8)
- [which\(\)](#which-0b2d23db5ed0)

## Constructors

### Builder(SegmentBuilder, int, int, int, short) <a href="#builder-179fba5038bd" id="builder-179fba5038bd"></a>

**Package-private**

```java
Builder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`


## Methods

### asReader() <a href="#asreader-b5c0f2a8d115" id="asreader-b5c0f2a8d115"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getBits() <a href="#getbits-032b4694ff31" id="getbits-032b4694ff31"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeBits.Builder getBits()
```

Types: [Builder](../../CsTypeBits/Builder.md#builder-21f09e83781d)

### getDecimal64() <a href="#getdecimal64-193bb466ba33" id="getdecimal64-193bb466ba33"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Builder getDecimal64()
```

Types: [Builder](../../CsTypeDecimal64/Builder.md#builder-21f09e83781d)

### getDisplayHint() <a href="#getdisplayhint-f9cb8b7f487f" id="getdisplayhint-f9cb8b7f487f"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder getDisplayHint()
```

Types: [Builder](../../CsTypeDisplayHint/Builder.md#builder-21f09e83781d)

### getEnum() <a href="#getenum-c3a0d3b9ada8" id="getenum-c3a0d3b9ada8"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeEnum.Builder getEnum()
```

Types: [Builder](../../CsTypeEnum/Builder.md#builder-21f09e83781d)

### getIdentity() <a href="#getidentity-249dccdd4d86" id="getidentity-249dccdd4d86"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdentity.Builder getIdentity()
```

Types: [Builder](../../CsTypeIdentity/Builder.md#builder-21f09e83781d)

### getIdref() <a href="#getidref-63813e21dc3f" id="getidref-63813e21dc3f"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Builder getIdref()
```

Types: [Builder](../../CsTypeIdref/Builder.md#builder-21f09e83781d)

### getList() <a href="#getlist-bb3f8cbe83be" id="getlist-bb3f8cbe83be"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeList.Builder getList()
```

Types: [Builder](../../CsTypeList/Builder.md#builder-21f09e83781d)

### getListRestriction() <a href="#getlistrestriction-ce6c8d137d0a" id="getlistrestriction-ce6c8d137d0a"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Builder getListRestriction()
```

Types: [Builder](../../CsTypeListRestriction/Builder.md#builder-21f09e83781d)

### getNone() <a href="#getnone-e31bfdbffa7f" id="getnone-e31bfdbffa7f"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeNone.Builder getNone()
```

Types: [Builder](../../CsTypeNone/Builder.md#builder-21f09e83781d)

### getNumber() <a href="#getnumber-bb87f37a80c3" id="getnumber-bb87f37a80c3"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeNumber.Builder getNumber()
```

Types: [Builder](../../CsTypeNumber/Builder.md#builder-21f09e83781d)

### getString() <a href="#getstring-4464e45dd212" id="getstring-4464e45dd212"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeString.Builder getString()
```

Types: [Builder](../../CsTypeString/Builder.md#builder-21f09e83781d)

### getUnion() <a href="#getunion-09a450ad6ddb" id="getunion-09a450ad6ddb"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeUnion.Builder getUnion()
```

Types: [Builder](../../CsTypeUnion/Builder.md#builder-21f09e83781d)

### initBits() <a href="#initbits-2dbfa0aeed3b" id="initbits-2dbfa0aeed3b"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeBits.Builder initBits()
```

Types: [Builder](../../CsTypeBits/Builder.md#builder-21f09e83781d)

### initDecimal64() <a href="#initdecimal64-beda8ac08084" id="initdecimal64-beda8ac08084"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Builder initDecimal64()
```

Types: [Builder](../../CsTypeDecimal64/Builder.md#builder-21f09e83781d)

### initDisplayHint() <a href="#initdisplayhint-9d66c0d147b8" id="initdisplayhint-9d66c0d147b8"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder initDisplayHint()
```

Types: [Builder](../../CsTypeDisplayHint/Builder.md#builder-21f09e83781d)

### initEnum() <a href="#initenum-e698c3ca924f" id="initenum-e698c3ca924f"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeEnum.Builder initEnum()
```

Types: [Builder](../../CsTypeEnum/Builder.md#builder-21f09e83781d)

### initIdentity() <a href="#initidentity-69e2b226e07b" id="initidentity-69e2b226e07b"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdentity.Builder initIdentity()
```

Types: [Builder](../../CsTypeIdentity/Builder.md#builder-21f09e83781d)

### initIdref() <a href="#initidref-b7de2c064443" id="initidref-b7de2c064443"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Builder initIdref()
```

Types: [Builder](../../CsTypeIdref/Builder.md#builder-21f09e83781d)

### initList() <a href="#initlist-702c5f37fea8" id="initlist-702c5f37fea8"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeList.Builder initList()
```

Types: [Builder](../../CsTypeList/Builder.md#builder-21f09e83781d)

### initListRestriction() <a href="#initlistrestriction-9469f8169fd2" id="initlistrestriction-9469f8169fd2"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Builder initListRestriction()
```

Types: [Builder](../../CsTypeListRestriction/Builder.md#builder-21f09e83781d)

### initNone() <a href="#initnone-940281ebc367" id="initnone-940281ebc367"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeNone.Builder initNone()
```

Types: [Builder](../../CsTypeNone/Builder.md#builder-21f09e83781d)

### initNumber() <a href="#initnumber-22a62d90f621" id="initnumber-22a62d90f621"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeNumber.Builder initNumber()
```

Types: [Builder](../../CsTypeNumber/Builder.md#builder-21f09e83781d)

### initString() <a href="#initstring-fce088a7ee00" id="initstring-fce088a7ee00"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeString.Builder initString()
```

Types: [Builder](../../CsTypeString/Builder.md#builder-21f09e83781d)

### initUnion() <a href="#initunion-8c18e3f27de0" id="initunion-8c18e3f27de0"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeUnion.Builder initUnion()
```

Types: [Builder](../../CsTypeUnion/Builder.md#builder-21f09e83781d)

### isBits() <a href="#isbits-fbb2c14b0e4a" id="isbits-fbb2c14b0e4a"></a>

```java
public final boolean isBits()
```

### isDecimal64() <a href="#isdecimal64-fbfc5a5de098" id="isdecimal64-fbfc5a5de098"></a>

```java
public final boolean isDecimal64()
```

### isDisplayHint() <a href="#isdisplayhint-b573e27dbdd3" id="isdisplayhint-b573e27dbdd3"></a>

```java
public final boolean isDisplayHint()
```

### isEnum() <a href="#isenum-4f01ba38b65e" id="isenum-4f01ba38b65e"></a>

```java
public final boolean isEnum()
```

### isIdentity() <a href="#isidentity-694dbb6ae0ec" id="isidentity-694dbb6ae0ec"></a>

```java
public final boolean isIdentity()
```

### isIdref() <a href="#isidref-bb5a2e992bb2" id="isidref-bb5a2e992bb2"></a>

```java
public final boolean isIdref()
```

### isList() <a href="#islist-c36bce63b506" id="islist-c36bce63b506"></a>

```java
public final boolean isList()
```

### isListRestriction() <a href="#islistrestriction-be6f3b28620e" id="islistrestriction-be6f3b28620e"></a>

```java
public final boolean isListRestriction()
```

### isNone() <a href="#isnone-e8a993ad0453" id="isnone-e8a993ad0453"></a>

```java
public final boolean isNone()
```

### isNumber() <a href="#isnumber-ea698f0863fe" id="isnumber-ea698f0863fe"></a>

```java
public final boolean isNumber()
```

### isString() <a href="#isstring-7b1e5678e352" id="isstring-7b1e5678e352"></a>

```java
public final boolean isString()
```

### isUnion() <a href="#isunion-6183f968c3e8" id="isunion-6183f968c3e8"></a>

```java
public final boolean isUnion()
```

### setBits(Reader) <a href="#setbits-acd0d7796d19" id="setbits-acd0d7796d19"></a>

```java
public final void setBits(com.tailf.ncs.maapi.Schema.CsTypeBits.Reader value)
```

Types: [Reader](../../CsTypeBits/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeBits.Reader value`

### setDecimal64(Reader) <a href="#setdecimal64-47a93b37586c" id="setdecimal64-47a93b37586c"></a>

```java
public final void setDecimal64(com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader value)
```

Types: [Reader](../../CsTypeDecimal64/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader value`

### setDisplayHint(Reader) <a href="#setdisplayhint-cb6a40b9e298" id="setdisplayhint-cb6a40b9e298"></a>

```java
public final void setDisplayHint(com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader value)
```

Types: [Reader](../../CsTypeDisplayHint/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader value`

### setEnum(Reader) <a href="#setenum-df08facd9fa5" id="setenum-df08facd9fa5"></a>

```java
public final void setEnum(com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader value)
```

Types: [Reader](../../CsTypeEnum/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader value`

### setIdentity(Reader) <a href="#setidentity-c71105e683fd" id="setidentity-c71105e683fd"></a>

```java
public final void setIdentity(com.tailf.ncs.maapi.Schema.CsTypeIdentity.Reader value)
```

Types: [Reader](../../CsTypeIdentity/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeIdentity.Reader value`

### setIdref(Reader) <a href="#setidref-3282e311a8e9" id="setidref-3282e311a8e9"></a>

```java
public final void setIdref(com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader value)
```

Types: [Reader](../../CsTypeIdref/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader value`

### setList(Reader) <a href="#setlist-5da1821f6d51" id="setlist-5da1821f6d51"></a>

```java
public final void setList(com.tailf.ncs.maapi.Schema.CsTypeList.Reader value)
```

Types: [Reader](../../CsTypeList/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeList.Reader value`

### setListRestriction(Reader) <a href="#setlistrestriction-d82716184c78" id="setlistrestriction-d82716184c78"></a>

```java
public final void setListRestriction(com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader value)
```

Types: [Reader](../../CsTypeListRestriction/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader value`

### setNone(Reader) <a href="#setnone-5609f2872612" id="setnone-5609f2872612"></a>

```java
public final void setNone(com.tailf.ncs.maapi.Schema.CsTypeNone.Reader value)
```

Types: [Reader](../../CsTypeNone/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeNone.Reader value`

### setNumber(Reader) <a href="#setnumber-b57d165bf856" id="setnumber-b57d165bf856"></a>

```java
public final void setNumber(com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader value)
```

Types: [Reader](../../CsTypeNumber/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader value`

### setString(Reader) <a href="#setstring-81c550471f9f" id="setstring-81c550471f9f"></a>

```java
public final void setString(com.tailf.ncs.maapi.Schema.CsTypeString.Reader value)
```

Types: [Reader](../../CsTypeString/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeString.Reader value`

### setUnion(Reader) <a href="#setunion-cede465a72c8" id="setunion-cede465a72c8"></a>

```java
public final void setUnion(com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader value)
```

Types: [Reader](../../CsTypeUnion/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader value`

### which() <a href="#which-0b2d23db5ed0" id="which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.CsType.Value.Which which()
```

Types: [Which](Which.md#which-92b652653aa7)
