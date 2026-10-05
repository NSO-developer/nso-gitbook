<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueTime.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getHour()](#s-getHour)
- [getMicro()](#s-getMicro)
- [getMin()](#s-getMin)
- [getSec()](#s-getSec)
- [getTimezone()](#s-getTimezone)
- [getTimezoneMinutes()](#s-getTimezoneMinutes)
- [setHour(byte)](#s-setHour)
- [setMicro(int)](#s-setMicro)
- [setMin(byte)](#s-setMin)
- [setSec(byte)](#s-setSec)
- [setTimezone(byte)](#s-setTimezone)
- [setTimezoneMinutes(byte)](#s-setTimezoneMinutes)

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
public final com.tailf.ncs.maapi.Schema.CsValueTime.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

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

<a id="s-setHour"></a>
### setHour(byte)

```java
public final void setHour(byte value)
```

**Parameters**

- `byte value`

<a id="s-setMicro"></a>
### setMicro(int)

```java
public final void setMicro(int value)
```

**Parameters**

- `int value`

<a id="s-setMin"></a>
### setMin(byte)

```java
public final void setMin(byte value)
```

**Parameters**

- `byte value`

<a id="s-setSec"></a>
### setSec(byte)

```java
public final void setSec(byte value)
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
