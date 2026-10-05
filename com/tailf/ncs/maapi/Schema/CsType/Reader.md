<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getName()](#m-getname-2634b18b4a25)
- [getNs()](#m-getns-59b97eae2a4a)
- [getParent()](#m-getparent-45c1b196ed70)
- [getValue()](#m-getvalue-d93864668c40)
- [hasName()](#m-hasname-bfe6c334e0d1)
- [hasParent()](#m-hasparent-eef40f9d4483)

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

<a id="m-getns-59b97eae2a4a"></a>
### getNs()

```java
public final int getNs()
```

<a id="m-getparent-45c1b196ed70"></a>
### getParent()

```java
public com.tailf.ncs.maapi.Schema.CsTypeReference.Reader getParent()
```

Types: [Reader](../CsTypeReference/Reader.md#cls-Reader)

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public com.tailf.ncs.maapi.Schema.CsType.Value.Reader getValue()
```

Types: [Reader](Value/Reader.md#cls-Reader)

<a id="m-hasname-bfe6c334e0d1"></a>
### hasName()

```java
public boolean hasName()
```

<a id="m-hasparent-eef40f9d4483"></a>
### hasParent()

```java
public boolean hasParent()
```
