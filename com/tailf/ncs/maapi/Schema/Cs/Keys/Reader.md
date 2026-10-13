# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Keys.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader\(SegmentReader, int, int, int, short, int\)](#reader-cf5e962c3323)

**Methods**:

- [getList\(\)](#getlist-bb3f8cbe83be)
- [getNone\(\)](#getnone-e31bfdbffa7f)
- [hasList\(\)](#haslist-3712d7ce73ac)
- [isList\(\)](#islist-c36bce63b506)
- [isNone\(\)](#isnone-e8a993ad0453)
- [which\(\)](#which-0b2d23db5ed0)

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

### getList() <a href="#getlist-bb3f8cbe83be" id="getlist-bb3f8cbe83be"></a>

```java
public final org.capnproto.PrimitiveList.Int.Reader getList()
```

### getNone() <a href="#getnone-e31bfdbffa7f" id="getnone-e31bfdbffa7f"></a>

```java
public final org.capnproto.Void getNone()
```

### hasList() <a href="#haslist-3712d7ce73ac" id="haslist-3712d7ce73ac"></a>

```java
public final boolean hasList()
```

### isList() <a href="#islist-c36bce63b506" id="islist-c36bce63b506"></a>

```java
public final boolean isList()
```

### isNone() <a href="#isnone-e8a993ad0453" id="isnone-e8a993ad0453"></a>

```java
public final boolean isNone()
```

### which() <a href="#which-0b2d23db5ed0" id="which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.Keys.Which which()
```

Types: [Which](Which.md#which-92b652653aa7)
