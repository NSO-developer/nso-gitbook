# DataCBType <a href="#datacbtype-1cb4e4ee7708" id="datacbtype-1cb4e4ee7708"></a>

```java
public enum com.tailf.dp.proto.DataCBType
```

Types: [DataCBType](DataCBType.md#datacbtype-1cb4e4ee7708)

Enumeration of Data callback methods

**Since:** 3.2.0

## Members

**Enum Constants**:

- [CREATE](#create-146c3c7e4f65)
- [EXISTS\_OPTIONAL](#exists_optional-f5be923624f4)
- [GET\_ATTRS](#get_attrs-e8030b5dd328)
- [GET\_CASE](#get_case-9ef2ae59c94b)
- [GET\_ELEM](#get_elem-c4bad67e639e)
- [GET\_NEXT](#get_next-6a271635d86e)
- [GET\_NEXT\_OBJECT](#get_next_object-9f70b230e968)
- [GET\_NEXT\_OBJECT\_LIST](#get_next_object_list-b798e83d5f8e)
- [GET\_OBJECT](#get_object-839ff9de9cc4)
- [ITERATOR](#iterator-4246715ba5f0)
- [MOVE\_AFTER](#move_after-582d0ddace39)
- [NUM\_INSTANCES](#num_instances-bc8f1909765f)
- [REMOVE](#remove-954d8c0ae444)
- [SET\_ATTR](#set_attr-8d1502d32197)
- [SET\_CASE](#set_case-bba9ec167799)
- [SET\_ELEM](#set_elem-a932054018d7)
- [WRITE\_ALL](#write_all-16f02b0c53c5)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### CREATE <a href="#create-146c3c7e4f65" id="create-146c3c7e4f65"></a>

```java
public static final com.tailf.dp.proto.DataCBType CREATE;
```

Bit flag for the
 [`DpDataCallback#create(DpTrans,ConfObject[])`](../DpDataCallback.md#create-b5264b1d26e2) method.

### EXISTS_OPTIONAL <a href="#exists_optional-f5be923624f4" id="exists_optional-f5be923624f4"></a>

```java
public static final com.tailf.dp.proto.DataCBType EXISTS_OPTIONAL;
```

Bit flag for the
 [`DpDataCallback#existsOptional(DpTrans,ConfObject[])`](../DpDataCallback.md#existsoptional-3a4437a2a54a)
 method.

### GET_ATTRS <a href="#get_attrs-e8030b5dd328" id="get_attrs-e8030b5dd328"></a>

```java
public static final com.tailf.dp.proto.DataCBType GET_ATTRS;
```

Bit flag for the
 `DpDataCallback#getAttrs(
 DpTrans, ConfObject[], java.util.List)` method.

### GET_CASE <a href="#get_case-9ef2ae59c94b" id="get_case-9ef2ae59c94b"></a>

```java
public static final com.tailf.dp.proto.DataCBType GET_CASE;
```

Bit flag for the
 [`DpDataCallback#getCase(
 DpTrans, ConfObject[], ConfObject[])`](../DpDataCallback.md#getcase-24568d257ce7) method.

### GET_ELEM <a href="#get_elem-c4bad67e639e" id="get_elem-c4bad67e639e"></a>

```java
public static final com.tailf.dp.proto.DataCBType GET_ELEM;
```

Bit flag for the
 [`DpDataCallback#getElem(DpTrans,ConfObject[])`](../DpDataCallback.md#getelem-baf9006121df) method.

### GET_NEXT <a href="#get_next-6a271635d86e" id="get_next-6a271635d86e"></a>

```java
public static final com.tailf.dp.proto.DataCBType GET_NEXT;
```

Bit flag for getting the next key for a list entry using an iterator
 retrieved from the
 [`DpDataCallback#iterator(DpTrans,ConfObject[])`](../DpDataCallback.md#iterator-89c62926f3e8)
 method, and converting the Java object into a
 key with the [`DpDataCallback#getIteratorKey(
 DpTrans,ConfObject[],Object)`](../DpDataCallback.md#getiteratorkey-6df7c38f65f8) method.

### GET_NEXT_OBJECT <a href="#get_next_object-9f70b230e968" id="get_next_object-9f70b230e968"></a>

```java
public static final com.tailf.dp.proto.DataCBType GET_NEXT_OBJECT;
```

Bit flag for getting the next object using an iterator retrieved from the
 [`DpDataCallback#iterator(DpTrans,ConfObject[])`](../DpDataCallback.md#iterator-89c62926f3e8)
 method, and converting the object into an array of
 [`ConfValue`](../../conf/ConfValue.md#confvalue-769292781c7d) with the
 [`DpDataCallback#getIteratorObject(
 DpTrans,ConfObject[],Object)`](../DpDataCallback.md#getiteratorobject-425632c26c31) method.

### GET_NEXT_OBJECT_LIST <a href="#get_next_object_list-b798e83d5f8e" id="get_next_object_list-b798e83d5f8e"></a>

```java
public static final com.tailf.dp.proto.DataCBType GET_NEXT_OBJECT_LIST;
```

Bit flag for getting a List of objects using an iterator retrieved from
 the [`DpDataCallback#iterator(DpTrans,ConfObject[])`](../DpDataCallback.md#iterator-89c62926f3e8)
 method.
 Each object being an represented as an array of
 [`ConfValue`](../../conf/ConfValue.md#confvalue-769292781c7d). This method is used for large lists
 where sending data in bigger chunks is preferable.

### GET_OBJECT <a href="#get_object-839ff9de9cc4" id="get_object-839ff9de9cc4"></a>

```java
public static final com.tailf.dp.proto.DataCBType GET_OBJECT;
```

Bit flag for the
 [`DpDataCallback#getObject(DpTrans,ConfObject[])`](../DpDataCallback.md#getobject-b2d87f9b9270)
 method.

### ITERATOR <a href="#iterator-4246715ba5f0" id="iterator-4246715ba5f0"></a>

```java
public static final com.tailf.dp.proto.DataCBType ITERATOR;
```

iterator to be used with
 [`DpDataCallback#iterator(DpTrans, ConfObject[])`](../DpDataCallback.md#iterator-89c62926f3e8)
 method.
 necessary when using either
 [`DpDataCallback#getIteratorKey(
 DpTrans, ConfObject[], Object)`](../DpDataCallback.md#getiteratorkey-6df7c38f65f8) or
 [`DpDataCallback#getIteratorObject(
 DpTrans, ConfObject[], Object)`](../DpDataCallback.md#getiteratorobject-425632c26c31)
 is used

### MOVE_AFTER <a href="#move_after-582d0ddace39" id="move_after-582d0ddace39"></a>

```java
public static final com.tailf.dp.proto.DataCBType MOVE_AFTER;
```

Bit flag for the
 [`DpDataCallback#moveAfter(
 DpTrans, ConfObject[], com.tailf.conf.ConfKey)`](../DpDataCallback.md#moveafter-023d2bce078c) method.

### NUM_INSTANCES <a href="#num_instances-bc8f1909765f" id="num_instances-bc8f1909765f"></a>

```java
public static final com.tailf.dp.proto.DataCBType NUM_INSTANCES;
```

Bit flag for the
 [`DpDataCallback#numInstances(DpTrans,ConfObject[])`](../DpDataCallback.md#numinstances-71fd723ecab5)
 method.

### REMOVE <a href="#remove-954d8c0ae444" id="remove-954d8c0ae444"></a>

```java
public static final com.tailf.dp.proto.DataCBType REMOVE;
```

Bit flag for the
 [`DpDataCallback#remove(DpTrans,ConfObject[])`](../DpDataCallback.md#remove-93340909c9a0) method.

### SET_ATTR <a href="#set_attr-8d1502d32197" id="set_attr-8d1502d32197"></a>

```java
public static final com.tailf.dp.proto.DataCBType SET_ATTR;
```

Bit flag for the
 [`DpDataCallback#setAttr(
 DpTrans, ConfObject[], com.tailf.conf.ConfAttributeValue)`](../DpDataCallback.md#setattr-656af041deec) method.

### SET_CASE <a href="#set_case-bba9ec167799" id="set_case-bba9ec167799"></a>

```java
public static final com.tailf.dp.proto.DataCBType SET_CASE;
```

Bit flag for the
 [`DpDataCallback#setCase(
 DpTrans, ConfObject[], ConfObject[], com.tailf.conf.ConfTag)`](../DpDataCallback.md#setcase-430d4dbe7c83) method.

### SET_ELEM <a href="#set_elem-a932054018d7" id="set_elem-a932054018d7"></a>

```java
public static final com.tailf.dp.proto.DataCBType SET_ELEM;
```

Bit flag for the
 [`DpDataCallback#setElem(
 DpTrans,ConfObject[],ConfValue)`](../DpDataCallback.md#setelem-8a5e46811f6e) method.

### WRITE_ALL <a href="#write_all-16f02b0c53c5" id="write_all-16f02b0c53c5"></a>

```java
public static final com.tailf.dp.proto.DataCBType WRITE_ALL;
```

Bit flag for the
 [`DpDataCallback#writeAll(DpTrans, ConfObject[])`](../DpDataCallback.md#writeall-a4604e96718c)
 method. Only used by write-all transaction hooks.


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.dp.proto.DataCBType valueOf(String name)
```

Types: [DataCBType](DataCBType.md#datacbtype-1cb4e4ee7708)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.dp.proto.DataCBType[] values()
```

Types: [DataCBType](DataCBType.md#datacbtype-1cb4e4ee7708)
