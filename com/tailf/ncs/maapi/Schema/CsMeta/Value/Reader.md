<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsMeta.Value.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getNone()](#s-getNone)
- [getText()](#s-getText)
- [hasText()](#s-hasText)
- [isNone()](#s-isNone)
- [isText()](#s-isText)
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

<a id="s-getText"></a>
### getText()

```java
public org.capnproto.Text.Reader getText()
```

<a id="s-hasText"></a>
### hasText()

```java
public boolean hasText()
```

<a id="s-isNone"></a>
### isNone()

```java
public final boolean isNone()
```

<a id="s-isText"></a>
### isText()

```java
public final boolean isText()
```

<a id="s-which"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.CsMeta.Value.Which which()
```

Types: [Which](Which.md#s-Which)
