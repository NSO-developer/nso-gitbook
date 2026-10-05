<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeIdref.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getRefs()](#s-getRefs)
- [hasRefs()](#s-hasRefs)
- [initRefs(int)](#s-initRefs)
- [setRefs(Reader<Reader>)](#s-setRefs)

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
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getRefs"></a>
### getRefs()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder> getRefs()
```

Types: [Builder](Ref/Builder.md#s-Builder)

<a id="s-hasRefs"></a>
### hasRefs()

```java
public final boolean hasRefs()
```

<a id="s-initRefs"></a>
### initRefs(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder> initRefs(
    int size
)
```

Types: [Builder](Ref/Builder.md#s-Builder)

**Parameters**

- `int size`

<a id="s-setRefs"></a>
### setRefs(Reader<Reader>)

```java
public final void setRefs(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader> value
)
```

Types: [Reader](Ref/Reader.md#s-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader> value`
