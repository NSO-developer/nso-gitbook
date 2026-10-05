<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueTime.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getHour()](#m-gethour-32c719f425c9)
- [getMicro()](#m-getmicro-37aa6b436572)
- [getMin()](#m-getmin-8654ceab94db)
- [getSec()](#m-getsec-c0fe657f6906)
- [getTimezone()](#m-gettimezone-9573790f24e6)
- [getTimezoneMinutes()](#m-gettimezoneminutes-b20d3de8d152)
- [setHour(byte)](#m-sethour-49c3f93cc667)
- [setMicro(int)](#m-setmicro-f8ae466800c3)
- [setMin(byte)](#m-setmin-4bea903ce744)
- [setSec(byte)](#m-setsec-487f1ad78d76)
- [setTimezone(byte)](#m-settimezone-c58c111fac16)
- [setTimezoneMinutes(byte)](#m-settimezoneminutes-69e0ed31afd1)

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
public final com.tailf.ncs.maapi.Schema.CsValueTime.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

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

<a id="m-sethour-49c3f93cc667"></a>
### setHour(byte)

```java
public final void setHour(byte value)
```

**Parameters**

- `byte value`

<a id="m-setmicro-f8ae466800c3"></a>
### setMicro(int)

```java
public final void setMicro(int value)
```

**Parameters**

- `int value`

<a id="m-setmin-4bea903ce744"></a>
### setMin(byte)

```java
public final void setMin(byte value)
```

**Parameters**

- `byte value`

<a id="m-setsec-487f1ad78d76"></a>
### setSec(byte)

```java
public final void setSec(byte value)
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
