<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueBitBig.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getValue()](#s-getValue)
- [hasValue()](#s-hasValue)
- [initValue(int)](#s-initValue)
- [setValue(byte[])](#s-setValue)
- [setValue(Reader)](#s-setValue-1)

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
public final com.tailf.ncs.maapi.Schema.CsValueBitBig.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getValue"></a>
### getValue()

```java
public final org.capnproto.Data.Builder getValue()
```

<a id="s-hasValue"></a>
### hasValue()

```java
public final boolean hasValue()
```

<a id="s-initValue"></a>
### initValue(int)

```java
public final org.capnproto.Data.Builder initValue(int size)
```

**Parameters**

- `int size`

<a id="s-setValue"></a>
### setValue(byte[])

```java
public final void setValue(byte[] value)
```

**Parameters**

- `byte[] value`

<a id="s-setValue-1"></a>
### setValue(Reader)

```java
public final void setValue(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`
