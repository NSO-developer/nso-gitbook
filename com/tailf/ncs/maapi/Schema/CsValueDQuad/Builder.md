# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDQuad.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getD1\(\)](#getd1-1ccbbca0d18f)
- [getD2\(\)](#getd2-93b8c43fe331)
- [getD3\(\)](#getd3-1982f3560cd6)
- [getD4\(\)](#getd4-a7608deae360)
- [setD1\(byte\)](#setd1-123e1073562a)
- [setD2\(byte\)](#setd2-7e3edbd83eb9)
- [setD3\(byte\)](#setd3-304a3b391ac1)
- [setD4\(byte\)](#setd4-fad28190aa51)

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
public final com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getD1() <a href="#getd1-1ccbbca0d18f" id="getd1-1ccbbca0d18f"></a>

```java
public final byte getD1()
```

### getD2() <a href="#getd2-93b8c43fe331" id="getd2-93b8c43fe331"></a>

```java
public final byte getD2()
```

### getD3() <a href="#getd3-1982f3560cd6" id="getd3-1982f3560cd6"></a>

```java
public final byte getD3()
```

### getD4() <a href="#getd4-a7608deae360" id="getd4-a7608deae360"></a>

```java
public final byte getD4()
```

### setD1(byte) <a href="#setd1-123e1073562a" id="setd1-123e1073562a"></a>

```java
public final void setD1(byte value)
```

**Parameters**

- `byte value`

### setD2(byte) <a href="#setd2-7e3edbd83eb9" id="setd2-7e3edbd83eb9"></a>

```java
public final void setD2(byte value)
```

**Parameters**

- `byte value`

### setD3(byte) <a href="#setd3-304a3b391ac1" id="setd3-304a3b391ac1"></a>

```java
public final void setD3(byte value)
```

**Parameters**

- `byte value`

### setD4(byte) <a href="#setd4-fad28190aa51" id="setd4-fad28190aa51"></a>

```java
public final void setD4(byte value)
```

**Parameters**

- `byte value`
