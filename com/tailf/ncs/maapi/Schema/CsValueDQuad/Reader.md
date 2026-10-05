<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getD1()](#s-getD1)
- [getD2()](#s-getD2)
- [getD3()](#s-getD3)
- [getD4()](#s-getD4)

## Constructors

<a id="s-Reader-1"></a>
### Reader(SegmentReader, int, int, int, short, int)

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
