<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Keys.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getList()](#s-getList)
- [getNone()](#s-getNone)
- [hasList()](#s-hasList)
- [initList(int)](#s-initList)
- [isList()](#s-isList)
- [isNone()](#s-isNone)
- [setList(Reader)](#s-setList)
- [setNone(Void)](#s-setNone)
- [which()](#s-which)

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
public final com.tailf.ncs.maapi.Schema.Cs.Keys.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getList"></a>
### getList()

```java
public final org.capnproto.PrimitiveList.Int.Builder getList()
```

<a id="s-getNone"></a>
### getNone()

```java
public final org.capnproto.Void getNone()
```

<a id="s-hasList"></a>
### hasList()

```java
public final boolean hasList()
```

<a id="s-initList"></a>
### initList(int)

```java
public final org.capnproto.PrimitiveList.Int.Builder initList(int size)
```

**Parameters**

- `int size`

<a id="s-isList"></a>
### isList()

```java
public final boolean isList()
```

<a id="s-isNone"></a>
### isNone()

```java
public final boolean isNone()
```

<a id="s-setList"></a>
### setList(Reader)

```java
public final void setList(org.capnproto.PrimitiveList.Int.Reader value)
```

**Parameters**

- `org.capnproto.PrimitiveList.Int.Reader value`

<a id="s-setNone"></a>
### setNone(Void)

```java
public final void setNone(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="s-which"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.Cs.Keys.Which which()
```

Types: [Which](Which.md#s-Which)
