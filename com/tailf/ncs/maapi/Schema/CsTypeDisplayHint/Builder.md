# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#builder-179fba5038bd)

**Methods**:

- [asReader()](#asreader-b5c0f2a8d115)
- [getDisplayHint()](#getdisplayhint-f9cb8b7f487f)
- [hasDisplayHint()](#hasdisplayhint-a0d050b8aab0)
- [initDisplayHint(int)](#initdisplayhint-c16e1e013565)
- [setDisplayHint(byte[])](#setdisplayhint-a6a8c5e2aab1)
- [setDisplayHint(Reader)](#setdisplayhint-29d7604e3fc3)

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
public final com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getDisplayHint() <a href="#getdisplayhint-f9cb8b7f487f" id="getdisplayhint-f9cb8b7f487f"></a>

```java
public final org.capnproto.Data.Builder getDisplayHint()
```

### hasDisplayHint() <a href="#hasdisplayhint-a0d050b8aab0" id="hasdisplayhint-a0d050b8aab0"></a>

```java
public final boolean hasDisplayHint()
```

### initDisplayHint(int) <a href="#initdisplayhint-c16e1e013565" id="initdisplayhint-c16e1e013565"></a>

```java
public final org.capnproto.Data.Builder initDisplayHint(int size)
```

**Parameters**

- `int size`

### setDisplayHint(byte[]) <a href="#setdisplayhint-a6a8c5e2aab1" id="setdisplayhint-a6a8c5e2aab1"></a>

```java
public final void setDisplayHint(byte[] value)
```

**Parameters**

- `byte[] value`

### setDisplayHint(Reader) <a href="#setdisplayhint-29d7604e3fc3" id="setdisplayhint-29d7604e3fc3"></a>

```java
public final void setDisplayHint(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`
