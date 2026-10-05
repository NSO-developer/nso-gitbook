<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsType.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getName()](#s-getName)
- [getNs()](#s-getNs)
- [getParent()](#s-getParent)
- [getValue()](#s-getValue)
- [hasName()](#s-hasName)
- [initName(int)](#s-initName)
- [initParent()](#s-initParent)
- [initValue()](#s-initValue)
- [setName(Reader)](#s-setName)
- [setName(String)](#s-setName-1)
- [setNs(int)](#s-setNs)
- [setParent(Reader)](#s-setParent)

## Constructors

<a id="s-Builder-1"></a>
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

<a id="s-asReader"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.CsType.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getName"></a>
### getName()

```java
public final org.capnproto.Text.Builder getName()
```

<a id="s-getNs"></a>
### getNs()

```java
public final int getNs()
```

<a id="s-getParent"></a>
### getParent()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeReference.Builder getParent()
```

Types: [Builder](../CsTypeReference/Builder.md#s-Builder)

<a id="s-getValue"></a>
### getValue()

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Builder getValue()
```

Types: [Builder](Value/Builder.md#s-Builder)

<a id="s-hasName"></a>
### hasName()

```java
public final boolean hasName()
```

<a id="s-initName"></a>
### initName(int)

```java
public final org.capnproto.Text.Builder initName(int size)
```

**Parameters**

- `int size`

<a id="s-initParent"></a>
### initParent()

```java
public final com.tailf.ncs.maapi.Schema.CsTypeReference.Builder initParent()
```

Types: [Builder](../CsTypeReference/Builder.md#s-Builder)

<a id="s-initValue"></a>
### initValue()

```java
public final com.tailf.ncs.maapi.Schema.CsType.Value.Builder initValue()
```

Types: [Builder](Value/Builder.md#s-Builder)

<a id="s-setName"></a>
### setName(Reader)

```java
public final void setName(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="s-setName-1"></a>
### setName(String)

```java
public final void setName(String value)
```

**Parameters**

- `String value`

<a id="s-setNs"></a>
### setNs(int)

```java
public final void setNs(int value)
```

**Parameters**

- `int value`

<a id="s-setParent"></a>
### setParent(Reader)

```java
public final void setParent(com.tailf.ncs.maapi.Schema.CsTypeReference.Reader value)
```

Types: [Reader](../CsTypeReference/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeReference.Reader value`
