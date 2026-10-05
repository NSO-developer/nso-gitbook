# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueTime.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#reader-cf5e962c3323)

**Methods**:

- [getHour()](#gethour-32c719f425c9)
- [getMicro()](#getmicro-37aa6b436572)
- [getMin()](#getmin-8654ceab94db)
- [getSec()](#getsec-c0fe657f6906)
- [getTimezone()](#gettimezone-9573790f24e6)
- [getTimezoneMinutes()](#gettimezoneminutes-b20d3de8d152)

## Constructors

### Reader(SegmentReader, int, int, int, short, int) <a href="#reader-cf5e962c3323" id="reader-cf5e962c3323"></a>

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

### getHour() <a href="#gethour-32c719f425c9" id="gethour-32c719f425c9"></a>

```java
public final byte getHour()
```

### getMicro() <a href="#getmicro-37aa6b436572" id="getmicro-37aa6b436572"></a>

```java
public final int getMicro()
```

### getMin() <a href="#getmin-8654ceab94db" id="getmin-8654ceab94db"></a>

```java
public final byte getMin()
```

### getSec() <a href="#getsec-c0fe657f6906" id="getsec-c0fe657f6906"></a>

```java
public final byte getSec()
```

### getTimezone() <a href="#gettimezone-9573790f24e6" id="gettimezone-9573790f24e6"></a>

```java
public final byte getTimezone()
```

### getTimezoneMinutes() <a href="#gettimezoneminutes-b20d3de8d152" id="gettimezoneminutes-b20d3de8d152"></a>

```java
public final byte getTimezoneMinutes()
```
