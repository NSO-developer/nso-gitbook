# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsMeta.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getKey\(\)](#getkey-9a8856159458)
- [getValue\(\)](#getvalue-d93864668c40)
- [hasKey\(\)](#haskey-feb6e0de2bc0)
- [initKey\(int\)](#initkey-c974a5aab6d7)
- [initValue\(\)](#initvalue-a7755fffc529)
- [setKey\(Reader\)](#setkey-aecf165a1c36)
- [setKey\(String\)](#setkey-b33e905ae785)

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
public final com.tailf.ncs.maapi.Schema.CsMeta.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getKey() <a href="#getkey-9a8856159458" id="getkey-9a8856159458"></a>

```java
public final org.capnproto.Text.Builder getKey()
```

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder getValue()
```

Types: [Builder](Value/Builder.md#builder-21f09e83781d)

### hasKey() <a href="#haskey-feb6e0de2bc0" id="haskey-feb6e0de2bc0"></a>

```java
public final boolean hasKey()
```

### initKey(int) <a href="#initkey-c974a5aab6d7" id="initkey-c974a5aab6d7"></a>

```java
public final org.capnproto.Text.Builder initKey(int size)
```

**Parameters**

- `int size`

### initValue() <a href="#initvalue-a7755fffc529" id="initvalue-a7755fffc529"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder initValue()
```

Types: [Builder](Value/Builder.md#builder-21f09e83781d)

### setKey(Reader) <a href="#setkey-aecf165a1c36" id="setkey-aecf165a1c36"></a>

```java
public final void setKey(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setKey(String) <a href="#setkey-b33e905ae785" id="setkey-b33e905ae785"></a>

```java
public final void setKey(String value)
```

**Parameters**

- `String value`
