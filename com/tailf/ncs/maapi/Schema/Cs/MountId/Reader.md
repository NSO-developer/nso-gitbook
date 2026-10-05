<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.MountId.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getNone()](#m-getnone-e31bfdbffa7f)
- [getValue()](#m-getvalue-d93864668c40)
- [hasValue()](#m-hasvalue-dad92e423e7a)
- [isNone()](#m-isnone-e8a993ad0453)
- [isValue()](#m-isvalue-7280ea8211f4)
- [which()](#m-which-0b2d23db5ed0)

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

<a id="m-getnone-e31bfdbffa7f"></a>
### getNone()

```java
public final org.capnproto.Void getNone()
```

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public com.tailf.ncs.maapi.Schema.QTag.Reader getValue()
```

Types: [Reader](../../QTag/Reader.md#cls-Reader)

<a id="m-hasvalue-dad92e423e7a"></a>
### hasValue()

```java
public boolean hasValue()
```

<a id="m-isnone-e8a993ad0453"></a>
### isNone()

```java
public final boolean isNone()
```

<a id="m-isvalue-7280ea8211f4"></a>
### isValue()

```java
public final boolean isValue()
```

<a id="m-which-0b2d23db5ed0"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.Cs.MountId.Which which()
```

Types: [Which](Which.md#cls-Which)
