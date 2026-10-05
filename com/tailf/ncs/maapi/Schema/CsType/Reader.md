# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#reader-cf5e962c3323)

**Methods**:

- [getName()](#getname-2634b18b4a25)
- [getNs()](#getns-59b97eae2a4a)
- [getParent()](#getparent-45c1b196ed70)
- [getValue()](#getvalue-d93864668c40)
- [hasName()](#hasname-bfe6c334e0d1)
- [hasParent()](#hasparent-eef40f9d4483)

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

### getNs() <a href="#getns-59b97eae2a4a" id="getns-59b97eae2a4a"></a>

```java
public final int getNs()
```

### getParent() <a href="#getparent-45c1b196ed70" id="getparent-45c1b196ed70"></a>

```java
public com.tailf.ncs.maapi.Schema.CsTypeReference.Reader getParent()
```

Types: [Reader](../CsTypeReference/Reader.md#reader-b2467a96ddff)

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public com.tailf.ncs.maapi.Schema.CsType.Value.Reader getValue()
```

Types: [Reader](Value/Reader.md#reader-b2467a96ddff)

### hasName() <a href="#hasname-bfe6c334e0d1" id="hasname-bfe6c334e0d1"></a>

```java
public boolean hasName()
```

### hasParent() <a href="#hasparent-eef40f9d4483" id="hasparent-eef40f9d4483"></a>

```java
public boolean hasParent()
```
