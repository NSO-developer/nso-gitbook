# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeIdref.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getRefs()](#m-getRefs-b06b91bf4474)
- [hasRefs()](#m-hasRefs-1092d9d8bb51)
- [initRefs(int)](#m-initRefs-ba28b74a20d7)
- [setRefs(Reader<Reader>)](#m-setRefs-be4e2cc42754)

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
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getRefs() <a href="#m-getRefs-b06b91bf4474" id="m-getRefs-b06b91bf4474"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder> getRefs()
```

Types: [Builder](Ref/Builder.md#cls-Builder)

### hasRefs() <a href="#m-hasRefs-1092d9d8bb51" id="m-hasRefs-1092d9d8bb51"></a>

```java
public final boolean hasRefs()
```

### initRefs(int) <a href="#m-initRefs-ba28b74a20d7" id="m-initRefs-ba28b74a20d7"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder> initRefs(
    int size
)
```

Types: [Builder](Ref/Builder.md#cls-Builder)

**Parameters**

- `int size`

### setRefs(Reader<Reader>) <a href="#m-setRefs-be4e2cc42754" id="m-setRefs-be4e2cc42754"></a>

```java
public final void setRefs(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader> value
)
```

Types: [Reader](Ref/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader> value`
