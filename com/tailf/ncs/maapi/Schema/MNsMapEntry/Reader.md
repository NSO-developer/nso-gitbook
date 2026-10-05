# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getModname()](#m-getModname-40cd7f77aac9)
- [getNs()](#m-getNs-59b97eae2a4a)
- [getNsHash()](#m-getNsHash-f6f3e3ae1e6b)
- [getPrefix()](#m-getPrefix-9268091e0223)
- [getXmlns()](#m-getXmlns-e2c0fd08466b)
- [hasModname()](#m-hasModname-fdd47b76b94a)
- [hasNs()](#m-hasNs-9cd343037be1)
- [hasPrefix()](#m-hasPrefix-ddbc3bbca9c3)
- [hasXmlns()](#m-hasXmlns-3eb601ca5705)

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

### getModname() <a href="#m-getModname-40cd7f77aac9" id="m-getModname-40cd7f77aac9"></a>

```java
public org.capnproto.Text.Reader getModname()
```

### getNs() <a href="#m-getNs-59b97eae2a4a" id="m-getNs-59b97eae2a4a"></a>

```java
public org.capnproto.Text.Reader getNs()
```

### getNsHash() <a href="#m-getNsHash-f6f3e3ae1e6b" id="m-getNsHash-f6f3e3ae1e6b"></a>

```java
public final int getNsHash()
```

### getPrefix() <a href="#m-getPrefix-9268091e0223" id="m-getPrefix-9268091e0223"></a>

```java
public org.capnproto.Text.Reader getPrefix()
```

### getXmlns() <a href="#m-getXmlns-e2c0fd08466b" id="m-getXmlns-e2c0fd08466b"></a>

```java
public org.capnproto.Text.Reader getXmlns()
```

### hasModname() <a href="#m-hasModname-fdd47b76b94a" id="m-hasModname-fdd47b76b94a"></a>

```java
public boolean hasModname()
```

### hasNs() <a href="#m-hasNs-9cd343037be1" id="m-hasNs-9cd343037be1"></a>

```java
public boolean hasNs()
```

### hasPrefix() <a href="#m-hasPrefix-ddbc3bbca9c3" id="m-hasPrefix-ddbc3bbca9c3"></a>

```java
public boolean hasPrefix()
```

### hasXmlns() <a href="#m-hasXmlns-3eb601ca5705" id="m-hasXmlns-3eb601ca5705"></a>

```java
public boolean hasXmlns()
```
