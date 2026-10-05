# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Value.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

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
- [hasBits()](#m-hasBits-3d091966c9f9)
- [hasDecimal64()](#m-hasDecimal64-85dcdb2b131e)
- [hasDisplayHint()](#m-hasDisplayHint-a0d050b8aab0)
- [hasEnum()](#m-hasEnum-1d114db3fe39)
- [hasIdentity()](#m-hasIdentity-f1490905d6e2)
- [hasIdref()](#m-hasIdref-289f055cad8f)
- [hasList()](#m-hasList-3712d7ce73ac)
- [hasListRestriction()](#m-hasListRestriction-c778171a0737)
- [hasNone()](#m-hasNone-2bfc8643e387)
- [hasNumber()](#m-hasNumber-0518c2df0887)
- [hasString()](#m-hasString-881bf798306f)
- [hasUnion()](#m-hasUnion-b08deffc4123)
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
- [which()](#m-which-0b2d23db5ed0)

## Constructors

### Reader(SegmentReader, int, int, int, short, int) <a href="#m-Reader-cf5e962c3323" id="m-Reader-cf5e962c3323"></a>

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

### getBits() <a href="#m-getBits-032b4694ff31" id="m-getBits-032b4694ff31"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeBits.Reader getBits()
```

Types: [Reader](../../CsTypeBits/Reader.md#cls-Reader)

### getDecimal64() <a href="#m-getDecimal64-193bb466ba33" id="m-getDecimal64-193bb466ba33"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader getDecimal64()
```

Types: [Reader](../../CsTypeDecimal64/Reader.md#cls-Reader)

### getDisplayHint() <a href="#m-getDisplayHint-f9cb8b7f487f" id="m-getDisplayHint-f9cb8b7f487f"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader getDisplayHint()
```

Types: [Reader](../../CsTypeDisplayHint/Reader.md#cls-Reader)

### getEnum() <a href="#m-getEnum-c3a0d3b9ada8" id="m-getEnum-c3a0d3b9ada8"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader getEnum()
```

Types: [Reader](../../CsTypeEnum/Reader.md#cls-Reader)

### getIdentity() <a href="#m-getIdentity-249dccdd4d86" id="m-getIdentity-249dccdd4d86"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeIdentity.Reader getIdentity()
```

Types: [Reader](../../CsTypeIdentity/Reader.md#cls-Reader)

### getIdref() <a href="#m-getIdref-63813e21dc3f" id="m-getIdref-63813e21dc3f"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader getIdref()
```

Types: [Reader](../../CsTypeIdref/Reader.md#cls-Reader)

### getList() <a href="#m-getList-bb3f8cbe83be" id="m-getList-bb3f8cbe83be"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeList.Reader getList()
```

Types: [Reader](../../CsTypeList/Reader.md#cls-Reader)

### getListRestriction() <a href="#m-getListRestriction-ce6c8d137d0a" id="m-getListRestriction-ce6c8d137d0a"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader getListRestriction()
```

Types: [Reader](../../CsTypeListRestriction/Reader.md#cls-Reader)

### getNone() <a href="#m-getNone-e31bfdbffa7f" id="m-getNone-e31bfdbffa7f"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeNone.Reader getNone()
```

Types: [Reader](../../CsTypeNone/Reader.md#cls-Reader)

### getNumber() <a href="#m-getNumber-bb87f37a80c3" id="m-getNumber-bb87f37a80c3"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader getNumber()
```

Types: [Reader](../../CsTypeNumber/Reader.md#cls-Reader)

### getString() <a href="#m-getString-4464e45dd212" id="m-getString-4464e45dd212"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeString.Reader getString()
```

Types: [Reader](../../CsTypeString/Reader.md#cls-Reader)

### getUnion() <a href="#m-getUnion-09a450ad6ddb" id="m-getUnion-09a450ad6ddb"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader getUnion()
```

Types: [Reader](../../CsTypeUnion/Reader.md#cls-Reader)

### hasBits() <a href="#m-hasBits-3d091966c9f9" id="m-hasBits-3d091966c9f9"></a>

```java
public boolean hasBits()
```

### hasDecimal64() <a href="#m-hasDecimal64-85dcdb2b131e" id="m-hasDecimal64-85dcdb2b131e"></a>

```java
public boolean hasDecimal64()
```

### hasDisplayHint() <a href="#m-hasDisplayHint-a0d050b8aab0" id="m-hasDisplayHint-a0d050b8aab0"></a>

```java
public boolean hasDisplayHint()
```

### hasEnum() <a href="#m-hasEnum-1d114db3fe39" id="m-hasEnum-1d114db3fe39"></a>

```java
public boolean hasEnum()
```

### hasIdentity() <a href="#m-hasIdentity-f1490905d6e2" id="m-hasIdentity-f1490905d6e2"></a>

```java
public boolean hasIdentity()
```

### hasIdref() <a href="#m-hasIdref-289f055cad8f" id="m-hasIdref-289f055cad8f"></a>

```java
public boolean hasIdref()
```

### hasList() <a href="#m-hasList-3712d7ce73ac" id="m-hasList-3712d7ce73ac"></a>

```java
public boolean hasList()
```

### hasListRestriction() <a href="#m-hasListRestriction-c778171a0737" id="m-hasListRestriction-c778171a0737"></a>

```java
public boolean hasListRestriction()
```

### hasNone() <a href="#m-hasNone-2bfc8643e387" id="m-hasNone-2bfc8643e387"></a>

```java
public boolean hasNone()
```

### hasNumber() <a href="#m-hasNumber-0518c2df0887" id="m-hasNumber-0518c2df0887"></a>

```java
public boolean hasNumber()
```

### hasString() <a href="#m-hasString-881bf798306f" id="m-hasString-881bf798306f"></a>

```java
public boolean hasString()
```

### hasUnion() <a href="#m-hasUnion-b08deffc4123" id="m-hasUnion-b08deffc4123"></a>

```java
public boolean hasUnion()
```

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

### which() <a href="#m-which-0b2d23db5ed0" id="m-which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.CsType.Value.Which which()
```

Types: [Which](Which.md#cls-Which)
