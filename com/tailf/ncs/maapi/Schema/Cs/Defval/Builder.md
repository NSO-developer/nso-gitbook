<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Defval.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getNone()](#m-getnone-e31bfdbffa7f)
- [getValue()](#m-getvalue-d93864668c40)
- [initValue()](#m-initvalue-a7755fffc529)
- [isNone()](#m-isnone-e8a993ad0453)
- [isValue()](#m-isvalue-7280ea8211f4)
- [setNone(Void)](#m-setnone-46764db867d5)
- [setValue(Reader)](#m-setvalue-1558adba6de5)
- [which()](#m-which-0b2d23db5ed0)

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
public final com.tailf.ncs.maapi.Schema.Cs.Defval.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getnone-e31bfdbffa7f"></a>
### getNone()

```java
public final org.capnproto.Void getNone()
```

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder getValue()
```

Types: [Builder](../../CsValue/Builder.md#cls-Builder)

<a id="m-initvalue-a7755fffc529"></a>
### initValue()

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder initValue()
```

Types: [Builder](../../CsValue/Builder.md#cls-Builder)

<a id="m-isnone-e8a993ad0453"></a>
### isNone()

```java
public final boolean isNone()
```

<a id="m-isvalue-7280ea8211f4"></a>
### isValue()

```java
public final boolean isValue()
```

<a id="m-setnone-46764db867d5"></a>
### setNone(Void)

```java
public final void setNone(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="m-setvalue-1558adba6de5"></a>
### setValue(Reader)

```java
public final void setValue(com.tailf.ncs.maapi.Schema.CsValue.Reader value)
```

Types: [Reader](../../CsValue/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValue.Reader value`

<a id="m-which-0b2d23db5ed0"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.Cs.Defval.Which which()
```

Types: [Which](Which.md#cls-Which)
