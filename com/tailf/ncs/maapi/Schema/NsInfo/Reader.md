<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.NsInfo.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getModule()](#m-getmodule-68694513ccce)
- [getNshash()](#m-getnshash-c5a7631eae00)
- [getPrefix()](#m-getprefix-9268091e0223)
- [getRevision()](#m-getrevision-b0088aa9f0bf)
- [getRootNodes()](#m-getrootnodes-63f2b6255095)
- [getTypes()](#m-gettypes-cbd0de718034)
- [getUri()](#m-geturi-e839fdd3e24c)
- [hasModule()](#m-hasmodule-8a9f381a7ff1)
- [hasPrefix()](#m-hasprefix-ddbc3bbca9c3)
- [hasRevision()](#m-hasrevision-23a5e6a14bd8)
- [hasRootNodes()](#m-hasrootnodes-251070d577eb)
- [hasTypes()](#m-hastypes-5c6311e6f402)
- [hasUri()](#m-hasuri-d455832c8996)

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

<a id="m-getmodule-68694513ccce"></a>
### getModule()

```java
public org.capnproto.Text.Reader getModule()
```

<a id="m-getnshash-c5a7631eae00"></a>
### getNshash()

```java
public final int getNshash()
```

<a id="m-getprefix-9268091e0223"></a>
### getPrefix()

```java
public org.capnproto.Text.Reader getPrefix()
```

<a id="m-getrevision-b0088aa9f0bf"></a>
### getRevision()

```java
public org.capnproto.Text.Reader getRevision()
```

<a id="m-getrootnodes-63f2b6255095"></a>
### getRootNodes()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> getRootNodes()
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

<a id="m-gettypes-cbd0de718034"></a>
### getTypes()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NamedType.Reader> getTypes()
```

Types: [Reader](../NamedType/Reader.md#cls-Reader)

<a id="m-geturi-e839fdd3e24c"></a>
### getUri()

```java
public org.capnproto.Text.Reader getUri()
```

<a id="m-hasmodule-8a9f381a7ff1"></a>
### hasModule()

```java
public boolean hasModule()
```

<a id="m-hasprefix-ddbc3bbca9c3"></a>
### hasPrefix()

```java
public boolean hasPrefix()
```

<a id="m-hasrevision-23a5e6a14bd8"></a>
### hasRevision()

```java
public boolean hasRevision()
```

<a id="m-hasrootnodes-251070d577eb"></a>
### hasRootNodes()

```java
public final boolean hasRootNodes()
```

<a id="m-hastypes-5c6311e6f402"></a>
### hasTypes()

```java
public final boolean hasTypes()
```

<a id="m-hasuri-d455832c8996"></a>
### hasUri()

```java
public boolean hasUri()
```
