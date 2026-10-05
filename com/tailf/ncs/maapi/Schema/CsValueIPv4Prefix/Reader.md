<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getA1()](#s-getA1)
- [getA2()](#s-getA2)
- [getA3()](#s-getA3)
- [getA4()](#s-getA4)
- [getPrefix()](#s-getPrefix)

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
