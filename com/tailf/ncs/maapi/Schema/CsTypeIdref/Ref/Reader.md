# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getHid()](#m-getHid-34aa6038c623)
- [getHns()](#m-getHns-457afaf41ae6)
- [getQname()](#m-getQname-022156d42738)
- [hasQname()](#m-hasQname-3146e94ee2c2)

## Constructors

### Reader(SegmentReader, int, int, int, short, int) <a href="#m-Reader-cf5e962c3323" id="m-Reader-cf5e962c3323"></a>

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
public org.capnproto.Text.Reader getQname()
```

### hasQname() <a href="#m-hasQname-3146e94ee2c2" id="m-hasQname-3146e94ee2c2"></a>

```java
public boolean hasQname()
```
