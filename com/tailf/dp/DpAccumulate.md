<a id="cls-DpAccumulate"></a>
# DpAccumulate

```java
public class com.tailf.dp.DpAccumulate
```

The DpAccumulate object is used for accumulating operations on database from
 the DpDataCallbacks `setElem`, `create`, and
 `remove` operations when they return
 `Conf.REPLY_ACCUMULATE`.

**See also:** [`DpDataCallback#setElem(DpTrans,ConfObject[],ConfValue)`](DpDataCallback.md#m-setelem-8a5e46811f6e), [`DpDataCallback#create(DpTrans,ConfObject[])`](DpDataCallback.md#m-create-b5264b1d26e2), [`DpDataCallback#remove(DpTrans,ConfObject[])`](DpDataCallback.md#m-remove-93340909c9a0)

## Members

**Constructors**:

- [DpAccumulate(String, int, ConfObject[])](#m-dpaccumulate-de9e3eaafa4b)
- [DpAccumulate(String, int, ConfObject[], ConfValue)](#m-dpaccumulate-1fee939d1993)

**Fields**:

- [CREATE](#m-CREATE)
- [REMOVE](#m-REMOVE)
- [SET_ELEM](#m-SET_ELEM)

**Methods**:

- [getCallPoint()](#m-getcallpoint-f816d0a44b26)
- [getKP()](#m-getkp-45b2f95adae4)
- [getOperation()](#m-getoperation-baf0e4738a2a)
- [getValue()](#m-getvalue-d93864668c40)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-dpaccumulate-de9e3eaafa4b"></a>
### DpAccumulate(String, int, ConfObject[])

**Package-private**

```java
DpAccumulate(String callpoint, int op, com.tailf.conf.ConfObject[] kp)
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

**Parameters**

- `String callpoint`
- `int op`
- `com.tailf.conf.ConfObject[] kp`

<a id="m-dpaccumulate-1fee939d1993"></a>
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

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfValue](../conf/ConfValue.md#cls-ConfValue)

**Parameters**

- `String callpoint`
- `int op`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfValue value`


## Fields

<a id="m-CREATE"></a>
### CREATE

```java
public static final int CREATE = 2;
```

An accumulated create operation.

<a id="m-REMOVE"></a>
### REMOVE

```java
public static final int REMOVE = 3;
```

An accumulated remove operation.

<a id="m-SET_ELEM"></a>
### SET_ELEM

```java
public static final int SET_ELEM = 1;
```

An accumulating setElem operation.


## Methods

<a id="m-getcallpoint-f816d0a44b26"></a>
### getCallPoint()

```java
public String getCallPoint()
```

The callpoint that handled the operation.

<a id="m-getkp-45b2f95adae4"></a>
### getKP()

```java
public com.tailf.conf.ConfObject[] getKP()
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

The keypath consisting of an array of ConfTag and/or ConfKey objects.
 Where kp[0] is the leaf.

<a id="m-getoperation-baf0e4738a2a"></a>
### getOperation()

```java
public int getOperation()
```

The op has one of the values: `SET_ELEM`, `CREATE`,
 `REMOVE`

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public com.tailf.conf.ConfValue getValue()
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue)

The value to be set if op is `SET_ELEM`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
