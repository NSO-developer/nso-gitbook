<a id="s-NavuTreeTraversal"></a>
# NavuTreeTraversal

```java
public class com.tailf.navu.traversal.NavuTreeTraversal
```

Starting point for both *Active* and *Passive* mode traversal



 Starting class from which one can retrieve an iterator
 or create an instance for passive mode traversal.
 In passive mode, the user registers one or more filter methods which are
 called for each `NavuNode` encountered by the traversal.

## Members

**Methods**:

- [addFilter(TraversalFilter)](#s-addFilter)
- [createInstance(NavuContext, NavuTraversalMean)](#s-createInstance)
- [iterator(NavuContext)](#s-iterator)
- [iterator(NavuNode)](#s-iterator-1)
- [printChain(NavuNode)](#s-printChain)
- [traverse()](#s-traverse)

## Methods

<a id="s-addFilter"></a>
### addFilter(TraversalFilter)

```java
public void addFilter(com.tailf.navu.traversal.TraversalFilter filter)
```

Types: [TraversalFilter](TraversalFilter.md#s-TraversalFilter)

**Parameters**

- `com.tailf.navu.traversal.TraversalFilter filter`

<a id="s-createInstance"></a>
### createInstance(NavuContext, NavuTraversalMean)

```java
public static com.tailf.navu.traversal.NavuTreeTraversal createInstance(
    com.tailf.navu.NavuContext ctx,
    com.tailf.navu.traversal.NavuTraversalMean travmeth
)
    throws com.tailf.navu.NavuException
```

Types: [NavuTreeTraversal](NavuTreeTraversal.md#s-NavuTreeTraversal), [NavuContext](../NavuContext.md#s-NavuContext), [NavuTraversalMean](NavuTraversalMean.md#s-NavuTraversalMean), [NavuException](../NavuException.md#s-NavuException)

Factory method to retrieve an instance of this class.

**Parameters**

- `com.tailf.navu.NavuContext ctx`
- `com.tailf.navu.traversal.NavuTraversalMean travmeth`

**Returns:** an instance of this class

<a id="s-iterator"></a>
### iterator(NavuContext)

```java
public static java.util.Iterator<com.tailf.navu.NavuNode> iterator(com.tailf.navu.NavuContext ctx)
```

Types: [NavuNode](../NavuNode.md#s-NavuNode), [NavuContext](../NavuContext.md#s-NavuContext)

Retrieve an iterator to traverse the entire NAVU tree.



 This method should be used if we want to traverse
 the whole NAVU tree, i.e., every existing path for all loaded
 YANG models.


 This is the active mode of traversal, meaning it is up to the
 user to retrieve the next node using the `getNext()`
 method on the iterator. The nodes are returned in depth-first
 order.

**Parameters**

- `com.tailf.navu.NavuContext ctx` - NavuContext for which to perform the iteration

<a id="s-iterator-1"></a>
### iterator(NavuNode)

```java
public static java.util.Iterator<com.tailf.navu.NavuNode> iterator(
    com.tailf.navu.NavuNode startNode
)
```

Types: [NavuNode](../NavuNode.md#s-NavuNode)

Retrieve an iterator to traverse part of a NAVU tree.


 This method should be used if we want to traverse
 a part of the tree starting from the children of
 supplied `NavuNode`. This is the active mode of
 traversal, meaning it is up to the user to retrieve the next
 node using the `getNext()` method on the iterator.
 The nodes are returned in depth-first order.

**Parameters**

- `com.tailf.navu.NavuNode startNode` - the starting `NavuNode`, which will be used
                  as the root node for the iteration process

**Returns:** iterator starting from the given `NavuNode`

<a id="s-printChain"></a>
### printChain(NavuNode)

```java
public void printChain(com.tailf.navu.NavuNode node)
```

Types: [NavuNode](../NavuNode.md#s-NavuNode)

**Parameters**

- `com.tailf.navu.NavuNode node`

<a id="s-traverse"></a>
### traverse()

```java
public java.util.Set<String> traverse() throws com.tailf.navu.NavuException
```

Types: [NavuException](../NavuException.md#s-NavuException)

Start the traversal process.


 For each NavuNode encountered by the process, all added filters
 will be invoked.

**Returns:** Set of all visited paths
