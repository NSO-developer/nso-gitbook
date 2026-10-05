# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueQName.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getName()](#m-getName-2634b18b4a25)
- [getPrefix()](#m-getPrefix-9268091e0223)
- [hasName()](#m-hasName-bfe6c334e0d1)
- [hasPrefix()](#m-hasPrefix-ddbc3bbca9c3)

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

### getName() <a href="#m-getName-2634b18b4a25" id="m-getName-2634b18b4a25"></a>

```java
public org.capnproto.Text.Reader getName()
```

### getPrefix() <a href="#m-getPrefix-9268091e0223" id="m-getPrefix-9268091e0223"></a>

```java
public org.capnproto.Text.Reader getPrefix()
```

### hasName() <a href="#m-hasName-bfe6c334e0d1" id="m-hasName-bfe6c334e0d1"></a>

```java
public boolean hasName()
```

### hasPrefix() <a href="#m-hasPrefix-ddbc3bbca9c3" id="m-hasPrefix-ddbc3bbca9c3"></a>

```java
public boolean hasPrefix()
```
