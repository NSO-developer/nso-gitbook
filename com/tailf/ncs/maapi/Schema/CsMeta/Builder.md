<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsMeta.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getKey()](#m-getkey-9a8856159458)
- [getValue()](#m-getvalue-d93864668c40)
- [hasKey()](#m-haskey-feb6e0de2bc0)
- [initKey(int)](#m-initkey-c974a5aab6d7)
- [initValue()](#m-initvalue-a7755fffc529)
- [setKey(Reader)](#m-setkey-aecf165a1c36)
- [setKey(String)](#m-setkey-b33e905ae785)

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
public final com.tailf.ncs.maapi.Schema.CsMeta.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getkey-9a8856159458"></a>
### getKey()

```java
public final org.capnproto.Text.Builder getKey()
```

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public final com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder getValue()
```

Types: [Builder](Value/Builder.md#cls-Builder)

<a id="m-haskey-feb6e0de2bc0"></a>
### hasKey()

```java
public final boolean hasKey()
```

<a id="m-initkey-c974a5aab6d7"></a>
### initKey(int)

```java
public final org.capnproto.Text.Builder initKey(int size)
```

**Parameters**

- `int size`

<a id="m-initvalue-a7755fffc529"></a>
### initValue()

```java
public final com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder initValue()
```

Types: [Builder](Value/Builder.md#cls-Builder)

<a id="m-setkey-aecf165a1c36"></a>
### setKey(Reader)

```java
public final void setKey(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="m-setkey-b33e905ae785"></a>
### setKey(String)

```java
public final void setKey(String value)
```

**Parameters**

- `String value`
