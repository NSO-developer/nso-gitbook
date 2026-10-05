# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#reader-cf5e962c3323)

**Methods**:

- [getModname()](#getmodname-40cd7f77aac9)
- [getNs()](#getns-59b97eae2a4a)
- [getNsHash()](#getnshash-f6f3e3ae1e6b)
- [getPrefix()](#getprefix-9268091e0223)
- [getXmlns()](#getxmlns-e2c0fd08466b)
- [hasModname()](#hasmodname-fdd47b76b94a)
- [hasNs()](#hasns-9cd343037be1)
- [hasPrefix()](#hasprefix-ddbc3bbca9c3)
- [hasXmlns()](#hasxmlns-3eb601ca5705)

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

### getModname() <a href="#getmodname-40cd7f77aac9" id="getmodname-40cd7f77aac9"></a>

```java
public org.capnproto.Text.Reader getModname()
```

### getNs() <a href="#getns-59b97eae2a4a" id="getns-59b97eae2a4a"></a>

```java
public org.capnproto.Text.Reader getNs()
```

### getNsHash() <a href="#getnshash-f6f3e3ae1e6b" id="getnshash-f6f3e3ae1e6b"></a>

```java
public final int getNsHash()
```

### getPrefix() <a href="#getprefix-9268091e0223" id="getprefix-9268091e0223"></a>

```java
public org.capnproto.Text.Reader getPrefix()
```

### getXmlns() <a href="#getxmlns-e2c0fd08466b" id="getxmlns-e2c0fd08466b"></a>

```java
public org.capnproto.Text.Reader getXmlns()
```

### hasModname() <a href="#hasmodname-fdd47b76b94a" id="hasmodname-fdd47b76b94a"></a>

```java
public boolean hasModname()
```

### hasNs() <a href="#hasns-9cd343037be1" id="hasns-9cd343037be1"></a>

```java
public boolean hasNs()
```

### hasPrefix() <a href="#hasprefix-ddbc3bbca9c3" id="hasprefix-ddbc3bbca9c3"></a>

```java
public boolean hasPrefix()
```

### hasXmlns() <a href="#hasxmlns-3eb601ca5705" id="hasxmlns-3eb601ca5705"></a>

```java
public boolean hasXmlns()
```
