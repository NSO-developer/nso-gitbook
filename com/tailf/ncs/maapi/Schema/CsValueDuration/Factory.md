# Factory <a href="#factory-1787784624e8" id="factory-1787784624e8"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDuration.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueDuration.Builder,com.tailf.ncs.maapi.Schema.CsValueDuration.Reader>
```

Types: [Builder](Builder.md#builder-21f09e83781d), [Reader](Reader.md#reader-b2467a96ddff)

## Members

**Constructors**:

- [Factory\(\)](#factory-0e9f9d7f4e84)

**Methods**:

- [asReader\(\)](Builder.md#asreader-b5c0f2a8d115) from Builder
- [asReader\(Builder\)](#asreader-f5a8817ee133)
- [constructBuilder\(SegmentBuilder, int, int, int, short\)](#constructbuilder-5a2abf3209f9)
- [constructReader\(SegmentReader, int, int, int, short, int\)](#constructreader-fbce6f4f912a)
- [getDays\(\)](Builder.md#getdays-046356f0d5f0) from Builder
- [getHours\(\)](Builder.md#gethours-3fa193b38793) from Builder
- [getMicros\(\)](Builder.md#getmicros-062944cf4511) from Builder
- [getMins\(\)](Builder.md#getmins-c1eeffb194a4) from Builder
- [getMonths\(\)](Builder.md#getmonths-980c2a29d103) from Builder
- [getSecs\(\)](Builder.md#getsecs-460472c1be09) from Builder
- [getYears\(\)](Builder.md#getyears-04cc2ca752eb) from Builder
- [setDays\(int\)](Builder.md#setdays-1ad4dd185830) from Builder
- [setHours\(int\)](Builder.md#sethours-9f714fc42623) from Builder
- [setMicros\(int\)](Builder.md#setmicros-9410072f84ff) from Builder
- [setMins\(int\)](Builder.md#setmins-5fc890f362e6) from Builder
- [setMonths\(int\)](Builder.md#setmonths-cdd1cef5d14a) from Builder
- [setSecs\(int\)](Builder.md#setsecs-b16b5f90b69a) from Builder
- [setYears\(int\)](Builder.md#setyears-d08ddee7575a) from Builder
- [structSize\(\)](#structsize-1fa68dcadd21)

## Constructors

### Factory() <a href="#factory-0e9f9d7f4e84" id="factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#asreader-f5a8817ee133" id="asreader-f5a8817ee133"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDuration.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueDuration.Builder builder
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff), [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDuration.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#constructbuilder-5a2abf3209f9" id="constructbuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDuration.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsValueDuration.Reader constructReader(
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
