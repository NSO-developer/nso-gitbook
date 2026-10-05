<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsMeta.Value.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getNone()](#m-getnone-e31bfdbffa7f)
- [getText()](#m-gettext-e63d55fcdcbd)
- [hasText()](#m-hastext-9f49522a4f5a)
- [isNone()](#m-isnone-e8a993ad0453)
- [isText()](#m-istext-98869fdb86ee)
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

<a id="m-gettext-e63d55fcdcbd"></a>
### getText()

```java
public org.capnproto.Text.Reader getText()
```

<a id="m-hastext-9f49522a4f5a"></a>
### hasText()

```java
public boolean hasText()
```

<a id="m-isnone-e8a993ad0453"></a>
### isNone()

```java
public final boolean isNone()
```

<a id="m-istext-98869fdb86ee"></a>
### isText()

```java
public final boolean isText()
```

<a id="m-which-0b2d23db5ed0"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.CsMeta.Value.Which which()
```

Types: [Which](Which.md#cls-Which)
