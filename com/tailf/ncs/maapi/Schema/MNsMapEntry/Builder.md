<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getModname()](#m-getmodname-40cd7f77aac9)
- [getNs()](#m-getns-59b97eae2a4a)
- [getNsHash()](#m-getnshash-f6f3e3ae1e6b)
- [getPrefix()](#m-getprefix-9268091e0223)
- [getXmlns()](#m-getxmlns-e2c0fd08466b)
- [hasModname()](#m-hasmodname-fdd47b76b94a)
- [hasNs()](#m-hasns-9cd343037be1)
- [hasPrefix()](#m-hasprefix-ddbc3bbca9c3)
- [hasXmlns()](#m-hasxmlns-3eb601ca5705)
- [initModname(int)](#m-initmodname-adbe25a612a2)
- [initNs(int)](#m-initns-594e96675702)
- [initPrefix(int)](#m-initprefix-e25b609de101)
- [initXmlns(int)](#m-initxmlns-17805c1c0d5c)
- [setModname(Reader)](#m-setmodname-fe28ed5ab65b)
- [setModname(String)](#m-setmodname-885ff7e8e342)
- [setNs(Reader)](#m-setns-dcd01c91436e)
- [setNs(String)](#m-setns-510adfcd3e70)
- [setNsHash(int)](#m-setnshash-856e3c88b24a)
- [setPrefix(Reader)](#m-setprefix-5c58f0bf0784)
- [setPrefix(String)](#m-setprefix-63fe622cb50c)
- [setXmlns(Reader)](#m-setxmlns-333e49621e27)
- [setXmlns(String)](#m-setxmlns-8666c0c76ee9)

## Constructors

<a id="m-builder-179fba5038bd"></a>
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

<a id="m-asreader-b5c0f2a8d115"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getmodname-40cd7f77aac9"></a>
### getModname()

```java
public final org.capnproto.Text.Builder getModname()
```

<a id="m-getns-59b97eae2a4a"></a>
### getNs()

```java
public final org.capnproto.Text.Builder getNs()
```

<a id="m-getnshash-f6f3e3ae1e6b"></a>
### getNsHash()

```java
public final int getNsHash()
```

<a id="m-getprefix-9268091e0223"></a>
### getPrefix()

```java
public final org.capnproto.Text.Builder getPrefix()
```

<a id="m-getxmlns-e2c0fd08466b"></a>
### getXmlns()

```java
public final org.capnproto.Text.Builder getXmlns()
```

<a id="m-hasmodname-fdd47b76b94a"></a>
### hasModname()

```java
public final boolean hasModname()
```

<a id="m-hasns-9cd343037be1"></a>
### hasNs()

```java
public final boolean hasNs()
```

<a id="m-hasprefix-ddbc3bbca9c3"></a>
### hasPrefix()

```java
public final boolean hasPrefix()
```

<a id="m-hasxmlns-3eb601ca5705"></a>
### hasXmlns()

```java
public final boolean hasXmlns()
```

<a id="m-initmodname-adbe25a612a2"></a>
### initModname(int)

```java
public final org.capnproto.Text.Builder initModname(int size)
```

**Parameters**

- `int size`

<a id="m-initns-594e96675702"></a>
### initNs(int)

```java
public final org.capnproto.Text.Builder initNs(int size)
```

**Parameters**

- `int size`

<a id="m-initprefix-e25b609de101"></a>
### initPrefix(int)

```java
public final org.capnproto.Text.Builder initPrefix(int size)
```

**Parameters**

- `int size`

<a id="m-initxmlns-17805c1c0d5c"></a>
### initXmlns(int)

```java
public final org.capnproto.Text.Builder initXmlns(int size)
```

**Parameters**

- `int size`

<a id="m-setmodname-fe28ed5ab65b"></a>
### setModname(Reader)

```java
public final void setModname(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="m-setmodname-885ff7e8e342"></a>
### setModname(String)

```java
public final void setModname(String value)
```

**Parameters**

- `String value`

<a id="m-setns-dcd01c91436e"></a>
### setNs(Reader)

```java
public final void setNs(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="m-setns-510adfcd3e70"></a>
### setNs(String)

```java
public final void setNs(String value)
```

**Parameters**

- `String value`

<a id="m-setnshash-856e3c88b24a"></a>
### setNsHash(int)

```java
public final void setNsHash(int value)
```

**Parameters**

- `int value`

<a id="m-setprefix-5c58f0bf0784"></a>
### setPrefix(Reader)

```java
public final void setPrefix(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="m-setprefix-63fe622cb50c"></a>
### setPrefix(String)

```java
public final void setPrefix(String value)
```

**Parameters**

- `String value`

<a id="m-setxmlns-333e49621e27"></a>
### setXmlns(Reader)

```java
public final void setXmlns(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="m-setxmlns-8666c0c76ee9"></a>
### setXmlns(String)

```java
public final void setXmlns(String value)
```

**Parameters**

- `String value`
