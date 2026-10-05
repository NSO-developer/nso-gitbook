<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Value.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getBits()](#m-getbits-032b4694ff31)
- [getDecimal64()](#m-getdecimal64-193bb466ba33)
- [getDisplayHint()](#m-getdisplayhint-f9cb8b7f487f)
- [getEnum()](#m-getenum-c3a0d3b9ada8)
- [getIdentity()](#m-getidentity-249dccdd4d86)
- [getIdref()](#m-getidref-63813e21dc3f)
- [getList()](#m-getlist-bb3f8cbe83be)
- [getListRestriction()](#m-getlistrestriction-ce6c8d137d0a)
- [getNone()](#m-getnone-e31bfdbffa7f)
- [getNumber()](#m-getnumber-bb87f37a80c3)
- [getString()](#m-getstring-4464e45dd212)
- [getUnion()](#m-getunion-09a450ad6ddb)
- [initBits()](#m-initbits-2dbfa0aeed3b)
- [initDecimal64()](#m-initdecimal64-beda8ac08084)
- [initDisplayHint()](#m-initdisplayhint-9d66c0d147b8)
- [initEnum()](#m-initenum-e698c3ca924f)
- [initIdentity()](#m-initidentity-69e2b226e07b)
- [initIdref()](#m-initidref-b7de2c064443)
- [initList()](#m-initlist-702c5f37fea8)
- [initListRestriction()](#m-initlistrestriction-9469f8169fd2)
- [initNone()](#m-initnone-940281ebc367)
- [initNumber()](#m-initnumber-22a62d90f621)
- [initString()](#m-initstring-fce088a7ee00)
- [initUnion()](#m-initunion-8c18e3f27de0)
- [isBits()](#m-isbits-fbb2c14b0e4a)
- [isDecimal64()](#m-isdecimal64-fbfc5a5de098)
- [isDisplayHint()](#m-isdisplayhint-b573e27dbdd3)
- [isEnum()](#m-isenum-4f01ba38b65e)
- [isIdentity()](#m-isidentity-694dbb6ae0ec)
- [isIdref()](#m-isidref-bb5a2e992bb2)
- [isList()](#m-islist-c36bce63b506)
- [isListRestriction()](#m-islistrestriction-be6f3b28620e)
- [isNone()](#m-isnone-e8a993ad0453)
- [isNumber()](#m-isnumber-ea698f0863fe)
- [isString()](#m-isstring-7b1e5678e352)
- [isUnion()](#m-isunion-6183f968c3e8)
- [setBits(Reader)](#m-setbits-acd0d7796d19)
- [setDecimal64(Reader)](#m-setdecimal64-47a93b37586c)
- [setDisplayHint(Reader)](#m-setdisplayhint-cb6a40b9e298)
- [setEnum(Reader)](#m-setenum-df08facd9fa5)
- [setIdentity(Reader)](#m-setidentity-c71105e683fd)
- [setIdref(Reader)](#m-setidref-3282e311a8e9)
- [setList(Reader)](#m-setlist-5da1821f6d51)
- [setListRestriction(Reader)](#m-setlistrestriction-d82716184c78)
- [setNone(Reader)](#m-setnone-5609f2872612)
- [setNumber(Reader)](#m-setnumber-b57d165bf856)
- [setString(Reader)](#m-setstring-81c550471f9f)
- [setUnion(Reader)](#m-setunion-cede465a72c8)
- [which()](#m-which-0b2d23db5ed0)

## Constructors

<a id="m-builder-179fba5038bd"></a>
### Builder(SegmentBuilder, int, int, int, short)

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

<a id="m-asreader-b5c0f2a8d115"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getbits-032b4694ff31"></a>
### getBits()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeBits.Builder getBits()
```

Types: [Builder](../../CsTypeBits/Builder.md#cls-Builder)

<a id="m-getdecimal64-193bb466ba33"></a>
### getDecimal64()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Builder getDecimal64()
```

Types: [Builder](../../CsTypeDecimal64/Builder.md#cls-Builder)

<a id="m-getdisplayhint-f9cb8b7f487f"></a>
### getDisplayHint()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder getDisplayHint()
```

Types: [Builder](../../CsTypeDisplayHint/Builder.md#cls-Builder)

<a id="m-getenum-c3a0d3b9ada8"></a>
### getEnum()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeEnum.Builder getEnum()
```

Types: [Builder](../../CsTypeEnum/Builder.md#cls-Builder)

<a id="m-getidentity-249dccdd4d86"></a>
### getIdentity()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdentity.Builder getIdentity()
```

Types: [Builder](../../CsTypeIdentity/Builder.md#cls-Builder)

<a id="m-getidref-63813e21dc3f"></a>
### getIdref()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Builder getIdref()
```

Types: [Builder](../../CsTypeIdref/Builder.md#cls-Builder)

<a id="m-getlist-bb3f8cbe83be"></a>
### getList()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeList.Builder getList()
```

Types: [Builder](../../CsTypeList/Builder.md#cls-Builder)

<a id="m-getlistrestriction-ce6c8d137d0a"></a>
### getListRestriction()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Builder getListRestriction()
```

Types: [Builder](../../CsTypeListRestriction/Builder.md#cls-Builder)

<a id="m-getnone-e31bfdbffa7f"></a>
### getNone()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeNone.Builder getNone()
```

Types: [Builder](../../CsTypeNone/Builder.md#cls-Builder)

<a id="m-getnumber-bb87f37a80c3"></a>
### getNumber()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeNumber.Builder getNumber()
```

Types: [Builder](../../CsTypeNumber/Builder.md#cls-Builder)

<a id="m-getstring-4464e45dd212"></a>
### getString()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeString.Builder getString()
```

Types: [Builder](../../CsTypeString/Builder.md#cls-Builder)

<a id="m-getunion-09a450ad6ddb"></a>
### getUnion()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeUnion.Builder getUnion()
```

Types: [Builder](../../CsTypeUnion/Builder.md#cls-Builder)

<a id="m-initbits-2dbfa0aeed3b"></a>
### initBits()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeBits.Builder initBits()
```

Types: [Builder](../../CsTypeBits/Builder.md#cls-Builder)

<a id="m-initdecimal64-beda8ac08084"></a>
### initDecimal64()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Builder initDecimal64()
```

Types: [Builder](../../CsTypeDecimal64/Builder.md#cls-Builder)

<a id="m-initdisplayhint-9d66c0d147b8"></a>
### initDisplayHint()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder initDisplayHint()
```

Types: [Builder](../../CsTypeDisplayHint/Builder.md#cls-Builder)

<a id="m-initenum-e698c3ca924f"></a>
### initEnum()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeEnum.Builder initEnum()
```

Types: [Builder](../../CsTypeEnum/Builder.md#cls-Builder)

<a id="m-initidentity-69e2b226e07b"></a>
### initIdentity()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdentity.Builder initIdentity()
```

Types: [Builder](../../CsTypeIdentity/Builder.md#cls-Builder)

<a id="m-initidref-b7de2c064443"></a>
### initIdref()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Builder initIdref()
```

Types: [Builder](../../CsTypeIdref/Builder.md#cls-Builder)

<a id="m-initlist-702c5f37fea8"></a>
### initList()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeList.Builder initList()
```

Types: [Builder](../../CsTypeList/Builder.md#cls-Builder)

<a id="m-initlistrestriction-9469f8169fd2"></a>
### initListRestriction()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Builder initListRestriction()
```

Types: [Builder](../../CsTypeListRestriction/Builder.md#cls-Builder)

<a id="m-initnone-940281ebc367"></a>
### initNone()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeNone.Builder initNone()
```

Types: [Builder](../../CsTypeNone/Builder.md#cls-Builder)

<a id="m-initnumber-22a62d90f621"></a>
### initNumber()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeNumber.Builder initNumber()
```

Types: [Builder](../../CsTypeNumber/Builder.md#cls-Builder)

<a id="m-initstring-fce088a7ee00"></a>
### initString()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeString.Builder initString()
```

Types: [Builder](../../CsTypeString/Builder.md#cls-Builder)

<a id="m-initunion-8c18e3f27de0"></a>
### initUnion()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeUnion.Builder initUnion()
```

Types: [Builder](../../CsTypeUnion/Builder.md#cls-Builder)

<a id="m-isbits-fbb2c14b0e4a"></a>
### isBits()

```java
public final boolean isBits()
```

<a id="m-isdecimal64-fbfc5a5de098"></a>
### isDecimal64()

```java
public final boolean isDecimal64()
```

<a id="m-isdisplayhint-b573e27dbdd3"></a>
### isDisplayHint()

```java
public final boolean isDisplayHint()
```

<a id="m-isenum-4f01ba38b65e"></a>
### isEnum()

```java
public final boolean isEnum()
```

<a id="m-isidentity-694dbb6ae0ec"></a>
### isIdentity()

```java
public final boolean isIdentity()
```

<a id="m-isidref-bb5a2e992bb2"></a>
### isIdref()

```java
public final boolean isIdref()
```

<a id="m-islist-c36bce63b506"></a>
### isList()

```java
public final boolean isList()
```

<a id="m-islistrestriction-be6f3b28620e"></a>
### isListRestriction()

```java
public final boolean isListRestriction()
```

<a id="m-isnone-e8a993ad0453"></a>
### isNone()

```java
public final boolean isNone()
```

<a id="m-isnumber-ea698f0863fe"></a>
### isNumber()

```java
public final boolean isNumber()
```

<a id="m-isstring-7b1e5678e352"></a>
### isString()

```java
public final boolean isString()
```

<a id="m-isunion-6183f968c3e8"></a>
### isUnion()

```java
public final boolean isUnion()
```

<a id="m-setbits-acd0d7796d19"></a>
### setBits(Reader)

```java
public final void setBits(com.tailf.ncs.maapi.Schema.CsTypeBits.Reader value)
```

Types: [Reader](../../CsTypeBits/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeBits.Reader value`

<a id="m-setdecimal64-47a93b37586c"></a>
### setDecimal64(Reader)

```java
public final void setDecimal64(com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader value)
```

Types: [Reader](../../CsTypeDecimal64/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader value`

<a id="m-setdisplayhint-cb6a40b9e298"></a>
### setDisplayHint(Reader)

```java
public final void setDisplayHint(com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader value)
```

Types: [Reader](../../CsTypeDisplayHint/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader value`

<a id="m-setenum-df08facd9fa5"></a>
### setEnum(Reader)

```java
public final void setEnum(com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader value)
```

Types: [Reader](../../CsTypeEnum/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader value`

<a id="m-setidentity-c71105e683fd"></a>
### setIdentity(Reader)

```java
public final void setIdentity(com.tailf.ncs.maapi.Schema.CsTypeIdentity.Reader value)
```

Types: [Reader](../../CsTypeIdentity/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeIdentity.Reader value`

<a id="m-setidref-3282e311a8e9"></a>
### setIdref(Reader)

```java
public final void setIdref(com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader value)
```

Types: [Reader](../../CsTypeIdref/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader value`

<a id="m-setlist-5da1821f6d51"></a>
### setList(Reader)

```java
public final void setList(com.tailf.ncs.maapi.Schema.CsTypeList.Reader value)
```

Types: [Reader](../../CsTypeList/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeList.Reader value`

<a id="m-setlistrestriction-d82716184c78"></a>
### setListRestriction(Reader)

```java
public final void setListRestriction(com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader value)
```

Types: [Reader](../../CsTypeListRestriction/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader value`

<a id="m-setnone-5609f2872612"></a>
### setNone(Reader)

```java
public final void setNone(com.tailf.ncs.maapi.Schema.CsTypeNone.Reader value)
```

Types: [Reader](../../CsTypeNone/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeNone.Reader value`

<a id="m-setnumber-b57d165bf856"></a>
### setNumber(Reader)

```java
public final void setNumber(com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader value)
```

Types: [Reader](../../CsTypeNumber/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader value`

<a id="m-setstring-81c550471f9f"></a>
### setString(Reader)

```java
public final void setString(com.tailf.ncs.maapi.Schema.CsTypeString.Reader value)
```

Types: [Reader](../../CsTypeString/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeString.Reader value`

<a id="m-setunion-cede465a72c8"></a>
### setUnion(Reader)

```java
public final void setUnion(com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader value)
```

Types: [Reader](../../CsTypeUnion/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader value`

<a id="m-which-0b2d23db5ed0"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.CsType.Value.Which which()
```

Types: [Which](Which.md#cls-Which)
