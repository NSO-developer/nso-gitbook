# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueTime.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueTime.Builder,com.tailf.ncs.maapi.Schema.CsValueTime.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-c5b4c70fffc2)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getHour()](Builder.md#m-getHour-32c719f425c9) from Builder
- [getMicro()](Builder.md#m-getMicro-37aa6b436572) from Builder
- [getMin()](Builder.md#m-getMin-8654ceab94db) from Builder
- [getSec()](Builder.md#m-getSec-c0fe657f6906) from Builder
- [getTimezone()](Builder.md#m-getTimezone-9573790f24e6) from Builder
- [getTimezoneMinutes()](Builder.md#m-getTimezoneMinutes-b20d3de8d152) from Builder
- [setHour(byte)](Builder.md#m-setHour-49c3f93cc667) from Builder
- [setMicro(int)](Builder.md#m-setMicro-f8ae466800c3) from Builder
- [setMin(byte)](Builder.md#m-setMin-4bea903ce744) from Builder
- [setSec(byte)](Builder.md#m-setSec-487f1ad78d76) from Builder
- [setTimezone(byte)](Builder.md#m-setTimezone-c58c111fac16) from Builder
- [setTimezoneMinutes(byte)](Builder.md#m-setTimezoneMinutes-69e0ed31afd1) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-c5b4c70fffc2" id="m-asReader-c5b4c70fffc2"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueTime.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueTime.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueTime.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueTime.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsValueTime.Reader constructReader(
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
