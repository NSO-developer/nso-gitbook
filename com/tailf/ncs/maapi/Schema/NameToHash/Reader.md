<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.NameToHash.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getHash()](#m-gethash-7efe0716cf4b)
- [getName()](#m-getname-2634b18b4a25)
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

<a id="m-gethash-7efe0716cf4b"></a>
### getHash()

```java
public final int getHash()
```

<a id="m-getname-2634b18b4a25"></a>
### getName()

```java
public org.capnproto.Text.Reader getName()
```

<a id="m-hasname-bfe6c334e0d1"></a>
### hasName()

```java
public boolean hasName()
```
