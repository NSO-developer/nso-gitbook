# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.NameToHash.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#builder-179fba5038bd)

**Methods**:

- [asReader()](#asreader-b5c0f2a8d115)
- [getHash()](#gethash-7efe0716cf4b)
- [getName()](#getname-2634b18b4a25)
- [hasName()](#hasname-bfe6c334e0d1)
- [initName(int)](#initname-281e5d2102d4)
- [setHash(int)](#sethash-e8bf998306ea)
- [setName(Reader)](#setname-79f9d1263a41)
- [setName(String)](#setname-c76ccfcb9f18)

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
public final com.tailf.ncs.maapi.Schema.NameToHash.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getHash() <a href="#gethash-7efe0716cf4b" id="gethash-7efe0716cf4b"></a>

```java
public final int getHash()
```

### getName() <a href="#getname-2634b18b4a25" id="getname-2634b18b4a25"></a>

```java
public final org.capnproto.Text.Builder getName()
```

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

### setHash(int) <a href="#sethash-e8bf998306ea" id="sethash-e8bf998306ea"></a>

```java
public final void setHash(int value)
```

**Parameters**

- `int value`

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
