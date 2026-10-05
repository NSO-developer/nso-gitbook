# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueTime.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getHour()](#m-getHour-32c719f425c9)
- [getMicro()](#m-getMicro-37aa6b436572)
- [getMin()](#m-getMin-8654ceab94db)
- [getSec()](#m-getSec-c0fe657f6906)
- [getTimezone()](#m-getTimezone-9573790f24e6)
- [getTimezoneMinutes()](#m-getTimezoneMinutes-b20d3de8d152)

## Constructors

### Reader(SegmentReader, int, int, int, short, int) <a href="#m-Reader-cf5e962c3323" id="m-Reader-cf5e962c3323"></a>

**Package-private**

```java
Reader(
    org.capnproto.SegmentReader segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount,
    int nestingLimit
)
```

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`


## Methods

### getHour() <a href="#m-getHour-32c719f425c9" id="m-getHour-32c719f425c9"></a>

```java
public final byte getHour()
```

### getMicro() <a href="#m-getMicro-37aa6b436572" id="m-getMicro-37aa6b436572"></a>

```java
public final int getMicro()
```

### getMin() <a href="#m-getMin-8654ceab94db" id="m-getMin-8654ceab94db"></a>

```java
public final byte getMin()
```

### getSec() <a href="#m-getSec-c0fe657f6906" id="m-getSec-c0fe657f6906"></a>

```java
public final byte getSec()
```

### getTimezone() <a href="#m-getTimezone-9573790f24e6" id="m-getTimezone-9573790f24e6"></a>

```java
public final byte getTimezone()
```

### getTimezoneMinutes() <a href="#m-getTimezoneMinutes-b20d3de8d152" id="m-getTimezoneMinutes-b20d3de8d152"></a>

```java
public final byte getTimezoneMinutes()
```
