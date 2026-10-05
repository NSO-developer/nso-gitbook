# Factory <a href="#factory-1787784624e8" id="factory-1787784624e8"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDateTime.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueDateTime.Builder,com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader>
```

Types: [Builder](Builder.md#builder-21f09e83781d), [Reader](Reader.md#reader-b2467a96ddff)

## Members

**Constructors**:

- [Factory()](#factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#asreader-aafa1163fda9)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#constructreader-fbce6f4f912a)
- [getDay()](Builder.md#getday-3b07996cd5f6) from Builder
- [getHour()](Builder.md#gethour-32c719f425c9) from Builder
- [getMicro()](Builder.md#getmicro-37aa6b436572) from Builder
- [getMin()](Builder.md#getmin-8654ceab94db) from Builder
- [getMonth()](Builder.md#getmonth-3813513d5069) from Builder
- [getSec()](Builder.md#getsec-c0fe657f6906) from Builder
- [getTimezone()](Builder.md#gettimezone-9573790f24e6) from Builder
- [getTimezoneMinutes()](Builder.md#gettimezoneminutes-b20d3de8d152) from Builder
- [getYear()](Builder.md#getyear-584af4457cda) from Builder
- [setDay(byte)](Builder.md#setday-2c873a29eed0) from Builder
- [setHour(byte)](Builder.md#sethour-49c3f93cc667) from Builder
- [setMicro(int)](Builder.md#setmicro-f8ae466800c3) from Builder
- [setMin(byte)](Builder.md#setmin-4bea903ce744) from Builder
- [setMonth(byte)](Builder.md#setmonth-b56a6d48db74) from Builder
- [setSec(byte)](Builder.md#setsec-487f1ad78d76) from Builder
- [setTimezone(byte)](Builder.md#settimezone-c58c111fac16) from Builder
- [setTimezoneMinutes(byte)](Builder.md#settimezoneminutes-69e0ed31afd1) from Builder
- [setYear(short)](Builder.md#setyear-ecdf80e7189d) from Builder
- [structSize()](#structsize-1fa68dcadd21)

## Constructors

### Factory() <a href="#factory-0e9f9d7f4e84" id="factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#asreader-aafa1163fda9" id="asreader-aafa1163fda9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueDateTime.Builder builder
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff), [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDateTime.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#constructbuilder-5a2abf3209f9" id="constructbuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDateTime.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader constructReader(
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
