<a id="cls-DataCBType"></a>
# DataCBType

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

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-CREATE"></a>
### CREATE

```java
public static final com.tailf.dp.proto.DataCBType CREATE;
```

Bit flag for the
 [`DpDataCallback#create(DpTrans,ConfObject[])`](../DpDataCallback.md#m-create-b5264b1d26e2) method.

<a id="m-EXISTS_OPTIONAL"></a>
### EXISTS_OPTIONAL

```java
public static final com.tailf.dp.proto.DataCBType EXISTS_OPTIONAL;
```

Bit flag for the
 [`DpDataCallback#existsOptional(DpTrans,ConfObject[])`](../DpDataCallback.md#m-existsoptional-3a4437a2a54a)
 method.

<a id="m-GET_ATTRS"></a>
### GET_ATTRS

```java
public static final com.tailf.dp.proto.DataCBType GET_ATTRS;
```

Bit flag for the
 `DpDataCallback#getAttrs(
 DpTrans, ConfObject[], java.util.List)` method.

<a id="m-GET_CASE"></a>
### GET_CASE

```java
public static final com.tailf.dp.proto.DataCBType GET_CASE;
```

Bit flag for the
 [`DpDataCallback#getCase(
 DpTrans, ConfObject[], ConfObject[])`](../DpDataCallback.md#m-getcase-24568d257ce7) method.

<a id="m-GET_ELEM"></a>
### GET_ELEM

```java
public static final com.tailf.dp.proto.DataCBType GET_ELEM;
```

Bit flag for the
 [`DpDataCallback#getElem(DpTrans,ConfObject[])`](../DpDataCallback.md#m-getelem-baf9006121df) method.

<a id="m-GET_NEXT"></a>
### GET_NEXT

```java
public static final com.tailf.dp.proto.DataCBType GET_NEXT;
```

Bit flag for getting the next key for a list entry using an iterator
 retrieved from the
 [`DpDataCallback#iterator(DpTrans,ConfObject[])`](../DpDataCallback.md#m-iterator-89c62926f3e8)
 method, and converting the Java object into a
 key with the [`DpDataCallback#getIteratorKey(
 DpTrans,ConfObject[],Object)`](../DpDataCallback.md#m-getiteratorkey-6df7c38f65f8) method.

<a id="m-GET_NEXT_OBJECT"></a>
### GET_NEXT_OBJECT

```java
public static final com.tailf.dp.proto.DataCBType GET_NEXT_OBJECT;
```

Bit flag for getting the next object using an iterator retrieved from the
 [`DpDataCallback#iterator(DpTrans,ConfObject[])`](../DpDataCallback.md#m-iterator-89c62926f3e8)
 method, and converting the object into an array of
 [`ConfValue`](../../conf/ConfValue.md#cls-ConfValue) with the
 [`DpDataCallback#getIteratorObject(
 DpTrans,ConfObject[],Object)`](../DpDataCallback.md#m-getiteratorobject-425632c26c31) method.

<a id="m-GET_NEXT_OBJECT_LIST"></a>
### GET_NEXT_OBJECT_LIST

```java
public static final com.tailf.dp.proto.DataCBType GET_NEXT_OBJECT_LIST;
```

Bit flag for getting a List of objects using an iterator retrieved from
 the [`DpDataCallback#iterator(DpTrans,ConfObject[])`](../DpDataCallback.md#m-iterator-89c62926f3e8)
 method.
 Each object being an represented as an array of
 [`ConfValue`](../../conf/ConfValue.md#cls-ConfValue). This method is used for large lists
 where sending data in bigger chunks is preferable.

<a id="m-GET_OBJECT"></a>
### GET_OBJECT

```java
public static final com.tailf.dp.proto.DataCBType GET_OBJECT;
```

Bit flag for the
 [`DpDataCallback#getObject(DpTrans,ConfObject[])`](../DpDataCallback.md#m-getobject-b2d87f9b9270)
 method.

<a id="m-ITERATOR"></a>
### ITERATOR

```java
public static final com.tailf.dp.proto.DataCBType ITERATOR;
```

iterator to be used with
 [`DpDataCallback#iterator(DpTrans, ConfObject[])`](../DpDataCallback.md#m-iterator-89c62926f3e8)
 method.
 necessary when using either
 [`DpDataCallback#getIteratorKey(
 DpTrans, ConfObject[], Object)`](../DpDataCallback.md#m-getiteratorkey-6df7c38f65f8) or
 [`DpDataCallback#getIteratorObject(
 DpTrans, ConfObject[], Object)`](../DpDataCallback.md#m-getiteratorobject-425632c26c31)
 is used

<a id="m-MOVE_AFTER"></a>
### MOVE_AFTER

```java
public static final com.tailf.dp.proto.DataCBType MOVE_AFTER;
```

Bit flag for the
 [`DpDataCallback#moveAfter(
 DpTrans, ConfObject[], com.tailf.conf.ConfKey)`](../DpDataCallback.md#m-moveafter-023d2bce078c) method.

<a id="m-NUM_INSTANCES"></a>
### NUM_INSTANCES

```java
public static final com.tailf.dp.proto.DataCBType NUM_INSTANCES;
```

Bit flag for the
 [`DpDataCallback#numInstances(DpTrans,ConfObject[])`](../DpDataCallback.md#m-numinstances-71fd723ecab5)
 method.

<a id="m-REMOVE"></a>
### REMOVE

```java
public static final com.tailf.dp.proto.DataCBType REMOVE;
```

Bit flag for the
 [`DpDataCallback#remove(DpTrans,ConfObject[])`](../DpDataCallback.md#m-remove-93340909c9a0) method.

<a id="m-SET_ATTR"></a>
### SET_ATTR

```java
public static final com.tailf.dp.proto.DataCBType SET_ATTR;
```

Bit flag for the
 [`DpDataCallback#setAttr(
 DpTrans, ConfObject[], com.tailf.conf.ConfAttributeValue)`](../DpDataCallback.md#m-setattr-656af041deec) method.

<a id="m-SET_CASE"></a>
### SET_CASE

```java
public static final com.tailf.dp.proto.DataCBType SET_CASE;
```

Bit flag for the
 [`DpDataCallback#setCase(
 DpTrans, ConfObject[], ConfObject[], com.tailf.conf.ConfTag)`](../DpDataCallback.md#m-setcase-430d4dbe7c83) method.

<a id="m-SET_ELEM"></a>
### SET_ELEM

```java
public static final com.tailf.dp.proto.DataCBType SET_ELEM;
```

Bit flag for the
 [`DpDataCallback#setElem(
 DpTrans,ConfObject[],ConfValue)`](../DpDataCallback.md#m-setelem-8a5e46811f6e) method.

<a id="m-WRITE_ALL"></a>
### WRITE_ALL

```java
public static final com.tailf.dp.proto.DataCBType WRITE_ALL;
```

Bit flag for the
 [`DpDataCallback#writeAll(DpTrans, ConfObject[])`](../DpDataCallback.md#m-writeall-a4604e96718c)
 method. Only used by write-all transaction hooks.


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.dp.proto.DataCBType valueOf(String name)
```

Types: [DataCBType](DataCBType.md#cls-DataCBType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.dp.proto.DataCBType[] values()
```

Types: [DataCBType](DataCBType.md#cls-DataCBType)
