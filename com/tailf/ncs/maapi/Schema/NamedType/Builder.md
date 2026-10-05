# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.NamedType.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getName()](#m-getName-2634b18b4a25)
- [getType()](#m-getType-5a52f6f0d4c1)
- [hasName()](#m-hasName-bfe6c334e0d1)
- [initName(int)](#m-initName-281e5d2102d4)
- [initType()](#m-initType-9d8086c9965a)
- [setName(Reader)](#m-setName-79f9d1263a41)
- [setName(String)](#m-setName-c76ccfcb9f18)
- [setType(Reader)](#m-setType-b1128ee37ec1)

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
public final com.tailf.ncs.maapi.Schema.NamedType.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getName() <a href="#m-getName-2634b18b4a25" id="m-getName-2634b18b4a25"></a>

```java
public final org.capnproto.Text.Builder getName()
```

### getType() <a href="#m-getType-5a52f6f0d4c1" id="m-getType-5a52f6f0d4c1"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Builder getType()
```

Types: [Builder](../CsType/Builder.md#cls-Builder)

### hasName() <a href="#m-hasName-bfe6c334e0d1" id="m-hasName-bfe6c334e0d1"></a>

```java
public final boolean hasName()
```

### initName(int) <a href="#m-initName-281e5d2102d4" id="m-initName-281e5d2102d4"></a>

```java
public final org.capnproto.Text.Builder initName(int size)
```

**Parameters**

- `int size`

### initType() <a href="#m-initType-9d8086c9965a" id="m-initType-9d8086c9965a"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Builder initType()
```

Types: [Builder](../CsType/Builder.md#cls-Builder)

### setName(Reader) <a href="#m-setName-79f9d1263a41" id="m-setName-79f9d1263a41"></a>

```java
public final void setName(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setName(String) <a href="#m-setName-c76ccfcb9f18" id="m-setName-c76ccfcb9f18"></a>

```java
public final void setName(String value)
```

**Parameters**

- `String value`

### setType(Reader) <a href="#m-setType-b1128ee37ec1" id="m-setType-b1128ee37ec1"></a>

```java
public final void setType(com.tailf.ncs.maapi.Schema.CsType.Reader value)
```

Types: [Reader](../CsType/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsType.Reader value`
