<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.NamedType.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getName()](#m-getname-2634b18b4a25)
- [getType()](#m-gettype-5a52f6f0d4c1)
- [hasName()](#m-hasname-bfe6c334e0d1)
- [hasType()](#m-hastype-61dd7b60aacb)

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

<a id="m-gettype-5a52f6f0d4c1"></a>
### getType()

```java
public com.tailf.ncs.maapi.Schema.CsType.Reader getType()
```

Types: [Reader](../CsType/Reader.md#cls-Reader)

<a id="m-hasname-bfe6c334e0d1"></a>
### hasName()

```java
public boolean hasName()
```

<a id="m-hastype-61dd7b60aacb"></a>
### hasType()

```java
public boolean hasType()
```
