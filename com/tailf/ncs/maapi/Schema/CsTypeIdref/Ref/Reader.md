<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getHid()](#m-gethid-34aa6038c623)
- [getHns()](#m-gethns-457afaf41ae6)
- [getQname()](#m-getqname-022156d42738)
- [hasQname()](#m-hasqname-3146e94ee2c2)

## Constructors

<a id="m-reader-cf5e962c3323"></a>
### Reader(SegmentReader, int, int, int, short, int)

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
public org.capnproto.Text.Reader getQname()
```

<a id="m-hasqname-3146e94ee2c2"></a>
### hasQname()

```java
public boolean hasQname()
```
