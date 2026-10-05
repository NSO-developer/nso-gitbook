# Factory <a href="#factory-1787784624e8" id="factory-1787784624e8"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMapEntry.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder,com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader>
```

Types: [Builder](Builder.md#builder-21f09e83781d), [Reader](Reader.md#reader-b2467a96ddff)

## Members

**Constructors**:

- [Factory()](#factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#asreader-4e0a650997b2)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#constructreader-fbce6f4f912a)
- [getModname()](Builder.md#getmodname-40cd7f77aac9) from Builder
- [getNs()](Builder.md#getns-59b97eae2a4a) from Builder
- [getNsHash()](Builder.md#getnshash-f6f3e3ae1e6b) from Builder
- [getPrefix()](Builder.md#getprefix-9268091e0223) from Builder
- [getXmlns()](Builder.md#getxmlns-e2c0fd08466b) from Builder
- [hasModname()](Builder.md#hasmodname-fdd47b76b94a) from Builder
- [hasNs()](Builder.md#hasns-9cd343037be1) from Builder
- [hasPrefix()](Builder.md#hasprefix-ddbc3bbca9c3) from Builder
- [hasXmlns()](Builder.md#hasxmlns-3eb601ca5705) from Builder
- [initModname(int)](Builder.md#initmodname-adbe25a612a2) from Builder
- [initNs(int)](Builder.md#initns-594e96675702) from Builder
- [initPrefix(int)](Builder.md#initprefix-e25b609de101) from Builder
- [initXmlns(int)](Builder.md#initxmlns-17805c1c0d5c) from Builder
- [setModname(Reader)](Builder.md#setmodname-fe28ed5ab65b) from Builder
- [setModname(String)](Builder.md#setmodname-885ff7e8e342) from Builder
- [setNs(Reader)](Builder.md#setns-dcd01c91436e) from Builder
- [setNs(String)](Builder.md#setns-510adfcd3e70) from Builder
- [setNsHash(int)](Builder.md#setnshash-856e3c88b24a) from Builder
- [setPrefix(Reader)](Builder.md#setprefix-5c58f0bf0784) from Builder
- [setPrefix(String)](Builder.md#setprefix-63fe622cb50c) from Builder
- [setXmlns(Reader)](Builder.md#setxmlns-333e49621e27) from Builder
- [setXmlns(String)](Builder.md#setxmlns-8666c0c76ee9) from Builder
- [structSize()](#structsize-1fa68dcadd21)

## Constructors

### Factory() <a href="#factory-0e9f9d7f4e84" id="factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#asreader-4e0a650997b2" id="asreader-4e0a650997b2"></a>

```java
public final com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader asReader(
    com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder builder
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff), [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#constructbuilder-5a2abf3209f9" id="constructbuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder constructBuilder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

Types: [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`

### constructReader(SegmentReader, int, int, int, short, int) <a href="#constructreader-fbce6f4f912a" id="constructreader-fbce6f4f912a"></a>

```java
public final com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader constructReader(
    org.capnproto.SegmentReader segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount,
    int nestingLimit
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`

### structSize() <a href="#structsize-1fa68dcadd21" id="structsize-1fa68dcadd21"></a>

```java
public final org.capnproto.StructSize structSize()
```
