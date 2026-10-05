<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getHid()](#s-getHid)
- [getHns()](#s-getHns)
- [getQname()](#s-getQname)
- [hasQname()](#s-hasQname)

## Constructors

<a id="s-Reader-1"></a>
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
public org.capnproto.Text.Reader getQname()
```

<a id="s-hasQname"></a>
### hasQname()

```java
public boolean hasQname()
```
