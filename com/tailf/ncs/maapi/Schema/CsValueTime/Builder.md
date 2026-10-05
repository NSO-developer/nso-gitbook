# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueTime.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#builder-179fba5038bd)

**Methods**:

- [asReader()](#asreader-b5c0f2a8d115)
- [getHour()](#gethour-32c719f425c9)
- [getMicro()](#getmicro-37aa6b436572)
- [getMin()](#getmin-8654ceab94db)
- [getSec()](#getsec-c0fe657f6906)
- [getTimezone()](#gettimezone-9573790f24e6)
- [getTimezoneMinutes()](#gettimezoneminutes-b20d3de8d152)
- [setHour(byte)](#sethour-49c3f93cc667)
- [setMicro(int)](#setmicro-f8ae466800c3)
- [setMin(byte)](#setmin-4bea903ce744)
- [setSec(byte)](#setsec-487f1ad78d76)
- [setTimezone(byte)](#settimezone-c58c111fac16)
- [setTimezoneMinutes(byte)](#settimezoneminutes-69e0ed31afd1)

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
public final com.tailf.ncs.maapi.Schema.CsValueTime.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

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

### setHour(byte) <a href="#sethour-49c3f93cc667" id="sethour-49c3f93cc667"></a>

```java
public final void setHour(byte value)
```

**Parameters**

- `byte value`

### setMicro(int) <a href="#setmicro-f8ae466800c3" id="setmicro-f8ae466800c3"></a>

```java
public final void setMicro(int value)
```

**Parameters**

- `int value`

### setMin(byte) <a href="#setmin-4bea903ce744" id="setmin-4bea903ce744"></a>

```java
public final void setMin(byte value)
```

**Parameters**

- `byte value`

### setSec(byte) <a href="#setsec-487f1ad78d76" id="setsec-487f1ad78d76"></a>

```java
public final void setSec(byte value)
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
