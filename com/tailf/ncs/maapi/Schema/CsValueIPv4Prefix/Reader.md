# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getA1()](#m-getA1-f8b8009a6bc7)
- [getA2()](#m-getA2-a28d45466763)
- [getA3()](#m-getA3-330abd611894)
- [getA4()](#m-getA4-fce3220b7c51)
- [getPrefix()](#m-getPrefix-9268091e0223)

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

### getA1() <a href="#m-getA1-f8b8009a6bc7" id="m-getA1-f8b8009a6bc7"></a>

```java
public final byte getA1()
```

### getA2() <a href="#m-getA2-a28d45466763" id="m-getA2-a28d45466763"></a>

```java
public final byte getA2()
```

### getA3() <a href="#m-getA3-330abd611894" id="m-getA3-330abd611894"></a>

```java
public final byte getA3()
```

### getA4() <a href="#m-getA4-fce3220b7c51" id="m-getA4-fce3220b7c51"></a>

```java
public final byte getA4()
```

### getPrefix() <a href="#m-getPrefix-9268091e0223" id="m-getPrefix-9268091e0223"></a>

```java
public final byte getPrefix()
```
