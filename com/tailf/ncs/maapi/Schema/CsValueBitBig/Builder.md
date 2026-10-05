# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueBitBig.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getValue()](#m-getValue-d93864668c40)
- [hasValue()](#m-hasValue-dad92e423e7a)
- [initValue(int)](#m-initValue-a117f5eca48d)
- [setValue(byte[])](#m-setValue-da5fdcdbf2b9)
- [setValue(Reader)](#m-setValue-f6f6b43d91d8)

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
public final com.tailf.ncs.maapi.Schema.CsValueBitBig.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public final org.capnproto.Data.Builder getValue()
```

### hasValue() <a href="#m-hasValue-dad92e423e7a" id="m-hasValue-dad92e423e7a"></a>

```java
public final boolean hasValue()
```

### initValue(int) <a href="#m-initValue-a117f5eca48d" id="m-initValue-a117f5eca48d"></a>

```java
public final org.capnproto.Data.Builder initValue(int size)
```

**Parameters**

- `int size`

### setValue(byte[]) <a href="#m-setValue-da5fdcdbf2b9" id="m-setValue-da5fdcdbf2b9"></a>

```java
public final void setValue(byte[] value)
```

**Parameters**

- `byte[] value`

### setValue(Reader) <a href="#m-setValue-f6f6b43d91d8" id="m-setValue-f6f6b43d91d8"></a>

```java
public final void setValue(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`
