# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Value.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader\(SegmentReader, int, int, int, short, int\)](#reader-cf5e962c3323)

**Methods**:

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
- [hasBits\(\)](#hasbits-3d091966c9f9)
- [hasDecimal64\(\)](#hasdecimal64-85dcdb2b131e)
- [hasDisplayHint\(\)](#hasdisplayhint-a0d050b8aab0)
- [hasEnum\(\)](#hasenum-1d114db3fe39)
- [hasIdentity\(\)](#hasidentity-f1490905d6e2)
- [hasIdref\(\)](#hasidref-289f055cad8f)
- [hasList\(\)](#haslist-3712d7ce73ac)
- [hasListRestriction\(\)](#haslistrestriction-c778171a0737)
- [hasNone\(\)](#hasnone-2bfc8643e387)
- [hasNumber\(\)](#hasnumber-0518c2df0887)
- [hasString\(\)](#hasstring-881bf798306f)
- [hasUnion\(\)](#hasunion-b08deffc4123)
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
- [which\(\)](#which-0b2d23db5ed0)

## Constructors

### Reader(SegmentReader, int, int, int, short, int) <a href="#reader-cf5e962c3323" id="reader-cf5e962c3323"></a>

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

### getBits() <a href="#getbits-032b4694ff31" id="getbits-032b4694ff31"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeBits.Reader getBits()
```

Types: [Reader](../../CsTypeBits/Reader.md#reader-b2467a96ddff)

### getDecimal64() <a href="#getdecimal64-193bb466ba33" id="getdecimal64-193bb466ba33"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader getDecimal64()
```

Types: [Reader](../../CsTypeDecimal64/Reader.md#reader-b2467a96ddff)

### getDisplayHint() <a href="#getdisplayhint-f9cb8b7f487f" id="getdisplayhint-f9cb8b7f487f"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader getDisplayHint()
```

Types: [Reader](../../CsTypeDisplayHint/Reader.md#reader-b2467a96ddff)

### getEnum() <a href="#getenum-c3a0d3b9ada8" id="getenum-c3a0d3b9ada8"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader getEnum()
```

Types: [Reader](../../CsTypeEnum/Reader.md#reader-b2467a96ddff)

### getIdentity() <a href="#getidentity-249dccdd4d86" id="getidentity-249dccdd4d86"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeIdentity.Reader getIdentity()
```

Types: [Reader](../../CsTypeIdentity/Reader.md#reader-b2467a96ddff)

### getIdref() <a href="#getidref-63813e21dc3f" id="getidref-63813e21dc3f"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader getIdref()
```

Types: [Reader](../../CsTypeIdref/Reader.md#reader-b2467a96ddff)

### getList() <a href="#getlist-bb3f8cbe83be" id="getlist-bb3f8cbe83be"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeList.Reader getList()
```

Types: [Reader](../../CsTypeList/Reader.md#reader-b2467a96ddff)

### getListRestriction() <a href="#getlistrestriction-ce6c8d137d0a" id="getlistrestriction-ce6c8d137d0a"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader getListRestriction()
```

Types: [Reader](../../CsTypeListRestriction/Reader.md#reader-b2467a96ddff)

### getNone() <a href="#getnone-e31bfdbffa7f" id="getnone-e31bfdbffa7f"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeNone.Reader getNone()
```

Types: [Reader](../../CsTypeNone/Reader.md#reader-b2467a96ddff)

### getNumber() <a href="#getnumber-bb87f37a80c3" id="getnumber-bb87f37a80c3"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader getNumber()
```

Types: [Reader](../../CsTypeNumber/Reader.md#reader-b2467a96ddff)

### getString() <a href="#getstring-4464e45dd212" id="getstring-4464e45dd212"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeString.Reader getString()
```

Types: [Reader](../../CsTypeString/Reader.md#reader-b2467a96ddff)

### getUnion() <a href="#getunion-09a450ad6ddb" id="getunion-09a450ad6ddb"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader getUnion()
```

Types: [Reader](../../CsTypeUnion/Reader.md#reader-b2467a96ddff)

### hasBits() <a href="#hasbits-3d091966c9f9" id="hasbits-3d091966c9f9"></a>

```java
public boolean hasBits()
```

### hasDecimal64() <a href="#hasdecimal64-85dcdb2b131e" id="hasdecimal64-85dcdb2b131e"></a>

```java
public boolean hasDecimal64()
```

### hasDisplayHint() <a href="#hasdisplayhint-a0d050b8aab0" id="hasdisplayhint-a0d050b8aab0"></a>

```java
public boolean hasDisplayHint()
```

### hasEnum() <a href="#hasenum-1d114db3fe39" id="hasenum-1d114db3fe39"></a>

```java
public boolean hasEnum()
```

### hasIdentity() <a href="#hasidentity-f1490905d6e2" id="hasidentity-f1490905d6e2"></a>

```java
public boolean hasIdentity()
```

### hasIdref() <a href="#hasidref-289f055cad8f" id="hasidref-289f055cad8f"></a>

```java
public boolean hasIdref()
```

### hasList() <a href="#haslist-3712d7ce73ac" id="haslist-3712d7ce73ac"></a>

```java
public boolean hasList()
```

### hasListRestriction() <a href="#haslistrestriction-c778171a0737" id="haslistrestriction-c778171a0737"></a>

```java
public boolean hasListRestriction()
```

### hasNone() <a href="#hasnone-2bfc8643e387" id="hasnone-2bfc8643e387"></a>

```java
public boolean hasNone()
```

### hasNumber() <a href="#hasnumber-0518c2df0887" id="hasnumber-0518c2df0887"></a>

```java
public boolean hasNumber()
```

### hasString() <a href="#hasstring-881bf798306f" id="hasstring-881bf798306f"></a>

```java
public boolean hasString()
```

### hasUnion() <a href="#hasunion-b08deffc4123" id="hasunion-b08deffc4123"></a>

```java
public boolean hasUnion()
```

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

### which() <a href="#which-0b2d23db5ed0" id="which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.CsType.Value.Which which()
```

Types: [Which](Which.md#which-92b652653aa7)
