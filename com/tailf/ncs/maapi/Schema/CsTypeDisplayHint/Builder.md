<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getDisplayHint()](#m-getdisplayhint-f9cb8b7f487f)
- [hasDisplayHint()](#m-hasdisplayhint-a0d050b8aab0)
- [initDisplayHint(int)](#m-initdisplayhint-c16e1e013565)
- [setDisplayHint(byte[])](#m-setdisplayhint-a6a8c5e2aab1)
- [setDisplayHint(Reader)](#m-setdisplayhint-29d7604e3fc3)

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
public final com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getdisplayhint-f9cb8b7f487f"></a>
### getDisplayHint()

```java
public final org.capnproto.Data.Builder getDisplayHint()
```

<a id="m-hasdisplayhint-a0d050b8aab0"></a>
### hasDisplayHint()

```java
public final boolean hasDisplayHint()
```

<a id="m-initdisplayhint-c16e1e013565"></a>
### initDisplayHint(int)

```java
public final org.capnproto.Data.Builder initDisplayHint(int size)
```

**Parameters**

- `int size`

<a id="m-setdisplayhint-a6a8c5e2aab1"></a>
### setDisplayHint(byte[])

```java
public final void setDisplayHint(byte[] value)
```

**Parameters**

- `byte[] value`

<a id="m-setdisplayhint-29d7604e3fc3"></a>
### setDisplayHint(Reader)

```java
public final void setDisplayHint(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`
