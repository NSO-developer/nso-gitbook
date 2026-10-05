<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.QTag.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getHns()](#s-getHns)
- [getHtag()](#s-getHtag)
- [setHns(int)](#s-setHns)
- [setHtag(int)](#s-setHtag)

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
public final com.tailf.ncs.maapi.Schema.QTag.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

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
