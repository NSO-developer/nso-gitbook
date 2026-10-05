<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getHid()](#m-gethid-34aa6038c623)
- [getHns()](#m-gethns-457afaf41ae6)
- [getQname()](#m-getqname-022156d42738)
- [hasQname()](#m-hasqname-3146e94ee2c2)
- [initQname(int)](#m-initqname-070346dcfd2a)
- [setHid(int)](#m-sethid-628b88f6c037)
- [setHns(int)](#m-sethns-7405e78f40fe)
- [setQname(Reader)](#m-setqname-5263707f5f9e)
- [setQname(String)](#m-setqname-d55a4e375433)

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
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-gethid-34aa6038c623"></a>
### getHid()

```java
public final int getHid()
```

<a id="m-gethns-457afaf41ae6"></a>
### getHns()

```java
public final int getHns()
```

<a id="m-getqname-022156d42738"></a>
### getQname()

```java
public final org.capnproto.Text.Builder getQname()
```

<a id="m-hasqname-3146e94ee2c2"></a>
### hasQname()

```java
public final boolean hasQname()
```

<a id="m-initqname-070346dcfd2a"></a>
### initQname(int)

```java
public final org.capnproto.Text.Builder initQname(int size)
```

**Parameters**

- `int size`

<a id="m-sethid-628b88f6c037"></a>
### setHid(int)

```java
public final void setHid(int value)
```

**Parameters**

- `int value`

<a id="m-sethns-7405e78f40fe"></a>
### setHns(int)

```java
public final void setHns(int value)
```

**Parameters**

- `int value`

<a id="m-setqname-5263707f5f9e"></a>
### setQname(Reader)

```java
public final void setQname(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="m-setqname-d55a4e375433"></a>
### setQname(String)

```java
public final void setQname(String value)
```

**Parameters**

- `String value`
