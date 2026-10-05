# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#builder-179fba5038bd)

**Methods**:

- [asReader()](#asreader-b5c0f2a8d115)
- [getName()](#getname-2634b18b4a25)
- [getNs()](#getns-59b97eae2a4a)
- [getParent()](#getparent-45c1b196ed70)
- [getValue()](#getvalue-d93864668c40)
- [hasName()](#hasname-bfe6c334e0d1)
- [initName(int)](#initname-281e5d2102d4)
- [initParent()](#initparent-42003b75a7dd)
- [initValue()](#initvalue-a7755fffc529)
- [setName(Reader)](#setname-79f9d1263a41)
- [setName(String)](#setname-c76ccfcb9f18)
- [setNs(int)](#setns-3c6980dbfd35)
- [setParent(Reader)](#setparent-9ed68f47e1db)

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
public final com.tailf.ncs.maapi.Schema.CsType.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getName() <a href="#getname-2634b18b4a25" id="getname-2634b18b4a25"></a>

```java
public final org.capnproto.Text.Builder getName()
```

### getNs() <a href="#getns-59b97eae2a4a" id="getns-59b97eae2a4a"></a>

```java
public final int getNs()
```

### getParent() <a href="#getparent-45c1b196ed70" id="getparent-45c1b196ed70"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeReference.Builder getParent()
```

Types: [Builder](../CsTypeReference/Builder.md#builder-21f09e83781d)

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Builder getValue()
```

Types: [Builder](Value/Builder.md#builder-21f09e83781d)

### hasName() <a href="#hasname-bfe6c334e0d1" id="hasname-bfe6c334e0d1"></a>

```java
public final boolean hasName()
```

### initName(int) <a href="#initname-281e5d2102d4" id="initname-281e5d2102d4"></a>

```java
public final org.capnproto.Text.Builder initName(int size)
```

**Parameters**

- `int size`

### initParent() <a href="#initparent-42003b75a7dd" id="initparent-42003b75a7dd"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeReference.Builder initParent()
```

Types: [Builder](../CsTypeReference/Builder.md#builder-21f09e83781d)

### initValue() <a href="#initvalue-a7755fffc529" id="initvalue-a7755fffc529"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Builder initValue()
```

Types: [Builder](Value/Builder.md#builder-21f09e83781d)

### setName(Reader) <a href="#setname-79f9d1263a41" id="setname-79f9d1263a41"></a>

```java
public final void setName(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setName(String) <a href="#setname-c76ccfcb9f18" id="setname-c76ccfcb9f18"></a>

```java
public final void setName(String value)
```

**Parameters**

- `String value`

### setNs(int) <a href="#setns-3c6980dbfd35" id="setns-3c6980dbfd35"></a>

```java
public final void setNs(int value)
```

**Parameters**

- `int value`

### setParent(Reader) <a href="#setparent-9ed68f47e1db" id="setparent-9ed68f47e1db"></a>

```java
public final void setParent(com.tailf.ncs.maapi.Schema.CsTypeReference.Reader value)
```

Types: [Reader](../CsTypeReference/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeReference.Reader value`
