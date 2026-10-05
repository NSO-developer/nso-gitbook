<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDuration.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getDays()](#s-getDays)
- [getHours()](#s-getHours)
- [getMicros()](#s-getMicros)
- [getMins()](#s-getMins)
- [getMonths()](#s-getMonths)
- [getSecs()](#s-getSecs)
- [getYears()](#s-getYears)
- [setDays(int)](#s-setDays)
- [setHours(int)](#s-setHours)
- [setMicros(int)](#s-setMicros)
- [setMins(int)](#s-setMins)
- [setMonths(int)](#s-setMonths)
- [setSecs(int)](#s-setSecs)
- [setYears(int)](#s-setYears)

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
public final com.tailf.ncs.maapi.Schema.CsValueDuration.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getDays"></a>
### getDays()

```java
public final int getDays()
```

<a id="s-getHours"></a>
### getHours()

```java
public final int getHours()
```

<a id="s-getMicros"></a>
### getMicros()

```java
public final int getMicros()
```

<a id="s-getMins"></a>
### getMins()

```java
public final int getMins()
```

<a id="s-getMonths"></a>
### getMonths()

```java
public final int getMonths()
```

<a id="s-getSecs"></a>
### getSecs()

```java
public final int getSecs()
```

<a id="s-getYears"></a>
### getYears()

```java
public final int getYears()
```

<a id="s-setDays"></a>
### setDays(int)

```java
public final void setDays(int value)
```

**Parameters**

- `int value`

<a id="s-setHours"></a>
### setHours(int)

```java
public final void setHours(int value)
```

**Parameters**

- `int value`

<a id="s-setMicros"></a>
### setMicros(int)

```java
public final void setMicros(int value)
```

**Parameters**

- `int value`

<a id="s-setMins"></a>
### setMins(int)

```java
public final void setMins(int value)
```

**Parameters**

- `int value`

<a id="s-setMonths"></a>
### setMonths(int)

```java
public final void setMonths(int value)
```

**Parameters**

- `int value`

<a id="s-setSecs"></a>
### setSecs(int)

```java
public final void setSecs(int value)
```

**Parameters**

- `int value`

<a id="s-setYears"></a>
### setYears(int)

```java
public final void setYears(int value)
```

**Parameters**

- `int value`
