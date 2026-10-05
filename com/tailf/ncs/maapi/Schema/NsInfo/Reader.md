# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.NsInfo.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#reader-cf5e962c3323)

**Methods**:

- [getModule()](#getmodule-68694513ccce)
- [getNshash()](#getnshash-c5a7631eae00)
- [getPrefix()](#getprefix-9268091e0223)
- [getRevision()](#getrevision-b0088aa9f0bf)
- [getRootNodes()](#getrootnodes-63f2b6255095)
- [getTypes()](#gettypes-cbd0de718034)
- [getUri()](#geturi-e839fdd3e24c)
- [hasModule()](#hasmodule-8a9f381a7ff1)
- [hasPrefix()](#hasprefix-ddbc3bbca9c3)
- [hasRevision()](#hasrevision-23a5e6a14bd8)
- [hasRootNodes()](#hasrootnodes-251070d577eb)
- [hasTypes()](#hastypes-5c6311e6f402)
- [hasUri()](#hasuri-d455832c8996)

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

### getModule() <a href="#getmodule-68694513ccce" id="getmodule-68694513ccce"></a>

```java
public org.capnproto.Text.Reader getModule()
```

### getNshash() <a href="#getnshash-c5a7631eae00" id="getnshash-c5a7631eae00"></a>

```java
public final int getNshash()
```

### getPrefix() <a href="#getprefix-9268091e0223" id="getprefix-9268091e0223"></a>

```java
public org.capnproto.Text.Reader getPrefix()
```

### getRevision() <a href="#getrevision-b0088aa9f0bf" id="getrevision-b0088aa9f0bf"></a>

```java
public org.capnproto.Text.Reader getRevision()
```

### getRootNodes() <a href="#getrootnodes-63f2b6255095" id="getrootnodes-63f2b6255095"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> getRootNodes()
```

Types: [Reader](../QTag/Reader.md#reader-b2467a96ddff)

### getTypes() <a href="#gettypes-cbd0de718034" id="gettypes-cbd0de718034"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NamedType.Reader> getTypes()
```

Types: [Reader](../NamedType/Reader.md#reader-b2467a96ddff)

### getUri() <a href="#geturi-e839fdd3e24c" id="geturi-e839fdd3e24c"></a>

```java
public org.capnproto.Text.Reader getUri()
```

### hasModule() <a href="#hasmodule-8a9f381a7ff1" id="hasmodule-8a9f381a7ff1"></a>

```java
public boolean hasModule()
```

### hasPrefix() <a href="#hasprefix-ddbc3bbca9c3" id="hasprefix-ddbc3bbca9c3"></a>

```java
public boolean hasPrefix()
```

### hasRevision() <a href="#hasrevision-23a5e6a14bd8" id="hasrevision-23a5e6a14bd8"></a>

```java
public boolean hasRevision()
```

### hasRootNodes() <a href="#hasrootnodes-251070d577eb" id="hasrootnodes-251070d577eb"></a>

```java
public final boolean hasRootNodes()
```

### hasTypes() <a href="#hastypes-5c6311e6f402" id="hastypes-5c6311e6f402"></a>

```java
public final boolean hasTypes()
```

### hasUri() <a href="#hasuri-d455832c8996" id="hasuri-d455832c8996"></a>

```java
public boolean hasUri()
```
