# NavuChange <a href="#cls-NavuChange" id="cls-NavuChange"></a>

```java
public class com.tailf.navu.NavuChange
```

This class handles changes on a node. The changes can be CREATE or
 DELETE if the node has been created or deleted and MODIFY if a
 subordinate node has been created, deleted or modified.

## Members

**Constructors**:

- [NavuChange(ConfKey)](#m-NavuChange-f9837a9c397b)

**Methods**:

- [add(NavuNode)](#m-add-2bf2a742c2a6)
- [contains(NavuNode)](#m-contains-d5aea0a3a91f)
- [get(int)](#m-get-5bd20d94a8b1)
- [getChange()](#m-getChange-6190c59d58da)
- [getKey()](#m-getKey-9a8856159458)
- [isEmpty()](#m-isEmpty-4dde48126244)
- [iterator()](#m-iterator-188aa52d1f86)
- [setChange(DiffIterateOperFlag)](#m-setChange-05fa40d4fa0e)
- [size()](#m-size-c6d8505255fd)
- [subList(int, int)](#m-subList-0fe73c4cdfba)
- [toArray()](#m-toArray-4819af4b68f9)
- [toArray(T[])](#m-toArray-d0a3b39b53fc)

## Constructors

### NavuChange(ConfKey) <a href="#m-NavuChange-f9837a9c397b" id="m-NavuChange-f9837a9c397b"></a>

```java
protected NavuChange(com.tailf.conf.ConfKey key)
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey)

**Parameters**

- `com.tailf.conf.ConfKey key` - the node name of the change


## Methods

### add(NavuNode) <a href="#m-add-2bf2a742c2a6" id="m-add-2bf2a742c2a6"></a>

```java
public boolean add(com.tailf.navu.NavuNode e)
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

Adds a node.

**Parameters**

- `com.tailf.navu.NavuNode e` - changed node.

**Returns:** true if this node already was added.

### contains(NavuNode) <a href="#m-contains-d5aea0a3a91f" id="m-contains-d5aea0a3a91f"></a>

```java
public boolean contains(com.tailf.navu.NavuNode node)
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

Checks if a node is already contained by the change.

**Parameters**

- `com.tailf.navu.NavuNode node` - a node to check.

**Returns:** true if it is contained.

### get(int) <a href="#m-get-5bd20d94a8b1" id="m-get-5bd20d94a8b1"></a>

```java
public com.tailf.navu.NavuNode get(int index)
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

Returns a node at a certain position.

**Parameters**

- `int index` - the index to use

**Returns:** the node at this position. null if no node exists.

### getChange() <a href="#m-getChange-6190c59d58da" id="m-getChange-6190c59d58da"></a>

```java
public com.tailf.conf.DiffIterateOperFlag getChange()
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

**Returns:** the change type.

### getKey() <a href="#m-getKey-9a8856159458" id="m-getKey-9a8856159458"></a>

```java
public com.tailf.conf.ConfKey getKey()
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey)

**Returns:** the key of the change.

### isEmpty() <a href="#m-isEmpty-4dde48126244" id="m-isEmpty-4dde48126244"></a>

```java
public boolean isEmpty()
```

**Returns:** true if no changes exists.

### iterator() <a href="#m-iterator-188aa52d1f86" id="m-iterator-188aa52d1f86"></a>

```java
public java.util.Iterator<com.tailf.navu.NavuNode> iterator()
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

**Returns:** an iterator of the changes.

### setChange(DiffIterateOperFlag) <a href="#m-setChange-05fa40d4fa0e" id="m-setChange-05fa40d4fa0e"></a>

```java
public void setChange(com.tailf.conf.DiffIterateOperFlag op)
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

Sets the change type.

**Parameters**

- `com.tailf.conf.DiffIterateOperFlag op` - change type.

### size() <a href="#m-size-c6d8505255fd" id="m-size-c6d8505255fd"></a>

```java
public int size()
```

**Returns:** the number of changes.

### subList(int, int) <a href="#m-subList-0fe73c4cdfba" id="m-subList-0fe73c4cdfba"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> subList(int startIndex, int stopindex)
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

**Parameters**

- `int startIndex` - first index of the sub-list
- `int stopindex` - stop index (exclusive)

**Returns:** a subList

### toArray() <a href="#m-toArray-4819af4b68f9" id="m-toArray-4819af4b68f9"></a>

```java
public Object[] toArray()
```

Converts the list of changes to an array.

**Returns:** an array of objects.

### toArray(T[]) <a href="#m-toArray-d0a3b39b53fc" id="m-toArray-d0a3b39b53fc"></a>

```java
public <T> T[] toArray(T[] a)
```

**Parameters**

- `T[] a`

**Returns:** an array of type T.
