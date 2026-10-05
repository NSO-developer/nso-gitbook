<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueQName.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getName()](#s-getName)
- [getPrefix()](#s-getPrefix)
- [hasName()](#s-hasName)
- [hasPrefix()](#s-hasPrefix)

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

<a id="s-getPrefix"></a>
### getPrefix()

```java
public org.capnproto.Text.Reader getPrefix()
```

<a id="s-hasName"></a>
### hasName()

```java
public boolean hasName()
```

<a id="s-hasPrefix"></a>
### hasPrefix()

```java
public boolean hasPrefix()
```
