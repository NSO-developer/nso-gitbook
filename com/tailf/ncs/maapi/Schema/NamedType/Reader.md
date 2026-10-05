# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.NamedType.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getName()](#m-getName-2634b18b4a25)
- [getType()](#m-getType-5a52f6f0d4c1)
- [hasName()](#m-hasName-bfe6c334e0d1)
- [hasType()](#m-hasType-61dd7b60aacb)

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

### getName() <a href="#m-getName-2634b18b4a25" id="m-getName-2634b18b4a25"></a>

```java
public org.capnproto.Text.Reader getName()
```

### getType() <a href="#m-getType-5a52f6f0d4c1" id="m-getType-5a52f6f0d4c1"></a>

```java
public com.tailf.ncs.maapi.Schema.CsType.Reader getType()
```

Types: [Reader](../CsType/Reader.md#cls-Reader)

### hasName() <a href="#m-hasName-bfe6c334e0d1" id="m-hasName-bfe6c334e0d1"></a>

```java
public boolean hasName()
```

### hasType() <a href="#m-hasType-61dd7b60aacb" id="m-hasType-61dd7b60aacb"></a>

```java
public boolean hasType()
```
