<a id="cls-NavuChange"></a>
# NavuChange

```java
public class com.tailf.navu.NavuChange
```

This class handles changes on a node. The changes can be CREATE or
 DELETE if the node has been created or deleted and MODIFY if a
 subordinate node has been created, deleted or modified.

## Members

**Constructors**:

- [NavuChange(ConfKey)](#m-navuchange-f9837a9c397b)

**Methods**:

- [add(NavuNode)](#m-add-2bf2a742c2a6)
- [contains(NavuNode)](#m-contains-d5aea0a3a91f)
- [get(int)](#m-get-5bd20d94a8b1)
- [getChange()](#m-getchange-6190c59d58da)
- [getKey()](#m-getkey-9a8856159458)
- [isEmpty()](#m-isempty-4dde48126244)
- [iterator()](#m-iterator-188aa52d1f86)
- [setChange(DiffIterateOperFlag)](#m-setchange-05fa40d4fa0e)
- [size()](#m-size-c6d8505255fd)
- [subList(int, int)](#m-sublist-0fe73c4cdfba)
- [toArray()](#m-toarray-4819af4b68f9)
- [toArray(T[])](#m-toarray-d0a3b39b53fc)

## Constructors

<a id="m-navuchange-f9837a9c397b"></a>
### NavuChange(ConfKey)

```java
protected NavuChange(com.tailf.conf.ConfKey key)
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey)

**Parameters**

- `com.tailf.conf.ConfKey key` - the node name of the change


## Methods

<a id="m-add-2bf2a742c2a6"></a>
### add(NavuNode)

```java
public boolean add(com.tailf.navu.NavuNode e)
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

Adds a node.

**Parameters**

- `com.tailf.navu.NavuNode e` - changed node.

**Returns:** true if this node already was added.

<a id="m-contains-d5aea0a3a91f"></a>
### contains(NavuNode)

```java
public boolean contains(com.tailf.navu.NavuNode node)
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

Checks if a node is already contained by the change.

**Parameters**

- `com.tailf.navu.NavuNode node` - a node to check.

**Returns:** true if it is contained.

<a id="m-get-5bd20d94a8b1"></a>
### get(int)

```java
public com.tailf.navu.NavuNode get(int index)
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

Returns a node at a certain position.

**Parameters**

- `int index` - the index to use

**Returns:** the node at this position. null if no node exists.

<a id="m-getchange-6190c59d58da"></a>
### getChange()

```java
public com.tailf.conf.DiffIterateOperFlag getChange()
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

**Returns:** the change type.

<a id="m-getkey-9a8856159458"></a>
### getKey()

```java
public com.tailf.conf.ConfKey getKey()
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey)

**Returns:** the key of the change.

<a id="m-isempty-4dde48126244"></a>
### isEmpty()

```java
public boolean isEmpty()
```

**Returns:** true if no changes exists.

<a id="m-iterator-188aa52d1f86"></a>
### iterator()

```java
public java.util.Iterator<com.tailf.navu.NavuNode> iterator()
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

**Returns:** an iterator of the changes.

<a id="m-setchange-05fa40d4fa0e"></a>
### setChange(DiffIterateOperFlag)

```java
public void setChange(com.tailf.conf.DiffIterateOperFlag op)
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

Sets the change type.

**Parameters**

- `com.tailf.conf.DiffIterateOperFlag op` - change type.

<a id="m-size-c6d8505255fd"></a>
### size()

```java
public int size()
```

**Returns:** the number of changes.

<a id="m-sublist-0fe73c4cdfba"></a>
### subList(int, int)

```java
public java.util.List<com.tailf.navu.NavuNode> subList(int startIndex, int stopindex)
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

**Parameters**

- `int startIndex` - first index of the sub-list
- `int stopindex` - stop index (exclusive)

**Returns:** a subList

<a id="m-toarray-4819af4b68f9"></a>
### toArray()

```java
public Object[] toArray()
```

Converts the list of changes to an array.

**Returns:** an array of objects.

<a id="m-toarray-d0a3b39b53fc"></a>
### toArray(T[])

```java
public <T> T[] toArray(T[] a)
```

**Parameters**

- `T[] a`

**Returns:** an array of type T.
