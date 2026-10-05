<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.MountId.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getNone()](#s-getNone)
- [getValue()](#s-getValue)
- [hasValue()](#s-hasValue)
- [isNone()](#s-isNone)
- [isValue()](#s-isValue)
- [which()](#s-which)

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

<a id="s-getNone"></a>
### getNone()

```java
public final org.capnproto.Void getNone()
```

<a id="s-getValue"></a>
### getValue()

```java
public com.tailf.ncs.maapi.Schema.QTag.Reader getValue()
```

Types: [Reader](../../QTag/Reader.md#s-Reader)

<a id="s-hasValue"></a>
### hasValue()

```java
public boolean hasValue()
```

<a id="s-isNone"></a>
### isNone()

```java
public final boolean isNone()
```

<a id="s-isValue"></a>
### isValue()

```java
public final boolean isValue()
```

<a id="s-which"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.Cs.MountId.Which which()
```

Types: [Which](Which.md#s-Which)
