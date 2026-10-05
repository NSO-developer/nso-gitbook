<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Prompt.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.Cs.Prompt.Builder,com.tailf.ncs.maapi.Schema.Cs.Prompt.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-bedb68fbcbe4)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getNone()](Builder.md#m-getnone-e31bfdbffa7f) from Builder
- [getValue()](Builder.md#m-getvalue-d93864668c40) from Builder
- [hasValue()](Builder.md#m-hasvalue-dad92e423e7a) from Builder
- [initValue(int)](Builder.md#m-initvalue-a117f5eca48d) from Builder
- [isNone()](Builder.md#m-isnone-e8a993ad0453) from Builder
- [isValue()](Builder.md#m-isvalue-7280ea8211f4) from Builder
- [setNone(Void)](Builder.md#m-setnone-46764db867d5) from Builder
- [setValue(Reader)](Builder.md#m-setvalue-6784c0d559f7) from Builder
- [setValue(String)](Builder.md#m-setvalue-90771990f0a6) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)
- [which()](Builder.md#m-which-0b2d23db5ed0) from Builder

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-bedb68fbcbe4"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.Cs.Prompt.Reader asReader(
    com.tailf.ncs.maapi.Schema.Cs.Prompt.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.Cs.Prompt.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

```java
public final com.tailf.ncs.maapi.Schema.Cs.Prompt.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.Cs.Prompt.Reader constructReader(
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
