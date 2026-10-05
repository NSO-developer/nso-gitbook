# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getName()](#m-getName-2634b18b4a25)
- [getNs()](#m-getNs-59b97eae2a4a)
- [getParent()](#m-getParent-45c1b196ed70)
- [getValue()](#m-getValue-d93864668c40)
- [hasName()](#m-hasName-bfe6c334e0d1)
- [hasParent()](#m-hasParent-eef40f9d4483)

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

### getNs() <a href="#m-getNs-59b97eae2a4a" id="m-getNs-59b97eae2a4a"></a>

```java
public final int getNs()
```

### getParent() <a href="#m-getParent-45c1b196ed70" id="m-getParent-45c1b196ed70"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeReference.Reader getParent()
```

Types: [Reader](../CsTypeReference/Reader.md#cls-Reader)

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public com.tailf.ncs.maapi.Schema.CsType.Value.Reader getValue()
```

Types: [Reader](Value/Reader.md#cls-Reader)

### hasName() <a href="#m-hasName-bfe6c334e0d1" id="m-hasName-bfe6c334e0d1"></a>

```java
public boolean hasName()
```

### hasParent() <a href="#m-hasParent-eef40f9d4483" id="m-hasParent-eef40f9d4483"></a>

```java
public boolean hasParent()
```
