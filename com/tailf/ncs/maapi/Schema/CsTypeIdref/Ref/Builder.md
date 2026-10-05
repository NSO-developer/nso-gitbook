# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getHid\(\)](#gethid-34aa6038c623)
- [getHns\(\)](#gethns-457afaf41ae6)
- [getQname\(\)](#getqname-022156d42738)
- [hasQname\(\)](#hasqname-3146e94ee2c2)
- [initQname\(int\)](#initqname-070346dcfd2a)
- [setHid\(int\)](#sethid-628b88f6c037)
- [setHns\(int\)](#sethns-7405e78f40fe)
- [setQname\(Reader\)](#setqname-5263707f5f9e)
- [setQname\(String\)](#setqname-d55a4e375433)

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
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getHid() <a href="#gethid-34aa6038c623" id="gethid-34aa6038c623"></a>

```java
public final int getHid()
```

### getHns() <a href="#gethns-457afaf41ae6" id="gethns-457afaf41ae6"></a>

```java
public final int getHns()
```

### getQname() <a href="#getqname-022156d42738" id="getqname-022156d42738"></a>

```java
public final org.capnproto.Text.Builder getQname()
```

### hasQname() <a href="#hasqname-3146e94ee2c2" id="hasqname-3146e94ee2c2"></a>

```java
public final boolean hasQname()
```

### initQname(int) <a href="#initqname-070346dcfd2a" id="initqname-070346dcfd2a"></a>

```java
public final org.capnproto.Text.Builder initQname(int size)
```

**Parameters**

- `int size`

### setHid(int) <a href="#sethid-628b88f6c037" id="sethid-628b88f6c037"></a>

```java
public final void setHid(int value)
```

**Parameters**

- `int value`

### setHns(int) <a href="#sethns-7405e78f40fe" id="sethns-7405e78f40fe"></a>

```java
public final void setHns(int value)
```

**Parameters**

- `int value`

### setQname(Reader) <a href="#setqname-5263707f5f9e" id="setqname-5263707f5f9e"></a>

```java
public final void setQname(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setQname(String) <a href="#setqname-d55a4e375433" id="setqname-d55a4e375433"></a>

```java
public final void setQname(String value)
```

**Parameters**

- `String value`
