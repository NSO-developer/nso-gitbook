# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDuration.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueDuration.Builder,com.tailf.ncs.maapi.Schema.CsValueDuration.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-f5a8817ee133)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getDays()](Builder.md#m-getDays-046356f0d5f0) from Builder
- [getHours()](Builder.md#m-getHours-3fa193b38793) from Builder
- [getMicros()](Builder.md#m-getMicros-062944cf4511) from Builder
- [getMins()](Builder.md#m-getMins-c1eeffb194a4) from Builder
- [getMonths()](Builder.md#m-getMonths-980c2a29d103) from Builder
- [getSecs()](Builder.md#m-getSecs-460472c1be09) from Builder
- [getYears()](Builder.md#m-getYears-04cc2ca752eb) from Builder
- [setDays(int)](Builder.md#m-setDays-1ad4dd185830) from Builder
- [setHours(int)](Builder.md#m-setHours-9f714fc42623) from Builder
- [setMicros(int)](Builder.md#m-setMicros-9410072f84ff) from Builder
- [setMins(int)](Builder.md#m-setMins-5fc890f362e6) from Builder
- [setMonths(int)](Builder.md#m-setMonths-cdd1cef5d14a) from Builder
- [setSecs(int)](Builder.md#m-setSecs-b16b5f90b69a) from Builder
- [setYears(int)](Builder.md#m-setYears-d08ddee7575a) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-f5a8817ee133" id="m-asReader-f5a8817ee133"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDuration.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueDuration.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDuration.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDuration.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsValueDuration.Reader constructReader(
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
