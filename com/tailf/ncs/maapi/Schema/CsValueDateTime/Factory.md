<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDateTime.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueDateTime.Builder,com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-aafa1163fda9)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getDay()](Builder.md#m-getday-3b07996cd5f6) from Builder
- [getHour()](Builder.md#m-gethour-32c719f425c9) from Builder
- [getMicro()](Builder.md#m-getmicro-37aa6b436572) from Builder
- [getMin()](Builder.md#m-getmin-8654ceab94db) from Builder
- [getMonth()](Builder.md#m-getmonth-3813513d5069) from Builder
- [getSec()](Builder.md#m-getsec-c0fe657f6906) from Builder
- [getTimezone()](Builder.md#m-gettimezone-9573790f24e6) from Builder
- [getTimezoneMinutes()](Builder.md#m-gettimezoneminutes-b20d3de8d152) from Builder
- [getYear()](Builder.md#m-getyear-584af4457cda) from Builder
- [setDay(byte)](Builder.md#m-setday-2c873a29eed0) from Builder
- [setHour(byte)](Builder.md#m-sethour-49c3f93cc667) from Builder
- [setMicro(int)](Builder.md#m-setmicro-f8ae466800c3) from Builder
- [setMin(byte)](Builder.md#m-setmin-4bea903ce744) from Builder
- [setMonth(byte)](Builder.md#m-setmonth-b56a6d48db74) from Builder
- [setSec(byte)](Builder.md#m-setsec-487f1ad78d76) from Builder
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

<a id="m-asreader-aafa1163fda9"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueDateTime.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDateTime.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

```java
public final com.tailf.ncs.maapi.Schema.CsValueDateTime.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader constructReader(
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
