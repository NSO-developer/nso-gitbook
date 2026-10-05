# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeUnion.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getTypeReferences()](#m-getTypeReferences-ba94c4f34d9c)
- [hasTypeReferences()](#m-hasTypeReferences-8e6b59641fe0)
- [initTypeReferences(int)](#m-initTypeReferences-13fff3e850b8)
- [setTypeReferences(Reader<Reader>)](#m-setTypeReferences-6e6dc8393c25)

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
public final com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getTypeReferences() <a href="#m-getTypeReferences-ba94c4f34d9c" id="m-getTypeReferences-ba94c4f34d9c"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeReference.Builder> getTypeReferences()
```

Types: [Builder](../CsTypeReference/Builder.md#cls-Builder)

### hasTypeReferences() <a href="#m-hasTypeReferences-8e6b59641fe0" id="m-hasTypeReferences-8e6b59641fe0"></a>

```java
public final boolean hasTypeReferences()
```

### initTypeReferences(int) <a href="#m-initTypeReferences-13fff3e850b8" id="m-initTypeReferences-13fff3e850b8"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeReference.Builder> initTypeReferences(
    int size
)
```

Types: [Builder](../CsTypeReference/Builder.md#cls-Builder)

**Parameters**

- `int size`

### setTypeReferences(Reader<Reader>) <a href="#m-setTypeReferences-6e6dc8393c25" id="m-setTypeReferences-6e6dc8393c25"></a>

```java
public final void setTypeReferences(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> value
)
```

Types: [Reader](../CsTypeReference/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> value`
