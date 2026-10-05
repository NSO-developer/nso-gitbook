<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeUnion.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getTypeReferences()](#m-gettypereferences-ba94c4f34d9c)
- [hasTypeReferences()](#m-hastypereferences-8e6b59641fe0)
- [initTypeReferences(int)](#m-inittypereferences-13fff3e850b8)
- [setTypeReferences(Reader<Reader>)](#m-settypereferences-6e6dc8393c25)

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
public final com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-gettypereferences-ba94c4f34d9c"></a>
### getTypeReferences()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeReference.Builder> getTypeReferences()
```

Types: [Builder](../CsTypeReference/Builder.md#cls-Builder)

<a id="m-hastypereferences-8e6b59641fe0"></a>
### hasTypeReferences()

```java
public final boolean hasTypeReferences()
```

<a id="m-inittypereferences-13fff3e850b8"></a>
### initTypeReferences(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeReference.Builder> initTypeReferences(
    int size
)
```

Types: [Builder](../CsTypeReference/Builder.md#cls-Builder)

**Parameters**

- `int size`

<a id="m-settypereferences-6e6dc8393c25"></a>
### setTypeReferences(Reader<Reader>)

```java
public final void setTypeReferences(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> value
)
```

Types: [Reader](../CsTypeReference/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> value`
