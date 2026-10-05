# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getName\(\)](#getname-2634b18b4a25)
- [getPos\(\)](#getpos-ad2d7b30807f)
- [hasName\(\)](#hasname-bfe6c334e0d1)
- [initName\(int\)](#initname-281e5d2102d4)
- [setName\(Reader\)](#setname-79f9d1263a41)
- [setName\(String\)](#setname-c76ccfcb9f18)
- [setPos\(int\)](#setpos-a83f79498a31)

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
public final com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getName() <a href="#getname-2634b18b4a25" id="getname-2634b18b4a25"></a>

```java
public final org.capnproto.Text.Builder getName()
```

### getPos() <a href="#getpos-ad2d7b30807f" id="getpos-ad2d7b30807f"></a>

```java
public final int getPos()
```

### hasName() <a href="#hasname-bfe6c334e0d1" id="hasname-bfe6c334e0d1"></a>

```java
public final boolean hasName()
```

### initName(int) <a href="#initname-281e5d2102d4" id="initname-281e5d2102d4"></a>

```java
public final org.capnproto.Text.Builder initName(int size)
```

**Parameters**

- `int size`

### setName(Reader) <a href="#setname-79f9d1263a41" id="setname-79f9d1263a41"></a>

```java
public final void setName(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setName(String) <a href="#setname-c76ccfcb9f18" id="setname-c76ccfcb9f18"></a>

```java
public final void setName(String value)
```

**Parameters**

- `String value`

### setPos(int) <a href="#setpos-a83f79498a31" id="setpos-a83f79498a31"></a>

```java
public final void setPos(int value)
```

**Parameters**

- `int value`
