# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeReference.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader\(SegmentReader, int, int, int, short, int\)](#reader-cf5e962c3323)

**Methods**:

- [getName\(\)](#getname-2634b18b4a25)
- [getNsHash\(\)](#getnshash-f6f3e3ae1e6b)
- [hasName\(\)](#hasname-bfe6c334e0d1)

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

### getNsHash() <a href="#getnshash-f6f3e3ae1e6b" id="getnshash-f6f3e3ae1e6b"></a>

```java
public final int getNsHash()
```

### hasName() <a href="#hasname-bfe6c334e0d1" id="hasname-bfe6c334e0d1"></a>

```java
public boolean hasName()
```
