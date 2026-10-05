# Factory <a href="#factory-1787784624e8" id="factory-1787784624e8"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueQName.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueQName.Builder,com.tailf.ncs.maapi.Schema.CsValueQName.Reader>
```

Types: [Builder](Builder.md#builder-21f09e83781d), [Reader](Reader.md#reader-b2467a96ddff)

## Members

**Constructors**:

- [Factory()](#factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#asreader-9c5174106110)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#constructreader-fbce6f4f912a)
- [getName()](Builder.md#getname-2634b18b4a25) from Builder
- [getPrefix()](Builder.md#getprefix-9268091e0223) from Builder
- [hasName()](Builder.md#hasname-bfe6c334e0d1) from Builder
- [hasPrefix()](Builder.md#hasprefix-ddbc3bbca9c3) from Builder
- [initName(int)](Builder.md#initname-281e5d2102d4) from Builder
- [initPrefix(int)](Builder.md#initprefix-e25b609de101) from Builder
- [setName(Reader)](Builder.md#setname-79f9d1263a41) from Builder
- [setName(String)](Builder.md#setname-c76ccfcb9f18) from Builder
- [setPrefix(Reader)](Builder.md#setprefix-5c58f0bf0784) from Builder
- [setPrefix(String)](Builder.md#setprefix-63fe622cb50c) from Builder
- [structSize()](#structsize-1fa68dcadd21)

## Constructors

### Factory() <a href="#factory-0e9f9d7f4e84" id="factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#asreader-9c5174106110" id="asreader-9c5174106110"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueQName.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueQName.Builder builder
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff), [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueQName.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#constructbuilder-5a2abf3209f9" id="constructbuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueQName.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsValueQName.Reader constructReader(
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
