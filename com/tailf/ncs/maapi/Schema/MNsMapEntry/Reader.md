<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getModname()](#m-getmodname-40cd7f77aac9)
- [getNs()](#m-getns-59b97eae2a4a)
- [getNsHash()](#m-getnshash-f6f3e3ae1e6b)
- [getPrefix()](#m-getprefix-9268091e0223)
- [getXmlns()](#m-getxmlns-e2c0fd08466b)
- [hasModname()](#m-hasmodname-fdd47b76b94a)
- [hasNs()](#m-hasns-9cd343037be1)
- [hasPrefix()](#m-hasprefix-ddbc3bbca9c3)
- [hasXmlns()](#m-hasxmlns-3eb601ca5705)

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

<a id="m-getmodname-40cd7f77aac9"></a>
### getModname()

```java
public org.capnproto.Text.Reader getModname()
```

<a id="m-getns-59b97eae2a4a"></a>
### getNs()

```java
public org.capnproto.Text.Reader getNs()
```

<a id="m-getnshash-f6f3e3ae1e6b"></a>
### getNsHash()

```java
public final int getNsHash()
```

<a id="m-getprefix-9268091e0223"></a>
### getPrefix()

```java
public org.capnproto.Text.Reader getPrefix()
```

<a id="m-getxmlns-e2c0fd08466b"></a>
### getXmlns()

```java
public org.capnproto.Text.Reader getXmlns()
```

<a id="m-hasmodname-fdd47b76b94a"></a>
### hasModname()

```java
public boolean hasModname()
```

<a id="m-hasns-9cd343037be1"></a>
### hasNs()

```java
public boolean hasNs()
```

<a id="m-hasprefix-ddbc3bbca9c3"></a>
### hasPrefix()

```java
public boolean hasPrefix()
```

<a id="m-hasxmlns-3eb601ca5705"></a>
### hasXmlns()

```java
public boolean hasXmlns()
```
