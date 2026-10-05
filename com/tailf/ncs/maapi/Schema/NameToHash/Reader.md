<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.NameToHash.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getHash()](#s-getHash)
- [getName()](#s-getName)
- [hasName()](#s-hasName)

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

<a id="s-getHash"></a>
### getHash()

```java
public final int getHash()
```

<a id="s-getName"></a>
### getName()

```java
public org.capnproto.Text.Reader getName()
```

<a id="s-hasName"></a>
### hasName()

```java
public boolean hasName()
```
