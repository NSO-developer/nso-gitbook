<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDQuad.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getD1()](#s-getD1)
- [getD2()](#s-getD2)
- [getD3()](#s-getD3)
- [getD4()](#s-getD4)
- [setD1(byte)](#s-setD1)
- [setD2(byte)](#s-setD2)
- [setD3(byte)](#s-setD3)
- [setD4(byte)](#s-setD4)

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
public final com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getD1"></a>
### getD1()

```java
public final byte getD1()
```

<a id="s-getD2"></a>
### getD2()

```java
public final byte getD2()
```

<a id="s-getD3"></a>
### getD3()

```java
public final byte getD3()
```

<a id="s-getD4"></a>
### getD4()

```java
public final byte getD4()
```

<a id="s-setD1"></a>
### setD1(byte)

```java
public final void setD1(byte value)
```

**Parameters**

- `byte value`

<a id="s-setD2"></a>
### setD2(byte)

```java
public final void setD2(byte value)
```

**Parameters**

- `byte value`

<a id="s-setD3"></a>
### setD3(byte)

```java
public final void setD3(byte value)
```

**Parameters**

- `byte value`

<a id="s-setD4"></a>
### setD4(byte)

```java
public final void setD4(byte value)
```

**Parameters**

- `byte value`
