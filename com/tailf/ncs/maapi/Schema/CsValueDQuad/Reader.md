# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getD1()](#m-getD1-1ccbbca0d18f)
- [getD2()](#m-getD2-93b8c43fe331)
- [getD3()](#m-getD3-1982f3560cd6)
- [getD4()](#m-getD4-a7608deae360)

## Constructors

### Reader(SegmentReader, int, int, int, short, int) <a href="#m-Reader-cf5e962c3323" id="m-Reader-cf5e962c3323"></a>

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

### getD1() <a href="#m-getD1-1ccbbca0d18f" id="m-getD1-1ccbbca0d18f"></a>

```java
public final byte getD1()
```

### getD2() <a href="#m-getD2-93b8c43fe331" id="m-getD2-93b8c43fe331"></a>

```java
public final byte getD2()
```

### getD3() <a href="#m-getD3-1982f3560cd6" id="m-getD3-1982f3560cd6"></a>

```java
public final byte getD3()
```

### getD4() <a href="#m-getD4-a7608deae360" id="m-getD4-a7608deae360"></a>

```java
public final byte getD4()
```
