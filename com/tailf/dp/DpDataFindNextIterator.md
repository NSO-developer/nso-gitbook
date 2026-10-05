<a id="s-DpDataFindNextIterator"></a>
# DpDataFindNextIterator

```java
public interface com.tailf.dp.DpDataFindNextIterator
    extends java.util.Iterator<Object>
```

Extended Iterator interface used to get `findNext` functionality.


 This class is expected to be the return value of the
 DP Data Provider method
 [`DpDataCallback`](DpDataCallback.md#s-DpDataCallback)
 If this overlaid iterator method is implemented this implies that the
 data provider is capable of both getNext as the basic iterator as well
 as findNext which is the extended method in this interface.

 Iterators of this type are expected to be first called by a findNext to
 position at some element in a list. The iterator will then accept subsequent
 getNext calls from that initial position.

## Members

**Methods**:

- [findNext(DpTrans, ConfObject[], ConfFindNextType, ConfKey)](#s-findNext)

## Methods

<a id="s-findNext"></a>
### findNext(DpTrans, ConfObject[], ConfFindNextType, ConfKey)

```java
public abstract Object findNext(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfFindNextType type,
    com.tailf.conf.ConfKey key
)
```

Types: [DpTrans](DpTrans.md#s-DpTrans), [ConfObject](../conf/ConfObject.md#s-ConfObject), [ConfFindNextType](../conf/ConfFindNextType.md#s-ConfFindNextType), [ConfKey](../conf/ConfKey.md#s-ConfKey)

This method is called by Dp when a FIND_NEXT or a FIND_NEXT_OBJECT call
 is issued. This iterator method is called to retrieve the element and
 the object is then rendered with the normal
 [`DpDataCallback`](DpDataCallback.md#s-DpDataCallback)
 or [`DpDataCallback`](DpDataCallback.md#s-DpDataCallback)
 methods before the element returned.

**Parameters**

- `com.tailf.dp.DpTrans trans` - current DpTrans object
- `com.tailf.conf.ConfObject[] kp` - keypath for the iterator
- `com.tailf.conf.ConfFindNextType type` - ConfFindNextType enum indicating this or next element
- `com.tailf.conf.ConfKey key` - value for the searched element

**Returns:** retrieved element
