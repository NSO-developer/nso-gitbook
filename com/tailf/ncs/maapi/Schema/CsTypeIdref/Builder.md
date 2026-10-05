# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeIdref.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getRefs\(\)](#getrefs-b06b91bf4474)
- [hasRefs\(\)](#hasrefs-1092d9d8bb51)
- [initRefs\(int\)](#initrefs-ba28b74a20d7)
- [setRefs\(Reader\<Reader\>\)](#setrefs-be4e2cc42754)

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
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getRefs() <a href="#getrefs-b06b91bf4474" id="getrefs-b06b91bf4474"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder> getRefs()
```

Types: [Builder](Ref/Builder.md#builder-21f09e83781d)

### hasRefs() <a href="#hasrefs-1092d9d8bb51" id="hasrefs-1092d9d8bb51"></a>

```java
public final boolean hasRefs()
```

### initRefs(int) <a href="#initrefs-ba28b74a20d7" id="initrefs-ba28b74a20d7"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder> initRefs(
    int size
)
```

Types: [Builder](Ref/Builder.md#builder-21f09e83781d)

**Parameters**

- `int size`

### setRefs(Reader&lt;Reader&gt;) <a href="#setrefs-be4e2cc42754" id="setrefs-be4e2cc42754"></a>

```java
public final void setRefs(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader> value
)
```

Types: [Reader](Ref/Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader> value`
