<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getName()](#m-getname-2634b18b4a25)
- [getNs()](#m-getns-59b97eae2a4a)
- [getParent()](#m-getparent-45c1b196ed70)
- [getValue()](#m-getvalue-d93864668c40)
- [hasName()](#m-hasname-bfe6c334e0d1)
- [initName(int)](#m-initname-281e5d2102d4)
- [initParent()](#m-initparent-42003b75a7dd)
- [initValue()](#m-initvalue-a7755fffc529)
- [setName(Reader)](#m-setname-79f9d1263a41)
- [setName(String)](#m-setname-c76ccfcb9f18)
- [setNs(int)](#m-setns-3c6980dbfd35)
- [setParent(Reader)](#m-setparent-9ed68f47e1db)

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
public final com.tailf.ncs.maapi.Schema.CsType.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getname-2634b18b4a25"></a>
### getName()

```java
public final org.capnproto.Text.Builder getName()
```

<a id="m-getns-59b97eae2a4a"></a>
### getNs()

```java
public final int getNs()
```

<a id="m-getparent-45c1b196ed70"></a>
### getParent()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeReference.Builder getParent()
```

Types: [Builder](../CsTypeReference/Builder.md#cls-Builder)

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Builder getValue()
```

Types: [Builder](Value/Builder.md#cls-Builder)

<a id="m-hasname-bfe6c334e0d1"></a>
### hasName()

```java
public final boolean hasName()
```

<a id="m-initname-281e5d2102d4"></a>
### initName(int)

```java
public final org.capnproto.Text.Builder initName(int size)
```

**Parameters**

- `int size`

<a id="m-initparent-42003b75a7dd"></a>
### initParent()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeReference.Builder initParent()
```

Types: [Builder](../CsTypeReference/Builder.md#cls-Builder)

<a id="m-initvalue-a7755fffc529"></a>
### initValue()

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Builder initValue()
```

Types: [Builder](Value/Builder.md#cls-Builder)

<a id="m-setname-79f9d1263a41"></a>
### setName(Reader)

```java
public final void setName(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="m-setname-c76ccfcb9f18"></a>
### setName(String)

```java
public final void setName(String value)
```

**Parameters**

- `String value`

<a id="m-setns-3c6980dbfd35"></a>
### setNs(int)

```java
public final void setNs(int value)
```

**Parameters**

- `int value`

<a id="m-setparent-9ed68f47e1db"></a>
### setParent(Reader)

```java
public final void setParent(com.tailf.ncs.maapi.Schema.CsTypeReference.Reader value)
```

Types: [Reader](../CsTypeReference/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeReference.Reader value`
