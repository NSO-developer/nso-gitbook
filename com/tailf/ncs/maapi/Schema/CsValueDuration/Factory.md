<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDuration.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueDuration.Builder,com.tailf.ncs.maapi.Schema.CsValueDuration.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-f5a8817ee133)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getDays()](Builder.md#m-getdays-046356f0d5f0) from Builder
- [getHours()](Builder.md#m-gethours-3fa193b38793) from Builder
- [getMicros()](Builder.md#m-getmicros-062944cf4511) from Builder
- [getMins()](Builder.md#m-getmins-c1eeffb194a4) from Builder
- [getMonths()](Builder.md#m-getmonths-980c2a29d103) from Builder
- [getSecs()](Builder.md#m-getsecs-460472c1be09) from Builder
- [getYears()](Builder.md#m-getyears-04cc2ca752eb) from Builder
- [setDays(int)](Builder.md#m-setdays-1ad4dd185830) from Builder
- [setHours(int)](Builder.md#m-sethours-9f714fc42623) from Builder
- [setMicros(int)](Builder.md#m-setmicros-9410072f84ff) from Builder
- [setMins(int)](Builder.md#m-setmins-5fc890f362e6) from Builder
- [setMonths(int)](Builder.md#m-setmonths-cdd1cef5d14a) from Builder
- [setSecs(int)](Builder.md#m-setsecs-b16b5f90b69a) from Builder
- [setYears(int)](Builder.md#m-setyears-d08ddee7575a) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-f5a8817ee133"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.CsValueDuration.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueDuration.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDuration.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

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

<a id="m-constructreader-fbce6f4f912a"></a>
### constructReader(SegmentReader, int, int, int, short, int)

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

<a id="m-structsize-1fa68dcadd21"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
