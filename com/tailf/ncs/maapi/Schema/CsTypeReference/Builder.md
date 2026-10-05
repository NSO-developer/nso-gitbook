<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeReference.Builder
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
- [getNsHash()](#s-getNsHash)
- [hasName()](#s-hasName)
- [initName(int)](#s-initName)
- [setName(Reader)](#s-setName)
- [setName(String)](#s-setName-1)
- [setNsHash(int)](#s-setNsHash)

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
public final com.tailf.ncs.maapi.Schema.CsTypeReference.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getName"></a>
### getName()

```java
public final org.capnproto.Text.Builder getName()
```

<a id="s-getNsHash"></a>
### getNsHash()

```java
public final int getNsHash()
```

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

<a id="s-setNsHash"></a>
### setNsHash(int)

```java
public final void setNsHash(int value)
```

**Parameters**

- `int value`
