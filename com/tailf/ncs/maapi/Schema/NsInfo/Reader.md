<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.NsInfo.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getModule()](#s-getModule)
- [getNshash()](#s-getNshash)
- [getPrefix()](#s-getPrefix)
- [getRevision()](#s-getRevision)
- [getRootNodes()](#s-getRootNodes)
- [getTypes()](#s-getTypes)
- [getUri()](#s-getUri)
- [hasModule()](#s-hasModule)
- [hasPrefix()](#s-hasPrefix)
- [hasRevision()](#s-hasRevision)
- [hasRootNodes()](#s-hasRootNodes)
- [hasTypes()](#s-hasTypes)
- [hasUri()](#s-hasUri)

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

<a id="s-getModule"></a>
### getModule()

```java
public org.capnproto.Text.Reader getModule()
```

<a id="s-getNshash"></a>
### getNshash()

```java
public final int getNshash()
```

<a id="s-getPrefix"></a>
### getPrefix()

```java
public org.capnproto.Text.Reader getPrefix()
```

<a id="s-getRevision"></a>
### getRevision()

```java
public org.capnproto.Text.Reader getRevision()
```

<a id="s-getRootNodes"></a>
### getRootNodes()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> getRootNodes()
```

Types: [Reader](../QTag/Reader.md#s-Reader)

<a id="s-getTypes"></a>
### getTypes()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NamedType.Reader> getTypes()
```

Types: [Reader](../NamedType/Reader.md#s-Reader)

<a id="s-getUri"></a>
### getUri()

```java
public org.capnproto.Text.Reader getUri()
```

<a id="s-hasModule"></a>
### hasModule()

```java
public boolean hasModule()
```

<a id="s-hasPrefix"></a>
### hasPrefix()

```java
public boolean hasPrefix()
```

<a id="s-hasRevision"></a>
### hasRevision()

```java
public boolean hasRevision()
```

<a id="s-hasRootNodes"></a>
### hasRootNodes()

```java
public final boolean hasRootNodes()
```

<a id="s-hasTypes"></a>
### hasTypes()

```java
public final boolean hasTypes()
```

<a id="s-hasUri"></a>
### hasUri()

```java
public boolean hasUri()
```
