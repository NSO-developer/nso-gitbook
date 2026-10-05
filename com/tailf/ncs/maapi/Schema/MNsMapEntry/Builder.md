<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getModname()](#s-getModname)
- [getNs()](#s-getNs)
- [getNsHash()](#s-getNsHash)
- [getPrefix()](#s-getPrefix)
- [getXmlns()](#s-getXmlns)
- [hasModname()](#s-hasModname)
- [hasNs()](#s-hasNs)
- [hasPrefix()](#s-hasPrefix)
- [hasXmlns()](#s-hasXmlns)
- [initModname(int)](#s-initModname)
- [initNs(int)](#s-initNs)
- [initPrefix(int)](#s-initPrefix)
- [initXmlns(int)](#s-initXmlns)
- [setModname(Reader)](#s-setModname)
- [setModname(String)](#s-setModname-1)
- [setNs(Reader)](#s-setNs)
- [setNs(String)](#s-setNs-1)
- [setNsHash(int)](#s-setNsHash)
- [setPrefix(Reader)](#s-setPrefix)
- [setPrefix(String)](#s-setPrefix-1)
- [setXmlns(Reader)](#s-setXmlns)
- [setXmlns(String)](#s-setXmlns-1)

## Constructors

<a id="s-Builder-1"></a>
### Builder(SegmentBuilder, int, int, int, short)

**Package-private**

```java
Builder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`


## Methods

<a id="s-asReader"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getModname"></a>
### getModname()

```java
public final org.capnproto.Text.Builder getModname()
```

<a id="s-getNs"></a>
### getNs()

```java
public final org.capnproto.Text.Builder getNs()
```

<a id="s-getNsHash"></a>
### getNsHash()

```java
public final int getNsHash()
```

<a id="s-getPrefix"></a>
### getPrefix()

```java
public final org.capnproto.Text.Builder getPrefix()
```

<a id="s-getXmlns"></a>
### getXmlns()

```java
public final org.capnproto.Text.Builder getXmlns()
```

<a id="s-hasModname"></a>
### hasModname()

```java
public final boolean hasModname()
```

<a id="s-hasNs"></a>
### hasNs()

```java
public final boolean hasNs()
```

<a id="s-hasPrefix"></a>
### hasPrefix()

```java
public final boolean hasPrefix()
```

<a id="s-hasXmlns"></a>
### hasXmlns()

```java
public final boolean hasXmlns()
```

<a id="s-initModname"></a>
### initModname(int)

```java
public final org.capnproto.Text.Builder initModname(int size)
```

**Parameters**

- `int size`

<a id="s-initNs"></a>
### initNs(int)

```java
public final org.capnproto.Text.Builder initNs(int size)
```

**Parameters**

- `int size`

<a id="s-initPrefix"></a>
### initPrefix(int)

```java
public final org.capnproto.Text.Builder initPrefix(int size)
```

**Parameters**

- `int size`

<a id="s-initXmlns"></a>
### initXmlns(int)

```java
public final org.capnproto.Text.Builder initXmlns(int size)
```

**Parameters**

- `int size`

<a id="s-setModname"></a>
### setModname(Reader)

```java
public final void setModname(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="s-setModname-1"></a>
### setModname(String)

```java
public final void setModname(String value)
```

**Parameters**

- `String value`

<a id="s-setNs"></a>
### setNs(Reader)

```java
public final void setNs(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="s-setNs-1"></a>
### setNs(String)

```java
public final void setNs(String value)
```

**Parameters**

- `String value`

<a id="s-setNsHash"></a>
### setNsHash(int)

```java
public final void setNsHash(int value)
```

**Parameters**

- `int value`

<a id="s-setPrefix"></a>
### setPrefix(Reader)

```java
public final void setPrefix(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="s-setPrefix-1"></a>
### setPrefix(String)

```java
public final void setPrefix(String value)
```

**Parameters**

- `String value`

<a id="s-setXmlns"></a>
### setXmlns(Reader)

```java
public final void setXmlns(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="s-setXmlns-1"></a>
### setXmlns(String)

```java
public final void setXmlns(String value)
```

**Parameters**

- `String value`
