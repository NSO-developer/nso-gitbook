# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader\(SegmentReader, int, int, int, short, int\)](#reader-cf5e962c3323)

**Methods**:

- [getD1\(\)](#getd1-1ccbbca0d18f)
- [getD2\(\)](#getd2-93b8c43fe331)
- [getD3\(\)](#getd3-1982f3560cd6)
- [getD4\(\)](#getd4-a7608deae360)

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
