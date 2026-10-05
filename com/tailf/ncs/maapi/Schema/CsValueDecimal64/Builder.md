# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDecimal64.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getFractionDigits()](#m-getFractionDigits-57dce19c4ffe)
- [getValue()](#m-getValue-d93864668c40)
- [setFractionDigits(byte)](#m-setFractionDigits-4268b060f4fc)
- [setValue(long)](#m-setValue-0eb87343a952)

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
public final com.tailf.ncs.maapi.Schema.CsValueDecimal64.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getFractionDigits() <a href="#m-getFractionDigits-57dce19c4ffe" id="m-getFractionDigits-57dce19c4ffe"></a>

```java
public final byte getFractionDigits()
```

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public final long getValue()
```

### setFractionDigits(byte) <a href="#m-setFractionDigits-4268b060f4fc" id="m-setFractionDigits-4268b060f4fc"></a>

```java
public final void setFractionDigits(byte value)
```

**Parameters**

- `byte value`

### setValue(long) <a href="#m-setValue-0eb87343a952" id="m-setValue-0eb87343a952"></a>

```java
public final void setValue(long value)
```

**Parameters**

- `long value`
