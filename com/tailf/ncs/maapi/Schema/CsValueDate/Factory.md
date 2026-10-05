# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDate.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueDate.Builder,com.tailf.ncs.maapi.Schema.CsValueDate.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-ca134a2a5b60)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getDay()](Builder.md#m-getDay-3b07996cd5f6) from Builder
- [getMonth()](Builder.md#m-getMonth-3813513d5069) from Builder
- [getTimezone()](Builder.md#m-getTimezone-9573790f24e6) from Builder
- [getTimezoneMinutes()](Builder.md#m-getTimezoneMinutes-b20d3de8d152) from Builder
- [getYear()](Builder.md#m-getYear-584af4457cda) from Builder
- [setDay(byte)](Builder.md#m-setDay-2c873a29eed0) from Builder
- [setMonth(byte)](Builder.md#m-setMonth-b56a6d48db74) from Builder
- [setTimezone(byte)](Builder.md#m-setTimezone-c58c111fac16) from Builder
- [setTimezoneMinutes(byte)](Builder.md#m-setTimezoneMinutes-69e0ed31afd1) from Builder
- [setYear(short)](Builder.md#m-setYear-ecdf80e7189d) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-ca134a2a5b60" id="m-asReader-ca134a2a5b60"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDate.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueDate.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDate.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDate.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsValueDate.Reader constructReader(
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
