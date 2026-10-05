# DpAccumulate <a href="#dpaccumulate-2c3e1c3779d8" id="dpaccumulate-2c3e1c3779d8"></a>

```java
public class com.tailf.dp.DpAccumulate
```

The DpAccumulate object is used for accumulating operations on database from
 the DpDataCallbacks `setElem`, `create`, and
 `remove` operations when they return
 `Conf.REPLY_ACCUMULATE`.

**See also:** [`DpDataCallback#setElem(DpTrans,ConfObject[],ConfValue)`](DpDataCallback.md#setelem-8a5e46811f6e), [`DpDataCallback#create(DpTrans,ConfObject[])`](DpDataCallback.md#create-b5264b1d26e2), [`DpDataCallback#remove(DpTrans,ConfObject[])`](DpDataCallback.md#remove-93340909c9a0)

## Members

**Constructors**:

- [DpAccumulate(String, int, ConfObject[])](#dpaccumulate-de9e3eaafa4b)
- [DpAccumulate(String, int, ConfObject[], ConfValue)](#dpaccumulate-1fee939d1993)

**Fields**:

- [CREATE](#create-815a8a632c4b)
- [REMOVE](#remove-6d87754ff4a2)
- [SET_ELEM](#set_elem-9a90fa845e50)

**Methods**:

- [getCallPoint()](#getcallpoint-f816d0a44b26)
- [getKP()](#getkp-45b2f95adae4)
- [getOperation()](#getoperation-baf0e4738a2a)
- [getValue()](#getvalue-d93864668c40)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### DpAccumulate(String, int, ConfObject[]) <a href="#dpaccumulate-de9e3eaafa4b" id="dpaccumulate-de9e3eaafa4b"></a>

**Package-private**

```java
DpAccumulate(String callpoint, int op, com.tailf.conf.ConfObject[] kp)
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2)

**Parameters**

- `String callpoint`
- `int op`
- `com.tailf.conf.ConfObject[] kp`

### DpAccumulate(String, int, ConfObject[], ConfValue) <a href="#dpaccumulate-1fee939d1993" id="dpaccumulate-1fee939d1993"></a>

**Package-private**

```java
DpAccumulate(
    String callpoint,
    int op,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfValue value
)
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d)

**Parameters**

- `String callpoint`
- `int op`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfValue value`


## Fields

### CREATE <a href="#create-815a8a632c4b" id="create-815a8a632c4b"></a>

```java
public static final int CREATE = 2;
```

An accumulated create operation.

### REMOVE <a href="#remove-6d87754ff4a2" id="remove-6d87754ff4a2"></a>

```java
public static final int REMOVE = 3;
```

An accumulated remove operation.

### SET_ELEM <a href="#set_elem-9a90fa845e50" id="set_elem-9a90fa845e50"></a>

```java
public static final int SET_ELEM = 1;
```

An accumulating setElem operation.


## Methods

### getCallPoint() <a href="#getcallpoint-f816d0a44b26" id="getcallpoint-f816d0a44b26"></a>

```java
public String getCallPoint()
```

The callpoint that handled the operation.

### getKP() <a href="#getkp-45b2f95adae4" id="getkp-45b2f95adae4"></a>

```java
public com.tailf.conf.ConfObject[] getKP()
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2)

The keypath consisting of an array of ConfTag and/or ConfKey objects.
 Where kp[0] is the leaf.

### getOperation() <a href="#getoperation-baf0e4738a2a" id="getoperation-baf0e4738a2a"></a>

```java
public int getOperation()
```

The op has one of the values: `SET_ELEM`, `CREATE`,
 `REMOVE`

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public com.tailf.conf.ConfValue getValue()
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d)

The value to be set if op is `SET_ELEM`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
