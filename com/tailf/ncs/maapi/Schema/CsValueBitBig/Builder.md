# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueBitBig.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#builder-179fba5038bd)

**Methods**:

- [asReader()](#asreader-b5c0f2a8d115)
- [getValue()](#getvalue-d93864668c40)
- [hasValue()](#hasvalue-dad92e423e7a)
- [initValue(int)](#initvalue-a117f5eca48d)
- [setValue(byte[])](#setvalue-da5fdcdbf2b9)
- [setValue(Reader)](#setvalue-f6f6b43d91d8)

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
public final com.tailf.ncs.maapi.Schema.CsValueBitBig.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public final org.capnproto.Data.Builder getValue()
```

### hasValue() <a href="#hasvalue-dad92e423e7a" id="hasvalue-dad92e423e7a"></a>

```java
public final boolean hasValue()
```

### initValue(int) <a href="#initvalue-a117f5eca48d" id="initvalue-a117f5eca48d"></a>

```java
public final org.capnproto.Data.Builder initValue(int size)
```

**Parameters**

- `int size`

### setValue(byte[]) <a href="#setvalue-da5fdcdbf2b9" id="setvalue-da5fdcdbf2b9"></a>

```java
public final void setValue(byte[] value)
```

**Parameters**

- `byte[] value`

### setValue(Reader) <a href="#setvalue-f6f6b43d91d8" id="setvalue-f6f6b43d91d8"></a>

```java
public final void setValue(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`
