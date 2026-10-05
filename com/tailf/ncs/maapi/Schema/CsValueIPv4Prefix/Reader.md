<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getA1()](#m-geta1-f8b8009a6bc7)
- [getA2()](#m-geta2-a28d45466763)
- [getA3()](#m-geta3-330abd611894)
- [getA4()](#m-geta4-fce3220b7c51)
- [getPrefix()](#m-getprefix-9268091e0223)

## Constructors

<a id="m-reader-cf5e962c3323"></a>
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

<a id="m-geta1-f8b8009a6bc7"></a>
### getA1()

```java
public final byte getA1()
```

<a id="m-geta2-a28d45466763"></a>
### getA2()

```java
public final byte getA2()
```

<a id="m-geta3-330abd611894"></a>
### getA3()

```java
public final byte getA3()
```

<a id="m-geta4-fce3220b7c51"></a>
### getA4()

```java
public final byte getA4()
```

<a id="m-getprefix-9268091e0223"></a>
### getPrefix()

```java
public final byte getPrefix()
```
