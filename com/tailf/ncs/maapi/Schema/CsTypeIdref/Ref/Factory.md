<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder,com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-14351272b8c2)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getHid()](Builder.md#m-gethid-34aa6038c623) from Builder
- [getHns()](Builder.md#m-gethns-457afaf41ae6) from Builder
- [getQname()](Builder.md#m-getqname-022156d42738) from Builder
- [hasQname()](Builder.md#m-hasqname-3146e94ee2c2) from Builder
- [initQname(int)](Builder.md#m-initqname-070346dcfd2a) from Builder
- [setHid(int)](Builder.md#m-sethid-628b88f6c037) from Builder
- [setHns(int)](Builder.md#m-sethns-7405e78f40fe) from Builder
- [setQname(Reader)](Builder.md#m-setqname-5263707f5f9e) from Builder
- [setQname(String)](Builder.md#m-setqname-d55a4e375433) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-14351272b8c2"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

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

<a id="m-constructreader-fbce6f4f912a"></a>
### constructReader(SegmentReader, int, int, int, short, int)

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

<a id="m-structsize-1fa68dcadd21"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
