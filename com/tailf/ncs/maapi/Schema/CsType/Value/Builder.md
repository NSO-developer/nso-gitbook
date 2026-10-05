<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Value.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getBits()](#s-getBits)
- [getDecimal64()](#s-getDecimal64)
- [getDisplayHint()](#s-getDisplayHint)
- [getEnum()](#s-getEnum)
- [getIdentity()](#s-getIdentity)
- [getIdref()](#s-getIdref)
- [getList()](#s-getList)
- [getListRestriction()](#s-getListRestriction)
- [getNone()](#s-getNone)
- [getNumber()](#s-getNumber)
- [getString()](#s-getString)
- [getUnion()](#s-getUnion)
- [initBits()](#s-initBits)
- [initDecimal64()](#s-initDecimal64)
- [initDisplayHint()](#s-initDisplayHint)
- [initEnum()](#s-initEnum)
- [initIdentity()](#s-initIdentity)
- [initIdref()](#s-initIdref)
- [initList()](#s-initList)
- [initListRestriction()](#s-initListRestriction)
- [initNone()](#s-initNone)
- [initNumber()](#s-initNumber)
- [initString()](#s-initString)
- [initUnion()](#s-initUnion)
- [isBits()](#s-isBits)
- [isDecimal64()](#s-isDecimal64)
- [isDisplayHint()](#s-isDisplayHint)
- [isEnum()](#s-isEnum)
- [isIdentity()](#s-isIdentity)
- [isIdref()](#s-isIdref)
- [isList()](#s-isList)
- [isListRestriction()](#s-isListRestriction)
- [isNone()](#s-isNone)
- [isNumber()](#s-isNumber)
- [isString()](#s-isString)
- [isUnion()](#s-isUnion)
- [setBits(Reader)](#s-setBits)
- [setDecimal64(Reader)](#s-setDecimal64)
- [setDisplayHint(Reader)](#s-setDisplayHint)
- [setEnum(Reader)](#s-setEnum)
- [setIdentity(Reader)](#s-setIdentity)
- [setIdref(Reader)](#s-setIdref)
- [setList(Reader)](#s-setList)
- [setListRestriction(Reader)](#s-setListRestriction)
- [setNone(Reader)](#s-setNone)
- [setNumber(Reader)](#s-setNumber)
- [setString(Reader)](#s-setString)
- [setUnion(Reader)](#s-setUnion)
- [which()](#s-which)

## Constructors

<a id="s-Builder-1"></a>
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

<a id="s-asReader"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getBits"></a>
### getBits()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeBits.Builder getBits()
```

Types: [Builder](../../CsTypeBits/Builder.md#s-Builder)

<a id="s-getDecimal64"></a>
### getDecimal64()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Builder getDecimal64()
```

Types: [Builder](../../CsTypeDecimal64/Builder.md#s-Builder)

<a id="s-getDisplayHint"></a>
### getDisplayHint()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder getDisplayHint()
```

Types: [Builder](../../CsTypeDisplayHint/Builder.md#s-Builder)

<a id="s-getEnum"></a>
### getEnum()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeEnum.Builder getEnum()
```

Types: [Builder](../../CsTypeEnum/Builder.md#s-Builder)

<a id="s-getIdentity"></a>
### getIdentity()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdentity.Builder getIdentity()
```

Types: [Builder](../../CsTypeIdentity/Builder.md#s-Builder)

<a id="s-getIdref"></a>
### getIdref()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Builder getIdref()
```

Types: [Builder](../../CsTypeIdref/Builder.md#s-Builder)

<a id="s-getList"></a>
### getList()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeList.Builder getList()
```

Types: [Builder](../../CsTypeList/Builder.md#s-Builder)

<a id="s-getListRestriction"></a>
### getListRestriction()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Builder getListRestriction()
```

Types: [Builder](../../CsTypeListRestriction/Builder.md#s-Builder)

<a id="s-getNone"></a>
### getNone()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeNone.Builder getNone()
```

Types: [Builder](../../CsTypeNone/Builder.md#s-Builder)

<a id="s-getNumber"></a>
### getNumber()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeNumber.Builder getNumber()
```

Types: [Builder](../../CsTypeNumber/Builder.md#s-Builder)

<a id="s-getString"></a>
### getString()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeString.Builder getString()
```

Types: [Builder](../../CsTypeString/Builder.md#s-Builder)

<a id="s-getUnion"></a>
### getUnion()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeUnion.Builder getUnion()
```

Types: [Builder](../../CsTypeUnion/Builder.md#s-Builder)

<a id="s-initBits"></a>
### initBits()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeBits.Builder initBits()
```

Types: [Builder](../../CsTypeBits/Builder.md#s-Builder)

<a id="s-initDecimal64"></a>
### initDecimal64()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Builder initDecimal64()
```

Types: [Builder](../../CsTypeDecimal64/Builder.md#s-Builder)

<a id="s-initDisplayHint"></a>
### initDisplayHint()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder initDisplayHint()
```

Types: [Builder](../../CsTypeDisplayHint/Builder.md#s-Builder)

<a id="s-initEnum"></a>
### initEnum()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeEnum.Builder initEnum()
```

Types: [Builder](../../CsTypeEnum/Builder.md#s-Builder)

<a id="s-initIdentity"></a>
### initIdentity()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdentity.Builder initIdentity()
```

Types: [Builder](../../CsTypeIdentity/Builder.md#s-Builder)

<a id="s-initIdref"></a>
### initIdref()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Builder initIdref()
```

Types: [Builder](../../CsTypeIdref/Builder.md#s-Builder)

<a id="s-initList"></a>
### initList()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeList.Builder initList()
```

Types: [Builder](../../CsTypeList/Builder.md#s-Builder)

<a id="s-initListRestriction"></a>
### initListRestriction()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Builder initListRestriction()
```

Types: [Builder](../../CsTypeListRestriction/Builder.md#s-Builder)

<a id="s-initNone"></a>
### initNone()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeNone.Builder initNone()
```

Types: [Builder](../../CsTypeNone/Builder.md#s-Builder)

<a id="s-initNumber"></a>
### initNumber()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeNumber.Builder initNumber()
```

Types: [Builder](../../CsTypeNumber/Builder.md#s-Builder)

<a id="s-initString"></a>
### initString()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeString.Builder initString()
```

Types: [Builder](../../CsTypeString/Builder.md#s-Builder)

<a id="s-initUnion"></a>
### initUnion()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeUnion.Builder initUnion()
```

Types: [Builder](../../CsTypeUnion/Builder.md#s-Builder)

<a id="s-isBits"></a>
### isBits()

```java
public final boolean isBits()
```

<a id="s-isDecimal64"></a>
### isDecimal64()

```java
public final boolean isDecimal64()
```

<a id="s-isDisplayHint"></a>
### isDisplayHint()

```java
public final boolean isDisplayHint()
```

<a id="s-isEnum"></a>
### isEnum()

```java
public final boolean isEnum()
```

<a id="s-isIdentity"></a>
### isIdentity()

```java
public final boolean isIdentity()
```

<a id="s-isIdref"></a>
### isIdref()

```java
public final boolean isIdref()
```

<a id="s-isList"></a>
### isList()

```java
public final boolean isList()
```

<a id="s-isListRestriction"></a>
### isListRestriction()

```java
public final boolean isListRestriction()
```

<a id="s-isNone"></a>
### isNone()

```java
public final boolean isNone()
```

<a id="s-isNumber"></a>
### isNumber()

```java
public final boolean isNumber()
```

<a id="s-isString"></a>
### isString()

```java
public final boolean isString()
```

<a id="s-isUnion"></a>
### isUnion()

```java
public final boolean isUnion()
```

<a id="s-setBits"></a>
### setBits(Reader)

```java
public final void setBits(com.tailf.ncs.maapi.Schema.CsTypeBits.Reader value)
```

Types: [Reader](../../CsTypeBits/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeBits.Reader value`

<a id="s-setDecimal64"></a>
### setDecimal64(Reader)

```java
public final void setDecimal64(com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader value)
```

Types: [Reader](../../CsTypeDecimal64/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader value`

<a id="s-setDisplayHint"></a>
### setDisplayHint(Reader)

```java
public final void setDisplayHint(com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader value)
```

Types: [Reader](../../CsTypeDisplayHint/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader value`

<a id="s-setEnum"></a>
### setEnum(Reader)

```java
public final void setEnum(com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader value)
```

Types: [Reader](../../CsTypeEnum/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader value`

<a id="s-setIdentity"></a>
### setIdentity(Reader)

```java
public final void setIdentity(com.tailf.ncs.maapi.Schema.CsTypeIdentity.Reader value)
```

Types: [Reader](../../CsTypeIdentity/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeIdentity.Reader value`

<a id="s-setIdref"></a>
### setIdref(Reader)

```java
public final void setIdref(com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader value)
```

Types: [Reader](../../CsTypeIdref/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader value`

<a id="s-setList"></a>
### setList(Reader)

```java
public final void setList(com.tailf.ncs.maapi.Schema.CsTypeList.Reader value)
```

Types: [Reader](../../CsTypeList/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeList.Reader value`

<a id="s-setListRestriction"></a>
### setListRestriction(Reader)

```java
public final void setListRestriction(com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader value)
```

Types: [Reader](../../CsTypeListRestriction/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader value`

<a id="s-setNone"></a>
### setNone(Reader)

```java
public final void setNone(com.tailf.ncs.maapi.Schema.CsTypeNone.Reader value)
```

Types: [Reader](../../CsTypeNone/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeNone.Reader value`

<a id="s-setNumber"></a>
### setNumber(Reader)

```java
public final void setNumber(com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader value)
```

Types: [Reader](../../CsTypeNumber/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader value`

<a id="s-setString"></a>
### setString(Reader)

```java
public final void setString(com.tailf.ncs.maapi.Schema.CsTypeString.Reader value)
```

Types: [Reader](../../CsTypeString/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeString.Reader value`

<a id="s-setUnion"></a>
### setUnion(Reader)

```java
public final void setUnion(com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader value)
```

Types: [Reader](../../CsTypeUnion/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader value`

<a id="s-which"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.CsType.Value.Which which()
```

Types: [Which](Which.md#s-Which)
