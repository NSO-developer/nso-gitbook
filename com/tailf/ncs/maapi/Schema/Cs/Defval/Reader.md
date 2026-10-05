# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Defval.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#reader-cf5e962c3323)

**Methods**:

- [getNone()](#getnone-e31bfdbffa7f)
- [getValue()](#getvalue-d93864668c40)
- [hasValue()](#hasvalue-dad92e423e7a)
- [isNone()](#isnone-e8a993ad0453)
- [isValue()](#isvalue-7280ea8211f4)
- [which()](#which-0b2d23db5ed0)

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

### getNone() <a href="#getnone-e31bfdbffa7f" id="getnone-e31bfdbffa7f"></a>

```java
public final org.capnproto.Void getNone()
```

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValue.Reader getValue()
```

Types: [Reader](../../CsValue/Reader.md#reader-b2467a96ddff)

### hasValue() <a href="#hasvalue-dad92e423e7a" id="hasvalue-dad92e423e7a"></a>

```java
public boolean hasValue()
```

### isNone() <a href="#isnone-e8a993ad0453" id="isnone-e8a993ad0453"></a>

```java
public final boolean isNone()
```

### isValue() <a href="#isvalue-7280ea8211f4" id="isvalue-7280ea8211f4"></a>

```java
public final boolean isValue()
```

### which() <a href="#which-0b2d23db5ed0" id="which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.Defval.Which which()
```

Types: [Which](Which.md#which-92b652653aa7)
