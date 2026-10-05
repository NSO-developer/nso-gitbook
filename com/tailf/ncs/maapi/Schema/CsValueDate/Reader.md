# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDate.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getDay()](#m-getDay-3b07996cd5f6)
- [getMonth()](#m-getMonth-3813513d5069)
- [getTimezone()](#m-getTimezone-9573790f24e6)
- [getTimezoneMinutes()](#m-getTimezoneMinutes-b20d3de8d152)
- [getYear()](#m-getYear-584af4457cda)

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

### getDay() <a href="#m-getDay-3b07996cd5f6" id="m-getDay-3b07996cd5f6"></a>

```java
public final byte getDay()
```

### getMonth() <a href="#m-getMonth-3813513d5069" id="m-getMonth-3813513d5069"></a>

```java
public final byte getMonth()
```

### getTimezone() <a href="#m-getTimezone-9573790f24e6" id="m-getTimezone-9573790f24e6"></a>

```java
public final byte getTimezone()
```

### getTimezoneMinutes() <a href="#m-getTimezoneMinutes-b20d3de8d152" id="m-getTimezoneMinutes-b20d3de8d152"></a>

```java
public final byte getTimezoneMinutes()
```

### getYear() <a href="#m-getYear-584af4457cda" id="m-getYear-584af4457cda"></a>

```java
public final short getYear()
```
