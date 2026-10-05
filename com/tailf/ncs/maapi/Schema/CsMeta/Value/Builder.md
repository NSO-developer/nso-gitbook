<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getNone()](#s-getNone)
- [getText()](#s-getText)
- [hasText()](#s-hasText)
- [initText(int)](#s-initText)
- [isNone()](#s-isNone)
- [isText()](#s-isText)
- [setNone(Void)](#s-setNone)
- [setText(Reader)](#s-setText)
- [setText(String)](#s-setText-1)
- [which()](#s-which)

## Constructors

<a id="s-Builder-1"></a>
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

<a id="s-asReader"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.CsMeta.Value.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getNone"></a>
### getNone()

```java
public final org.capnproto.Void getNone()
```

<a id="s-getText"></a>
### getText()

```java
public final org.capnproto.Text.Builder getText()
```

<a id="s-hasText"></a>
### hasText()

```java
public final boolean hasText()
```

<a id="s-initText"></a>
### initText(int)

```java
public final org.capnproto.Text.Builder initText(int size)
```

**Parameters**

- `int size`

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

<a id="s-setNone"></a>
### setNone(Void)

```java
public final void setNone(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="s-setText"></a>
### setText(Reader)

```java
public final void setText(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="s-setText-1"></a>
### setText(String)

```java
public final void setText(String value)
```

**Parameters**

- `String value`

<a id="s-which"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.CsMeta.Value.Which which()
```

Types: [Which](Which.md#s-Which)
