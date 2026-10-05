<a id="s-NavuChange"></a>
# NavuChange

```java
public class com.tailf.navu.NavuChange
```

This class handles changes on a node. The changes can be CREATE or
 DELETE if the node has been created or deleted and MODIFY if a
 subordinate node has been created, deleted or modified.

## Members

**Constructors**:

- [NavuChange(ConfKey)](#s-NavuChange-1)

**Methods**:

- [add(NavuNode)](#s-add)
- [contains(NavuNode)](#s-contains)
- [get(int)](#s-get)
- [getChange()](#s-getChange)
- [getKey()](#s-getKey)
- [isEmpty()](#s-isEmpty)
- [iterator()](#s-iterator)
- [setChange(DiffIterateOperFlag)](#s-setChange)
- [size()](#s-size)
- [subList(int, int)](#s-subList)
- [toArray()](#s-toArray)
- [toArray(T[])](#s-toArray-1)

## Constructors

<a id="s-NavuChange-1"></a>
### NavuChange(ConfKey)

```java
protected NavuChange(com.tailf.conf.ConfKey key)
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey)

**Parameters**

- `com.tailf.conf.ConfKey key` - the node name of the change


## Methods

<a id="s-add"></a>
### add(NavuNode)

```java
public boolean add(com.tailf.navu.NavuNode e)
```

Types: [NavuNode](NavuNode.md#s-NavuNode)

Adds a node.

**Parameters**

- `com.tailf.navu.NavuNode e` - changed node.

**Returns:** true if this node already was added.

<a id="s-contains"></a>
### contains(NavuNode)

```java
public boolean contains(com.tailf.navu.NavuNode node)
```

Types: [NavuNode](NavuNode.md#s-NavuNode)

Checks if a node is already contained by the change.

**Parameters**

- `com.tailf.navu.NavuNode node` - a node to check.

**Returns:** true if it is contained.

<a id="s-get"></a>
### get(int)

```java
public com.tailf.navu.NavuNode get(int index)
```

Types: [NavuNode](NavuNode.md#s-NavuNode)

Returns a node at a certain position.

**Parameters**

- `int index` - the index to use

**Returns:** the node at this position. null if no node exists.

<a id="s-getChange"></a>
### getChange()

```java
public com.tailf.conf.DiffIterateOperFlag getChange()
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)

**Returns:** the change type.

<a id="s-getKey"></a>
### getKey()

```java
public com.tailf.conf.ConfKey getKey()
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey)

**Returns:** the key of the change.

<a id="s-isEmpty"></a>
### isEmpty()

```java
public boolean isEmpty()
```

**Returns:** true if no changes exists.

<a id="s-iterator"></a>
### iterator()

```java
public java.util.Iterator<com.tailf.navu.NavuNode> iterator()
```

Types: [NavuNode](NavuNode.md#s-NavuNode)

**Returns:** an iterator of the changes.

<a id="s-setChange"></a>
### setChange(DiffIterateOperFlag)

```java
public void setChange(com.tailf.conf.DiffIterateOperFlag op)
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)

Sets the change type.

**Parameters**

- `com.tailf.conf.DiffIterateOperFlag op` - change type.

<a id="s-size"></a>
### size()

```java
public int size()
```

**Returns:** the number of changes.

<a id="s-subList"></a>
### subList(int, int)

```java
public java.util.List<com.tailf.navu.NavuNode> subList(int startIndex, int stopindex)
```

Types: [NavuNode](NavuNode.md#s-NavuNode)

**Parameters**

- `int startIndex` - first index of the sub-list
- `int stopindex` - stop index (exclusive)

**Returns:** a subList

<a id="s-toArray"></a>
### toArray()

```java
public Object[] toArray()
```

Converts the list of changes to an array.

**Returns:** an array of objects.

<a id="s-toArray-1"></a>
### toArray(T[])

```java
public <T> T[] toArray(T[] a)
```

**Parameters**

- `T[] a`

**Returns:** an array of type T.
