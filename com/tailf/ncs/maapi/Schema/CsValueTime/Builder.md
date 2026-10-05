# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueTime.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getHour()](#m-getHour-32c719f425c9)
- [getMicro()](#m-getMicro-37aa6b436572)
- [getMin()](#m-getMin-8654ceab94db)
- [getSec()](#m-getSec-c0fe657f6906)
- [getTimezone()](#m-getTimezone-9573790f24e6)
- [getTimezoneMinutes()](#m-getTimezoneMinutes-b20d3de8d152)
- [setHour(byte)](#m-setHour-49c3f93cc667)
- [setMicro(int)](#m-setMicro-f8ae466800c3)
- [setMin(byte)](#m-setMin-4bea903ce744)
- [setSec(byte)](#m-setSec-487f1ad78d76)
- [setTimezone(byte)](#m-setTimezone-c58c111fac16)
- [setTimezoneMinutes(byte)](#m-setTimezoneMinutes-69e0ed31afd1)

## Constructors

### Builder(SegmentBuilder, int, int, int, short) <a href="#m-Builder-179fba5038bd" id="m-Builder-179fba5038bd"></a>

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

### asReader() <a href="#m-asReader-b5c0f2a8d115" id="m-asReader-b5c0f2a8d115"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueTime.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getHour() <a href="#m-getHour-32c719f425c9" id="m-getHour-32c719f425c9"></a>

```java
public final byte getHour()
```

### getMicro() <a href="#m-getMicro-37aa6b436572" id="m-getMicro-37aa6b436572"></a>

```java
public final int getMicro()
```

### getMin() <a href="#m-getMin-8654ceab94db" id="m-getMin-8654ceab94db"></a>

```java
public final byte getMin()
```

### getSec() <a href="#m-getSec-c0fe657f6906" id="m-getSec-c0fe657f6906"></a>

```java
public final byte getSec()
```

### getTimezone() <a href="#m-getTimezone-9573790f24e6" id="m-getTimezone-9573790f24e6"></a>

```java
public final byte getTimezone()
```

### getTimezoneMinutes() <a href="#m-getTimezoneMinutes-b20d3de8d152" id="m-getTimezoneMinutes-b20d3de8d152"></a>

```java
public final byte getTimezoneMinutes()
```

### setHour(byte) <a href="#m-setHour-49c3f93cc667" id="m-setHour-49c3f93cc667"></a>

```java
public final void setHour(byte value)
```

**Parameters**

- `byte value`

### setMicro(int) <a href="#m-setMicro-f8ae466800c3" id="m-setMicro-f8ae466800c3"></a>

```java
public final void setMicro(int value)
```

**Parameters**

- `int value`

### setMin(byte) <a href="#m-setMin-4bea903ce744" id="m-setMin-4bea903ce744"></a>

```java
public final void setMin(byte value)
```

**Parameters**

- `byte value`

### setSec(byte) <a href="#m-setSec-487f1ad78d76" id="m-setSec-487f1ad78d76"></a>

```java
public final void setSec(byte value)
```

**Parameters**

- `byte value`

### setTimezone(byte) <a href="#m-setTimezone-c58c111fac16" id="m-setTimezone-c58c111fac16"></a>

```java
public final void setTimezone(byte value)
```

**Parameters**

- `byte value`

### setTimezoneMinutes(byte) <a href="#m-setTimezoneMinutes-69e0ed31afd1" id="m-setTimezoneMinutes-69e0ed31afd1"></a>

```java
public final void setTimezoneMinutes(byte value)
```

**Parameters**

- `byte value`
