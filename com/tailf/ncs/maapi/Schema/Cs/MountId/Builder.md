<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.MountId.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getNone()](#s-getNone)
- [getValue()](#s-getValue)
- [initValue()](#s-initValue)
- [isNone()](#s-isNone)
- [isValue()](#s-isValue)
- [setNone(Void)](#s-setNone)
- [setValue(Reader)](#s-setValue)
- [which()](#s-which)

## Constructors

<a id="s-Builder-1"></a>
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

<a id="s-asReader"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.Cs.MountId.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getNone"></a>
### getNone()

```java
public final org.capnproto.Void getNone()
```

<a id="s-getValue"></a>
### getValue()

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder getValue()
```

Types: [Builder](../../QTag/Builder.md#s-Builder)

<a id="s-initValue"></a>
### initValue()

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder initValue()
```

Types: [Builder](../../QTag/Builder.md#s-Builder)

<a id="s-isNone"></a>
### isNone()

```java
public final boolean isNone()
```

<a id="s-isValue"></a>
### isValue()

```java
public final boolean isValue()
```

<a id="s-setNone"></a>
### setNone(Void)

```java
public final void setNone(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="s-setValue"></a>
### setValue(Reader)

```java
public final void setValue(com.tailf.ncs.maapi.Schema.QTag.Reader value)
```

Types: [Reader](../../QTag/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.QTag.Reader value`

<a id="s-which"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.Cs.MountId.Which which()
```

Types: [Which](Which.md#s-Which)
