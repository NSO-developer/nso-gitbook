<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getName()](#s-getName)
- [getPos()](#s-getPos)
- [hasName()](#s-hasName)
- [initName(int)](#s-initName)
- [setName(Reader)](#s-setName)
- [setName(String)](#s-setName-1)
- [setPos(int)](#s-setPos)

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
public final com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getName"></a>
### getName()

```java
public final org.capnproto.Text.Builder getName()
```

<a id="s-getPos"></a>
### getPos()

```java
public final int getPos()
```

<a id="s-hasName"></a>
### hasName()

```java
public final boolean hasName()
```

<a id="s-initName"></a>
### initName(int)

```java
public final org.capnproto.Text.Builder initName(int size)
```

**Parameters**

- `int size`

<a id="s-setName"></a>
### setName(Reader)

```java
public final void setName(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="s-setName-1"></a>
### setName(String)

```java
public final void setName(String value)
```

**Parameters**

- `String value`

<a id="s-setPos"></a>
### setPos(int)

```java
public final void setPos(int value)
```

**Parameters**

- `int value`
