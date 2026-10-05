# DpAccumulate <a href="#cls-DpAccumulate" id="cls-DpAccumulate"></a>

```java
public class com.tailf.dp.DpAccumulate
```

The DpAccumulate object is used for accumulating operations on database from
 the DpDataCallbacks `setElem`, `create`, and
 `remove` operations when they return
 `Conf.REPLY_ACCUMULATE`.

**See also:** [`DpDataCallback#setElem(DpTrans,ConfObject[],ConfValue)`](DpDataCallback.md#m-setElem-8a5e46811f6e), [`DpDataCallback#create(DpTrans,ConfObject[])`](DpDataCallback.md#m-create-b5264b1d26e2), [`DpDataCallback#remove(DpTrans,ConfObject[])`](DpDataCallback.md#m-remove-93340909c9a0)

## Members

**Constructors**:

- [DpAccumulate(String, int, ConfObject[])](#m-DpAccumulate-de9e3eaafa4b)
- [DpAccumulate(String, int, ConfObject[], ConfValue)](#m-DpAccumulate-1fee939d1993)

**Fields**:

- [CREATE](#m-CREATE)
- [REMOVE](#m-REMOVE)
- [SET_ELEM](#m-SET_ELEM)

**Methods**:

- [getCallPoint()](#m-getCallPoint-f816d0a44b26)
- [getKP()](#m-getKP-45b2f95adae4)
- [getOperation()](#m-getOperation-baf0e4738a2a)
- [getValue()](#m-getValue-d93864668c40)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### DpAccumulate(String, int, ConfObject[]) <a href="#m-DpAccumulate-de9e3eaafa4b" id="m-DpAccumulate-de9e3eaafa4b"></a>

**Package-private**

```java
DpAccumulate(String callpoint, int op, com.tailf.conf.ConfObject[] kp)
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

**Parameters**

- `String callpoint`
- `int op`
- `com.tailf.conf.ConfObject[] kp`

### DpAccumulate(String, int, ConfObject[], ConfValue) <a href="#m-DpAccumulate-1fee939d1993" id="m-DpAccumulate-1fee939d1993"></a>

**Package-private**

```java
DpAccumulate(
    String callpoint,
    int op,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfValue value
)
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfValue](../conf/ConfValue.md#cls-ConfValue)

**Parameters**

- `String callpoint`
- `int op`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfValue value`


## Fields

### CREATE <a href="#m-CREATE" id="m-CREATE"></a>

```java
public static final int CREATE = 2;
```

An accumulated create operation.

### REMOVE <a href="#m-REMOVE" id="m-REMOVE"></a>

```java
public static final int REMOVE = 3;
```

An accumulated remove operation.

### SET_ELEM <a href="#m-SET_ELEM" id="m-SET_ELEM"></a>

```java
public static final int SET_ELEM = 1;
```

An accumulating setElem operation.


## Methods

### getCallPoint() <a href="#m-getCallPoint-f816d0a44b26" id="m-getCallPoint-f816d0a44b26"></a>

```java
public String getCallPoint()
```

The callpoint that handled the operation.

### getKP() <a href="#m-getKP-45b2f95adae4" id="m-getKP-45b2f95adae4"></a>

```java
public com.tailf.conf.ConfObject[] getKP()
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

The keypath consisting of an array of ConfTag and/or ConfKey objects.
 Where kp[0] is the leaf.

### getOperation() <a href="#m-getOperation-baf0e4738a2a" id="m-getOperation-baf0e4738a2a"></a>

```java
public int getOperation()
```

The op has one of the values: `SET_ELEM`, `CREATE`,
 `REMOVE`

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public com.tailf.conf.ConfValue getValue()
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue)

The value to be set if op is `SET_ELEM`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
