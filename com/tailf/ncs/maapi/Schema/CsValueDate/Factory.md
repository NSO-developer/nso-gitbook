<a id="s-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDate.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueDate.Builder,com.tailf.ncs.maapi.Schema.CsValueDate.Reader>
```

Types: [Builder](Builder.md#s-Builder), [Reader](Reader.md#s-Reader)

## Members

**Constructors**:

- [Factory()](#s-Factory-1)

**Methods**:

- [asReader()](Builder.md#s-asReader) from Builder
- [asReader(Builder)](#s-asReader)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#s-constructBuilder)
- [constructReader(SegmentReader, int, int, int, short, int)](#s-constructReader)
- [getDay()](Builder.md#s-getDay) from Builder
- [getMonth()](Builder.md#s-getMonth) from Builder
- [getTimezone()](Builder.md#s-getTimezone) from Builder
- [getTimezoneMinutes()](Builder.md#s-getTimezoneMinutes) from Builder
- [getYear()](Builder.md#s-getYear) from Builder
- [setDay(byte)](Builder.md#s-setDay) from Builder
- [setMonth(byte)](Builder.md#s-setMonth) from Builder
- [setTimezone(byte)](Builder.md#s-setTimezone) from Builder
- [setTimezoneMinutes(byte)](Builder.md#s-setTimezoneMinutes) from Builder
- [setYear(short)](Builder.md#s-setYear) from Builder
- [structSize()](#s-structSize)

## Constructors

<a id="s-Factory-1"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="s-asReader"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.CsValueDate.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueDate.Builder builder
)
```

Types: [Reader](Reader.md#s-Reader), [Builder](Builder.md#s-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDate.Builder builder`

<a id="s-constructBuilder"></a>
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

Types: [Builder](Builder.md#s-Builder)

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`

<a id="s-constructReader"></a>
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

Types: [Reader](Reader.md#s-Reader)

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`

<a id="s-structSize"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
