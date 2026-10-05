# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Defval.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getNone()](#m-getNone-e31bfdbffa7f)
- [getValue()](#m-getValue-d93864668c40)
- [initValue()](#m-initValue-a7755fffc529)
- [isNone()](#m-isNone-e8a993ad0453)
- [isValue()](#m-isValue-7280ea8211f4)
- [setNone(Void)](#m-setNone-46764db867d5)
- [setValue(Reader)](#m-setValue-1558adba6de5)
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
public final com.tailf.ncs.maapi.Schema.Cs.Defval.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getNone() <a href="#m-getNone-e31bfdbffa7f" id="m-getNone-e31bfdbffa7f"></a>

```java
public final org.capnproto.Void getNone()
```

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder getValue()
```

Types: [Builder](../../CsValue/Builder.md#cls-Builder)

### initValue() <a href="#m-initValue-a7755fffc529" id="m-initValue-a7755fffc529"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder initValue()
```

Types: [Builder](../../CsValue/Builder.md#cls-Builder)

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

### setValue(Reader) <a href="#m-setValue-1558adba6de5" id="m-setValue-1558adba6de5"></a>

```java
public final void setValue(com.tailf.ncs.maapi.Schema.CsValue.Reader value)
```

Types: [Reader](../../CsValue/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValue.Reader value`

### which() <a href="#m-which-0b2d23db5ed0" id="m-which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.Defval.Which which()
```

Types: [Which](Which.md#cls-Which)
