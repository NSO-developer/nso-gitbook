# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader\(SegmentReader, int, int, int, short, int\)](#reader-cf5e962c3323)

**Methods**:

- [getHid\(\)](#gethid-34aa6038c623)
- [getHns\(\)](#gethns-457afaf41ae6)
- [getQname\(\)](#getqname-022156d42738)
- [hasQname\(\)](#hasqname-3146e94ee2c2)

## Constructors

### Reader(SegmentReader, int, int, int, short, int) <a href="#reader-cf5e962c3323" id="reader-cf5e962c3323"></a>

**Package-private**

```java
Reader(
    org.capnproto.SegmentReader segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount,
    int nestingLimit
)
```

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`


## Methods

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
public org.capnproto.Text.Reader getQname()
```

### hasQname() <a href="#hasqname-3146e94ee2c2" id="hasqname-3146e94ee2c2"></a>

```java
public boolean hasQname()
```
