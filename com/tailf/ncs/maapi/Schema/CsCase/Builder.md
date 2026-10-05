<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsCase.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getChoices()](#s-getChoices)
- [getHns()](#s-getHns)
- [getHtag()](#s-getHtag)
- [getNodes()](#s-getNodes)
- [hasChoices()](#s-hasChoices)
- [hasNodes()](#s-hasNodes)
- [initChoices(int)](#s-initChoices)
- [initNodes(int)](#s-initNodes)
- [setChoices(Reader<Reader>)](#s-setChoices)
- [setHns(int)](#s-setHns)
- [setHtag(int)](#s-setHtag)
- [setNodes(Reader<Reader>)](#s-setNodes)

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
public final com.tailf.ncs.maapi.Schema.CsCase.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getChoices"></a>
### getChoices()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsChoice.Builder> getChoices()
```

Types: [Builder](../CsChoice/Builder.md#s-Builder)

<a id="s-getHns"></a>
### getHns()

```java
public final int getHns()
```

<a id="s-getHtag"></a>
### getHtag()

```java
public final int getHtag()
```

<a id="s-getNodes"></a>
### getNodes()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> getNodes()
```

Types: [Builder](../QTag/Builder.md#s-Builder)

<a id="s-hasChoices"></a>
### hasChoices()

```java
public final boolean hasChoices()
```

<a id="s-hasNodes"></a>
### hasNodes()

```java
public final boolean hasNodes()
```

<a id="s-initChoices"></a>
### initChoices(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsChoice.Builder> initChoices(
    int size
)
```

Types: [Builder](../CsChoice/Builder.md#s-Builder)

**Parameters**

- `int size`

<a id="s-initNodes"></a>
### initNodes(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> initNodes(
    int size
)
```

Types: [Builder](../QTag/Builder.md#s-Builder)

**Parameters**

- `int size`

<a id="s-setChoices"></a>
### setChoices(Reader<Reader>)

```java
public final void setChoices(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> value
)
```

Types: [Reader](../CsChoice/Reader.md#s-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> value`

<a id="s-setHns"></a>
### setHns(int)

```java
public final void setHns(int value)
```

**Parameters**

- `int value`

<a id="s-setHtag"></a>
### setHtag(int)

```java
public final void setHtag(int value)
```

**Parameters**

- `int value`

<a id="s-setNodes"></a>
### setNodes(Reader<Reader>)

```java
public final void setNodes(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value
)
```

Types: [Reader](../QTag/Reader.md#s-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value`
