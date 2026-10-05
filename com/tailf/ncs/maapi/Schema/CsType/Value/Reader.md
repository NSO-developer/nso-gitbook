<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Value.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

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
- [hasBits()](#s-hasBits)
- [hasDecimal64()](#s-hasDecimal64)
- [hasDisplayHint()](#s-hasDisplayHint)
- [hasEnum()](#s-hasEnum)
- [hasIdentity()](#s-hasIdentity)
- [hasIdref()](#s-hasIdref)
- [hasList()](#s-hasList)
- [hasListRestriction()](#s-hasListRestriction)
- [hasNone()](#s-hasNone)
- [hasNumber()](#s-hasNumber)
- [hasString()](#s-hasString)
- [hasUnion()](#s-hasUnion)
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
- [which()](#s-which)

## Constructors

<a id="s-Reader-1"></a>
### Reader(SegmentReader, int, int, int, short, int)

**Package-private**

```java
Reader(
    org.capnproto.SegmentReader segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount,
    int nestingLimit
)
```

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`


## Methods

<a id="s-getBits"></a>
### getBits()

```java
public com.tailf.ncs.maapi.Schema.CsTypeBits.Reader getBits()
```

Types: [Reader](../../CsTypeBits/Reader.md#s-Reader)

<a id="s-getDecimal64"></a>
### getDecimal64()

```java
public com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader getDecimal64()
```

Types: [Reader](../../CsTypeDecimal64/Reader.md#s-Reader)

<a id="s-getDisplayHint"></a>
### getDisplayHint()

```java
public com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader getDisplayHint()
```

Types: [Reader](../../CsTypeDisplayHint/Reader.md#s-Reader)

<a id="s-getEnum"></a>
### getEnum()

```java
public com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader getEnum()
```

Types: [Reader](../../CsTypeEnum/Reader.md#s-Reader)

<a id="s-getIdentity"></a>
### getIdentity()

```java
public com.tailf.ncs.maapi.Schema.CsTypeIdentity.Reader getIdentity()
```

Types: [Reader](../../CsTypeIdentity/Reader.md#s-Reader)

<a id="s-getIdref"></a>
### getIdref()

```java
public com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader getIdref()
```

Types: [Reader](../../CsTypeIdref/Reader.md#s-Reader)

<a id="s-getList"></a>
### getList()

```java
public com.tailf.ncs.maapi.Schema.CsTypeList.Reader getList()
```

Types: [Reader](../../CsTypeList/Reader.md#s-Reader)

<a id="s-getListRestriction"></a>
### getListRestriction()

```java
public com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader getListRestriction()
```

Types: [Reader](../../CsTypeListRestriction/Reader.md#s-Reader)

<a id="s-getNone"></a>
### getNone()

```java
public com.tailf.ncs.maapi.Schema.CsTypeNone.Reader getNone()
```

Types: [Reader](../../CsTypeNone/Reader.md#s-Reader)

<a id="s-getNumber"></a>
### getNumber()

```java
public com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader getNumber()
```

Types: [Reader](../../CsTypeNumber/Reader.md#s-Reader)

<a id="s-getString"></a>
### getString()

```java
public com.tailf.ncs.maapi.Schema.CsTypeString.Reader getString()
```

Types: [Reader](../../CsTypeString/Reader.md#s-Reader)

<a id="s-getUnion"></a>
### getUnion()

```java
public com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader getUnion()
```

Types: [Reader](../../CsTypeUnion/Reader.md#s-Reader)

<a id="s-hasBits"></a>
### hasBits()

```java
public boolean hasBits()
```

<a id="s-hasDecimal64"></a>
### hasDecimal64()

```java
public boolean hasDecimal64()
```

<a id="s-hasDisplayHint"></a>
### hasDisplayHint()

```java
public boolean hasDisplayHint()
```

<a id="s-hasEnum"></a>
### hasEnum()

```java
public boolean hasEnum()
```

<a id="s-hasIdentity"></a>
### hasIdentity()

```java
public boolean hasIdentity()
```

<a id="s-hasIdref"></a>
### hasIdref()

```java
public boolean hasIdref()
```

<a id="s-hasList"></a>
### hasList()

```java
public boolean hasList()
```

<a id="s-hasListRestriction"></a>
### hasListRestriction()

```java
public boolean hasListRestriction()
```

<a id="s-hasNone"></a>
### hasNone()

```java
public boolean hasNone()
```

<a id="s-hasNumber"></a>
### hasNumber()

```java
public boolean hasNumber()
```

<a id="s-hasString"></a>
### hasString()

```java
public boolean hasString()
```

<a id="s-hasUnion"></a>
### hasUnion()

```java
public boolean hasUnion()
```

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

<a id="s-which"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.CsType.Value.Which which()
```

Types: [Which](Which.md#s-Which)
