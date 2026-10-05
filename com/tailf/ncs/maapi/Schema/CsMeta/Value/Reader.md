# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsMeta.Value.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader\(SegmentReader, int, int, int, short, int\)](#reader-cf5e962c3323)

**Methods**:

- [getNone\(\)](#getnone-e31bfdbffa7f)
- [getText\(\)](#gettext-e63d55fcdcbd)
- [hasText\(\)](#hastext-9f49522a4f5a)
- [isNone\(\)](#isnone-e8a993ad0453)
- [isText\(\)](#istext-98869fdb86ee)
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

### getNone() <a href="#getnone-e31bfdbffa7f" id="getnone-e31bfdbffa7f"></a>

```java
public final org.capnproto.Void getNone()
```

### getText() <a href="#gettext-e63d55fcdcbd" id="gettext-e63d55fcdcbd"></a>

```java
public org.capnproto.Text.Reader getText()
```

### hasText() <a href="#hastext-9f49522a4f5a" id="hastext-9f49522a4f5a"></a>

```java
public boolean hasText()
```

### isNone() <a href="#isnone-e8a993ad0453" id="isnone-e8a993ad0453"></a>

```java
public final boolean isNone()
```

### isText() <a href="#istext-98869fdb86ee" id="istext-98869fdb86ee"></a>

```java
public final boolean isText()
```

### which() <a href="#which-0b2d23db5ed0" id="which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.CsMeta.Value.Which which()
```

Types: [Which](Which.md#which-92b652653aa7)
