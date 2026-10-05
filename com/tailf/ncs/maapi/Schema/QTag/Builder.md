# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.QTag.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getHns()](#m-getHns-457afaf41ae6)
- [getHtag()](#m-getHtag-3a838d71ddf7)
- [setHns(int)](#m-setHns-7405e78f40fe)
- [setHtag(int)](#m-setHtag-d40f4d76b210)

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
public final com.tailf.ncs.maapi.Schema.QTag.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getHns() <a href="#m-getHns-457afaf41ae6" id="m-getHns-457afaf41ae6"></a>

```java
public final int getHns()
```

### getHtag() <a href="#m-getHtag-3a838d71ddf7" id="m-getHtag-3a838d71ddf7"></a>

```java
public final int getHtag()
```

### setHns(int) <a href="#m-setHns-7405e78f40fe" id="m-setHns-7405e78f40fe"></a>

```java
public final void setHns(int value)
```

**Parameters**

- `int value`

### setHtag(int) <a href="#m-setHtag-d40f4d76b210" id="m-setHtag-d40f4d76b210"></a>

```java
public final void setHtag(int value)
```

**Parameters**

- `int value`
