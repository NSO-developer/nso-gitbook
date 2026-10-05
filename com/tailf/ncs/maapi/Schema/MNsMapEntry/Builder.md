# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getModname()](#m-getModname-40cd7f77aac9)
- [getNs()](#m-getNs-59b97eae2a4a)
- [getNsHash()](#m-getNsHash-f6f3e3ae1e6b)
- [getPrefix()](#m-getPrefix-9268091e0223)
- [getXmlns()](#m-getXmlns-e2c0fd08466b)
- [hasModname()](#m-hasModname-fdd47b76b94a)
- [hasNs()](#m-hasNs-9cd343037be1)
- [hasPrefix()](#m-hasPrefix-ddbc3bbca9c3)
- [hasXmlns()](#m-hasXmlns-3eb601ca5705)
- [initModname(int)](#m-initModname-adbe25a612a2)
- [initNs(int)](#m-initNs-594e96675702)
- [initPrefix(int)](#m-initPrefix-e25b609de101)
- [initXmlns(int)](#m-initXmlns-17805c1c0d5c)
- [setModname(Reader)](#m-setModname-fe28ed5ab65b)
- [setModname(String)](#m-setModname-885ff7e8e342)
- [setNs(Reader)](#m-setNs-dcd01c91436e)
- [setNs(String)](#m-setNs-510adfcd3e70)
- [setNsHash(int)](#m-setNsHash-856e3c88b24a)
- [setPrefix(Reader)](#m-setPrefix-5c58f0bf0784)
- [setPrefix(String)](#m-setPrefix-63fe622cb50c)
- [setXmlns(Reader)](#m-setXmlns-333e49621e27)
- [setXmlns(String)](#m-setXmlns-8666c0c76ee9)

## Constructors

### Builder(SegmentBuilder, int, int, int, short) <a href="#m-Builder-179fba5038bd" id="m-Builder-179fba5038bd"></a>

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

### asReader() <a href="#m-asReader-b5c0f2a8d115" id="m-asReader-b5c0f2a8d115"></a>

```java
public final com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getModname() <a href="#m-getModname-40cd7f77aac9" id="m-getModname-40cd7f77aac9"></a>

```java
public final org.capnproto.Text.Builder getModname()
```

### getNs() <a href="#m-getNs-59b97eae2a4a" id="m-getNs-59b97eae2a4a"></a>

```java
public final org.capnproto.Text.Builder getNs()
```

### getNsHash() <a href="#m-getNsHash-f6f3e3ae1e6b" id="m-getNsHash-f6f3e3ae1e6b"></a>

```java
public final int getNsHash()
```

### getPrefix() <a href="#m-getPrefix-9268091e0223" id="m-getPrefix-9268091e0223"></a>

```java
public final org.capnproto.Text.Builder getPrefix()
```

### getXmlns() <a href="#m-getXmlns-e2c0fd08466b" id="m-getXmlns-e2c0fd08466b"></a>

```java
public final org.capnproto.Text.Builder getXmlns()
```

### hasModname() <a href="#m-hasModname-fdd47b76b94a" id="m-hasModname-fdd47b76b94a"></a>

```java
public final boolean hasModname()
```

### hasNs() <a href="#m-hasNs-9cd343037be1" id="m-hasNs-9cd343037be1"></a>

```java
public final boolean hasNs()
```

### hasPrefix() <a href="#m-hasPrefix-ddbc3bbca9c3" id="m-hasPrefix-ddbc3bbca9c3"></a>

```java
public final boolean hasPrefix()
```

### hasXmlns() <a href="#m-hasXmlns-3eb601ca5705" id="m-hasXmlns-3eb601ca5705"></a>

```java
public final boolean hasXmlns()
```

### initModname(int) <a href="#m-initModname-adbe25a612a2" id="m-initModname-adbe25a612a2"></a>

```java
public final org.capnproto.Text.Builder initModname(int size)
```

**Parameters**

- `int size`

### initNs(int) <a href="#m-initNs-594e96675702" id="m-initNs-594e96675702"></a>

```java
public final org.capnproto.Text.Builder initNs(int size)
```

**Parameters**

- `int size`

### initPrefix(int) <a href="#m-initPrefix-e25b609de101" id="m-initPrefix-e25b609de101"></a>

```java
public final org.capnproto.Text.Builder initPrefix(int size)
```

**Parameters**

- `int size`

### initXmlns(int) <a href="#m-initXmlns-17805c1c0d5c" id="m-initXmlns-17805c1c0d5c"></a>

```java
public final org.capnproto.Text.Builder initXmlns(int size)
```

**Parameters**

- `int size`

### setModname(Reader) <a href="#m-setModname-fe28ed5ab65b" id="m-setModname-fe28ed5ab65b"></a>

```java
public final void setModname(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setModname(String) <a href="#m-setModname-885ff7e8e342" id="m-setModname-885ff7e8e342"></a>

```java
public final void setModname(String value)
```

**Parameters**

- `String value`

### setNs(Reader) <a href="#m-setNs-dcd01c91436e" id="m-setNs-dcd01c91436e"></a>

```java
public final void setNs(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setNs(String) <a href="#m-setNs-510adfcd3e70" id="m-setNs-510adfcd3e70"></a>

```java
public final void setNs(String value)
```

**Parameters**

- `String value`

### setNsHash(int) <a href="#m-setNsHash-856e3c88b24a" id="m-setNsHash-856e3c88b24a"></a>

```java
public final void setNsHash(int value)
```

**Parameters**

- `int value`

### setPrefix(Reader) <a href="#m-setPrefix-5c58f0bf0784" id="m-setPrefix-5c58f0bf0784"></a>

```java
public final void setPrefix(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setPrefix(String) <a href="#m-setPrefix-63fe622cb50c" id="m-setPrefix-63fe622cb50c"></a>

```java
public final void setPrefix(String value)
```

**Parameters**

- `String value`

### setXmlns(Reader) <a href="#m-setXmlns-333e49621e27" id="m-setXmlns-333e49621e27"></a>

```java
public final void setXmlns(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setXmlns(String) <a href="#m-setXmlns-8666c0c76ee9" id="m-setXmlns-8666c0c76ee9"></a>

```java
public final void setXmlns(String value)
```

**Parameters**

- `String value`
