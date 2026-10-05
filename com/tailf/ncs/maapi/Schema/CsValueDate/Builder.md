<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDate.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getDay()](#m-getday-3b07996cd5f6)
- [getMonth()](#m-getmonth-3813513d5069)
- [getTimezone()](#m-gettimezone-9573790f24e6)
- [getTimezoneMinutes()](#m-gettimezoneminutes-b20d3de8d152)
- [getYear()](#m-getyear-584af4457cda)
- [setDay(byte)](#m-setday-2c873a29eed0)
- [setMonth(byte)](#m-setmonth-b56a6d48db74)
- [setTimezone(byte)](#m-settimezone-c58c111fac16)
- [setTimezoneMinutes(byte)](#m-settimezoneminutes-69e0ed31afd1)
- [setYear(short)](#m-setyear-ecdf80e7189d)

## Constructors

<a id="m-builder-179fba5038bd"></a>
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

<a id="m-asreader-b5c0f2a8d115"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDate.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

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

<a id="m-setday-2c873a29eed0"></a>
### setDay(byte)

```java
public final void setDay(byte value)
```

**Parameters**

- `byte value`

<a id="m-setmonth-b56a6d48db74"></a>
### setMonth(byte)

```java
public final void setMonth(byte value)
```

**Parameters**

- `byte value`

<a id="m-settimezone-c58c111fac16"></a>
### setTimezone(byte)

```java
public final void setTimezone(byte value)
```

**Parameters**

- `byte value`

<a id="m-settimezoneminutes-69e0ed31afd1"></a>
### setTimezoneMinutes(byte)

```java
public final void setTimezoneMinutes(byte value)
```

**Parameters**

- `byte value`

<a id="m-setyear-ecdf80e7189d"></a>
### setYear(short)

```java
public final void setYear(short value)
```

**Parameters**

- `short value`
