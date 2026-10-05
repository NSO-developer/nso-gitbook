# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getA1()](#m-getA1-f8b8009a6bc7)
- [getA2()](#m-getA2-a28d45466763)
- [getA3()](#m-getA3-330abd611894)
- [getA4()](#m-getA4-fce3220b7c51)
- [getPrefix()](#m-getPrefix-9268091e0223)
- [setA1(byte)](#m-setA1-32c52405dfad)
- [setA2(byte)](#m-setA2-303439b65cb0)
- [setA3(byte)](#m-setA3-157e4ab42041)
- [setA4(byte)](#m-setA4-45ac97b7d3a4)
- [setPrefix(byte)](#m-setPrefix-e20c09b64c12)

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
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getA1() <a href="#m-getA1-f8b8009a6bc7" id="m-getA1-f8b8009a6bc7"></a>

```java
public final byte getA1()
```

### getA2() <a href="#m-getA2-a28d45466763" id="m-getA2-a28d45466763"></a>

```java
public final byte getA2()
```

### getA3() <a href="#m-getA3-330abd611894" id="m-getA3-330abd611894"></a>

```java
public final byte getA3()
```

### getA4() <a href="#m-getA4-fce3220b7c51" id="m-getA4-fce3220b7c51"></a>

```java
public final byte getA4()
```

### getPrefix() <a href="#m-getPrefix-9268091e0223" id="m-getPrefix-9268091e0223"></a>

```java
public final byte getPrefix()
```

### setA1(byte) <a href="#m-setA1-32c52405dfad" id="m-setA1-32c52405dfad"></a>

```java
public final void setA1(byte value)
```

**Parameters**

- `byte value`

### setA2(byte) <a href="#m-setA2-303439b65cb0" id="m-setA2-303439b65cb0"></a>

```java
public final void setA2(byte value)
```

**Parameters**

- `byte value`

### setA3(byte) <a href="#m-setA3-157e4ab42041" id="m-setA3-157e4ab42041"></a>

```java
public final void setA3(byte value)
```

**Parameters**

- `byte value`

### setA4(byte) <a href="#m-setA4-45ac97b7d3a4" id="m-setA4-45ac97b7d3a4"></a>

```java
public final void setA4(byte value)
```

**Parameters**

- `byte value`

### setPrefix(byte) <a href="#m-setPrefix-e20c09b64c12" id="m-setPrefix-e20c09b64c12"></a>

```java
public final void setPrefix(byte value)
```

**Parameters**

- `byte value`
