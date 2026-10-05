<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueTime.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getHour()](#m-gethour-32c719f425c9)
- [getMicro()](#m-getmicro-37aa6b436572)
- [getMin()](#m-getmin-8654ceab94db)
- [getSec()](#m-getsec-c0fe657f6906)
- [getTimezone()](#m-gettimezone-9573790f24e6)
- [getTimezoneMinutes()](#m-gettimezoneminutes-b20d3de8d152)

## Constructors

<a id="m-reader-cf5e962c3323"></a>
### Reader(SegmentReader, int, int, int, short, int)

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

<a id="m-gethour-32c719f425c9"></a>
### getHour()

```java
public final byte getHour()
```

<a id="m-getmicro-37aa6b436572"></a>
### getMicro()

```java
public final int getMicro()
```

<a id="m-getmin-8654ceab94db"></a>
### getMin()

```java
public final byte getMin()
```

<a id="m-getsec-c0fe657f6906"></a>
### getSec()

```java
public final byte getSec()
```

<a id="m-gettimezone-9573790f24e6"></a>
### getTimezone()

```java
public final byte getTimezone()
```

<a id="m-gettimezoneminutes-b20d3de8d152"></a>
### getTimezoneMinutes()

```java
public final byte getTimezoneMinutes()
```
