# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getDisplayHint()](#m-getDisplayHint-f9cb8b7f487f)
- [hasDisplayHint()](#m-hasDisplayHint-a0d050b8aab0)
- [initDisplayHint(int)](#m-initDisplayHint-c16e1e013565)
- [setDisplayHint(byte[])](#m-setDisplayHint-a6a8c5e2aab1)
- [setDisplayHint(Reader)](#m-setDisplayHint-29d7604e3fc3)

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
public final com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getDisplayHint() <a href="#m-getDisplayHint-f9cb8b7f487f" id="m-getDisplayHint-f9cb8b7f487f"></a>

```java
public final org.capnproto.Data.Builder getDisplayHint()
```

### hasDisplayHint() <a href="#m-hasDisplayHint-a0d050b8aab0" id="m-hasDisplayHint-a0d050b8aab0"></a>

```java
public final boolean hasDisplayHint()
```

### initDisplayHint(int) <a href="#m-initDisplayHint-c16e1e013565" id="m-initDisplayHint-c16e1e013565"></a>

```java
public final org.capnproto.Data.Builder initDisplayHint(int size)
```

**Parameters**

- `int size`

### setDisplayHint(byte[]) <a href="#m-setDisplayHint-a6a8c5e2aab1" id="m-setDisplayHint-a6a8c5e2aab1"></a>

```java
public final void setDisplayHint(byte[] value)
```

**Parameters**

- `byte[] value`

### setDisplayHint(Reader) <a href="#m-setDisplayHint-29d7604e3fc3" id="m-setDisplayHint-29d7604e3fc3"></a>

```java
public final void setDisplayHint(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`
