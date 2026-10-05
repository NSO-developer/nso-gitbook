# Factory <a href="#factory-1787784624e8" id="factory-1787784624e8"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder,com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader>
```

Types: [Builder](Builder.md#builder-21f09e83781d), [Reader](Reader.md#reader-b2467a96ddff)

## Members

**Constructors**:

- [Factory()](#factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#asreader-14351272b8c2)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#constructreader-fbce6f4f912a)
- [getHid()](Builder.md#gethid-34aa6038c623) from Builder
- [getHns()](Builder.md#gethns-457afaf41ae6) from Builder
- [getQname()](Builder.md#getqname-022156d42738) from Builder
- [hasQname()](Builder.md#hasqname-3146e94ee2c2) from Builder
- [initQname(int)](Builder.md#initqname-070346dcfd2a) from Builder
- [setHid(int)](Builder.md#sethid-628b88f6c037) from Builder
- [setHns(int)](Builder.md#sethns-7405e78f40fe) from Builder
- [setQname(Reader)](Builder.md#setqname-5263707f5f9e) from Builder
- [setQname(String)](Builder.md#setqname-d55a4e375433) from Builder
- [structSize()](#structsize-1fa68dcadd21)

## Constructors

### Factory() <a href="#factory-0e9f9d7f4e84" id="factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#asreader-14351272b8c2" id="asreader-14351272b8c2"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder builder
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff), [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#constructbuilder-5a2abf3209f9" id="constructbuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader constructReader(
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
