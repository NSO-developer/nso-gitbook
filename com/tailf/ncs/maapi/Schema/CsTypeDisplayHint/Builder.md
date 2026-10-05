<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getDisplayHint()](#s-getDisplayHint)
- [hasDisplayHint()](#s-hasDisplayHint)
- [initDisplayHint(int)](#s-initDisplayHint)
- [setDisplayHint(byte[])](#s-setDisplayHint)
- [setDisplayHint(Reader)](#s-setDisplayHint-1)

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
public final com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getDisplayHint"></a>
### getDisplayHint()

```java
public final org.capnproto.Data.Builder getDisplayHint()
```

<a id="s-hasDisplayHint"></a>
### hasDisplayHint()

```java
public final boolean hasDisplayHint()
```

<a id="s-initDisplayHint"></a>
### initDisplayHint(int)

```java
public final org.capnproto.Data.Builder initDisplayHint(int size)
```

**Parameters**

- `int size`

<a id="s-setDisplayHint"></a>
### setDisplayHint(byte[])

```java
public final void setDisplayHint(byte[] value)
```

**Parameters**

- `byte[] value`

<a id="s-setDisplayHint-1"></a>
### setDisplayHint(Reader)

```java
public final void setDisplayHint(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`
