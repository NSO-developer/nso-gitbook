<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDuration.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getDays()](#m-getdays-046356f0d5f0)
- [getHours()](#m-gethours-3fa193b38793)
- [getMicros()](#m-getmicros-062944cf4511)
- [getMins()](#m-getmins-c1eeffb194a4)
- [getMonths()](#m-getmonths-980c2a29d103)
- [getSecs()](#m-getsecs-460472c1be09)
- [getYears()](#m-getyears-04cc2ca752eb)
- [setDays(int)](#m-setdays-1ad4dd185830)
- [setHours(int)](#m-sethours-9f714fc42623)
- [setMicros(int)](#m-setmicros-9410072f84ff)
- [setMins(int)](#m-setmins-5fc890f362e6)
- [setMonths(int)](#m-setmonths-cdd1cef5d14a)
- [setSecs(int)](#m-setsecs-b16b5f90b69a)
- [setYears(int)](#m-setyears-d08ddee7575a)

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
public final com.tailf.ncs.maapi.Schema.CsValueDuration.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getdays-046356f0d5f0"></a>
### getDays()

```java
public final int getDays()
```

<a id="m-gethours-3fa193b38793"></a>
### getHours()

```java
public final int getHours()
```

<a id="m-getmicros-062944cf4511"></a>
### getMicros()

```java
public final int getMicros()
```

<a id="m-getmins-c1eeffb194a4"></a>
### getMins()

```java
public final int getMins()
```

<a id="m-getmonths-980c2a29d103"></a>
### getMonths()

```java
public final int getMonths()
```

<a id="m-getsecs-460472c1be09"></a>
### getSecs()

```java
public final int getSecs()
```

<a id="m-getyears-04cc2ca752eb"></a>
### getYears()

```java
public final int getYears()
```

<a id="m-setdays-1ad4dd185830"></a>
### setDays(int)

```java
public final void setDays(int value)
```

**Parameters**

- `int value`

<a id="m-sethours-9f714fc42623"></a>
### setHours(int)

```java
public final void setHours(int value)
```

**Parameters**

- `int value`

<a id="m-setmicros-9410072f84ff"></a>
### setMicros(int)

```java
public final void setMicros(int value)
```

**Parameters**

- `int value`

<a id="m-setmins-5fc890f362e6"></a>
### setMins(int)

```java
public final void setMins(int value)
```

**Parameters**

- `int value`

<a id="m-setmonths-cdd1cef5d14a"></a>
### setMonths(int)

```java
public final void setMonths(int value)
```

**Parameters**

- `int value`

<a id="m-setsecs-b16b5f90b69a"></a>
### setSecs(int)

```java
public final void setSecs(int value)
```

**Parameters**

- `int value`

<a id="m-setyears-d08ddee7575a"></a>
### setYears(int)

```java
public final void setYears(int value)
```

**Parameters**

- `int value`
