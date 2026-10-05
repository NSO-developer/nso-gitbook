# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeUnion.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getTypeReferences\(\)](#gettypereferences-ba94c4f34d9c)
- [hasTypeReferences\(\)](#hastypereferences-8e6b59641fe0)
- [initTypeReferences\(int\)](#inittypereferences-13fff3e850b8)
- [setTypeReferences\(Reader\<Reader\>\)](#settypereferences-6e6dc8393c25)

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
public final com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getTypeReferences() <a href="#gettypereferences-ba94c4f34d9c" id="gettypereferences-ba94c4f34d9c"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeReference.Builder> getTypeReferences()
```

Types: [Builder](../CsTypeReference/Builder.md#builder-21f09e83781d)

### hasTypeReferences() <a href="#hastypereferences-8e6b59641fe0" id="hastypereferences-8e6b59641fe0"></a>

```java
public final boolean hasTypeReferences()
```

### initTypeReferences(int) <a href="#inittypereferences-13fff3e850b8" id="inittypereferences-13fff3e850b8"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeReference.Builder> initTypeReferences(
    int size
)
```

Types: [Builder](../CsTypeReference/Builder.md#builder-21f09e83781d)

**Parameters**

- `int size`

### setTypeReferences(Reader&lt;Reader&gt;) <a href="#settypereferences-6e6dc8393c25" id="settypereferences-6e6dc8393c25"></a>

```java
public final void setTypeReferences(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> value
)
```

Types: [Reader](../CsTypeReference/Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> value`
