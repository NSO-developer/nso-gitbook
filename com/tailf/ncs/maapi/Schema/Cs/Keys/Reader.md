# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Keys.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getList()](#m-getList-bb3f8cbe83be)
- [getNone()](#m-getNone-e31bfdbffa7f)
- [hasList()](#m-hasList-3712d7ce73ac)
- [isList()](#m-isList-c36bce63b506)
- [isNone()](#m-isNone-e8a993ad0453)
- [which()](#m-which-0b2d23db5ed0)

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

### getList() <a href="#m-getList-bb3f8cbe83be" id="m-getList-bb3f8cbe83be"></a>

```java
public final org.capnproto.PrimitiveList.Int.Reader getList()
```

### getNone() <a href="#m-getNone-e31bfdbffa7f" id="m-getNone-e31bfdbffa7f"></a>

```java
public final org.capnproto.Void getNone()
```

### hasList() <a href="#m-hasList-3712d7ce73ac" id="m-hasList-3712d7ce73ac"></a>

```java
public final boolean hasList()
```

### isList() <a href="#m-isList-c36bce63b506" id="m-isList-c36bce63b506"></a>

```java
public final boolean isList()
```

### isNone() <a href="#m-isNone-e8a993ad0453" id="m-isNone-e8a993ad0453"></a>

```java
public final boolean isNone()
```

### which() <a href="#m-which-0b2d23db5ed0" id="m-which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.Keys.Which which()
```

Types: [Which](Which.md#cls-Which)
