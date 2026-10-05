<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getHid()](#s-getHid)
- [getHns()](#s-getHns)
- [getQname()](#s-getQname)
- [hasQname()](#s-hasQname)
- [initQname(int)](#s-initQname)
- [setHid(int)](#s-setHid)
- [setHns(int)](#s-setHns)
- [setQname(Reader)](#s-setQname)
- [setQname(String)](#s-setQname-1)

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
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getHid"></a>
### getHid()

```java
public final int getHid()
```

<a id="s-getHns"></a>
### getHns()

```java
public final int getHns()
```

<a id="s-getQname"></a>
### getQname()

```java
public final org.capnproto.Text.Builder getQname()
```

<a id="s-hasQname"></a>
### hasQname()

```java
public final boolean hasQname()
```

<a id="s-initQname"></a>
### initQname(int)

```java
public final org.capnproto.Text.Builder initQname(int size)
```

**Parameters**

- `int size`

<a id="s-setHid"></a>
### setHid(int)

```java
public final void setHid(int value)
```

**Parameters**

- `int value`

<a id="s-setHns"></a>
### setHns(int)

```java
public final void setHns(int value)
```

**Parameters**

- `int value`

<a id="s-setQname"></a>
### setQname(Reader)

```java
public final void setQname(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="s-setQname-1"></a>
### setQname(String)

```java
public final void setQname(String value)
```

**Parameters**

- `String value`
