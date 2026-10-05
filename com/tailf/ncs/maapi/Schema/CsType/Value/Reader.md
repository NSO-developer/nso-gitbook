<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Value.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

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
- [hasBits()](#m-hasbits-3d091966c9f9)
- [hasDecimal64()](#m-hasdecimal64-85dcdb2b131e)
- [hasDisplayHint()](#m-hasdisplayhint-a0d050b8aab0)
- [hasEnum()](#m-hasenum-1d114db3fe39)
- [hasIdentity()](#m-hasidentity-f1490905d6e2)
- [hasIdref()](#m-hasidref-289f055cad8f)
- [hasList()](#m-haslist-3712d7ce73ac)
- [hasListRestriction()](#m-haslistrestriction-c778171a0737)
- [hasNone()](#m-hasnone-2bfc8643e387)
- [hasNumber()](#m-hasnumber-0518c2df0887)
- [hasString()](#m-hasstring-881bf798306f)
- [hasUnion()](#m-hasunion-b08deffc4123)
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
- [which()](#m-which-0b2d23db5ed0)

## Constructors

<a id="m-reader-cf5e962c3323"></a>
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

<a id="m-getbits-032b4694ff31"></a>
### getBits()

```java
public com.tailf.ncs.maapi.Schema.CsTypeBits.Reader getBits()
```

Types: [Reader](../../CsTypeBits/Reader.md#cls-Reader)

<a id="m-getdecimal64-193bb466ba33"></a>
### getDecimal64()

```java
public com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader getDecimal64()
```

Types: [Reader](../../CsTypeDecimal64/Reader.md#cls-Reader)

<a id="m-getdisplayhint-f9cb8b7f487f"></a>
### getDisplayHint()

```java
public com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader getDisplayHint()
```

Types: [Reader](../../CsTypeDisplayHint/Reader.md#cls-Reader)

<a id="m-getenum-c3a0d3b9ada8"></a>
### getEnum()

```java
public com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader getEnum()
```

Types: [Reader](../../CsTypeEnum/Reader.md#cls-Reader)

<a id="m-getidentity-249dccdd4d86"></a>
### getIdentity()

```java
public com.tailf.ncs.maapi.Schema.CsTypeIdentity.Reader getIdentity()
```

Types: [Reader](../../CsTypeIdentity/Reader.md#cls-Reader)

<a id="m-getidref-63813e21dc3f"></a>
### getIdref()

```java
public com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader getIdref()
```

Types: [Reader](../../CsTypeIdref/Reader.md#cls-Reader)

<a id="m-getlist-bb3f8cbe83be"></a>
### getList()

```java
public com.tailf.ncs.maapi.Schema.CsTypeList.Reader getList()
```

Types: [Reader](../../CsTypeList/Reader.md#cls-Reader)

<a id="m-getlistrestriction-ce6c8d137d0a"></a>
### getListRestriction()

```java
public com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader getListRestriction()
```

Types: [Reader](../../CsTypeListRestriction/Reader.md#cls-Reader)

<a id="m-getnone-e31bfdbffa7f"></a>
### getNone()

```java
public com.tailf.ncs.maapi.Schema.CsTypeNone.Reader getNone()
```

Types: [Reader](../../CsTypeNone/Reader.md#cls-Reader)

<a id="m-getnumber-bb87f37a80c3"></a>
### getNumber()

```java
public com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader getNumber()
```

Types: [Reader](../../CsTypeNumber/Reader.md#cls-Reader)

<a id="m-getstring-4464e45dd212"></a>
### getString()

```java
public com.tailf.ncs.maapi.Schema.CsTypeString.Reader getString()
```

Types: [Reader](../../CsTypeString/Reader.md#cls-Reader)

<a id="m-getunion-09a450ad6ddb"></a>
### getUnion()

```java
public com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader getUnion()
```

Types: [Reader](../../CsTypeUnion/Reader.md#cls-Reader)

<a id="m-hasbits-3d091966c9f9"></a>
### hasBits()

```java
public boolean hasBits()
```

<a id="m-hasdecimal64-85dcdb2b131e"></a>
### hasDecimal64()

```java
public boolean hasDecimal64()
```

<a id="m-hasdisplayhint-a0d050b8aab0"></a>
### hasDisplayHint()

```java
public boolean hasDisplayHint()
```

<a id="m-hasenum-1d114db3fe39"></a>
### hasEnum()

```java
public boolean hasEnum()
```

<a id="m-hasidentity-f1490905d6e2"></a>
### hasIdentity()

```java
public boolean hasIdentity()
```

<a id="m-hasidref-289f055cad8f"></a>
### hasIdref()

```java
public boolean hasIdref()
```

<a id="m-haslist-3712d7ce73ac"></a>
### hasList()

```java
public boolean hasList()
```

<a id="m-haslistrestriction-c778171a0737"></a>
### hasListRestriction()

```java
public boolean hasListRestriction()
```

<a id="m-hasnone-2bfc8643e387"></a>
### hasNone()

```java
public boolean hasNone()
```

<a id="m-hasnumber-0518c2df0887"></a>
### hasNumber()

```java
public boolean hasNumber()
```

<a id="m-hasstring-881bf798306f"></a>
### hasString()

```java
public boolean hasString()
```

<a id="m-hasunion-b08deffc4123"></a>
### hasUnion()

```java
public boolean hasUnion()
```

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

<a id="m-which-0b2d23db5ed0"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.CsType.Value.Which which()
```

Types: [Which](Which.md#cls-Which)
