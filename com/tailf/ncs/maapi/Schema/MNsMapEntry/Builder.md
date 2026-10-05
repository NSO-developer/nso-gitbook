# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#builder-179fba5038bd)

**Methods**:

- [asReader()](#asreader-b5c0f2a8d115)
- [getModname()](#getmodname-40cd7f77aac9)
- [getNs()](#getns-59b97eae2a4a)
- [getNsHash()](#getnshash-f6f3e3ae1e6b)
- [getPrefix()](#getprefix-9268091e0223)
- [getXmlns()](#getxmlns-e2c0fd08466b)
- [hasModname()](#hasmodname-fdd47b76b94a)
- [hasNs()](#hasns-9cd343037be1)
- [hasPrefix()](#hasprefix-ddbc3bbca9c3)
- [hasXmlns()](#hasxmlns-3eb601ca5705)
- [initModname(int)](#initmodname-adbe25a612a2)
- [initNs(int)](#initns-594e96675702)
- [initPrefix(int)](#initprefix-e25b609de101)
- [initXmlns(int)](#initxmlns-17805c1c0d5c)
- [setModname(Reader)](#setmodname-fe28ed5ab65b)
- [setModname(String)](#setmodname-885ff7e8e342)
- [setNs(Reader)](#setns-dcd01c91436e)
- [setNs(String)](#setns-510adfcd3e70)
- [setNsHash(int)](#setnshash-856e3c88b24a)
- [setPrefix(Reader)](#setprefix-5c58f0bf0784)
- [setPrefix(String)](#setprefix-63fe622cb50c)
- [setXmlns(Reader)](#setxmlns-333e49621e27)
- [setXmlns(String)](#setxmlns-8666c0c76ee9)

## Constructors

### Builder(SegmentBuilder, int, int, int, short) <a href="#builder-179fba5038bd" id="builder-179fba5038bd"></a>

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

### asReader() <a href="#asreader-b5c0f2a8d115" id="asreader-b5c0f2a8d115"></a>

```java
public final com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getModname() <a href="#getmodname-40cd7f77aac9" id="getmodname-40cd7f77aac9"></a>

```java
public final org.capnproto.Text.Builder getModname()
```

### getNs() <a href="#getns-59b97eae2a4a" id="getns-59b97eae2a4a"></a>

```java
public final org.capnproto.Text.Builder getNs()
```

### getNsHash() <a href="#getnshash-f6f3e3ae1e6b" id="getnshash-f6f3e3ae1e6b"></a>

```java
public final int getNsHash()
```

### getPrefix() <a href="#getprefix-9268091e0223" id="getprefix-9268091e0223"></a>

```java
public final org.capnproto.Text.Builder getPrefix()
```

### getXmlns() <a href="#getxmlns-e2c0fd08466b" id="getxmlns-e2c0fd08466b"></a>

```java
public final org.capnproto.Text.Builder getXmlns()
```

### hasModname() <a href="#hasmodname-fdd47b76b94a" id="hasmodname-fdd47b76b94a"></a>

```java
public final boolean hasModname()
```

### hasNs() <a href="#hasns-9cd343037be1" id="hasns-9cd343037be1"></a>

```java
public final boolean hasNs()
```

### hasPrefix() <a href="#hasprefix-ddbc3bbca9c3" id="hasprefix-ddbc3bbca9c3"></a>

```java
public final boolean hasPrefix()
```

### hasXmlns() <a href="#hasxmlns-3eb601ca5705" id="hasxmlns-3eb601ca5705"></a>

```java
public final boolean hasXmlns()
```

### initModname(int) <a href="#initmodname-adbe25a612a2" id="initmodname-adbe25a612a2"></a>

```java
public final org.capnproto.Text.Builder initModname(int size)
```

**Parameters**

- `int size`

### initNs(int) <a href="#initns-594e96675702" id="initns-594e96675702"></a>

```java
public final org.capnproto.Text.Builder initNs(int size)
```

**Parameters**

- `int size`

### initPrefix(int) <a href="#initprefix-e25b609de101" id="initprefix-e25b609de101"></a>

```java
public final org.capnproto.Text.Builder initPrefix(int size)
```

**Parameters**

- `int size`

### initXmlns(int) <a href="#initxmlns-17805c1c0d5c" id="initxmlns-17805c1c0d5c"></a>

```java
public final org.capnproto.Text.Builder initXmlns(int size)
```

**Parameters**

- `int size`

### setModname(Reader) <a href="#setmodname-fe28ed5ab65b" id="setmodname-fe28ed5ab65b"></a>

```java
public final void setModname(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setModname(String) <a href="#setmodname-885ff7e8e342" id="setmodname-885ff7e8e342"></a>

```java
public final void setModname(String value)
```

**Parameters**

- `String value`

### setNs(Reader) <a href="#setns-dcd01c91436e" id="setns-dcd01c91436e"></a>

```java
public final void setNs(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setNs(String) <a href="#setns-510adfcd3e70" id="setns-510adfcd3e70"></a>

```java
public final void setNs(String value)
```

**Parameters**

- `String value`

### setNsHash(int) <a href="#setnshash-856e3c88b24a" id="setnshash-856e3c88b24a"></a>

```java
public final void setNsHash(int value)
```

**Parameters**

- `int value`

### setPrefix(Reader) <a href="#setprefix-5c58f0bf0784" id="setprefix-5c58f0bf0784"></a>

```java
public final void setPrefix(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setPrefix(String) <a href="#setprefix-63fe622cb50c" id="setprefix-63fe622cb50c"></a>

```java
public final void setPrefix(String value)
```

**Parameters**

- `String value`

### setXmlns(Reader) <a href="#setxmlns-333e49621e27" id="setxmlns-333e49621e27"></a>

```java
public final void setXmlns(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setXmlns(String) <a href="#setxmlns-8666c0c76ee9" id="setxmlns-8666c0c76ee9"></a>

```java
public final void setXmlns(String value)
```

**Parameters**

- `String value`
