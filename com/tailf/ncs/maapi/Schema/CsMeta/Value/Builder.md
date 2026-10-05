# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#builder-179fba5038bd)

**Methods**:

- [asReader()](#asreader-b5c0f2a8d115)
- [getNone()](#getnone-e31bfdbffa7f)
- [getText()](#gettext-e63d55fcdcbd)
- [hasText()](#hastext-9f49522a4f5a)
- [initText(int)](#inittext-6175682972e5)
- [isNone()](#isnone-e8a993ad0453)
- [isText()](#istext-98869fdb86ee)
- [setNone(Void)](#setnone-46764db867d5)
- [setText(Reader)](#settext-e072baf7bad6)
- [setText(String)](#settext-bb5093080571)
- [which()](#which-0b2d23db5ed0)

## Constructors

### Builder(SegmentBuilder, int, int, int, short) <a href="#builder-179fba5038bd" id="builder-179fba5038bd"></a>

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

### asReader() <a href="#asreader-b5c0f2a8d115" id="asreader-b5c0f2a8d115"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsMeta.Value.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getNone() <a href="#getnone-e31bfdbffa7f" id="getnone-e31bfdbffa7f"></a>

```java
public final org.capnproto.Void getNone()
```

### getText() <a href="#gettext-e63d55fcdcbd" id="gettext-e63d55fcdcbd"></a>

```java
public final org.capnproto.Text.Builder getText()
```

### hasText() <a href="#hastext-9f49522a4f5a" id="hastext-9f49522a4f5a"></a>

```java
public final boolean hasText()
```

### initText(int) <a href="#inittext-6175682972e5" id="inittext-6175682972e5"></a>

```java
public final org.capnproto.Text.Builder initText(int size)
```

**Parameters**

- `int size`

### isNone() <a href="#isnone-e8a993ad0453" id="isnone-e8a993ad0453"></a>

```java
public final boolean isNone()
```

### isText() <a href="#istext-98869fdb86ee" id="istext-98869fdb86ee"></a>

```java
public final boolean isText()
```

### setNone(Void) <a href="#setnone-46764db867d5" id="setnone-46764db867d5"></a>

```java
public final void setNone(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setText(Reader) <a href="#settext-e072baf7bad6" id="settext-e072baf7bad6"></a>

```java
public final void setText(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setText(String) <a href="#settext-bb5093080571" id="settext-bb5093080571"></a>

```java
public final void setText(String value)
```

**Parameters**

- `String value`

### which() <a href="#which-0b2d23db5ed0" id="which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.CsMeta.Value.Which which()
```

Types: [Which](Which.md#which-92b652653aa7)
