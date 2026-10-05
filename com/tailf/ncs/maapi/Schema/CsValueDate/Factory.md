<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDate.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueDate.Builder,com.tailf.ncs.maapi.Schema.CsValueDate.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-ca134a2a5b60)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getDay()](Builder.md#m-getday-3b07996cd5f6) from Builder
- [getMonth()](Builder.md#m-getmonth-3813513d5069) from Builder
- [getTimezone()](Builder.md#m-gettimezone-9573790f24e6) from Builder
- [getTimezoneMinutes()](Builder.md#m-gettimezoneminutes-b20d3de8d152) from Builder
- [getYear()](Builder.md#m-getyear-584af4457cda) from Builder
- [setDay(byte)](Builder.md#m-setday-2c873a29eed0) from Builder
- [setMonth(byte)](Builder.md#m-setmonth-b56a6d48db74) from Builder
- [setTimezone(byte)](Builder.md#m-settimezone-c58c111fac16) from Builder
- [setTimezoneMinutes(byte)](Builder.md#m-settimezoneminutes-69e0ed31afd1) from Builder
- [setYear(short)](Builder.md#m-setyear-ecdf80e7189d) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-ca134a2a5b60"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.CsValueDate.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueDate.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDate.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

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

<a id="m-constructreader-fbce6f4f912a"></a>
### constructReader(SegmentReader, int, int, int, short, int)

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

<a id="m-structsize-1fa68dcadd21"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
