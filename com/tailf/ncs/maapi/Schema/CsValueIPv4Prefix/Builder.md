<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getA1()](#s-getA1)
- [getA2()](#s-getA2)
- [getA3()](#s-getA3)
- [getA4()](#s-getA4)
- [getPrefix()](#s-getPrefix)
- [setA1(byte)](#s-setA1)
- [setA2(byte)](#s-setA2)
- [setA3(byte)](#s-setA3)
- [setA4(byte)](#s-setA4)
- [setPrefix(byte)](#s-setPrefix)

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
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getA1"></a>
### getA1()

```java
public final byte getA1()
```

<a id="s-getA2"></a>
### getA2()

```java
public final byte getA2()
```

<a id="s-getA3"></a>
### getA3()

```java
public final byte getA3()
```

<a id="s-getA4"></a>
### getA4()

```java
public final byte getA4()
```

<a id="s-getPrefix"></a>
### getPrefix()

```java
public final byte getPrefix()
```

<a id="s-setA1"></a>
### setA1(byte)

```java
public final void setA1(byte value)
```

**Parameters**

- `byte value`

<a id="s-setA2"></a>
### setA2(byte)

```java
public final void setA2(byte value)
```

**Parameters**

- `byte value`

<a id="s-setA3"></a>
### setA3(byte)

```java
public final void setA3(byte value)
```

**Parameters**

- `byte value`

<a id="s-setA4"></a>
### setA4(byte)

```java
public final void setA4(byte value)
```

**Parameters**

- `byte value`

<a id="s-setPrefix"></a>
### setPrefix(byte)

```java
public final void setPrefix(byte value)
```

**Parameters**

- `byte value`
