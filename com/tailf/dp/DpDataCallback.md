# DpDataCallback <a href="#cls-DpDataCallback" id="cls-DpDataCallback"></a>

```java
public interface com.tailf.dp.DpDataCallback
```

This interface is used for the user data callbacks.

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#m-registerAnnotatedCallbacks-ffaebadbfc42)

## Members

**Fields**:

- [M_ALL](#m-M_ALL)
- [M_CREATE](#m-M_CREATE)
- [M_EXISTS_OPTIONAL](#m-M_EXISTS_OPTIONAL)
- [M_GET_ATTRS](#m-M_GET_ATTRS)
- [M_GET_CASE](#m-M_GET_CASE)
- [M_GET_ELEM](#m-M_GET_ELEM)
- [M_GET_NEXT](#m-M_GET_NEXT)
- [M_GET_NEXT_OBJECT](#m-M_GET_NEXT_OBJECT)
- [M_GET_OBJECT](#m-M_GET_OBJECT)
- [M_MOVE_AFTER](#m-M_MOVE_AFTER)
- [M_NUM_INSTANCES](#m-M_NUM_INSTANCES)
- [M_REMOVE](#m-M_REMOVE)
- [M_SET_ATTR](#m-M_SET_ATTR)
- [M_SET_CASE](#m-M_SET_CASE)
- [M_SET_ELEM](#m-M_SET_ELEM)
- [M_WANT_FILTER](#m-M_WANT_FILTER)
- [M_WRITE_ALL](#m-M_WRITE_ALL)

**Methods**:

- [callpoint()](#m-callpoint-d6336403521b)
- [create(DpTrans, ConfObject[])](#m-create-b5264b1d26e2)
- [existsOptional(DpTrans, ConfObject[])](#m-existsOptional-3a4437a2a54a)
- [getAttrs(DpTrans, ConfObject[], List<ConfAttributeValue>)](#m-getAttrs-47ef46821576)
- [getCase(DpTrans, ConfObject[], ConfObject[])](#m-getCase-24568d257ce7)
- [getElem(DpTrans, ConfObject[])](#m-getElem-baf9006121df)
- [getIteratorKey(DpTrans, ConfObject[], Object)](#m-getIteratorKey-6df7c38f65f8)
- [getIteratorObject(DpTrans, ConfObject[], Object)](#m-getIteratorObject-425632c26c31)
- [getIteratorObjectList(DpTrans, ConfObject[], Object, Iterator<? extends Object>)](#m-getIteratorObjectList-17a0707464f1)
- [getObject(DpTrans, ConfObject[])](#m-getObject-b2d87f9b9270)
- [iterator(DpTrans, ConfObject[])](#m-iterator-89c62926f3e8)
- [iterator(DpTrans, ConfObject[], ConfFindNextType, ConfKey)](#m-iterator-5d250fbe6a8b)
- [iterator(DpTrans, ConfObject[], ConfFindNextType, ConfKey, DpListFilter)](#m-iterator-b1da1a451977)
- [iterator(DpTrans, ConfObject[], DpListFilter)](#m-iterator-02bb74b2989b)
- [mask()](#m-mask-24c2fa29c6af)
- [moveAfter(DpTrans, ConfObject[], ConfKey)](#m-moveAfter-023d2bce078c)
- [numInstances(DpTrans, ConfObject[])](#m-numInstances-71fd723ecab5)
- [remove(DpTrans, ConfObject[])](#m-remove-93340909c9a0)
- [setAttr(DpTrans, ConfObject[], ConfAttributeValue)](#m-setAttr-656af041deec)
- [setCase(DpTrans, ConfObject[], ConfObject[], ConfTag)](#m-setCase-430d4dbe7c83)
- [setElem(DpTrans, ConfObject[], ConfValue)](#m-setElem-8a5e46811f6e)
- [writeAll(DpTrans, ConfObject[])](#m-writeAll-a4604e96718c)

## Fields

### M_ALL <a href="#m-M_ALL" id="m-M_ALL"></a>

```java
public static final int M_ALL = 2047;
```

Bit flag for all flags

### M_CREATE <a href="#m-M_CREATE" id="m-M_CREATE"></a>

```java
public static final int M_CREATE = 16;
```

Bit flag for the `create(DpTrans,ConfObject[])` method.

### M_EXISTS_OPTIONAL <a href="#m-M_EXISTS_OPTIONAL" id="m-M_EXISTS_OPTIONAL"></a>

```java
public static final int M_EXISTS_OPTIONAL = 1;
```

Bit flag for the `existsOptional(DpTrans,ConfObject[])` method.

### M_GET_ATTRS <a href="#m-M_GET_ATTRS" id="m-M_GET_ATTRS"></a>

```java
public static final int M_GET_ATTRS = 2048;
```

Bit flag for the `getAttrs(DpTrans, ConfObject[], List)` method.

### M_GET_CASE <a href="#m-M_GET_CASE" id="m-M_GET_CASE"></a>

```java
public static final int M_GET_CASE = 512;
```

Bit flag for the `getCase(DpTrans, ConfObject[], ConfObject[])`
 method.

### M_GET_ELEM <a href="#m-M_GET_ELEM" id="m-M_GET_ELEM"></a>

```java
public static final int M_GET_ELEM = 2;
```

Bit flag for the `getElem(DpTrans,ConfObject[])` method.

### M_GET_NEXT <a href="#m-M_GET_NEXT" id="m-M_GET_NEXT"></a>

```java
public static final int M_GET_NEXT = 4;
```

Bit flag for getting the next key for an element using an iterator
 retrieved from the `iterator(DpTrans,ConfObject[])` method, and
 converting the Java object into a key with the
 `getIteratorKey(DpTrans, ConfObject[], Object)` method.

### M_GET_NEXT_OBJECT <a href="#m-M_GET_NEXT_OBJECT" id="m-M_GET_NEXT_OBJECT"></a>

```java
public static final int M_GET_NEXT_OBJECT = 256;
```

Bit flag for getting the next object using an iterator retrieved from the
 `iterator(DpTrans,ConfObject[])` method, and converting the Java
 object into an array of ConfValues with the
 `getIteratorObject(DpTrans, ConfObject[], Object)` method.

### M_GET_OBJECT <a href="#m-M_GET_OBJECT" id="m-M_GET_OBJECT"></a>

```java
public static final int M_GET_OBJECT = 128;
```

Bit flag for the `getObject(DpTrans,ConfObject[])` method.

### M_MOVE_AFTER <a href="#m-M_MOVE_AFTER" id="m-M_MOVE_AFTER"></a>

```java
public static final int M_MOVE_AFTER = 8192;
```

Bit flag for the `moveAfter(DpTrans, ConfObject[], ConfKey)`
 method.

### M_NUM_INSTANCES <a href="#m-M_NUM_INSTANCES" id="m-M_NUM_INSTANCES"></a>

```java
public static final int M_NUM_INSTANCES = 64;
```

Bit flag for the `numInstances(DpTrans,ConfObject[])` method.

### M_REMOVE <a href="#m-M_REMOVE" id="m-M_REMOVE"></a>

```java
public static final int M_REMOVE = 32;
```

Bit flag for the `remove(DpTrans,ConfObject[])` method.

### M_SET_ATTR <a href="#m-M_SET_ATTR" id="m-M_SET_ATTR"></a>

```java
public static final int M_SET_ATTR = 4096;
```

Bit flag for the
 `setAttr(DpTrans, ConfObject[], ConfAttributeValue)` method.

### M_SET_CASE <a href="#m-M_SET_CASE" id="m-M_SET_CASE"></a>

```java
public static final int M_SET_CASE = 1024;
```

Bit flag for the
 `setCase(DpTrans, ConfObject[], ConfObject[], ConfTag)` method.

### M_SET_ELEM <a href="#m-M_SET_ELEM" id="m-M_SET_ELEM"></a>

```java
public static final int M_SET_ELEM = 8;
```

Bit flag for the `setElem(DpTrans,ConfObject[],ConfValue)` method.

### M_WANT_FILTER <a href="#m-M_WANT_FILTER" id="m-M_WANT_FILTER"></a>

```java
public static final int M_WANT_FILTER = 131072;
```

Bit flag for indicating that filters are wanted.

### M_WRITE_ALL <a href="#m-M_WRITE_ALL" id="m-M_WRITE_ALL"></a>

```java
public static final int M_WRITE_ALL = 16384;
```

Bit flag for the `writeAll(DpTrans, ConfObject[])` method.


## Methods

### callpoint() <a href="#m-callpoint-d6336403521b" id="m-callpoint-d6336403521b"></a>

```java
public abstract String callpoint()
```

The name of the callpoint

### create(DpTrans, ConfObject[]) <a href="#m-create-b5264b1d26e2" id="m-create-b5264b1d26e2"></a>

```java
public abstract int create(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#cls-DpTrans), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

This callback creates a new presence container, list entry or empty leaf.
 In the case of the "servers" data model, this function need to create a
 new "server" list entry.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction
- `com.tailf.conf.ConfObject[] kp` - The keypath

**Returns:** `Conf.REPLY_OK` or `Conf.REPLY_ACCUMULATE`

**Throws**

- `DpCallbackException` - Callback method failed.

### existsOptional(DpTrans, ConfObject[]) <a href="#m-existsOptional-3a4437a2a54a" id="m-existsOptional-3a4437a2a54a"></a>

```java
public abstract boolean existsOptional(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#cls-DpTrans), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

If we have presence containers or optional leafs (empty leafs) without a
 type, we cannot use the getElem() callback to read such a leaf - since
 the element is typeless.

 Additionally, the getElem() callback cannot be used as an existence
 test by requesting a key leaf for entries in operational data lists
 without keys, or for leaf-list entries, since there are no
 key leafs in those cases.

 In all the above cases, we need to implement the existsOptional()
 callback method.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction
- `com.tailf.conf.ConfObject[] kp` - The keypath

**Returns:** `true` or `false`

**Throws**

- `DpCallbackException` - Callback method failed.

### getAttrs(DpTrans, ConfObject[], List<ConfAttributeValue>) <a href="#m-getAttrs-47ef46821576" id="m-getAttrs-47ef46821576"></a>

```java
public abstract int getAttrs(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    java.util.List<com.tailf.conf.ConfAttributeValue> attrList
)
    throws com.tailf.dp.DpCallbackException, IllegalArgumentException
```

Types: [DpTrans](DpTrans.md#cls-DpTrans), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfAttributeValue](../conf/ConfAttributeValue.md#cls-ConfAttributeValue), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

This callback only needs to be implemented for callpoints specified for
 configuration data, and only if attributes are enabled in the server
 configuration (/confdConfig/enableAttributes set to true).

 These are the
 currently supported attributes:

 [`ConfAttributeType#TAGS`](../conf/ConfAttributeType.md#m-TAGS)
 (values are ConfList of ConfBuf)
 [`ConfAttributeType#ANNOTATION`](../conf/ConfAttributeType.md#m-ANNOTATION) (value is ConfBuf)
 [`ConfAttributeType#INACTIVE`](../conf/ConfAttributeType.md#m-INACTIVE) (not used)
 [`ConfAttributeType#ORIGIN`](../conf/ConfAttributeType.md#m-ORIGIN)
 (value is Confidentityref)

 The attrs parameter is an list of ConfAttributeValue objects with
 attributeType set to requested attribute and attributeValue set to null.
 If the list is empty all attributes are requested.

 If the node given by kp does not exist, the callback should throw an
 IllegalArgumentException, otherwise it should set values to the elements
 of the attrs list, or even add attributes if the list was empty.

 Must return [`Conf#REPLY_OK`](../conf/Conf.md#m-REPLY_OK) on success or
 [`Conf#REPLY_DELAYED_RESPONSE`](../conf/Conf.md#m-REPLY_DELAYED_RESPONSE).

 On error a [`DpCallbackException`](DpCallbackException.md#cls-DpCallbackException) should be thrown

**Parameters**

- `com.tailf.dp.DpTrans trans` - current transaction
- `com.tailf.conf.ConfObject[] kp` - keypath for node to set attributes on
- `java.util.List<com.tailf.conf.ConfAttributeValue> attrList` - list of ConfAttributeValue to populate as result

**Returns:** `Conf.REPLY_OK` or
    `Conf.REPLY_DELAYED_RESPONSE` on successful call

**Throws**

- `DpCallbackException` - on unsuccessful call

### getCase(DpTrans, ConfObject[], ConfObject[]) <a href="#m-getCase-24568d257ce7" id="m-getCase-24568d257ce7"></a>

```java
public abstract com.tailf.conf.ConfObject getCase(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfObject[] choice
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DpTrans](DpTrans.md#cls-DpTrans), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

This callback method needs to return the currently chosen 'case' for a
 'choice' construct. The choice construct is an array of ConfTag values.
 The reason for this when nestled choice in choice definitions are
 addressed, for the "non-nestled" scenario the array is of length 1.

 The callback must return either a ConfTag containing
 the selected case or ConfDefault or ConfNoExist. A null return value
 is equivalent to ConfNoExist.
 success.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction
- `com.tailf.conf.ConfObject[] kp` - The keypath
- `com.tailf.conf.ConfObject[] choice` - The choice name(s) as an array of ConfTag

**Returns:** The ConfTag, ConfDefault, ConfNoExist or null.

**Throws**

- `DpCallbackException` - Callback method failed.

### getElem(DpTrans, ConfObject[]) <a href="#m-getElem-baf9006121df" id="m-getElem-baf9006121df"></a>

```java
public abstract com.tailf.conf.ConfValue getElem(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [DpTrans](DpTrans.md#cls-DpTrans), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

This callback method needs to return a specific leaf value.

 The callback  must return a [`ConfValue`](../conf/ConfValue.md#cls-ConfValue) on
 success. The implementation of `getElem` must
 be prepared to return all the leafs including the key(s).

 When ConfD/NCS invokes `getElem` on a key leaf it is
 an existence test. The application should verify whether the
 object exists or not. If an object doesn't exists this method
 must return null.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction
- `com.tailf.conf.ConfObject[] kp` - The keypath structured as a reversed array of
           [`ConfTag`](../conf/ConfTag.md#cls-ConfTag) and/or
           [`ConfKey`](../conf/ConfKey.md#cls-ConfKey) objects

**Returns:** The value of the element

**Throws**

- `DpCallbackException` - Callback method failure.

### getIteratorKey(DpTrans, ConfObject[], Object) <a href="#m-getIteratorKey-6df7c38f65f8" id="m-getIteratorKey-6df7c38f65f8"></a>

```java
public abstract com.tailf.conf.ConfKey getIteratorKey(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey), [DpTrans](DpTrans.md#cls-DpTrans), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

The following callback is used with the iterators above. For each object
 returned by the iterator the getKey method will be invoked which must
 return the ConfKey for the given object.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction
- `com.tailf.conf.ConfObject[] kp` - The keypath
- `Object obj` - The object returned by the iterator

**Returns:** The configuration key of the provided object.

**Throws**

- `DpCallbackException` - Callback method failed.

### getIteratorObject(DpTrans, ConfObject[], Object) <a href="#m-getIteratorObject-425632c26c31" id="m-getIteratorObject-425632c26c31"></a>

```java
public abstract com.tailf.conf.ConfObject[] getIteratorObject(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DpTrans](DpTrans.md#cls-DpTrans), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

The following callback is used with the iterators above.
 For each object returned by the iterator, the
 `getIteratorObject` method will be invoked and it must
 return either of the following:


- An array of [`ConfValue`](../conf/ConfValue.md#cls-ConfValue)s describing the object
    - An array of [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam)s describing the
      object
 If a ConfValue array is used, unset values must be represented by a
 [`ConfNoExists`](../conf/ConfNoExists.md#cls-ConfNoExists) element. Each list contained within
 the object must also be represented by a single ConfNoExists, regardless
 of whether it contains any elements or not. If a ConfXMLParam array is
 used, lists and missing values should simply be omitted from the array.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction
- `com.tailf.conf.ConfObject[] kp` - The keypath
- `Object obj` - The object returned by the iterator

**Returns:** An array of all values in the object.

**Throws**

- `DpCallbackException` - Callback method failed.

### getIteratorObjectList(DpTrans, ConfObject[], Object, Iterator<? extends Object>) <a href="#m-getIteratorObjectList-17a0707464f1" id="m-getIteratorObjectList-17a0707464f1"></a>

```java
public abstract java.util.List<com.tailf.conf.ConfObject[]> getIteratorObjectList(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    Object obj,
    java.util.Iterator<? extends Object> iterator
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DpTrans](DpTrans.md#cls-DpTrans), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

This callback is used in place of getIteratorObject when a
 `List` of objects is requested rather than a single instance.
 This is of interest when lists are big and performance requires larger
 chunks to be sent at once.

 The first object from the iterator is already retrieved and delivered
 in the `obj` parameter. It is mandatory to put this object
 first in the list. An arbitrary number of additional objects can then be
 retrieved using the iterator.

 The returned list should contain either [`ConfValue`](../conf/ConfValue.md#cls-ConfValue) arrays or
 [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam) arrays. See
 [`getIteratorObject`](DpDataCallback.md#m-getIteratorObject-425632c26c31) for more information on how to format
 the return values.

 It is important to return all objects retrieved by the iterator.
 Any item that is retrieved but not returned will be lost.

 To override the global object cache timeout for the response, return
 an object of the type [`NextObjectList`](NextObjectList.md#cls-NextObjectList)ConfObject[], for
 example an instance of [`NextObjectArrayList`](NextObjectArrayList.md#cls-NextObjectArrayList)ConfObject[]
 where you have set the desired timeout via the
 [`NextObjectArrayList#setTimeout`](NextObjectArrayList.md#m-setTimeout-cbe758ecb5d8) method.


 For backwards compatibility reasons, you can return a
 ListConfObject[] instance of a class that doesn't implement the
 NextObjectList interface, in which case the default object cache timeout
 will be in effect for the response.

 Also for backwards compatibility reasons, it is acceptable for this
 method to return a List[`ConfValue`](../conf/ConfValue.md#cls-ConfValue)[] instead of a
 ListConfObject[].

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction
- `com.tailf.conf.ConfObject[] kp` - The keypath
- `Object obj` - The first object returned by the iterator
- `java.util.Iterator<? extends Object> iterator` - The iterator to optionally retrieve more objects from

**Returns:** A List of objects where each object is represented as an
         array of ConfValues or ConfXMLParams.

**Throws**

- `DpCallbackException` - Callback method fails

### getObject(DpTrans, ConfObject[]) <a href="#m-getObject-b2d87f9b9270" id="m-getObject-b2d87f9b9270"></a>

```java
public abstract com.tailf.conf.ConfObject[] getObject(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DpTrans](DpTrans.md#cls-DpTrans), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

The purpose of the callback is to return an array of values,
 corresponding to a complete list entry in one swoop. The callback will
 only be called for list entries (i.e. getElem() is still needed for
 elements that are not sub-elements of a list entry).

 If the returned array is also ConfValue[] the complete list of values in
 there defined order is expected.

 However, as an option, it is possible to return an array of type
 ConfXMLParam[] instead. The difference being that the values are tagged
 with the node names from the data model - this means that non-existing
 values can simply be omitted from the array. Additionally the key leafs
 can be omitted, since they are already known by the server. - if the key
 leafs are included, they will be ignored. Finally, in e.g. the case of a
 container with both config and non-config data, where the config data is
 in CDB and only the non-config data provided by the callback, the config
 elements can be omitted (for the ConfValue[] return type they must be
 included as ConfNoExists elements).

 However, although the ConfXMLParam array format can represent nested
 lists, these must not be passed via this function, since the get_object()
 callback only pertains to a single entry of one list. Nodes representing
 sub-lists must thus be omitted from the array, and the server will issue
 separate get_object() invocations to retrieve the data for those.

 If the requested entry does not exist this callback should return null.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction
- `com.tailf.conf.ConfObject[] kp` - The keypath

**Returns:** An array of all values.

**Throws**

- `DpCallbackException` - Callback method failed.

### iterator(DpTrans, ConfObject[]) <a href="#m-iterator-89c62926f3e8" id="m-iterator-89c62926f3e8"></a>

```java
public abstract java.util.Iterator<? extends Object> iterator(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#cls-DpTrans), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

This callback makes it possible for ConfD/NCS to traverse a set of list
 entries.

 This method is a specific java construct which is actually not
 registered on the server side. Instead it is a mandatory tool for the
 `GET_NEXT/GET_NEXT_OBJECT` functionality to work. If either the
 `getIteratorKey(DpTrans, ConfObject[], Object)`
 or the `getIteratorObject(DpTrans, ConfObject[], Object)` is
 registered this method must also be registered.

 The Iterator is stored internally by [`Dp`](Dp.md#cls-Dp) and
 when a `GET_NEXT/GET_NEXT_OBJECT` request is issued the iterator
 is called to get the next element in the list.

 Note that the iterator is free to return any POJO Object
 and it is instead the responsibility of the `getIteratorKey` or
 `getIteratorObject` to render the return values.

**Parameters**

- `com.tailf.dp.DpTrans trans` - DpTrans object for current transaction
- `com.tailf.conf.ConfObject[] kp` - Keypath for the list that is subject for traversal

**Returns:** An Java Iterator for traversing objects in the table.

**Throws**

- `DpCallbackException` - if Callback method failed.

### iterator(DpTrans, ConfObject[], ConfFindNextType, ConfKey) <a href="#m-iterator-5d250fbe6a8b" id="m-iterator-5d250fbe6a8b"></a>

```java
public abstract com.tailf.dp.DpDataFindNextIterator iterator(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfFindNextType type,
    com.tailf.conf.ConfKey key
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDataFindNextIterator](DpDataFindNextIterator.md#cls-DpDataFindNextIterator), [DpTrans](DpTrans.md#cls-DpTrans), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfFindNextType](../conf/ConfFindNextType.md#cls-ConfFindNextType), [ConfKey](../conf/ConfKey.md#cls-ConfKey), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

This iterator method is a specialization of
 `iterator(DpTrans, ConfObject[])`
 in that it returns an extended iterator i.e. DpFindNextIterator.

 This iterator does the same job as the normal Java Iterator
 but it also has a
 [`DpDataFindNextIterator#findNext(DpTrans,
         ConfObject[], ConfFindNextType, ConfKey)`](DpDataFindNextIterator.md#m-findNext-76a998cf9bff)
 method that is called if FIND_NEXT/FIND_NEXT_OBJECT is called.

 Note that this iterator is expected to be able to traverse using
 next()/hasNext() functions after a initial findNext(...) has been
 called and it will take precedence over the standard iterator method.

**Parameters**

- `com.tailf.dp.DpTrans trans` - DpTrans object for current transaction
- `com.tailf.conf.ConfObject[] kp` - Keypath for the list that is subject for traversal
- `com.tailf.conf.ConfFindNextType type` - [`ConfFindNextType`](../conf/ConfFindNextType.md#cls-ConfFindNextType) describing the findNext behavior
- `com.tailf.conf.ConfKey key` - ConfKey which constitutes the search criteria

**Returns:** An Java Iterator subclass DpFindNextIterator.

**Throws**

- `DpCallbackException` - if Callback method failed.
- `DpCallbackException`

### iterator(DpTrans, ConfObject[], ConfFindNextType, ConfKey, DpListFilter) <a href="#m-iterator-b1da1a451977" id="m-iterator-b1da1a451977"></a>

```java
public abstract com.tailf.dp.DpDataFindNextIterator iterator(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfFindNextType type,
    com.tailf.conf.ConfKey key,
    com.tailf.dp.DpListFilter filter
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDataFindNextIterator](DpDataFindNextIterator.md#cls-DpDataFindNextIterator), [DpTrans](DpTrans.md#cls-DpTrans), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfFindNextType](../conf/ConfFindNextType.md#cls-ConfFindNextType), [ConfKey](../conf/ConfKey.md#cls-ConfKey), [DpListFilter](DpListFilter.md#cls-DpListFilter), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

Variant of the DpDataFindNextIterator-returning iterator above that may
 receive a DpListFilter instance which can be used to filter the list.
 Filtering the list is optional, if it is not done by the
 callback, it will be done server-side. If the callback implementation
 guarantees that the returned iterator is filtered, it can indicate this
 to the server by calling honorFilter(true) on the trans object.

 Note that this iterator will take precedence over all other iterators.

**Parameters**

- `com.tailf.dp.DpTrans trans` - DpTrans object for current transaction
- `com.tailf.conf.ConfObject[] kp` - Keypath for the list that is subject for traversal
- `com.tailf.conf.ConfFindNextType type` - [`ConfFindNextType`](../conf/ConfFindNextType.md#cls-ConfFindNextType) describing the findNext behavior
- `com.tailf.conf.ConfKey key` - ConfKey which constitutes the search criteria
- `com.tailf.dp.DpListFilter filter` - DpListFilter instance for filtering elements, or null
  if no filtering is requested

**Returns:** An Java Iterator subclass DpFindNextIterator.

**Throws**

- `DpCallbackException` - if Callback method failed.
- `DpCallbackException`

### iterator(DpTrans, ConfObject[], DpListFilter) <a href="#m-iterator-02bb74b2989b" id="m-iterator-02bb74b2989b"></a>

```java
public abstract java.util.Iterator<? extends Object> iterator(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.dp.DpListFilter filter
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#cls-DpTrans), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DpListFilter](DpListFilter.md#cls-DpListFilter), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

Variant of iterator that may receive a DpListFilter which can be used to
 filter the list. Filtering the list is optional, if it is not done by the
 callback, it will be done server-side. If the callback implementation
 guarantees that the returned iterator is filtered, it can indicate this
 to the server by calling honorFilter(true) on the trans object.

 Note that this iterator will take precedence over its non-filtering
 counterpart.

**Parameters**

- `com.tailf.dp.DpTrans trans` - DpTrans object for current transaction
- `com.tailf.conf.ConfObject[] kp` - Keypath for the list that is subject for traversal
- `com.tailf.dp.DpListFilter filter` - DpListFilter instance for filtering elements, or null
  if no filtering is requested

**Returns:** An Java Iterator for traversing objects in the table.

**Throws**

- `DpCallbackException` - if Callback method failed.

### mask() <a href="#m-mask-24c2fa29c6af" id="m-mask-24c2fa29c6af"></a>

```java
public abstract int mask()
```

Mask of flags for each method that is supported by this callback:


- [`M_EXISTS_OPTIONAL`](DpDataCallback.md#m-M_EXISTS_OPTIONAL)
   - [`M_GET_ELEM`](DpDataCallback.md#m-M_GET_ELEM)
     - [`M_GET_NEXT`](DpDataCallback.md#m-M_GET_NEXT)
       - [`M_SET_ELEM`](DpDataCallback.md#m-M_SET_ELEM)
         - [`M_CREATE`](DpDataCallback.md#m-M_CREATE)
           - [`M_REMOVE`](DpDataCallback.md#m-M_REMOVE)
             - [`M_NUM_INSTANCES`](DpDataCallback.md#m-M_NUM_INSTANCES)
               - [`M_GET_OBJECT`](DpDataCallback.md#m-M_GET_OBJECT)
                 - [`M_GET_NEXT_OBJECT`](DpDataCallback.md#m-M_GET_NEXT_OBJECT)
                   - [`M_GET_CASE`](DpDataCallback.md#m-M_GET_CASE)
                     - [`M_SET_CASE`](DpDataCallback.md#m-M_SET_CASE)
                       - [`M_GET_ATTRS`](DpDataCallback.md#m-M_GET_ATTRS)
                         - [`M_SET_ATTR`](DpDataCallback.md#m-M_SET_ATTR)
                           - [`M_MOVE_AFTER`](DpDataCallback.md#m-M_MOVE_AFTER)
                             - [`M_WRITE_ALL`](DpDataCallback.md#m-M_WRITE_ALL)
                               - [`M_WANT_FILTER`](DpDataCallback.md#m-M_WANT_FILTER)

### moveAfter(DpTrans, ConfObject[], ConfKey) <a href="#m-moveAfter-023d2bce078c" id="m-moveAfter-023d2bce078c"></a>

```java
public abstract int moveAfter(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfKey prevkey
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#cls-DpTrans), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfKey](../conf/ConfKey.md#cls-ConfKey), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

This callback only needs to be implemented if we provide configuration
 data that has YANG lists with a ordered-by user statement. The callback
 moves the list entry given by kp. If prevkey is NULL, the entry is moved
 first in the list, otherwise it is moved after the entry given by
 prevkey. In this case prevkey identifies an entry in the list.

 The callback must return Conf.REPLY_OK on success,
 Conf.REPLY_DELAYED_RESPONSE or Conf.REPLY_ACCUMULATE.

 On error an DpCallbackException should be thrown.

**Parameters**

- `com.tailf.dp.DpTrans trans` - current transaction
- `com.tailf.conf.ConfObject[] kp` - keypath for entry to move
- `com.tailf.conf.ConfKey prevkey` - position to entry which should be before the entry to move

**Returns:** `Conf.REPLY_OK`

**Throws**

- `DpCallbackException`

### numInstances(DpTrans, ConfObject[]) <a href="#m-numInstances-71fd723ecab5" id="m-numInstances-71fd723ecab5"></a>

```java
public abstract int numInstances(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#cls-DpTrans), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

This callback can optionally be implemented. The purpose is to return the
 number of instances of a list. Must return number of list entries on
 success

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction
- `com.tailf.conf.ConfObject[] kp` - The keypath

**Returns:** The number of instances

**Throws**

- `DpCallbackException` - Callback method failed.

### remove(DpTrans, ConfObject[]) <a href="#m-remove-93340909c9a0" id="m-remove-93340909c9a0"></a>

```java
public abstract int remove(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#cls-DpTrans), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

This callback is used to remove a presence container, list entry or empty
 leaf and all its sub elements.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction
- `com.tailf.conf.ConfObject[] kp` - The keypath

**Returns:** `Conf.REPLY_OK` or `Conf.REPLY_ACCUMULATE`

**Throws**

- `DpCallbackException` - Callback method failed.

### setAttr(DpTrans, ConfObject[], ConfAttributeValue) <a href="#m-setAttr-656af041deec" id="m-setAttr-656af041deec"></a>

```java
public abstract int setAttr(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfAttributeValue attr
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#cls-DpTrans), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfAttributeValue](../conf/ConfAttributeValue.md#cls-ConfAttributeValue), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

This callback also only needs to be implemented for callpoints specified
 for configuration data, and only if attributes are enabled in the server
 configuration (/confdConfig/enableAttributes set to true). See
 get_attrs() above for the supported attributes.

 The callback should set the attribute attr for the node given by kp to
 the value v. If the callback is invoked with NULL for the value argument,
 it means that the attribute should be deleted.

 The callback must return Conf.REPLY_OK on success,
 Conf.REPLY_DELAYED_RESPONSE or Conf.REPLY_ACCUMULATE.

 On error an DpCallbackException should be thrown.

**Parameters**

- `com.tailf.dp.DpTrans trans` - current transaction
- `com.tailf.conf.ConfObject[] kp` - keypath for node to set attributes on
- `com.tailf.conf.ConfAttributeValue attr` - ConfAttributeValue to set value

**Returns:** int

**Throws**

- `DpCallbackException`

### setCase(DpTrans, ConfObject[], ConfObject[], ConfTag) <a href="#m-setCase-430d4dbe7c83" id="m-setCase-430d4dbe7c83"></a>

```java
public abstract int setCase(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfObject[] choice,
    com.tailf.conf.ConfTag caseval
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#cls-DpTrans), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfTag](../conf/ConfTag.md#cls-ConfTag), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

This callback method sets the currently chosen 'case' for a 'choice'
 construct. The choice construct is an array of ConfTag values.
 The reason for this when nestled choice in choice definitions are
 addressed, for the "non-nestled" scenario the array is of length 1.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction
- `com.tailf.conf.ConfObject[] kp` - The keypath
- `com.tailf.conf.ConfObject[] choice` - The choice name(s) as an array of ConfTag
- `com.tailf.conf.ConfTag caseval` - The name of the case

**Returns:** `Conf.REPLY_OK`

**Throws**

- `DpCallbackException` - Callback method failed.

### setElem(DpTrans, ConfObject[], ConfValue) <a href="#m-setElem-8a5e46811f6e" id="m-setElem-8a5e46811f6e"></a>

```java
public abstract int setElem(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfValue newval
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#cls-DpTrans), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfValue](../conf/ConfValue.md#cls-ConfValue), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

This callback writes a data leaf. Note that an optional leaf (i.e. a leaf
 "type empty;" is created by a call to this method.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction
- `com.tailf.conf.ConfObject[] kp` - The keypath
- `com.tailf.conf.ConfValue newval` - The new value to be set

**Returns:** `Conf.REPLY_OK` or `Conf.REPLY_ACCUMULATE`

**Throws**

- `DpCallbackException` - Callback method failed.

### writeAll(DpTrans, ConfObject[]) <a href="#m-writeAll-a4604e96718c" id="m-writeAll-a4604e96718c"></a>

```java
public abstract int writeAll(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#cls-DpTrans), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

This callback method sets the currently chosen 'case' for a 'choice'
 construct.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction
- `com.tailf.conf.ConfObject[] kp` - The keypath

**Returns:** `Conf.REPLY_OK`

**Throws**

- `DpCallbackException` - Callback method failed.
