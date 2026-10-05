# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#reader-cf5e962c3323)

**Methods**:

- [getName()](#getname-2634b18b4a25)
- [getPos()](#getpos-ad2d7b30807f)
- [hasName()](#hasname-bfe6c334e0d1)

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

### getName() <a href="#getname-2634b18b4a25" id="getname-2634b18b4a25"></a>

```java
public org.capnproto.Text.Reader getName()
```

### getPos() <a href="#getpos-ad2d7b30807f" id="getpos-ad2d7b30807f"></a>

```java
public final int getPos()
```

### hasName() <a href="#hasname-bfe6c334e0d1" id="hasname-bfe6c334e0d1"></a>

```java
public boolean hasName()
```
