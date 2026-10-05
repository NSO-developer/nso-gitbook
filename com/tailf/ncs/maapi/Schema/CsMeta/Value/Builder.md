<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getNone()](#m-getnone-e31bfdbffa7f)
- [getText()](#m-gettext-e63d55fcdcbd)
- [hasText()](#m-hastext-9f49522a4f5a)
- [initText(int)](#m-inittext-6175682972e5)
- [isNone()](#m-isnone-e8a993ad0453)
- [isText()](#m-istext-98869fdb86ee)
- [setNone(Void)](#m-setnone-46764db867d5)
- [setText(Reader)](#m-settext-e072baf7bad6)
- [setText(String)](#m-settext-bb5093080571)
- [which()](#m-which-0b2d23db5ed0)

## Constructors

<a id="m-builder-179fba5038bd"></a>
### Builder(SegmentBuilder, int, int, int, short)

**Package-private**

```java
Builder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`


## Methods

<a id="m-asreader-b5c0f2a8d115"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.CsMeta.Value.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getnone-e31bfdbffa7f"></a>
### getNone()

```java
public final org.capnproto.Void getNone()
```

<a id="m-gettext-e63d55fcdcbd"></a>
### getText()

```java
public final org.capnproto.Text.Builder getText()
```

<a id="m-hastext-9f49522a4f5a"></a>
### hasText()

```java
public final boolean hasText()
```

<a id="m-inittext-6175682972e5"></a>
### initText(int)

```java
public final org.capnproto.Text.Builder initText(int size)
```

**Parameters**

- `int size`

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

<a id="m-setnone-46764db867d5"></a>
### setNone(Void)

```java
public final void setNone(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="m-settext-e072baf7bad6"></a>
### setText(Reader)

```java
public final void setText(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="m-settext-bb5093080571"></a>
### setText(String)

```java
public final void setText(String value)
```

**Parameters**

- `String value`

<a id="m-which-0b2d23db5ed0"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.CsMeta.Value.Which which()
```

Types: [Which](Which.md#cls-Which)
