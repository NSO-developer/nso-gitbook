# DpDataFindNextIterator <a href="#dpdatafindnextiterator-36f0eadb3071" id="dpdatafindnextiterator-36f0eadb3071"></a>

```java
public interface com.tailf.dp.DpDataFindNextIterator
    extends java.util.Iterator<Object>
```

Extended Iterator interface used to get `findNext` functionality.


 This class is expected to be the return value of the
 DP Data Provider method
 [`DpDataCallback#iterator(DpTrans, ConfObject[], ConfFindNextType,
 ConfKey)`](DpDataCallback.md#iterator-5d250fbe6a8b)
 If this overlaid iterator method is implemented this implies that the
 data provider is capable of both getNext as the basic iterator as well
 as findNext which is the extended method in this interface.

 Iterators of this type are expected to be first called by a findNext to
 position at some element in a list. The iterator will then accept subsequent
 getNext calls from that initial position.

## Members

**Methods**:

- [findNext(DpTrans, ConfObject[], ConfFindNextType, ConfKey)](#findnext-76a998cf9bff)

## Methods

### findNext(DpTrans, ConfObject[], ConfFindNextType, ConfKey) <a href="#findnext-76a998cf9bff" id="findnext-76a998cf9bff"></a>

```java
public abstract Object findNext(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfFindNextType type,
    com.tailf.conf.ConfKey key
)
```

Types: [DpTrans](DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfFindNextType](../conf/ConfFindNextType.md#conffindnexttype-c34c1027a581), [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867)

This method is called by Dp when a FIND_NEXT or a FIND_NEXT_OBJECT call
 is issued. This iterator method is called to retrieve the element and
 the object is then rendered with the normal
 [`DpDataCallback#getIteratorKey(DpTrans, ConfObject[], Object)`](DpDataCallback.md#getiteratorkey-6df7c38f65f8)
 or [`DpDataCallback#getIteratorObject(DpTrans, ConfObject[],
 Object)`](DpDataCallback.md#getiteratorobject-425632c26c31)
 methods before the element returned.

**Parameters**

- `com.tailf.dp.DpTrans trans` - current DpTrans object
- `com.tailf.conf.ConfObject[] kp` - keypath for the iterator
- `com.tailf.conf.ConfFindNextType type` - ConfFindNextType enum indicating this or next element
- `com.tailf.conf.ConfKey key` - value for the searched element

**Returns:** retrieved element
