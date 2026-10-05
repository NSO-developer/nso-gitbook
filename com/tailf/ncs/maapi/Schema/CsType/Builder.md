# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getName()](#m-getName-2634b18b4a25)
- [getNs()](#m-getNs-59b97eae2a4a)
- [getParent()](#m-getParent-45c1b196ed70)
- [getValue()](#m-getValue-d93864668c40)
- [hasName()](#m-hasName-bfe6c334e0d1)
- [initName(int)](#m-initName-281e5d2102d4)
- [initParent()](#m-initParent-42003b75a7dd)
- [initValue()](#m-initValue-a7755fffc529)
- [setName(Reader)](#m-setName-79f9d1263a41)
- [setName(String)](#m-setName-c76ccfcb9f18)
- [setNs(int)](#m-setNs-3c6980dbfd35)
- [setParent(Reader)](#m-setParent-9ed68f47e1db)

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
public final com.tailf.ncs.maapi.Schema.CsType.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getName() <a href="#m-getName-2634b18b4a25" id="m-getName-2634b18b4a25"></a>

```java
public final org.capnproto.Text.Builder getName()
```

### getNs() <a href="#m-getNs-59b97eae2a4a" id="m-getNs-59b97eae2a4a"></a>

```java
public final int getNs()
```

### getParent() <a href="#m-getParent-45c1b196ed70" id="m-getParent-45c1b196ed70"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeReference.Builder getParent()
```

Types: [Builder](../CsTypeReference/Builder.md#cls-Builder)

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Builder getValue()
```

Types: [Builder](Value/Builder.md#cls-Builder)

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

### initParent() <a href="#m-initParent-42003b75a7dd" id="m-initParent-42003b75a7dd"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeReference.Builder initParent()
```

Types: [Builder](../CsTypeReference/Builder.md#cls-Builder)

### initValue() <a href="#m-initValue-a7755fffc529" id="m-initValue-a7755fffc529"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Builder initValue()
```

Types: [Builder](Value/Builder.md#cls-Builder)

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

### setNs(int) <a href="#m-setNs-3c6980dbfd35" id="m-setNs-3c6980dbfd35"></a>

```java
public final void setNs(int value)
```

**Parameters**

- `int value`

### setParent(Reader) <a href="#m-setParent-9ed68f47e1db" id="m-setParent-9ed68f47e1db"></a>

```java
public final void setParent(com.tailf.ncs.maapi.Schema.CsTypeReference.Reader value)
```

Types: [Reader](../CsTypeReference/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeReference.Reader value`
