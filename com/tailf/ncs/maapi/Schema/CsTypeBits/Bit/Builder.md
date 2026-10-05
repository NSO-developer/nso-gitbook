# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getName()](#m-getName-2634b18b4a25)
- [getPos()](#m-getPos-ad2d7b30807f)
- [hasName()](#m-hasName-bfe6c334e0d1)
- [initName(int)](#m-initName-281e5d2102d4)
- [setName(Reader)](#m-setName-79f9d1263a41)
- [setName(String)](#m-setName-c76ccfcb9f18)
- [setPos(int)](#m-setPos-a83f79498a31)

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
public final com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getName() <a href="#m-getName-2634b18b4a25" id="m-getName-2634b18b4a25"></a>

```java
public final org.capnproto.Text.Builder getName()
```

### getPos() <a href="#m-getPos-ad2d7b30807f" id="m-getPos-ad2d7b30807f"></a>

```java
public final int getPos()
```

### hasName() <a href="#m-hasName-bfe6c334e0d1" id="m-hasName-bfe6c334e0d1"></a>

```java
public final boolean hasName()
```

### initName(int) <a href="#m-initName-281e5d2102d4" id="m-initName-281e5d2102d4"></a>

```java
public final org.capnproto.Text.Builder initName(int size)
```

**Parameters**

- `int size`

### setName(Reader) <a href="#m-setName-79f9d1263a41" id="m-setName-79f9d1263a41"></a>

```java
public final void setName(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setName(String) <a href="#m-setName-c76ccfcb9f18" id="m-setName-c76ccfcb9f18"></a>

```java
public final void setName(String value)
```

**Parameters**

- `String value`

### setPos(int) <a href="#m-setPos-a83f79498a31" id="m-setPos-a83f79498a31"></a>

```java
public final void setPos(int value)
```

**Parameters**

- `int value`
