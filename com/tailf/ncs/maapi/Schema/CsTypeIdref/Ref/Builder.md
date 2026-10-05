# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getHid()](#m-getHid-34aa6038c623)
- [getHns()](#m-getHns-457afaf41ae6)
- [getQname()](#m-getQname-022156d42738)
- [hasQname()](#m-hasQname-3146e94ee2c2)
- [initQname(int)](#m-initQname-070346dcfd2a)
- [setHid(int)](#m-setHid-628b88f6c037)
- [setHns(int)](#m-setHns-7405e78f40fe)
- [setQname(Reader)](#m-setQname-5263707f5f9e)
- [setQname(String)](#m-setQname-d55a4e375433)

## Constructors

### Builder(SegmentBuilder, int, int, int, short) <a href="#m-Builder-179fba5038bd" id="m-Builder-179fba5038bd"></a>

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

### asReader() <a href="#m-asReader-b5c0f2a8d115" id="m-asReader-b5c0f2a8d115"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getHid() <a href="#m-getHid-34aa6038c623" id="m-getHid-34aa6038c623"></a>

```java
public final int getHid()
```

### getHns() <a href="#m-getHns-457afaf41ae6" id="m-getHns-457afaf41ae6"></a>

```java
public final int getHns()
```

### getQname() <a href="#m-getQname-022156d42738" id="m-getQname-022156d42738"></a>

```java
public final org.capnproto.Text.Builder getQname()
```

### hasQname() <a href="#m-hasQname-3146e94ee2c2" id="m-hasQname-3146e94ee2c2"></a>

```java
public final boolean hasQname()
```

### initQname(int) <a href="#m-initQname-070346dcfd2a" id="m-initQname-070346dcfd2a"></a>

```java
public final org.capnproto.Text.Builder initQname(int size)
```

**Parameters**

- `int size`

### setHid(int) <a href="#m-setHid-628b88f6c037" id="m-setHid-628b88f6c037"></a>

```java
public final void setHid(int value)
```

**Parameters**

- `int value`

### setHns(int) <a href="#m-setHns-7405e78f40fe" id="m-setHns-7405e78f40fe"></a>

```java
public final void setHns(int value)
```

**Parameters**

- `int value`

### setQname(Reader) <a href="#m-setQname-5263707f5f9e" id="m-setQname-5263707f5f9e"></a>

```java
public final void setQname(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setQname(String) <a href="#m-setQname-d55a4e375433" id="m-setQname-d55a4e375433"></a>

```java
public final void setQname(String value)
```

**Parameters**

- `String value`
