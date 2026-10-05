# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.DocDescription.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getNone()](#m-getNone-e31bfdbffa7f)
- [getValue()](#m-getValue-d93864668c40)
- [hasValue()](#m-hasValue-dad92e423e7a)
- [initValue(int)](#m-initValue-a117f5eca48d)
- [isNone()](#m-isNone-e8a993ad0453)
- [isValue()](#m-isValue-7280ea8211f4)
- [setNone(Void)](#m-setNone-46764db867d5)
- [setValue(Reader)](#m-setValue-6784c0d559f7)
- [setValue(String)](#m-setValue-90771990f0a6)
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
public final com.tailf.ncs.maapi.Schema.Cs.DocDescription.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getNone() <a href="#m-getNone-e31bfdbffa7f" id="m-getNone-e31bfdbffa7f"></a>

```java
public final org.capnproto.Void getNone()
```

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public final org.capnproto.Text.Builder getValue()
```

### hasValue() <a href="#m-hasValue-dad92e423e7a" id="m-hasValue-dad92e423e7a"></a>

```java
public final boolean hasValue()
```

### initValue(int) <a href="#m-initValue-a117f5eca48d" id="m-initValue-a117f5eca48d"></a>

```java
public final org.capnproto.Text.Builder initValue(int size)
```

**Parameters**

- `int size`

### isNone() <a href="#m-isNone-e8a993ad0453" id="m-isNone-e8a993ad0453"></a>

```java
public final boolean isNone()
```

### isValue() <a href="#m-isValue-7280ea8211f4" id="m-isValue-7280ea8211f4"></a>

```java
public final boolean isValue()
```

### setNone(Void) <a href="#m-setNone-46764db867d5" id="m-setNone-46764db867d5"></a>

```java
public final void setNone(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setValue(Reader) <a href="#m-setValue-6784c0d559f7" id="m-setValue-6784c0d559f7"></a>

```java
public final void setValue(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setValue(String) <a href="#m-setValue-90771990f0a6" id="m-setValue-90771990f0a6"></a>

```java
public final void setValue(String value)
```

**Parameters**

- `String value`

### which() <a href="#m-which-0b2d23db5ed0" id="m-which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.DocDescription.Which which()
```

Types: [Which](Which.md#cls-Which)
