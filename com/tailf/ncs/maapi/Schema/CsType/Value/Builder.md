# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Value.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getBits()](#m-getBits-032b4694ff31)
- [getDecimal64()](#m-getDecimal64-193bb466ba33)
- [getDisplayHint()](#m-getDisplayHint-f9cb8b7f487f)
- [getEnum()](#m-getEnum-c3a0d3b9ada8)
- [getIdentity()](#m-getIdentity-249dccdd4d86)
- [getIdref()](#m-getIdref-63813e21dc3f)
- [getList()](#m-getList-bb3f8cbe83be)
- [getListRestriction()](#m-getListRestriction-ce6c8d137d0a)
- [getNone()](#m-getNone-e31bfdbffa7f)
- [getNumber()](#m-getNumber-bb87f37a80c3)
- [getString()](#m-getString-4464e45dd212)
- [getUnion()](#m-getUnion-09a450ad6ddb)
- [initBits()](#m-initBits-2dbfa0aeed3b)
- [initDecimal64()](#m-initDecimal64-beda8ac08084)
- [initDisplayHint()](#m-initDisplayHint-9d66c0d147b8)
- [initEnum()](#m-initEnum-e698c3ca924f)
- [initIdentity()](#m-initIdentity-69e2b226e07b)
- [initIdref()](#m-initIdref-b7de2c064443)
- [initList()](#m-initList-702c5f37fea8)
- [initListRestriction()](#m-initListRestriction-9469f8169fd2)
- [initNone()](#m-initNone-940281ebc367)
- [initNumber()](#m-initNumber-22a62d90f621)
- [initString()](#m-initString-fce088a7ee00)
- [initUnion()](#m-initUnion-8c18e3f27de0)
- [isBits()](#m-isBits-fbb2c14b0e4a)
- [isDecimal64()](#m-isDecimal64-fbfc5a5de098)
- [isDisplayHint()](#m-isDisplayHint-b573e27dbdd3)
- [isEnum()](#m-isEnum-4f01ba38b65e)
- [isIdentity()](#m-isIdentity-694dbb6ae0ec)
- [isIdref()](#m-isIdref-bb5a2e992bb2)
- [isList()](#m-isList-c36bce63b506)
- [isListRestriction()](#m-isListRestriction-be6f3b28620e)
- [isNone()](#m-isNone-e8a993ad0453)
- [isNumber()](#m-isNumber-ea698f0863fe)
- [isString()](#m-isString-7b1e5678e352)
- [isUnion()](#m-isUnion-6183f968c3e8)
- [setBits(Reader)](#m-setBits-acd0d7796d19)
- [setDecimal64(Reader)](#m-setDecimal64-47a93b37586c)
- [setDisplayHint(Reader)](#m-setDisplayHint-cb6a40b9e298)
- [setEnum(Reader)](#m-setEnum-df08facd9fa5)
- [setIdentity(Reader)](#m-setIdentity-c71105e683fd)
- [setIdref(Reader)](#m-setIdref-3282e311a8e9)
- [setList(Reader)](#m-setList-5da1821f6d51)
- [setListRestriction(Reader)](#m-setListRestriction-d82716184c78)
- [setNone(Reader)](#m-setNone-5609f2872612)
- [setNumber(Reader)](#m-setNumber-b57d165bf856)
- [setString(Reader)](#m-setString-81c550471f9f)
- [setUnion(Reader)](#m-setUnion-cede465a72c8)
- [which()](#m-which-0b2d23db5ed0)

## Constructors

### Builder(SegmentBuilder, int, int, int, short) <a href="#m-Builder-179fba5038bd" id="m-Builder-179fba5038bd"></a>

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

### asReader() <a href="#m-asReader-b5c0f2a8d115" id="m-asReader-b5c0f2a8d115"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getBits() <a href="#m-getBits-032b4694ff31" id="m-getBits-032b4694ff31"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeBits.Builder getBits()
```

Types: [Builder](../../CsTypeBits/Builder.md#cls-Builder)

### getDecimal64() <a href="#m-getDecimal64-193bb466ba33" id="m-getDecimal64-193bb466ba33"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Builder getDecimal64()
```

Types: [Builder](../../CsTypeDecimal64/Builder.md#cls-Builder)

### getDisplayHint() <a href="#m-getDisplayHint-f9cb8b7f487f" id="m-getDisplayHint-f9cb8b7f487f"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder getDisplayHint()
```

Types: [Builder](../../CsTypeDisplayHint/Builder.md#cls-Builder)

### getEnum() <a href="#m-getEnum-c3a0d3b9ada8" id="m-getEnum-c3a0d3b9ada8"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeEnum.Builder getEnum()
```

Types: [Builder](../../CsTypeEnum/Builder.md#cls-Builder)

### getIdentity() <a href="#m-getIdentity-249dccdd4d86" id="m-getIdentity-249dccdd4d86"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdentity.Builder getIdentity()
```

Types: [Builder](../../CsTypeIdentity/Builder.md#cls-Builder)

### getIdref() <a href="#m-getIdref-63813e21dc3f" id="m-getIdref-63813e21dc3f"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Builder getIdref()
```

Types: [Builder](../../CsTypeIdref/Builder.md#cls-Builder)

### getList() <a href="#m-getList-bb3f8cbe83be" id="m-getList-bb3f8cbe83be"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeList.Builder getList()
```

Types: [Builder](../../CsTypeList/Builder.md#cls-Builder)

### getListRestriction() <a href="#m-getListRestriction-ce6c8d137d0a" id="m-getListRestriction-ce6c8d137d0a"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Builder getListRestriction()
```

Types: [Builder](../../CsTypeListRestriction/Builder.md#cls-Builder)

### getNone() <a href="#m-getNone-e31bfdbffa7f" id="m-getNone-e31bfdbffa7f"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeNone.Builder getNone()
```

Types: [Builder](../../CsTypeNone/Builder.md#cls-Builder)

### getNumber() <a href="#m-getNumber-bb87f37a80c3" id="m-getNumber-bb87f37a80c3"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeNumber.Builder getNumber()
```

Types: [Builder](../../CsTypeNumber/Builder.md#cls-Builder)

### getString() <a href="#m-getString-4464e45dd212" id="m-getString-4464e45dd212"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeString.Builder getString()
```

Types: [Builder](../../CsTypeString/Builder.md#cls-Builder)

### getUnion() <a href="#m-getUnion-09a450ad6ddb" id="m-getUnion-09a450ad6ddb"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeUnion.Builder getUnion()
```

Types: [Builder](../../CsTypeUnion/Builder.md#cls-Builder)

### initBits() <a href="#m-initBits-2dbfa0aeed3b" id="m-initBits-2dbfa0aeed3b"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeBits.Builder initBits()
```

Types: [Builder](../../CsTypeBits/Builder.md#cls-Builder)

### initDecimal64() <a href="#m-initDecimal64-beda8ac08084" id="m-initDecimal64-beda8ac08084"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Builder initDecimal64()
```

Types: [Builder](../../CsTypeDecimal64/Builder.md#cls-Builder)

### initDisplayHint() <a href="#m-initDisplayHint-9d66c0d147b8" id="m-initDisplayHint-9d66c0d147b8"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder initDisplayHint()
```

Types: [Builder](../../CsTypeDisplayHint/Builder.md#cls-Builder)

### initEnum() <a href="#m-initEnum-e698c3ca924f" id="m-initEnum-e698c3ca924f"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeEnum.Builder initEnum()
```

Types: [Builder](../../CsTypeEnum/Builder.md#cls-Builder)

### initIdentity() <a href="#m-initIdentity-69e2b226e07b" id="m-initIdentity-69e2b226e07b"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdentity.Builder initIdentity()
```

Types: [Builder](../../CsTypeIdentity/Builder.md#cls-Builder)

### initIdref() <a href="#m-initIdref-b7de2c064443" id="m-initIdref-b7de2c064443"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Builder initIdref()
```

Types: [Builder](../../CsTypeIdref/Builder.md#cls-Builder)

### initList() <a href="#m-initList-702c5f37fea8" id="m-initList-702c5f37fea8"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeList.Builder initList()
```

Types: [Builder](../../CsTypeList/Builder.md#cls-Builder)

### initListRestriction() <a href="#m-initListRestriction-9469f8169fd2" id="m-initListRestriction-9469f8169fd2"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Builder initListRestriction()
```

Types: [Builder](../../CsTypeListRestriction/Builder.md#cls-Builder)

### initNone() <a href="#m-initNone-940281ebc367" id="m-initNone-940281ebc367"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeNone.Builder initNone()
```

Types: [Builder](../../CsTypeNone/Builder.md#cls-Builder)

### initNumber() <a href="#m-initNumber-22a62d90f621" id="m-initNumber-22a62d90f621"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeNumber.Builder initNumber()
```

Types: [Builder](../../CsTypeNumber/Builder.md#cls-Builder)

### initString() <a href="#m-initString-fce088a7ee00" id="m-initString-fce088a7ee00"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeString.Builder initString()
```

Types: [Builder](../../CsTypeString/Builder.md#cls-Builder)

### initUnion() <a href="#m-initUnion-8c18e3f27de0" id="m-initUnion-8c18e3f27de0"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeUnion.Builder initUnion()
```

Types: [Builder](../../CsTypeUnion/Builder.md#cls-Builder)

### isBits() <a href="#m-isBits-fbb2c14b0e4a" id="m-isBits-fbb2c14b0e4a"></a>

```java
public final boolean isBits()
```

### isDecimal64() <a href="#m-isDecimal64-fbfc5a5de098" id="m-isDecimal64-fbfc5a5de098"></a>

```java
public final boolean isDecimal64()
```

### isDisplayHint() <a href="#m-isDisplayHint-b573e27dbdd3" id="m-isDisplayHint-b573e27dbdd3"></a>

```java
public final boolean isDisplayHint()
```

### isEnum() <a href="#m-isEnum-4f01ba38b65e" id="m-isEnum-4f01ba38b65e"></a>

```java
public final boolean isEnum()
```

### isIdentity() <a href="#m-isIdentity-694dbb6ae0ec" id="m-isIdentity-694dbb6ae0ec"></a>

```java
public final boolean isIdentity()
```

### isIdref() <a href="#m-isIdref-bb5a2e992bb2" id="m-isIdref-bb5a2e992bb2"></a>

```java
public final boolean isIdref()
```

### isList() <a href="#m-isList-c36bce63b506" id="m-isList-c36bce63b506"></a>

```java
public final boolean isList()
```

### isListRestriction() <a href="#m-isListRestriction-be6f3b28620e" id="m-isListRestriction-be6f3b28620e"></a>

```java
public final boolean isListRestriction()
```

### isNone() <a href="#m-isNone-e8a993ad0453" id="m-isNone-e8a993ad0453"></a>

```java
public final boolean isNone()
```

### isNumber() <a href="#m-isNumber-ea698f0863fe" id="m-isNumber-ea698f0863fe"></a>

```java
public final boolean isNumber()
```

### isString() <a href="#m-isString-7b1e5678e352" id="m-isString-7b1e5678e352"></a>

```java
public final boolean isString()
```

### isUnion() <a href="#m-isUnion-6183f968c3e8" id="m-isUnion-6183f968c3e8"></a>

```java
public final boolean isUnion()
```

### setBits(Reader) <a href="#m-setBits-acd0d7796d19" id="m-setBits-acd0d7796d19"></a>

```java
public final void setBits(com.tailf.ncs.maapi.Schema.CsTypeBits.Reader value)
```

Types: [Reader](../../CsTypeBits/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeBits.Reader value`

### setDecimal64(Reader) <a href="#m-setDecimal64-47a93b37586c" id="m-setDecimal64-47a93b37586c"></a>

```java
public final void setDecimal64(com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader value)
```

Types: [Reader](../../CsTypeDecimal64/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader value`

### setDisplayHint(Reader) <a href="#m-setDisplayHint-cb6a40b9e298" id="m-setDisplayHint-cb6a40b9e298"></a>

```java
public final void setDisplayHint(com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader value)
```

Types: [Reader](../../CsTypeDisplayHint/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader value`

### setEnum(Reader) <a href="#m-setEnum-df08facd9fa5" id="m-setEnum-df08facd9fa5"></a>

```java
public final void setEnum(com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader value)
```

Types: [Reader](../../CsTypeEnum/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader value`

### setIdentity(Reader) <a href="#m-setIdentity-c71105e683fd" id="m-setIdentity-c71105e683fd"></a>

```java
public final void setIdentity(com.tailf.ncs.maapi.Schema.CsTypeIdentity.Reader value)
```

Types: [Reader](../../CsTypeIdentity/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeIdentity.Reader value`

### setIdref(Reader) <a href="#m-setIdref-3282e311a8e9" id="m-setIdref-3282e311a8e9"></a>

```java
public final void setIdref(com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader value)
```

Types: [Reader](../../CsTypeIdref/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader value`

### setList(Reader) <a href="#m-setList-5da1821f6d51" id="m-setList-5da1821f6d51"></a>

```java
public final void setList(com.tailf.ncs.maapi.Schema.CsTypeList.Reader value)
```

Types: [Reader](../../CsTypeList/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeList.Reader value`

### setListRestriction(Reader) <a href="#m-setListRestriction-d82716184c78" id="m-setListRestriction-d82716184c78"></a>

```java
public final void setListRestriction(com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader value)
```

Types: [Reader](../../CsTypeListRestriction/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader value`

### setNone(Reader) <a href="#m-setNone-5609f2872612" id="m-setNone-5609f2872612"></a>

```java
public final void setNone(com.tailf.ncs.maapi.Schema.CsTypeNone.Reader value)
```

Types: [Reader](../../CsTypeNone/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeNone.Reader value`

### setNumber(Reader) <a href="#m-setNumber-b57d165bf856" id="m-setNumber-b57d165bf856"></a>

```java
public final void setNumber(com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader value)
```

Types: [Reader](../../CsTypeNumber/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader value`

### setString(Reader) <a href="#m-setString-81c550471f9f" id="m-setString-81c550471f9f"></a>

```java
public final void setString(com.tailf.ncs.maapi.Schema.CsTypeString.Reader value)
```

Types: [Reader](../../CsTypeString/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeString.Reader value`

### setUnion(Reader) <a href="#m-setUnion-cede465a72c8" id="m-setUnion-cede465a72c8"></a>

```java
public final void setUnion(com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader value)
```

Types: [Reader](../../CsTypeUnion/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader value`

### which() <a href="#m-which-0b2d23db5ed0" id="m-which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.CsType.Value.Which which()
```

Types: [Which](Which.md#cls-Which)
