# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDuration.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#builder-179fba5038bd)

**Methods**:

- [asReader()](#asreader-b5c0f2a8d115)
- [getDays()](#getdays-046356f0d5f0)
- [getHours()](#gethours-3fa193b38793)
- [getMicros()](#getmicros-062944cf4511)
- [getMins()](#getmins-c1eeffb194a4)
- [getMonths()](#getmonths-980c2a29d103)
- [getSecs()](#getsecs-460472c1be09)
- [getYears()](#getyears-04cc2ca752eb)
- [setDays(int)](#setdays-1ad4dd185830)
- [setHours(int)](#sethours-9f714fc42623)
- [setMicros(int)](#setmicros-9410072f84ff)
- [setMins(int)](#setmins-5fc890f362e6)
- [setMonths(int)](#setmonths-cdd1cef5d14a)
- [setSecs(int)](#setsecs-b16b5f90b69a)
- [setYears(int)](#setyears-d08ddee7575a)

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
public final com.tailf.ncs.maapi.Schema.CsValueDuration.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getDays() <a href="#getdays-046356f0d5f0" id="getdays-046356f0d5f0"></a>

```java
public final int getDays()
```

### getHours() <a href="#gethours-3fa193b38793" id="gethours-3fa193b38793"></a>

```java
public final int getHours()
```

### getMicros() <a href="#getmicros-062944cf4511" id="getmicros-062944cf4511"></a>

```java
public final int getMicros()
```

### getMins() <a href="#getmins-c1eeffb194a4" id="getmins-c1eeffb194a4"></a>

```java
public final int getMins()
```

### getMonths() <a href="#getmonths-980c2a29d103" id="getmonths-980c2a29d103"></a>

```java
public final int getMonths()
```

### getSecs() <a href="#getsecs-460472c1be09" id="getsecs-460472c1be09"></a>

```java
public final int getSecs()
```

### getYears() <a href="#getyears-04cc2ca752eb" id="getyears-04cc2ca752eb"></a>

```java
public final int getYears()
```

### setDays(int) <a href="#setdays-1ad4dd185830" id="setdays-1ad4dd185830"></a>

```java
public final void setDays(int value)
```

**Parameters**

- `int value`

### setHours(int) <a href="#sethours-9f714fc42623" id="sethours-9f714fc42623"></a>

```java
public final void setHours(int value)
```

**Parameters**

- `int value`

### setMicros(int) <a href="#setmicros-9410072f84ff" id="setmicros-9410072f84ff"></a>

```java
public final void setMicros(int value)
```

**Parameters**

- `int value`

### setMins(int) <a href="#setmins-5fc890f362e6" id="setmins-5fc890f362e6"></a>

```java
public final void setMins(int value)
```

**Parameters**

- `int value`

### setMonths(int) <a href="#setmonths-cdd1cef5d14a" id="setmonths-cdd1cef5d14a"></a>

```java
public final void setMonths(int value)
```

**Parameters**

- `int value`

### setSecs(int) <a href="#setsecs-b16b5f90b69a" id="setsecs-b16b5f90b69a"></a>

```java
public final void setSecs(int value)
```

**Parameters**

- `int value`

### setYears(int) <a href="#setyears-d08ddee7575a" id="setyears-d08ddee7575a"></a>

```java
public final void setYears(int value)
```

**Parameters**

- `int value`
