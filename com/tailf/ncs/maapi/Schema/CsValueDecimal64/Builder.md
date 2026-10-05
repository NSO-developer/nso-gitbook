# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDecimal64.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#builder-179fba5038bd)

**Methods**:

- [asReader()](#asreader-b5c0f2a8d115)
- [getFractionDigits()](#getfractiondigits-57dce19c4ffe)
- [getValue()](#getvalue-d93864668c40)
- [setFractionDigits(byte)](#setfractiondigits-4268b060f4fc)
- [setValue(long)](#setvalue-0eb87343a952)

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
public final com.tailf.ncs.maapi.Schema.CsValueDecimal64.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getFractionDigits() <a href="#getfractiondigits-57dce19c4ffe" id="getfractiondigits-57dce19c4ffe"></a>

```java
public final byte getFractionDigits()
```

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public final long getValue()
```

### setFractionDigits(byte) <a href="#setfractiondigits-4268b060f4fc" id="setfractiondigits-4268b060f4fc"></a>

```java
public final void setFractionDigits(byte value)
```

**Parameters**

- `byte value`

### setValue(long) <a href="#setvalue-0eb87343a952" id="setvalue-0eb87343a952"></a>

```java
public final void setValue(long value)
```

**Parameters**

- `long value`
