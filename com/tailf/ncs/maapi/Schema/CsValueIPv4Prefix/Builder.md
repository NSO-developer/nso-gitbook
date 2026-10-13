# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getA1\(\)](#geta1-f8b8009a6bc7)
- [getA2\(\)](#geta2-a28d45466763)
- [getA3\(\)](#geta3-330abd611894)
- [getA4\(\)](#geta4-fce3220b7c51)
- [getPrefix\(\)](#getprefix-9268091e0223)
- [setA1\(byte\)](#seta1-32c52405dfad)
- [setA2\(byte\)](#seta2-303439b65cb0)
- [setA3\(byte\)](#seta3-157e4ab42041)
- [setA4\(byte\)](#seta4-45ac97b7d3a4)
- [setPrefix\(byte\)](#setprefix-e20c09b64c12)

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
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getA1() <a href="#geta1-f8b8009a6bc7" id="geta1-f8b8009a6bc7"></a>

```java
public final byte getA1()
```

### getA2() <a href="#geta2-a28d45466763" id="geta2-a28d45466763"></a>

```java
public final byte getA2()
```

### getA3() <a href="#geta3-330abd611894" id="geta3-330abd611894"></a>

```java
public final byte getA3()
```

### getA4() <a href="#geta4-fce3220b7c51" id="geta4-fce3220b7c51"></a>

```java
public final byte getA4()
```

### getPrefix() <a href="#getprefix-9268091e0223" id="getprefix-9268091e0223"></a>

```java
public final byte getPrefix()
```

### setA1(byte) <a href="#seta1-32c52405dfad" id="seta1-32c52405dfad"></a>

```java
public final void setA1(byte value)
```

**Parameters**

- `byte value`

### setA2(byte) <a href="#seta2-303439b65cb0" id="seta2-303439b65cb0"></a>

```java
public final void setA2(byte value)
```

**Parameters**

- `byte value`

### setA3(byte) <a href="#seta3-157e4ab42041" id="seta3-157e4ab42041"></a>

```java
public final void setA3(byte value)
```

**Parameters**

- `byte value`

### setA4(byte) <a href="#seta4-45ac97b7d3a4" id="seta4-45ac97b7d3a4"></a>

```java
public final void setA4(byte value)
```

**Parameters**

- `byte value`

### setPrefix(byte) <a href="#setprefix-e20c09b64c12" id="setprefix-e20c09b64c12"></a>

```java
public final void setPrefix(byte value)
```

**Parameters**

- `byte value`
