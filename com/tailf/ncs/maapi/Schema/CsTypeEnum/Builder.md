<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeEnum.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getValues()](#m-getvalues-06542a92d7fa)
- [hasValues()](#m-hasvalues-64d4a87b971a)
- [initValues(int)](#m-initvalues-28f8d9e6476f)
- [setValues(Reader<Reader>)](#m-setvalues-3ba13bd16732)

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
public final com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getvalues-06542a92d7fa"></a>
### getValues()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.NameToHash.Builder> getValues()
```

Types: [Builder](../NameToHash/Builder.md#cls-Builder)

<a id="m-hasvalues-64d4a87b971a"></a>
### hasValues()

```java
public final boolean hasValues()
```

<a id="m-initvalues-28f8d9e6476f"></a>
### initValues(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.NameToHash.Builder> initValues(
    int size
)
```

Types: [Builder](../NameToHash/Builder.md#cls-Builder)

**Parameters**

- `int size`

<a id="m-setvalues-3ba13bd16732"></a>
### setValues(Reader<Reader>)

```java
public final void setValues(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NameToHash.Reader> value
)
```

Types: [Reader](../NameToHash/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NameToHash.Reader> value`
