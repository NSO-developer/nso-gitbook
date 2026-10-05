<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getName()](#m-getname-2634b18b4a25)
- [getPos()](#m-getpos-ad2d7b30807f)
- [hasName()](#m-hasname-bfe6c334e0d1)

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

<a id="m-getname-2634b18b4a25"></a>
### getName()

```java
public org.capnproto.Text.Reader getName()
```

<a id="m-getpos-ad2d7b30807f"></a>
### getPos()

```java
public final int getPos()
```

<a id="m-hasname-bfe6c334e0d1"></a>
### hasName()

```java
public boolean hasName()
```
