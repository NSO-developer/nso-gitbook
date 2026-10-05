<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeIdref.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getRefs()](#m-getrefs-b06b91bf4474)
- [hasRefs()](#m-hasrefs-1092d9d8bb51)
- [initRefs(int)](#m-initrefs-ba28b74a20d7)
- [setRefs(Reader<Reader>)](#m-setrefs-be4e2cc42754)

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
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getrefs-b06b91bf4474"></a>
### getRefs()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder> getRefs()
```

Types: [Builder](Ref/Builder.md#cls-Builder)

<a id="m-hasrefs-1092d9d8bb51"></a>
### hasRefs()

```java
public final boolean hasRefs()
```

<a id="m-initrefs-ba28b74a20d7"></a>
### initRefs(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder> initRefs(
    int size
)
```

Types: [Builder](Ref/Builder.md#cls-Builder)

**Parameters**

- `int size`

<a id="m-setrefs-be4e2cc42754"></a>
### setRefs(Reader<Reader>)

```java
public final void setRefs(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader> value
)
```

Types: [Reader](Ref/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader> value`
