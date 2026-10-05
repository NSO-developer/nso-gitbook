# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDate.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader\(SegmentReader, int, int, int, short, int\)](#reader-cf5e962c3323)

**Methods**:

- [getDay\(\)](#getday-3b07996cd5f6)
- [getMonth\(\)](#getmonth-3813513d5069)
- [getTimezone\(\)](#gettimezone-9573790f24e6)
- [getTimezoneMinutes\(\)](#gettimezoneminutes-b20d3de8d152)
- [getYear\(\)](#getyear-584af4457cda)

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

### getDay() <a href="#getday-3b07996cd5f6" id="getday-3b07996cd5f6"></a>

```java
public final byte getDay()
```

### getMonth() <a href="#getmonth-3813513d5069" id="getmonth-3813513d5069"></a>

```java
public final byte getMonth()
```

### getTimezone() <a href="#gettimezone-9573790f24e6" id="gettimezone-9573790f24e6"></a>

```java
public final byte getTimezone()
```

### getTimezoneMinutes() <a href="#gettimezoneminutes-b20d3de8d152" id="gettimezoneminutes-b20d3de8d152"></a>

```java
public final byte getTimezoneMinutes()
```

### getYear() <a href="#getyear-584af4457cda" id="getyear-584af4457cda"></a>

```java
public final short getYear()
```
