<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDuration.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getDays()](#s-getDays)
- [getHours()](#s-getHours)
- [getMicros()](#s-getMicros)
- [getMins()](#s-getMins)
- [getMonths()](#s-getMonths)
- [getSecs()](#s-getSecs)
- [getYears()](#s-getYears)

## Constructors

<a id="s-Reader-1"></a>
### Reader(SegmentReader, int, int, int, short, int)

**Package-private**

```java
Reader(
    org.capnproto.SegmentReader segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount,
    int nestingLimit
)
```

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`


## Methods

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
