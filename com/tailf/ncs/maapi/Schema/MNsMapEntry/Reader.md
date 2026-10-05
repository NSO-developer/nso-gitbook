<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getModname()](#s-getModname)
- [getNs()](#s-getNs)
- [getNsHash()](#s-getNsHash)
- [getPrefix()](#s-getPrefix)
- [getXmlns()](#s-getXmlns)
- [hasModname()](#s-hasModname)
- [hasNs()](#s-hasNs)
- [hasPrefix()](#s-hasPrefix)
- [hasXmlns()](#s-hasXmlns)

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

<a id="s-getModname"></a>
### getModname()

```java
public org.capnproto.Text.Reader getModname()
```

<a id="s-getNs"></a>
### getNs()

```java
public org.capnproto.Text.Reader getNs()
```

<a id="s-getNsHash"></a>
### getNsHash()

```java
public final int getNsHash()
```

<a id="s-getPrefix"></a>
### getPrefix()

```java
public org.capnproto.Text.Reader getPrefix()
```

<a id="s-getXmlns"></a>
### getXmlns()

```java
public org.capnproto.Text.Reader getXmlns()
```

<a id="s-hasModname"></a>
### hasModname()

```java
public boolean hasModname()
```

<a id="s-hasNs"></a>
### hasNs()

```java
public boolean hasNs()
```

<a id="s-hasPrefix"></a>
### hasPrefix()

```java
public boolean hasPrefix()
```

<a id="s-hasXmlns"></a>
### hasXmlns()

```java
public boolean hasXmlns()
```
