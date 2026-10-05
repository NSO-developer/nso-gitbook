# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueQName.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getName()](#m-getName-2634b18b4a25)
- [getPrefix()](#m-getPrefix-9268091e0223)
- [hasName()](#m-hasName-bfe6c334e0d1)
- [hasPrefix()](#m-hasPrefix-ddbc3bbca9c3)
- [initName(int)](#m-initName-281e5d2102d4)
- [initPrefix(int)](#m-initPrefix-e25b609de101)
- [setName(Reader)](#m-setName-79f9d1263a41)
- [setName(String)](#m-setName-c76ccfcb9f18)
- [setPrefix(Reader)](#m-setPrefix-5c58f0bf0784)
- [setPrefix(String)](#m-setPrefix-63fe622cb50c)

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
public final com.tailf.ncs.maapi.Schema.CsValueQName.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getName() <a href="#m-getName-2634b18b4a25" id="m-getName-2634b18b4a25"></a>

```java
public final org.capnproto.Text.Builder getName()
```

### getPrefix() <a href="#m-getPrefix-9268091e0223" id="m-getPrefix-9268091e0223"></a>

```java
public final org.capnproto.Text.Builder getPrefix()
```

### hasName() <a href="#m-hasName-bfe6c334e0d1" id="m-hasName-bfe6c334e0d1"></a>

```java
public final boolean hasName()
```

### hasPrefix() <a href="#m-hasPrefix-ddbc3bbca9c3" id="m-hasPrefix-ddbc3bbca9c3"></a>

```java
public final boolean hasPrefix()
```

### initName(int) <a href="#m-initName-281e5d2102d4" id="m-initName-281e5d2102d4"></a>

```java
public final org.capnproto.Text.Builder initName(int size)
```

**Parameters**

- `int size`

### initPrefix(int) <a href="#m-initPrefix-e25b609de101" id="m-initPrefix-e25b609de101"></a>

```java
public final org.capnproto.Text.Builder initPrefix(int size)
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

### setPrefix(Reader) <a href="#m-setPrefix-5c58f0bf0784" id="m-setPrefix-5c58f0bf0784"></a>

```java
public final void setPrefix(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setPrefix(String) <a href="#m-setPrefix-63fe622cb50c" id="m-setPrefix-63fe622cb50c"></a>

```java
public final void setPrefix(String value)
```

**Parameters**

- `String value`
