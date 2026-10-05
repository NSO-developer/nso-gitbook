<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDecimal64.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getFractionDigits()](#m-getfractiondigits-57dce19c4ffe)
- [getValue()](#m-getvalue-d93864668c40)
- [setFractionDigits(byte)](#m-setfractiondigits-4268b060f4fc)
- [setValue(long)](#m-setvalue-0eb87343a952)

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
public final com.tailf.ncs.maapi.Schema.CsValueDecimal64.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getfractiondigits-57dce19c4ffe"></a>
### getFractionDigits()

```java
public final byte getFractionDigits()
```

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public final long getValue()
```

<a id="m-setfractiondigits-4268b060f4fc"></a>
### setFractionDigits(byte)

```java
public final void setFractionDigits(byte value)
```

**Parameters**

- `byte value`

<a id="m-setvalue-0eb87343a952"></a>
### setValue(long)

```java
public final void setValue(long value)
```

**Parameters**

- `long value`
