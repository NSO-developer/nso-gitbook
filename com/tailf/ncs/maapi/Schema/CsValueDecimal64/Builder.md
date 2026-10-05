<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDecimal64.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getFractionDigits()](#s-getFractionDigits)
- [getValue()](#s-getValue)
- [setFractionDigits(byte)](#s-setFractionDigits)
- [setValue(long)](#s-setValue)

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
public final com.tailf.ncs.maapi.Schema.CsValueDecimal64.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getFractionDigits"></a>
### getFractionDigits()

```java
public final byte getFractionDigits()
```

<a id="s-getValue"></a>
### getValue()

```java
public final long getValue()
```

<a id="s-setFractionDigits"></a>
### setFractionDigits(byte)

```java
public final void setFractionDigits(byte value)
```

**Parameters**

- `byte value`

<a id="s-setValue"></a>
### setValue(long)

```java
public final void setValue(long value)
```

**Parameters**

- `long value`
