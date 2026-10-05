<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getDay()](#s-getDay)
- [getHour()](#s-getHour)
- [getMicro()](#s-getMicro)
- [getMin()](#s-getMin)
- [getMonth()](#s-getMonth)
- [getSec()](#s-getSec)
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

<a id="s-getHour"></a>
### getHour()

```java
public final byte getHour()
```

<a id="s-getMicro"></a>
### getMicro()

```java
public final int getMicro()
```

<a id="s-getMin"></a>
### getMin()

```java
public final byte getMin()
```

<a id="s-getMonth"></a>
### getMonth()

```java
public final byte getMonth()
```

<a id="s-getSec"></a>
### getSec()

```java
public final byte getSec()
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
