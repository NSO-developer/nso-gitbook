<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsMeta.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getKey()](#s-getKey)
- [getValue()](#s-getValue)
- [hasKey()](#s-hasKey)
- [initKey(int)](#s-initKey)
- [initValue()](#s-initValue)
- [setKey(Reader)](#s-setKey)
- [setKey(String)](#s-setKey-1)

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
public final com.tailf.ncs.maapi.Schema.CsMeta.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getKey"></a>
### getKey()

```java
public final org.capnproto.Text.Builder getKey()
```

<a id="s-getValue"></a>
### getValue()

```java
public final com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder getValue()
```

Types: [Builder](Value/Builder.md#s-Builder)

<a id="s-hasKey"></a>
### hasKey()

```java
public final boolean hasKey()
```

<a id="s-initKey"></a>
### initKey(int)

```java
public final org.capnproto.Text.Builder initKey(int size)
```

**Parameters**

- `int size`

<a id="s-initValue"></a>
### initValue()

```java
public final com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder initValue()
```

Types: [Builder](Value/Builder.md#s-Builder)

<a id="s-setKey"></a>
### setKey(Reader)

```java
public final void setKey(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="s-setKey-1"></a>
### setKey(String)

```java
public final void setKey(String value)
```

**Parameters**

- `String value`
