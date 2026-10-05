<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.DocDescription.Builder
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
- [getValue()](#s-getValue)
- [hasValue()](#s-hasValue)
- [initValue(int)](#s-initValue)
- [isNone()](#s-isNone)
- [isValue()](#s-isValue)
- [setNone(Void)](#s-setNone)
- [setValue(Reader)](#s-setValue)
- [setValue(String)](#s-setValue-1)
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
public final com.tailf.ncs.maapi.Schema.Cs.DocDescription.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getNone"></a>
### getNone()

```java
public final org.capnproto.Void getNone()
```

<a id="s-getValue"></a>
### getValue()

```java
public final org.capnproto.Text.Builder getValue()
```

<a id="s-hasValue"></a>
### hasValue()

```java
public final boolean hasValue()
```

<a id="s-initValue"></a>
### initValue(int)

```java
public final org.capnproto.Text.Builder initValue(int size)
```

**Parameters**

- `int size`

<a id="s-isNone"></a>
### isNone()

```java
public final boolean isNone()
```

<a id="s-isValue"></a>
### isValue()

```java
public final boolean isValue()
```

<a id="s-setNone"></a>
### setNone(Void)

```java
public final void setNone(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="s-setValue"></a>
### setValue(Reader)

```java
public final void setValue(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="s-setValue-1"></a>
### setValue(String)

```java
public final void setValue(String value)
```

**Parameters**

- `String value`

<a id="s-which"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.Cs.DocDescription.Which which()
```

Types: [Which](Which.md#s-Which)
