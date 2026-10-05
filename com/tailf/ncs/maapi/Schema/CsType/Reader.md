<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getName()](#s-getName)
- [getNs()](#s-getNs)
- [getParent()](#s-getParent)
- [getValue()](#s-getValue)
- [hasName()](#s-hasName)
- [hasParent()](#s-hasParent)

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

<a id="s-getNs"></a>
### getNs()

```java
public final int getNs()
```

<a id="s-getParent"></a>
### getParent()

```java
public com.tailf.ncs.maapi.Schema.CsTypeReference.Reader getParent()
```

Types: [Reader](../CsTypeReference/Reader.md#s-Reader)

<a id="s-getValue"></a>
### getValue()

```java
public com.tailf.ncs.maapi.Schema.CsType.Value.Reader getValue()
```

Types: [Reader](Value/Reader.md#s-Reader)

<a id="s-hasName"></a>
### hasName()

```java
public boolean hasName()
```

<a id="s-hasParent"></a>
### hasParent()

```java
public boolean hasParent()
```
