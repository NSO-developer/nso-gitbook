# NavuChange <a href="#navuchange-03ae6b7f3c34" id="navuchange-03ae6b7f3c34"></a>

```java
public class com.tailf.navu.NavuChange
```

This class handles changes on a node. The changes can be CREATE or
 DELETE if the node has been created or deleted and MODIFY if a
 subordinate node has been created, deleted or modified.

## Members

**Constructors**:

- [NavuChange\(ConfKey\)](#navuchange-f9837a9c397b)

**Methods**:

- [add\(NavuNode\)](#add-2bf2a742c2a6)
- [contains\(NavuNode\)](#contains-d5aea0a3a91f)
- [get\(int\)](#get-5bd20d94a8b1)
- [getChange\(\)](#getchange-6190c59d58da)
- [getKey\(\)](#getkey-9a8856159458)
- [isEmpty\(\)](#isempty-4dde48126244)
- [iterator\(\)](#iterator-188aa52d1f86)
- [setChange\(DiffIterateOperFlag\)](#setchange-05fa40d4fa0e)
- [size\(\)](#size-c6d8505255fd)
- [subList\(int, int\)](#sublist-0fe73c4cdfba)
- [toArray\(\)](#toarray-4819af4b68f9)
- [toArray\(T\[\]\)](#toarray-d0a3b39b53fc)

## Constructors

### NavuChange(ConfKey) <a href="#navuchange-f9837a9c397b" id="navuchange-f9837a9c397b"></a>

```java
protected NavuChange(com.tailf.conf.ConfKey key)
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867)

**Parameters**

- `com.tailf.conf.ConfKey key` - the node name of the change


## Methods

### add(NavuNode) <a href="#add-2bf2a742c2a6" id="add-2bf2a742c2a6"></a>

```java
public boolean add(com.tailf.navu.NavuNode e)
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)

Adds a node.

**Parameters**

- `com.tailf.navu.NavuNode e` - changed node.

**Returns:** true if this node already was added.

### contains(NavuNode) <a href="#contains-d5aea0a3a91f" id="contains-d5aea0a3a91f"></a>

```java
public boolean contains(com.tailf.navu.NavuNode node)
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)

Checks if a node is already contained by the change.

**Parameters**

- `com.tailf.navu.NavuNode node` - a node to check.

**Returns:** true if it is contained.

### get(int) <a href="#get-5bd20d94a8b1" id="get-5bd20d94a8b1"></a>

```java
public com.tailf.navu.NavuNode get(int index)
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)

Returns a node at a certain position.

**Parameters**

- `int index` - the index to use

**Returns:** the node at this position. null if no node exists.

### getChange() <a href="#getchange-6190c59d58da" id="getchange-6190c59d58da"></a>

```java
public com.tailf.conf.DiffIterateOperFlag getChange()
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec)

**Returns:** the change type.

### getKey() <a href="#getkey-9a8856159458" id="getkey-9a8856159458"></a>

```java
public com.tailf.conf.ConfKey getKey()
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867)

**Returns:** the key of the change.

### isEmpty() <a href="#isempty-4dde48126244" id="isempty-4dde48126244"></a>

```java
public boolean isEmpty()
```

**Returns:** true if no changes exists.

### iterator() <a href="#iterator-188aa52d1f86" id="iterator-188aa52d1f86"></a>

```java
public java.util.Iterator<com.tailf.navu.NavuNode> iterator()
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)

**Returns:** an iterator of the changes.

### setChange(DiffIterateOperFlag) <a href="#setchange-05fa40d4fa0e" id="setchange-05fa40d4fa0e"></a>

```java
public void setChange(com.tailf.conf.DiffIterateOperFlag op)
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec)

Sets the change type.

**Parameters**

- `com.tailf.conf.DiffIterateOperFlag op` - change type.

### size() <a href="#size-c6d8505255fd" id="size-c6d8505255fd"></a>

```java
public int size()
```

**Returns:** the number of changes.

### subList(int, int) <a href="#sublist-0fe73c4cdfba" id="sublist-0fe73c4cdfba"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> subList(int startIndex, int stopindex)
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)

**Parameters**

- `int startIndex` - first index of the sub-list
- `int stopindex` - stop index (exclusive)

**Returns:** a subList

### toArray() <a href="#toarray-4819af4b68f9" id="toarray-4819af4b68f9"></a>

```java
public Object[] toArray()
```

Converts the list of changes to an array.

**Returns:** an array of objects.

### toArray(T[]) <a href="#toarray-d0a3b39b53fc" id="toarray-d0a3b39b53fc"></a>

```java
public <T> T[] toArray(T[] a)
```

**Parameters**

- `T[] a`

**Returns:** an array of type T.
