# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueQName.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#builder-179fba5038bd)

**Methods**:

- [asReader()](#asreader-b5c0f2a8d115)
- [getName()](#getname-2634b18b4a25)
- [getPrefix()](#getprefix-9268091e0223)
- [hasName()](#hasname-bfe6c334e0d1)
- [hasPrefix()](#hasprefix-ddbc3bbca9c3)
- [initName(int)](#initname-281e5d2102d4)
- [initPrefix(int)](#initprefix-e25b609de101)
- [setName(Reader)](#setname-79f9d1263a41)
- [setName(String)](#setname-c76ccfcb9f18)
- [setPrefix(Reader)](#setprefix-5c58f0bf0784)
- [setPrefix(String)](#setprefix-63fe622cb50c)

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
public final com.tailf.ncs.maapi.Schema.CsValueQName.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getName() <a href="#getname-2634b18b4a25" id="getname-2634b18b4a25"></a>

```java
public final org.capnproto.Text.Builder getName()
```

### getPrefix() <a href="#getprefix-9268091e0223" id="getprefix-9268091e0223"></a>

```java
public final org.capnproto.Text.Builder getPrefix()
```

### hasName() <a href="#hasname-bfe6c334e0d1" id="hasname-bfe6c334e0d1"></a>

```java
public final boolean hasName()
```

### hasPrefix() <a href="#hasprefix-ddbc3bbca9c3" id="hasprefix-ddbc3bbca9c3"></a>

```java
public final boolean hasPrefix()
```

### initName(int) <a href="#initname-281e5d2102d4" id="initname-281e5d2102d4"></a>

```java
public final org.capnproto.Text.Builder initName(int size)
```

**Parameters**

- `int size`

### initPrefix(int) <a href="#initprefix-e25b609de101" id="initprefix-e25b609de101"></a>

```java
public final org.capnproto.Text.Builder initPrefix(int size)
```

**Parameters**

- `int size`

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

### setPrefix(Reader) <a href="#setprefix-5c58f0bf0784" id="setprefix-5c58f0bf0784"></a>

```java
public final void setPrefix(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setPrefix(String) <a href="#setprefix-63fe622cb50c" id="setprefix-63fe622cb50c"></a>

```java
public final void setPrefix(String value)
```

**Parameters**

- `String value`
