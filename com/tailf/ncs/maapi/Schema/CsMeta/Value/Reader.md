# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsMeta.Value.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getNone()](#m-getNone-e31bfdbffa7f)
- [getText()](#m-getText-e63d55fcdcbd)
- [hasText()](#m-hasText-9f49522a4f5a)
- [isNone()](#m-isNone-e8a993ad0453)
- [isText()](#m-isText-98869fdb86ee)
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

### getText() <a href="#m-getText-e63d55fcdcbd" id="m-getText-e63d55fcdcbd"></a>

```java
public org.capnproto.Text.Reader getText()
```

### hasText() <a href="#m-hasText-9f49522a4f5a" id="m-hasText-9f49522a4f5a"></a>

```java
public boolean hasText()
```

### isNone() <a href="#m-isNone-e8a993ad0453" id="m-isNone-e8a993ad0453"></a>

```java
public final boolean isNone()
```

### isText() <a href="#m-isText-98869fdb86ee" id="m-isText-98869fdb86ee"></a>

```java
public final boolean isText()
```

### which() <a href="#m-which-0b2d23db5ed0" id="m-which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.CsMeta.Value.Which which()
```

Types: [Which](Which.md#cls-Which)
