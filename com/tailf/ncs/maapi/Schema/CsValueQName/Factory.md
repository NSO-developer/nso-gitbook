<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueQName.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueQName.Builder,com.tailf.ncs.maapi.Schema.CsValueQName.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-9c5174106110)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getName()](Builder.md#m-getname-2634b18b4a25) from Builder
- [getPrefix()](Builder.md#m-getprefix-9268091e0223) from Builder
- [hasName()](Builder.md#m-hasname-bfe6c334e0d1) from Builder
- [hasPrefix()](Builder.md#m-hasprefix-ddbc3bbca9c3) from Builder
- [initName(int)](Builder.md#m-initname-281e5d2102d4) from Builder
- [initPrefix(int)](Builder.md#m-initprefix-e25b609de101) from Builder
- [setName(Reader)](Builder.md#m-setname-79f9d1263a41) from Builder
- [setName(String)](Builder.md#m-setname-c76ccfcb9f18) from Builder
- [setPrefix(Reader)](Builder.md#m-setprefix-5c58f0bf0784) from Builder
- [setPrefix(String)](Builder.md#m-setprefix-63fe622cb50c) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-9c5174106110"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.CsValueQName.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueQName.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueQName.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

```java
public final com.tailf.ncs.maapi.Schema.CsValueQName.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsValueQName.Reader constructReader(
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
