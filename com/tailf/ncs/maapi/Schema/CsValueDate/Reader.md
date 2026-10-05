<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDate.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getDay()](#m-getday-3b07996cd5f6)
- [getMonth()](#m-getmonth-3813513d5069)
- [getTimezone()](#m-gettimezone-9573790f24e6)
- [getTimezoneMinutes()](#m-gettimezoneminutes-b20d3de8d152)
- [getYear()](#m-getyear-584af4457cda)

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

<a id="m-getday-3b07996cd5f6"></a>
### getDay()

```java
public final byte getDay()
```

<a id="m-getmonth-3813513d5069"></a>
### getMonth()

```java
public final byte getMonth()
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

<a id="m-getyear-584af4457cda"></a>
### getYear()

```java
public final short getYear()
```
