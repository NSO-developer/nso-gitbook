# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeEnum.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#builder-179fba5038bd)

**Methods**:

- [asReader()](#asreader-b5c0f2a8d115)
- [getValues()](#getvalues-06542a92d7fa)
- [hasValues()](#hasvalues-64d4a87b971a)
- [initValues(int)](#initvalues-28f8d9e6476f)
- [setValues(Reader<Reader>)](#setvalues-3ba13bd16732)

## Constructors

### Builder(SegmentBuilder, int, int, int, short) <a href="#builder-179fba5038bd" id="builder-179fba5038bd"></a>

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

### asReader() <a href="#asreader-b5c0f2a8d115" id="asreader-b5c0f2a8d115"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getValues() <a href="#getvalues-06542a92d7fa" id="getvalues-06542a92d7fa"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.NameToHash.Builder> getValues()
```

Types: [Builder](../NameToHash/Builder.md#builder-21f09e83781d)

### hasValues() <a href="#hasvalues-64d4a87b971a" id="hasvalues-64d4a87b971a"></a>

```java
public final boolean hasValues()
```

### initValues(int) <a href="#initvalues-28f8d9e6476f" id="initvalues-28f8d9e6476f"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.NameToHash.Builder> initValues(
    int size
)
```

Types: [Builder](../NameToHash/Builder.md#builder-21f09e83781d)

**Parameters**

- `int size`

### setValues(Reader&lt;Reader&gt;) <a href="#setvalues-3ba13bd16732" id="setvalues-3ba13bd16732"></a>

```java
public final void setValues(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NameToHash.Reader> value
)
```

Types: [Reader](../NameToHash/Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NameToHash.Reader> value`
