<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeList.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getTypeReferences()](#s-getTypeReferences)
- [hasTypeReferences()](#s-hasTypeReferences)
- [initTypeReferences(int)](#s-initTypeReferences)
- [setTypeReferences(Reader<Reader>)](#s-setTypeReferences)

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
public final com.tailf.ncs.maapi.Schema.CsTypeList.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getTypeReferences"></a>
### getTypeReferences()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeReference.Builder> getTypeReferences()
```

Types: [Builder](../CsTypeReference/Builder.md#s-Builder)

<a id="s-hasTypeReferences"></a>
### hasTypeReferences()

```java
public final boolean hasTypeReferences()
```

<a id="s-initTypeReferences"></a>
### initTypeReferences(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeReference.Builder> initTypeReferences(
    int size
)
```

Types: [Builder](../CsTypeReference/Builder.md#s-Builder)

**Parameters**

- `int size`

<a id="s-setTypeReferences"></a>
### setTypeReferences(Reader<Reader>)

```java
public final void setTypeReferences(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> value
)
```

Types: [Reader](../CsTypeReference/Reader.md#s-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> value`
