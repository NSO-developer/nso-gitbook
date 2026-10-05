# DpDataFindNextIterator <a href="#cls-DpDataFindNextIterator" id="cls-DpDataFindNextIterator"></a>

```java
public interface com.tailf.dp.DpDataFindNextIterator
    extends java.util.Iterator<Object>
```

Extended Iterator interface used to get `findNext` functionality.


 This class is expected to be the return value of the
 DP Data Provider method
 [`DpDataCallback#iterator(DpTrans, ConfObject[], ConfFindNextType,
 ConfKey)`](DpDataCallback.md#m-iterator-5d250fbe6a8b)
 If this overlaid iterator method is implemented this implies that the
 data provider is capable of both getNext as the basic iterator as well
 as findNext which is the extended method in this interface.

 Iterators of this type are expected to be first called by a findNext to
 position at some element in a list. The iterator will then accept subsequent
 getNext calls from that initial position.

## Members

**Methods**:

- [findNext(DpTrans, ConfObject[], ConfFindNextType, ConfKey)](#m-findNext-76a998cf9bff)

## Methods

### findNext(DpTrans, ConfObject[], ConfFindNextType, ConfKey) <a href="#m-findNext-76a998cf9bff" id="m-findNext-76a998cf9bff"></a>

```java
public abstract Object findNext(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfFindNextType type,
    com.tailf.conf.ConfKey key
)
```

Types: [DpTrans](DpTrans.md#cls-DpTrans), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfFindNextType](../conf/ConfFindNextType.md#cls-ConfFindNextType), [ConfKey](../conf/ConfKey.md#cls-ConfKey)

This method is called by Dp when a FIND_NEXT or a FIND_NEXT_OBJECT call
 is issued. This iterator method is called to retrieve the element and
 the object is then rendered with the normal
 [`DpDataCallback#getIteratorKey(DpTrans, ConfObject[], Object)`](DpDataCallback.md#m-getIteratorKey-6df7c38f65f8)
 or [`DpDataCallback#getIteratorObject(DpTrans, ConfObject[],
 Object)`](DpDataCallback.md#m-getIteratorObject-425632c26c31)
 methods before the element returned.

**Parameters**

- `com.tailf.dp.DpTrans trans` - current DpTrans object
- `com.tailf.conf.ConfObject[] kp` - keypath for the iterator
- `com.tailf.conf.ConfFindNextType type` - ConfFindNextType enum indicating this or next element
- `com.tailf.conf.ConfKey key` - value for the searched element

**Returns:** retrieved element
