# Factory <a href="#factory-1787784624e8" id="factory-1787784624e8"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueTime.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueTime.Builder,com.tailf.ncs.maapi.Schema.CsValueTime.Reader>
```

Types: [Builder](Builder.md#builder-21f09e83781d), [Reader](Reader.md#reader-b2467a96ddff)

## Members

**Constructors**:

- [Factory\(\)](#factory-0e9f9d7f4e84)

**Methods**:

- [asReader\(\)](Builder.md#asreader-b5c0f2a8d115) from Builder
- [asReader\(Builder\)](#asreader-c5b4c70fffc2)
- [constructBuilder\(SegmentBuilder, int, int, int, short\)](#constructbuilder-5a2abf3209f9)
- [constructReader\(SegmentReader, int, int, int, short, int\)](#constructreader-fbce6f4f912a)
- [getHour\(\)](Builder.md#gethour-32c719f425c9) from Builder
- [getMicro\(\)](Builder.md#getmicro-37aa6b436572) from Builder
- [getMin\(\)](Builder.md#getmin-8654ceab94db) from Builder
- [getSec\(\)](Builder.md#getsec-c0fe657f6906) from Builder
- [getTimezone\(\)](Builder.md#gettimezone-9573790f24e6) from Builder
- [getTimezoneMinutes\(\)](Builder.md#gettimezoneminutes-b20d3de8d152) from Builder
- [setHour\(byte\)](Builder.md#sethour-49c3f93cc667) from Builder
- [setMicro\(int\)](Builder.md#setmicro-f8ae466800c3) from Builder
- [setMin\(byte\)](Builder.md#setmin-4bea903ce744) from Builder
- [setSec\(byte\)](Builder.md#setsec-487f1ad78d76) from Builder
- [setTimezone\(byte\)](Builder.md#settimezone-c58c111fac16) from Builder
- [setTimezoneMinutes\(byte\)](Builder.md#settimezoneminutes-69e0ed31afd1) from Builder
- [structSize\(\)](#structsize-1fa68dcadd21)

## Constructors

### Factory() <a href="#factory-0e9f9d7f4e84" id="factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#asreader-c5b4c70fffc2" id="asreader-c5b4c70fffc2"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueTime.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueTime.Builder builder
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff), [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueTime.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#constructbuilder-5a2abf3209f9" id="constructbuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueTime.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsValueTime.Reader constructReader(
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
