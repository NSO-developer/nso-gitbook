# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.NsInfo.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getModule()](#m-getModule-68694513ccce)
- [getNshash()](#m-getNshash-c5a7631eae00)
- [getPrefix()](#m-getPrefix-9268091e0223)
- [getRevision()](#m-getRevision-b0088aa9f0bf)
- [getRootNodes()](#m-getRootNodes-63f2b6255095)
- [getTypes()](#m-getTypes-cbd0de718034)
- [getUri()](#m-getUri-e839fdd3e24c)
- [hasModule()](#m-hasModule-8a9f381a7ff1)
- [hasPrefix()](#m-hasPrefix-ddbc3bbca9c3)
- [hasRevision()](#m-hasRevision-23a5e6a14bd8)
- [hasRootNodes()](#m-hasRootNodes-251070d577eb)
- [hasTypes()](#m-hasTypes-5c6311e6f402)
- [hasUri()](#m-hasUri-d455832c8996)

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

### getModule() <a href="#m-getModule-68694513ccce" id="m-getModule-68694513ccce"></a>

```java
public org.capnproto.Text.Reader getModule()
```

### getNshash() <a href="#m-getNshash-c5a7631eae00" id="m-getNshash-c5a7631eae00"></a>

```java
public final int getNshash()
```

### getPrefix() <a href="#m-getPrefix-9268091e0223" id="m-getPrefix-9268091e0223"></a>

```java
public org.capnproto.Text.Reader getPrefix()
```

### getRevision() <a href="#m-getRevision-b0088aa9f0bf" id="m-getRevision-b0088aa9f0bf"></a>

```java
public org.capnproto.Text.Reader getRevision()
```

### getRootNodes() <a href="#m-getRootNodes-63f2b6255095" id="m-getRootNodes-63f2b6255095"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> getRootNodes()
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

### getTypes() <a href="#m-getTypes-cbd0de718034" id="m-getTypes-cbd0de718034"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NamedType.Reader> getTypes()
```

Types: [Reader](../NamedType/Reader.md#cls-Reader)

### getUri() <a href="#m-getUri-e839fdd3e24c" id="m-getUri-e839fdd3e24c"></a>

```java
public org.capnproto.Text.Reader getUri()
```

### hasModule() <a href="#m-hasModule-8a9f381a7ff1" id="m-hasModule-8a9f381a7ff1"></a>

```java
public boolean hasModule()
```

### hasPrefix() <a href="#m-hasPrefix-ddbc3bbca9c3" id="m-hasPrefix-ddbc3bbca9c3"></a>

```java
public boolean hasPrefix()
```

### hasRevision() <a href="#m-hasRevision-23a5e6a14bd8" id="m-hasRevision-23a5e6a14bd8"></a>

```java
public boolean hasRevision()
```

### hasRootNodes() <a href="#m-hasRootNodes-251070d577eb" id="m-hasRootNodes-251070d577eb"></a>

```java
public final boolean hasRootNodes()
```

### hasTypes() <a href="#m-hasTypes-5c6311e6f402" id="m-hasTypes-5c6311e6f402"></a>

```java
public final boolean hasTypes()
```

### hasUri() <a href="#m-hasUri-d455832c8996" id="m-hasUri-d455832c8996"></a>

```java
public boolean hasUri()
```
