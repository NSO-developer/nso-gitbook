# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeReference.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getName()](#m-getName-2634b18b4a25)
- [getNsHash()](#m-getNsHash-f6f3e3ae1e6b)
- [hasName()](#m-hasName-bfe6c334e0d1)
- [initName(int)](#m-initName-281e5d2102d4)
- [setName(Reader)](#m-setName-79f9d1263a41)
- [setName(String)](#m-setName-c76ccfcb9f18)
- [setNsHash(int)](#m-setNsHash-856e3c88b24a)

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
public final com.tailf.ncs.maapi.Schema.CsTypeReference.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getName() <a href="#m-getName-2634b18b4a25" id="m-getName-2634b18b4a25"></a>

```java
public final org.capnproto.Text.Builder getName()
```

### getNsHash() <a href="#m-getNsHash-f6f3e3ae1e6b" id="m-getNsHash-f6f3e3ae1e6b"></a>

```java
public final int getNsHash()
```

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

### setNsHash(int) <a href="#m-setNsHash-856e3c88b24a" id="m-setNsHash-856e3c88b24a"></a>

```java
public final void setNsHash(int value)
```

**Parameters**

- `int value`
