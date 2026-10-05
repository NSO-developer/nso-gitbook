<a id="s-DataCBType"></a>
# DataCBType

```java
public enum com.tailf.dp.proto.DataCBType
```

Types: [DataCBType](DataCBType.md#s-DataCBType)

Enumeration of Data callback methods

**Related classes**

- [DataCBType](DataCBType.md#s-DataCBType)

**Since:** 3.2.0

## Members

**Enum Constants**:

- [CREATE](#s-CREATE)
- [EXISTS_OPTIONAL](#s-EXISTS_OPTIONAL)
- [GET_ATTRS](#s-GET_ATTRS)
- [GET_CASE](#s-GET_CASE)
- [GET_ELEM](#s-GET_ELEM)
- [GET_NEXT](#s-GET_NEXT)
- [GET_NEXT_OBJECT](#s-GET_NEXT_OBJECT)
- [GET_NEXT_OBJECT_LIST](#s-GET_NEXT_OBJECT_LIST)
- [GET_OBJECT](#s-GET_OBJECT)
- [ITERATOR](#s-ITERATOR)
- [MOVE_AFTER](#s-MOVE_AFTER)
- [NUM_INSTANCES](#s-NUM_INSTANCES)
- [REMOVE](#s-REMOVE)
- [SET_ATTR](#s-SET_ATTR)
- [SET_CASE](#s-SET_CASE)
- [SET_ELEM](#s-SET_ELEM)
- [WRITE_ALL](#s-WRITE_ALL)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-CREATE"></a>
### CREATE

```java
public static final com.tailf.dp.proto.DataCBType CREATE;
```

Bit flag for the
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback) method.

<a id="s-EXISTS_OPTIONAL"></a>
### EXISTS_OPTIONAL

```java
public static final com.tailf.dp.proto.DataCBType EXISTS_OPTIONAL;
```

Bit flag for the
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback)
 method.

<a id="s-GET_ATTRS"></a>
### GET_ATTRS

```java
public static final com.tailf.dp.proto.DataCBType GET_ATTRS;
```

Bit flag for the
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback) method.

<a id="s-GET_CASE"></a>
### GET_CASE

```java
public static final com.tailf.dp.proto.DataCBType GET_CASE;
```

Bit flag for the
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback) method.

<a id="s-GET_ELEM"></a>
### GET_ELEM

```java
public static final com.tailf.dp.proto.DataCBType GET_ELEM;
```

Bit flag for the
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback) method.

<a id="s-GET_NEXT"></a>
### GET_NEXT

```java
public static final com.tailf.dp.proto.DataCBType GET_NEXT;
```

Bit flag for getting the next key for a list entry using an iterator
 retrieved from the
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback)
 method, and converting the Java object into a
 key with the [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback) method.

<a id="s-GET_NEXT_OBJECT"></a>
### GET_NEXT_OBJECT

```java
public static final com.tailf.dp.proto.DataCBType GET_NEXT_OBJECT;
```

Bit flag for getting the next object using an iterator retrieved from the
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback)
 method, and converting the object into an array of
 [`ConfValue`](../../conf/ConfValue.md#s-ConfValue) with the
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback) method.

<a id="s-GET_NEXT_OBJECT_LIST"></a>
### GET_NEXT_OBJECT_LIST

```java
public static final com.tailf.dp.proto.DataCBType GET_NEXT_OBJECT_LIST;
```

Bit flag for getting a List of objects using an iterator retrieved from
 the [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback)
 method.
 Each object being an represented as an array of
 [`ConfValue`](../../conf/ConfValue.md#s-ConfValue). This method is used for large lists
 where sending data in bigger chunks is preferable.

<a id="s-GET_OBJECT"></a>
### GET_OBJECT

```java
public static final com.tailf.dp.proto.DataCBType GET_OBJECT;
```

Bit flag for the
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback)
 method.

<a id="s-ITERATOR"></a>
### ITERATOR

```java
public static final com.tailf.dp.proto.DataCBType ITERATOR;
```

iterator to be used with
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback)
 method.
 necessary when using either
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback) or
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback)
 is used

<a id="s-MOVE_AFTER"></a>
### MOVE_AFTER

```java
public static final com.tailf.dp.proto.DataCBType MOVE_AFTER;
```

Bit flag for the
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback) method.

<a id="s-NUM_INSTANCES"></a>
### NUM_INSTANCES

```java
public static final com.tailf.dp.proto.DataCBType NUM_INSTANCES;
```

Bit flag for the
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback)
 method.

<a id="s-REMOVE"></a>
### REMOVE

```java
public static final com.tailf.dp.proto.DataCBType REMOVE;
```

Bit flag for the
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback) method.

<a id="s-SET_ATTR"></a>
### SET_ATTR

```java
public static final com.tailf.dp.proto.DataCBType SET_ATTR;
```

Bit flag for the
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback) method.

<a id="s-SET_CASE"></a>
### SET_CASE

```java
public static final com.tailf.dp.proto.DataCBType SET_CASE;
```

Bit flag for the
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback) method.

<a id="s-SET_ELEM"></a>
### SET_ELEM

```java
public static final com.tailf.dp.proto.DataCBType SET_ELEM;
```

Bit flag for the
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback) method.

<a id="s-WRITE_ALL"></a>
### WRITE_ALL

```java
public static final com.tailf.dp.proto.DataCBType WRITE_ALL;
```

Bit flag for the
 [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback)
 method. Only used by write-all transaction hooks.


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.dp.proto.DataCBType valueOf(String name)
```

Types: [DataCBType](DataCBType.md#s-DataCBType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.dp.proto.DataCBType[] values()
```

Types: [DataCBType](DataCBType.md#s-DataCBType)
