# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder,com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-14351272b8c2)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getHid()](Builder.md#m-getHid-34aa6038c623) from Builder
- [getHns()](Builder.md#m-getHns-457afaf41ae6) from Builder
- [getQname()](Builder.md#m-getQname-022156d42738) from Builder
- [hasQname()](Builder.md#m-hasQname-3146e94ee2c2) from Builder
- [initQname(int)](Builder.md#m-initQname-070346dcfd2a) from Builder
- [setHid(int)](Builder.md#m-setHid-628b88f6c037) from Builder
- [setHns(int)](Builder.md#m-setHns-7405e78f40fe) from Builder
- [setQname(Reader)](Builder.md#m-setQname-5263707f5f9e) from Builder
- [setQname(String)](Builder.md#m-setQname-d55a4e375433) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-14351272b8c2" id="m-asReader-14351272b8c2"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder constructBuilder(
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

### constructReader(SegmentReader, int, int, int, short, int) <a href="#m-constructReader-fbce6f4f912a" id="m-constructReader-fbce6f4f912a"></a>

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

Types: [Reader](Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`

### structSize() <a href="#m-structSize-1fa68dcadd21" id="m-structSize-1fa68dcadd21"></a>

```java
public final org.capnproto.StructSize structSize()
```
