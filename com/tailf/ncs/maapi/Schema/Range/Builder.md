<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.Range.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getFlags()](#s-getFlags)
- [getHi()](#s-getHi)
- [getLo()](#s-getLo)
- [initHi()](#s-initHi)
- [initLo()](#s-initLo)
- [setFlags(byte)](#s-setFlags)
- [setHi(Reader)](#s-setHi)
- [setLo(Reader)](#s-setLo)

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
public final com.tailf.ncs.maapi.Schema.Range.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getFlags"></a>
### getFlags()

```java
public final byte getFlags()
```

<a id="s-getHi"></a>
### getHi()

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder getHi()
```

Types: [Builder](../CsValue/Builder.md#s-Builder)

<a id="s-getLo"></a>
### getLo()

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder getLo()
```

Types: [Builder](../CsValue/Builder.md#s-Builder)

<a id="s-initHi"></a>
### initHi()

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder initHi()
```

Types: [Builder](../CsValue/Builder.md#s-Builder)

<a id="s-initLo"></a>
### initLo()

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder initLo()
```

Types: [Builder](../CsValue/Builder.md#s-Builder)

<a id="s-setFlags"></a>
### setFlags(byte)

```java
public final void setFlags(byte value)
```

**Parameters**

- `byte value`

<a id="s-setHi"></a>
### setHi(Reader)

```java
public final void setHi(com.tailf.ncs.maapi.Schema.CsValue.Reader value)
```

Types: [Reader](../CsValue/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValue.Reader value`

<a id="s-setLo"></a>
### setLo(Reader)

```java
public final void setLo(com.tailf.ncs.maapi.Schema.CsValue.Reader value)
```

Types: [Reader](../CsValue/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValue.Reader value`
