# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDate.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getDay\(\)](#getday-3b07996cd5f6)
- [getMonth\(\)](#getmonth-3813513d5069)
- [getTimezone\(\)](#gettimezone-9573790f24e6)
- [getTimezoneMinutes\(\)](#gettimezoneminutes-b20d3de8d152)
- [getYear\(\)](#getyear-584af4457cda)
- [setDay\(byte\)](#setday-2c873a29eed0)
- [setMonth\(byte\)](#setmonth-b56a6d48db74)
- [setTimezone\(byte\)](#settimezone-c58c111fac16)
- [setTimezoneMinutes\(byte\)](#settimezoneminutes-69e0ed31afd1)
- [setYear\(short\)](#setyear-ecdf80e7189d)

## Constructors

### Builder(SegmentBuilder, int, int, int, short) <a href="#builder-179fba5038bd" id="builder-179fba5038bd"></a>

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

### asReader() <a href="#asreader-b5c0f2a8d115" id="asreader-b5c0f2a8d115"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDate.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

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

### setDay(byte) <a href="#setday-2c873a29eed0" id="setday-2c873a29eed0"></a>

```java
public final void setDay(byte value)
```

**Parameters**

- `byte value`

### setMonth(byte) <a href="#setmonth-b56a6d48db74" id="setmonth-b56a6d48db74"></a>

```java
public final void setMonth(byte value)
```

**Parameters**

- `byte value`

### setTimezone(byte) <a href="#settimezone-c58c111fac16" id="settimezone-c58c111fac16"></a>

```java
public final void setTimezone(byte value)
```

**Parameters**

- `byte value`

### setTimezoneMinutes(byte) <a href="#settimezoneminutes-69e0ed31afd1" id="settimezoneminutes-69e0ed31afd1"></a>

```java
public final void setTimezoneMinutes(byte value)
```

**Parameters**

- `byte value`

### setYear(short) <a href="#setyear-ecdf80e7189d" id="setyear-ecdf80e7189d"></a>

```java
public final void setYear(short value)
```

**Parameters**

- `short value`
