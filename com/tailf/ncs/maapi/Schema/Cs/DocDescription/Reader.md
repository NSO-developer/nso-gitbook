# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.DocDescription.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getNone()](#m-getNone-e31bfdbffa7f)
- [getValue()](#m-getValue-d93864668c40)
- [hasValue()](#m-hasValue-dad92e423e7a)
- [isNone()](#m-isNone-e8a993ad0453)
- [isValue()](#m-isValue-7280ea8211f4)
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

### getNone() <a href="#m-getNone-e31bfdbffa7f" id="m-getNone-e31bfdbffa7f"></a>

```java
public final org.capnproto.Void getNone()
```

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public org.capnproto.Text.Reader getValue()
```

### hasValue() <a href="#m-hasValue-dad92e423e7a" id="m-hasValue-dad92e423e7a"></a>

```java
public boolean hasValue()
```

### isNone() <a href="#m-isNone-e8a993ad0453" id="m-isNone-e8a993ad0453"></a>

```java
public final boolean isNone()
```

### isValue() <a href="#m-isValue-7280ea8211f4" id="m-isValue-7280ea8211f4"></a>

```java
public final boolean isValue()
```

### which() <a href="#m-which-0b2d23db5ed0" id="m-which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.DocDescription.Which which()
```

Types: [Which](Which.md#cls-Which)
