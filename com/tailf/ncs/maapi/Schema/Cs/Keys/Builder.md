# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Keys.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getList\(\)](#getlist-bb3f8cbe83be)
- [getNone\(\)](#getnone-e31bfdbffa7f)
- [hasList\(\)](#haslist-3712d7ce73ac)
- [initList\(int\)](#initlist-619d59db076f)
- [isList\(\)](#islist-c36bce63b506)
- [isNone\(\)](#isnone-e8a993ad0453)
- [setList\(Reader\)](#setlist-446c0e535b30)
- [setNone\(Void\)](#setnone-46764db867d5)
- [which\(\)](#which-0b2d23db5ed0)

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
public final com.tailf.ncs.maapi.Schema.Cs.Keys.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getList() <a href="#getlist-bb3f8cbe83be" id="getlist-bb3f8cbe83be"></a>

```java
public final org.capnproto.PrimitiveList.Int.Builder getList()
```

### getNone() <a href="#getnone-e31bfdbffa7f" id="getnone-e31bfdbffa7f"></a>

```java
public final org.capnproto.Void getNone()
```

### hasList() <a href="#haslist-3712d7ce73ac" id="haslist-3712d7ce73ac"></a>

```java
public final boolean hasList()
```

### initList(int) <a href="#initlist-619d59db076f" id="initlist-619d59db076f"></a>

```java
public final org.capnproto.PrimitiveList.Int.Builder initList(int size)
```

**Parameters**

- `int size`

### isList() <a href="#islist-c36bce63b506" id="islist-c36bce63b506"></a>

```java
public final boolean isList()
```

### isNone() <a href="#isnone-e8a993ad0453" id="isnone-e8a993ad0453"></a>

```java
public final boolean isNone()
```

### setList(Reader) <a href="#setlist-446c0e535b30" id="setlist-446c0e535b30"></a>

```java
public final void setList(org.capnproto.PrimitiveList.Int.Reader value)
```

**Parameters**

- `org.capnproto.PrimitiveList.Int.Reader value`

### setNone(Void) <a href="#setnone-46764db867d5" id="setnone-46764db867d5"></a>

```java
public final void setNone(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### which() <a href="#which-0b2d23db5ed0" id="which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.Keys.Which which()
```

Types: [Which](Which.md#which-92b652653aa7)
