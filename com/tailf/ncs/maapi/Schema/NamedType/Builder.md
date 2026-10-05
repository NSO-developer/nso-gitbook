# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.NamedType.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getName\(\)](#getname-2634b18b4a25)
- [getType\(\)](#gettype-5a52f6f0d4c1)
- [hasName\(\)](#hasname-bfe6c334e0d1)
- [initName\(int\)](#initname-281e5d2102d4)
- [initType\(\)](#inittype-9d8086c9965a)
- [setName\(Reader\)](#setname-79f9d1263a41)
- [setName\(String\)](#setname-c76ccfcb9f18)
- [setType\(Reader\)](#settype-b1128ee37ec1)

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
public final com.tailf.ncs.maapi.Schema.NamedType.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getName() <a href="#getname-2634b18b4a25" id="getname-2634b18b4a25"></a>

```java
public final org.capnproto.Text.Builder getName()
```

### getType() <a href="#gettype-5a52f6f0d4c1" id="gettype-5a52f6f0d4c1"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Builder getType()
```

Types: [Builder](../CsType/Builder.md#builder-21f09e83781d)

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

### initType() <a href="#inittype-9d8086c9965a" id="inittype-9d8086c9965a"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Builder initType()
```

Types: [Builder](../CsType/Builder.md#builder-21f09e83781d)

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

### setType(Reader) <a href="#settype-b1128ee37ec1" id="settype-b1128ee37ec1"></a>

```java
public final void setType(com.tailf.ncs.maapi.Schema.CsType.Reader value)
```

Types: [Reader](../CsType/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsType.Reader value`
