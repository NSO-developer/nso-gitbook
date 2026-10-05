# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getNone()](#m-getNone-e31bfdbffa7f)
- [getText()](#m-getText-e63d55fcdcbd)
- [hasText()](#m-hasText-9f49522a4f5a)
- [initText(int)](#m-initText-6175682972e5)
- [isNone()](#m-isNone-e8a993ad0453)
- [isText()](#m-isText-98869fdb86ee)
- [setNone(Void)](#m-setNone-46764db867d5)
- [setText(Reader)](#m-setText-e072baf7bad6)
- [setText(String)](#m-setText-bb5093080571)
- [which()](#m-which-0b2d23db5ed0)

## Constructors

### Builder(SegmentBuilder, int, int, int, short) <a href="#m-Builder-179fba5038bd" id="m-Builder-179fba5038bd"></a>

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

### asReader() <a href="#m-asReader-b5c0f2a8d115" id="m-asReader-b5c0f2a8d115"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsMeta.Value.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getNone() <a href="#m-getNone-e31bfdbffa7f" id="m-getNone-e31bfdbffa7f"></a>

```java
public final org.capnproto.Void getNone()
```

### getText() <a href="#m-getText-e63d55fcdcbd" id="m-getText-e63d55fcdcbd"></a>

```java
public final org.capnproto.Text.Builder getText()
```

### hasText() <a href="#m-hasText-9f49522a4f5a" id="m-hasText-9f49522a4f5a"></a>

```java
public final boolean hasText()
```

### initText(int) <a href="#m-initText-6175682972e5" id="m-initText-6175682972e5"></a>

```java
public final org.capnproto.Text.Builder initText(int size)
```

**Parameters**

- `int size`

### isNone() <a href="#m-isNone-e8a993ad0453" id="m-isNone-e8a993ad0453"></a>

```java
public final boolean isNone()
```

### isText() <a href="#m-isText-98869fdb86ee" id="m-isText-98869fdb86ee"></a>

```java
public final boolean isText()
```

### setNone(Void) <a href="#m-setNone-46764db867d5" id="m-setNone-46764db867d5"></a>

```java
public final void setNone(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setText(Reader) <a href="#m-setText-e072baf7bad6" id="m-setText-e072baf7bad6"></a>

```java
public final void setText(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setText(String) <a href="#m-setText-bb5093080571" id="m-setText-bb5093080571"></a>

```java
public final void setText(String value)
```

**Parameters**

- `String value`

### which() <a href="#m-which-0b2d23db5ed0" id="m-which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.CsMeta.Value.Which which()
```

Types: [Which](Which.md#cls-Which)
