<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.NamedType.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getName()](#s-getName)
- [getType()](#s-getType)
- [hasName()](#s-hasName)
- [hasType()](#s-hasType)

## Constructors

<a id="s-Reader-1"></a>
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

<a id="s-getName"></a>
### getName()

```java
public org.capnproto.Text.Reader getName()
```

<a id="s-getType"></a>
### getType()

```java
public com.tailf.ncs.maapi.Schema.CsType.Reader getType()
```

Types: [Reader](../CsType/Reader.md#s-Reader)

<a id="s-hasName"></a>
### hasName()

```java
public boolean hasName()
```

<a id="s-hasType"></a>
### hasType()

```java
public boolean hasType()
```
