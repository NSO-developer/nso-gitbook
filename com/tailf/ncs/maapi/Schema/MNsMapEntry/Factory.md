<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMapEntry.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder,com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-4e0a650997b2)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getModname()](Builder.md#m-getmodname-40cd7f77aac9) from Builder
- [getNs()](Builder.md#m-getns-59b97eae2a4a) from Builder
- [getNsHash()](Builder.md#m-getnshash-f6f3e3ae1e6b) from Builder
- [getPrefix()](Builder.md#m-getprefix-9268091e0223) from Builder
- [getXmlns()](Builder.md#m-getxmlns-e2c0fd08466b) from Builder
- [hasModname()](Builder.md#m-hasmodname-fdd47b76b94a) from Builder
- [hasNs()](Builder.md#m-hasns-9cd343037be1) from Builder
- [hasPrefix()](Builder.md#m-hasprefix-ddbc3bbca9c3) from Builder
- [hasXmlns()](Builder.md#m-hasxmlns-3eb601ca5705) from Builder
- [initModname(int)](Builder.md#m-initmodname-adbe25a612a2) from Builder
- [initNs(int)](Builder.md#m-initns-594e96675702) from Builder
- [initPrefix(int)](Builder.md#m-initprefix-e25b609de101) from Builder
- [initXmlns(int)](Builder.md#m-initxmlns-17805c1c0d5c) from Builder
- [setModname(Reader)](Builder.md#m-setmodname-fe28ed5ab65b) from Builder
- [setModname(String)](Builder.md#m-setmodname-885ff7e8e342) from Builder
- [setNs(Reader)](Builder.md#m-setns-dcd01c91436e) from Builder
- [setNs(String)](Builder.md#m-setns-510adfcd3e70) from Builder
- [setNsHash(int)](Builder.md#m-setnshash-856e3c88b24a) from Builder
- [setPrefix(Reader)](Builder.md#m-setprefix-5c58f0bf0784) from Builder
- [setPrefix(String)](Builder.md#m-setprefix-63fe622cb50c) from Builder
- [setXmlns(Reader)](Builder.md#m-setxmlns-333e49621e27) from Builder
- [setXmlns(String)](Builder.md#m-setxmlns-8666c0c76ee9) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-4e0a650997b2"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader asReader(
    com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

```java
public final com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder constructBuilder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

Types: [Builder](Builder.md#cls-Builder)

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`

<a id="m-constructreader-fbce6f4f912a"></a>
### constructReader(SegmentReader, int, int, int, short, int)

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

Types: [Reader](Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`

<a id="m-structsize-1fa68dcadd21"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
