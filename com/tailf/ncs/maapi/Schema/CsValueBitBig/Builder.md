<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueBitBig.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getValue()](#m-getvalue-d93864668c40)
- [hasValue()](#m-hasvalue-dad92e423e7a)
- [initValue(int)](#m-initvalue-a117f5eca48d)
- [setValue(byte[])](#m-setvalue-da5fdcdbf2b9)
- [setValue(Reader)](#m-setvalue-f6f6b43d91d8)

## Constructors

<a id="m-builder-179fba5038bd"></a>
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

<a id="m-asreader-b5c0f2a8d115"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.CsValueBitBig.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public final org.capnproto.Data.Builder getValue()
```

<a id="m-hasvalue-dad92e423e7a"></a>
### hasValue()

```java
public final boolean hasValue()
```

<a id="m-initvalue-a117f5eca48d"></a>
### initValue(int)

```java
public final org.capnproto.Data.Builder initValue(int size)
```

**Parameters**

- `int size`

<a id="m-setvalue-da5fdcdbf2b9"></a>
### setValue(byte[])

```java
public final void setValue(byte[] value)
```

**Parameters**

- `byte[] value`

<a id="m-setvalue-f6f6b43d91d8"></a>
### setValue(Reader)

```java
public final void setValue(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`
