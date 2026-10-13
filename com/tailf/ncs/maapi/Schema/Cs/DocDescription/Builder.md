# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.DocDescription.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getNone\(\)](#getnone-e31bfdbffa7f)
- [getValue\(\)](#getvalue-d93864668c40)
- [hasValue\(\)](#hasvalue-dad92e423e7a)
- [initValue\(int\)](#initvalue-a117f5eca48d)
- [isNone\(\)](#isnone-e8a993ad0453)
- [isValue\(\)](#isvalue-7280ea8211f4)
- [setNone\(Void\)](#setnone-46764db867d5)
- [setValue\(Reader\)](#setvalue-6784c0d559f7)
- [setValue\(String\)](#setvalue-90771990f0a6)
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
public final com.tailf.ncs.maapi.Schema.Cs.DocDescription.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getNone() <a href="#getnone-e31bfdbffa7f" id="getnone-e31bfdbffa7f"></a>

```java
public final org.capnproto.Void getNone()
```

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public final org.capnproto.Text.Builder getValue()
```

### hasValue() <a href="#hasvalue-dad92e423e7a" id="hasvalue-dad92e423e7a"></a>

```java
public final boolean hasValue()
```

### initValue(int) <a href="#initvalue-a117f5eca48d" id="initvalue-a117f5eca48d"></a>

```java
public final org.capnproto.Text.Builder initValue(int size)
```

**Parameters**

- `int size`

### isNone() <a href="#isnone-e8a993ad0453" id="isnone-e8a993ad0453"></a>

```java
public final boolean isNone()
```

### isValue() <a href="#isvalue-7280ea8211f4" id="isvalue-7280ea8211f4"></a>

```java
public final boolean isValue()
```

### setNone(Void) <a href="#setnone-46764db867d5" id="setnone-46764db867d5"></a>

```java
public final void setNone(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setValue(Reader) <a href="#setvalue-6784c0d559f7" id="setvalue-6784c0d559f7"></a>

```java
public final void setValue(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setValue(String) <a href="#setvalue-90771990f0a6" id="setvalue-90771990f0a6"></a>

```java
public final void setValue(String value)
```

**Parameters**

- `String value`

### which() <a href="#which-0b2d23db5ed0" id="which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.DocDescription.Which which()
```

Types: [Which](Which.md#which-92b652653aa7)
