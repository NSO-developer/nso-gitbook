<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDate.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getDay()](#s-getDay)
- [getMonth()](#s-getMonth)
- [getTimezone()](#s-getTimezone)
- [getTimezoneMinutes()](#s-getTimezoneMinutes)
- [getYear()](#s-getYear)

## Constructors

<a id="s-Reader-1"></a>
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

<a id="s-getDay"></a>
### getDay()

```java
public final byte getDay()
```

<a id="s-getMonth"></a>
### getMonth()

```java
public final byte getMonth()
```

<a id="s-getTimezone"></a>
### getTimezone()

```java
public final byte getTimezone()
```

<a id="s-getTimezoneMinutes"></a>
### getTimezoneMinutes()

```java
public final byte getTimezoneMinutes()
```

<a id="s-getYear"></a>
### getYear()

```java
public final short getYear()
```
