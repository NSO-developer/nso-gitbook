# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#reader-cf5e962c3323)

**Methods**:

- [getA1()](#geta1-f8b8009a6bc7)
- [getA2()](#geta2-a28d45466763)
- [getA3()](#geta3-330abd611894)
- [getA4()](#geta4-fce3220b7c51)
- [getPrefix()](#getprefix-9268091e0223)

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
