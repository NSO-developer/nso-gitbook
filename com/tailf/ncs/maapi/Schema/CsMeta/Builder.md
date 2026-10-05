# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsMeta.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getKey()](#m-getKey-9a8856159458)
- [getValue()](#m-getValue-d93864668c40)
- [hasKey()](#m-hasKey-feb6e0de2bc0)
- [initKey(int)](#m-initKey-c974a5aab6d7)
- [initValue()](#m-initValue-a7755fffc529)
- [setKey(Reader)](#m-setKey-aecf165a1c36)
- [setKey(String)](#m-setKey-b33e905ae785)

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
public final com.tailf.ncs.maapi.Schema.CsMeta.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getKey() <a href="#m-getKey-9a8856159458" id="m-getKey-9a8856159458"></a>

```java
public final org.capnproto.Text.Builder getKey()
```

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder getValue()
```

Types: [Builder](Value/Builder.md#cls-Builder)

### hasKey() <a href="#m-hasKey-feb6e0de2bc0" id="m-hasKey-feb6e0de2bc0"></a>

```java
public final boolean hasKey()
```

### initKey(int) <a href="#m-initKey-c974a5aab6d7" id="m-initKey-c974a5aab6d7"></a>

```java
public final org.capnproto.Text.Builder initKey(int size)
```

**Parameters**

- `int size`

### initValue() <a href="#m-initValue-a7755fffc529" id="m-initValue-a7755fffc529"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder initValue()
```

Types: [Builder](Value/Builder.md#cls-Builder)

### setKey(Reader) <a href="#m-setKey-aecf165a1c36" id="m-setKey-aecf165a1c36"></a>

```java
public final void setKey(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setKey(String) <a href="#m-setKey-b33e905ae785" id="m-setKey-b33e905ae785"></a>

```java
public final void setKey(String value)
```

**Parameters**

- `String value`
