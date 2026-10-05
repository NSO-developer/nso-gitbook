<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDate.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getDay()](#s-getDay)
- [getMonth()](#s-getMonth)
- [getTimezone()](#s-getTimezone)
- [getTimezoneMinutes()](#s-getTimezoneMinutes)
- [getYear()](#s-getYear)
- [setDay(byte)](#s-setDay)
- [setMonth(byte)](#s-setMonth)
- [setTimezone(byte)](#s-setTimezone)
- [setTimezoneMinutes(byte)](#s-setTimezoneMinutes)
- [setYear(short)](#s-setYear)

## Constructors

<a id="s-Builder-1"></a>
### Builder(SegmentBuilder, int, int, int, short)

**Package-private**

```java
Builder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`


## Methods

<a id="s-asReader"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDate.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

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

<a id="s-setDay"></a>
### setDay(byte)

```java
public final void setDay(byte value)
```

**Parameters**

- `byte value`

<a id="s-setMonth"></a>
### setMonth(byte)

```java
public final void setMonth(byte value)
```

**Parameters**

- `byte value`

<a id="s-setTimezone"></a>
### setTimezone(byte)

```java
public final void setTimezone(byte value)
```

**Parameters**

- `byte value`

<a id="s-setTimezoneMinutes"></a>
### setTimezoneMinutes(byte)

```java
public final void setTimezoneMinutes(byte value)
```

**Parameters**

- `byte value`

<a id="s-setYear"></a>
### setYear(short)

```java
public final void setYear(short value)
```

**Parameters**

- `short value`
