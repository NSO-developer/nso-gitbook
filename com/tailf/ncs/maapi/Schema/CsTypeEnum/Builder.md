# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeEnum.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getValues()](#m-getValues-06542a92d7fa)
- [hasValues()](#m-hasValues-64d4a87b971a)
- [initValues(int)](#m-initValues-28f8d9e6476f)
- [setValues(Reader<Reader>)](#m-setValues-3ba13bd16732)

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
public final com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getValues() <a href="#m-getValues-06542a92d7fa" id="m-getValues-06542a92d7fa"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.NameToHash.Builder> getValues()
```

Types: [Builder](../NameToHash/Builder.md#cls-Builder)

### hasValues() <a href="#m-hasValues-64d4a87b971a" id="m-hasValues-64d4a87b971a"></a>

```java
public final boolean hasValues()
```

### initValues(int) <a href="#m-initValues-28f8d9e6476f" id="m-initValues-28f8d9e6476f"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.NameToHash.Builder> initValues(
    int size
)
```

Types: [Builder](../NameToHash/Builder.md#cls-Builder)

**Parameters**

- `int size`

### setValues(Reader<Reader>) <a href="#m-setValues-3ba13bd16732" id="m-setValues-3ba13bd16732"></a>

```java
public final void setValues(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NameToHash.Reader> value
)
```

Types: [Reader](../NameToHash/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NameToHash.Reader> value`
