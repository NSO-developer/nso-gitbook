<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeEnum.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getValues()](#s-getValues)
- [hasValues()](#s-hasValues)
- [initValues(int)](#s-initValues)
- [setValues(Reader<Reader>)](#s-setValues)

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
public final com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getValues"></a>
### getValues()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.NameToHash.Builder> getValues()
```

Types: [Builder](../NameToHash/Builder.md#s-Builder)

<a id="s-hasValues"></a>
### hasValues()

```java
public final boolean hasValues()
```

<a id="s-initValues"></a>
### initValues(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.NameToHash.Builder> initValues(
    int size
)
```

Types: [Builder](../NameToHash/Builder.md#s-Builder)

**Parameters**

- `int size`

<a id="s-setValues"></a>
### setValues(Reader<Reader>)

```java
public final void setValues(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NameToHash.Reader> value
)
```

Types: [Reader](../NameToHash/Reader.md#s-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NameToHash.Reader> value`
