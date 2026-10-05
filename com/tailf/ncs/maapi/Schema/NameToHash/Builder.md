<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.NameToHash.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getHash()](#m-gethash-7efe0716cf4b)
- [getName()](#m-getname-2634b18b4a25)
- [hasName()](#m-hasname-bfe6c334e0d1)
- [initName(int)](#m-initname-281e5d2102d4)
- [setHash(int)](#m-sethash-e8bf998306ea)
- [setName(Reader)](#m-setname-79f9d1263a41)
- [setName(String)](#m-setname-c76ccfcb9f18)

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
public final com.tailf.ncs.maapi.Schema.NameToHash.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-gethash-7efe0716cf4b"></a>
### getHash()

```java
public final int getHash()
```

<a id="m-getname-2634b18b4a25"></a>
### getName()

```java
public final org.capnproto.Text.Builder getName()
```

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

<a id="m-sethash-e8bf998306ea"></a>
### setHash(int)

```java
public final void setHash(int value)
```

**Parameters**

- `int value`

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
