<a id="s-DpAccumulate"></a>
# DpAccumulate

```java
public class com.tailf.dp.DpAccumulate
```

The DpAccumulate object is used for accumulating operations on database from
 the DpDataCallbacks `setElem`, `create`, and
 `remove` operations when they return
 `Conf.REPLY_ACCUMULATE`.

**See also:** [`DpDataCallback#setElem(DpTrans,ConfObject[],ConfValue)`](DpDataCallback.md#s-setElem), [`DpDataCallback#create(DpTrans,ConfObject[])`](DpDataCallback.md#s-create), [`DpDataCallback#remove(DpTrans,ConfObject[])`](DpDataCallback.md#s-remove)

## Members

**Constructors**:

- [DpAccumulate(String, int, ConfObject[])](#s-DpAccumulate-1)
- [DpAccumulate(String, int, ConfObject[], ConfValue)](#s-DpAccumulate-2)

**Fields**:

- [CREATE](#s-CREATE)
- [REMOVE](#s-REMOVE)
- [SET_ELEM](#s-SET_ELEM)

**Methods**:

- [getCallPoint()](#s-getCallPoint)
- [getKP()](#s-getKP)
- [getOperation()](#s-getOperation)
- [getValue()](#s-getValue)
- [toString()](#s-toString)

## Constructors

<a id="s-DpAccumulate-1"></a>
### DpAccumulate(String, int, ConfObject[])

**Package-private**

```java
DpAccumulate(String callpoint, int op, com.tailf.conf.ConfObject[] kp)
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject)

**Parameters**

- `String callpoint`
- `int op`
- `com.tailf.conf.ConfObject[] kp`

<a id="s-DpAccumulate-2"></a>
### DpAccumulate(String, int, ConfObject[], ConfValue)

**Package-private**

```java
DpAccumulate(
    String callpoint,
    int op,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfValue value
)
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject), [ConfValue](../conf/ConfValue.md#s-ConfValue)

**Parameters**

- `String callpoint`
- `int op`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfValue value`


## Fields

<a id="s-CREATE"></a>
### CREATE

```java
public static final int CREATE = 2;
```

An accumulated create operation.

<a id="s-REMOVE"></a>
### REMOVE

```java
public static final int REMOVE = 3;
```

An accumulated remove operation.

<a id="s-SET_ELEM"></a>
### SET_ELEM

```java
public static final int SET_ELEM = 1;
```

An accumulating setElem operation.


## Methods

<a id="s-getCallPoint"></a>
### getCallPoint()

```java
public String getCallPoint()
```

The callpoint that handled the operation.

<a id="s-getKP"></a>
### getKP()

```java
public com.tailf.conf.ConfObject[] getKP()
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject)

The keypath consisting of an array of ConfTag and/or ConfKey objects.
 Where kp[0] is the leaf.

<a id="s-getOperation"></a>
### getOperation()

```java
public int getOperation()
```

The op has one of the values: `SET_ELEM`, `CREATE`,
 `REMOVE`

<a id="s-getValue"></a>
### getValue()

```java
public com.tailf.conf.ConfValue getValue()
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue)

The value to be set if op is `SET_ELEM`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
