# DataCBType <a href="#cls-DataCBType" id="cls-DataCBType"></a>

```java
public enum com.tailf.dp.proto.DataCBType
```

Types: [DataCBType](DataCBType.md#cls-DataCBType)

Enumeration of Data callback methods

**Since:** 3.2.0

## Members

**Enum Constants**:

- [CREATE](#m-CREATE)
- [EXISTS_OPTIONAL](#m-EXISTS_OPTIONAL)
- [GET_ATTRS](#m-GET_ATTRS)
- [GET_CASE](#m-GET_CASE)
- [GET_ELEM](#m-GET_ELEM)
- [GET_NEXT](#m-GET_NEXT)
- [GET_NEXT_OBJECT](#m-GET_NEXT_OBJECT)
- [GET_NEXT_OBJECT_LIST](#m-GET_NEXT_OBJECT_LIST)
- [GET_OBJECT](#m-GET_OBJECT)
- [ITERATOR](#m-ITERATOR)
- [MOVE_AFTER](#m-MOVE_AFTER)
- [NUM_INSTANCES](#m-NUM_INSTANCES)
- [REMOVE](#m-REMOVE)
- [SET_ATTR](#m-SET_ATTR)
- [SET_CASE](#m-SET_CASE)
- [SET_ELEM](#m-SET_ELEM)
- [WRITE_ALL](#m-WRITE_ALL)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### CREATE <a href="#m-CREATE" id="m-CREATE"></a>

```java
public static final com.tailf.dp.proto.DataCBType CREATE;
```

Bit flag for the
 [`DpDataCallback#create(DpTrans,ConfObject[])`](../DpDataCallback.md#m-create-b5264b1d26e2) method.

### EXISTS_OPTIONAL <a href="#m-EXISTS_OPTIONAL" id="m-EXISTS_OPTIONAL"></a>

```java
public static final com.tailf.dp.proto.DataCBType EXISTS_OPTIONAL;
```

Bit flag for the
 [`DpDataCallback#existsOptional(DpTrans,ConfObject[])`](../DpDataCallback.md#m-existsOptional-3a4437a2a54a)
 method.

### GET_ATTRS <a href="#m-GET_ATTRS" id="m-GET_ATTRS"></a>

```java
public static final com.tailf.dp.proto.DataCBType GET_ATTRS;
```

Bit flag for the
 `DpDataCallback#getAttrs(
 DpTrans, ConfObject[], java.util.List)` method.

### GET_CASE <a href="#m-GET_CASE" id="m-GET_CASE"></a>

```java
public static final com.tailf.dp.proto.DataCBType GET_CASE;
```

Bit flag for the
 [`DpDataCallback#getCase(
 DpTrans, ConfObject[], ConfObject[])`](../DpDataCallback.md#m-getCase-24568d257ce7) method.

### GET_ELEM <a href="#m-GET_ELEM" id="m-GET_ELEM"></a>

```java
public static final com.tailf.dp.proto.DataCBType GET_ELEM;
```

Bit flag for the
 [`DpDataCallback#getElem(DpTrans,ConfObject[])`](../DpDataCallback.md#m-getElem-baf9006121df) method.

### GET_NEXT <a href="#m-GET_NEXT" id="m-GET_NEXT"></a>

```java
public static final com.tailf.dp.proto.DataCBType GET_NEXT;
```

Bit flag for getting the next key for a list entry using an iterator
 retrieved from the
 [`DpDataCallback#iterator(DpTrans,ConfObject[])`](../DpDataCallback.md#m-iterator-89c62926f3e8)
 method, and converting the Java object into a
 key with the [`DpDataCallback#getIteratorKey(
 DpTrans,ConfObject[],Object)`](../DpDataCallback.md#m-getIteratorKey-6df7c38f65f8) method.

### GET_NEXT_OBJECT <a href="#m-GET_NEXT_OBJECT" id="m-GET_NEXT_OBJECT"></a>

```java
public static final com.tailf.dp.proto.DataCBType GET_NEXT_OBJECT;
```

Bit flag for getting the next object using an iterator retrieved from the
 [`DpDataCallback#iterator(DpTrans,ConfObject[])`](../DpDataCallback.md#m-iterator-89c62926f3e8)
 method, and converting the object into an array of
 [`ConfValue`](../../conf/ConfValue.md#cls-ConfValue) with the
 [`DpDataCallback#getIteratorObject(
 DpTrans,ConfObject[],Object)`](../DpDataCallback.md#m-getIteratorObject-425632c26c31) method.

### GET_NEXT_OBJECT_LIST <a href="#m-GET_NEXT_OBJECT_LIST" id="m-GET_NEXT_OBJECT_LIST"></a>

```java
public static final com.tailf.dp.proto.DataCBType GET_NEXT_OBJECT_LIST;
```

Bit flag for getting a List of objects using an iterator retrieved from
 the [`DpDataCallback#iterator(DpTrans,ConfObject[])`](../DpDataCallback.md#m-iterator-89c62926f3e8)
 method.
 Each object being an represented as an array of
 [`ConfValue`](../../conf/ConfValue.md#cls-ConfValue). This method is used for large lists
 where sending data in bigger chunks is preferable.

### GET_OBJECT <a href="#m-GET_OBJECT" id="m-GET_OBJECT"></a>

```java
public static final com.tailf.dp.proto.DataCBType GET_OBJECT;
```

Bit flag for the
 [`DpDataCallback#getObject(DpTrans,ConfObject[])`](../DpDataCallback.md#m-getObject-b2d87f9b9270)
 method.

### ITERATOR <a href="#m-ITERATOR" id="m-ITERATOR"></a>

```java
public static final com.tailf.dp.proto.DataCBType ITERATOR;
```

iterator to be used with
 [`DpDataCallback#iterator(DpTrans, ConfObject[])`](../DpDataCallback.md#m-iterator-89c62926f3e8)
 method.
 necessary when using either
 [`DpDataCallback#getIteratorKey(
 DpTrans, ConfObject[], Object)`](../DpDataCallback.md#m-getIteratorKey-6df7c38f65f8) or
 [`DpDataCallback#getIteratorObject(
 DpTrans, ConfObject[], Object)`](../DpDataCallback.md#m-getIteratorObject-425632c26c31)
 is used

### MOVE_AFTER <a href="#m-MOVE_AFTER" id="m-MOVE_AFTER"></a>

```java
public static final com.tailf.dp.proto.DataCBType MOVE_AFTER;
```

Bit flag for the
 [`DpDataCallback#moveAfter(
 DpTrans, ConfObject[], com.tailf.conf.ConfKey)`](../DpDataCallback.md#m-moveAfter-023d2bce078c) method.

### NUM_INSTANCES <a href="#m-NUM_INSTANCES" id="m-NUM_INSTANCES"></a>

```java
public static final com.tailf.dp.proto.DataCBType NUM_INSTANCES;
```

Bit flag for the
 [`DpDataCallback#numInstances(DpTrans,ConfObject[])`](../DpDataCallback.md#m-numInstances-71fd723ecab5)
 method.

### REMOVE <a href="#m-REMOVE" id="m-REMOVE"></a>

```java
public static final com.tailf.dp.proto.DataCBType REMOVE;
```

Bit flag for the
 [`DpDataCallback#remove(DpTrans,ConfObject[])`](../DpDataCallback.md#m-remove-93340909c9a0) method.

### SET_ATTR <a href="#m-SET_ATTR" id="m-SET_ATTR"></a>

```java
public static final com.tailf.dp.proto.DataCBType SET_ATTR;
```

Bit flag for the
 [`DpDataCallback#setAttr(
 DpTrans, ConfObject[], com.tailf.conf.ConfAttributeValue)`](../DpDataCallback.md#m-setAttr-656af041deec) method.

### SET_CASE <a href="#m-SET_CASE" id="m-SET_CASE"></a>

```java
public static final com.tailf.dp.proto.DataCBType SET_CASE;
```

Bit flag for the
 [`DpDataCallback#setCase(
 DpTrans, ConfObject[], ConfObject[], com.tailf.conf.ConfTag)`](../DpDataCallback.md#m-setCase-430d4dbe7c83) method.

### SET_ELEM <a href="#m-SET_ELEM" id="m-SET_ELEM"></a>

```java
public static final com.tailf.dp.proto.DataCBType SET_ELEM;
```

Bit flag for the
 [`DpDataCallback#setElem(
 DpTrans,ConfObject[],ConfValue)`](../DpDataCallback.md#m-setElem-8a5e46811f6e) method.

### WRITE_ALL <a href="#m-WRITE_ALL" id="m-WRITE_ALL"></a>

```java
public static final com.tailf.dp.proto.DataCBType WRITE_ALL;
```

Bit flag for the
 [`DpDataCallback#writeAll(DpTrans, ConfObject[])`](../DpDataCallback.md#m-writeAll-a4604e96718c)
 method. Only used by write-all transaction hooks.


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.dp.proto.DataCBType valueOf(String name)
```

Types: [DataCBType](DataCBType.md#cls-DataCBType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.dp.proto.DataCBType[] values()
```

Types: [DataCBType](DataCBType.md#cls-DataCBType)
