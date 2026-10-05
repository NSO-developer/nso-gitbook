# NavuTreeTraversal <a href="#navutreetraversal-7a92763e1540" id="navutreetraversal-7a92763e1540"></a>

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

- [addFilter(TraversalFilter)](#addfilter-8eb81a3c72a2)
- [createInstance(NavuContext, NavuTraversalMean)](#createinstance-60ebd53e9e1f)
- [iterator(NavuContext)](#iterator-56e43ce23a9e)
- [iterator(NavuNode)](#iterator-509e808ecab4)
- [printChain(NavuNode)](#printchain-5285eb03e708)
- [traverse()](#traverse-4f872e3540cb)

## Methods

### addFilter(TraversalFilter) <a href="#addfilter-8eb81a3c72a2" id="addfilter-8eb81a3c72a2"></a>

```java
public void addFilter(com.tailf.navu.traversal.TraversalFilter filter)
```

Types: [TraversalFilter](TraversalFilter.md#traversalfilter-4e27b24c67a1)

**Parameters**

- `com.tailf.navu.traversal.TraversalFilter filter`

### createInstance(NavuContext, NavuTraversalMean) <a href="#createinstance-60ebd53e9e1f" id="createinstance-60ebd53e9e1f"></a>

```java
public static com.tailf.navu.traversal.NavuTreeTraversal createInstance(
    com.tailf.navu.NavuContext ctx,
    com.tailf.navu.traversal.NavuTraversalMean travmeth
)
    throws com.tailf.navu.NavuException
```

Types: [NavuTreeTraversal](NavuTreeTraversal.md#navutreetraversal-7a92763e1540), [NavuContext](../NavuContext.md#navucontext-2974e9f92a9e), [NavuTraversalMean](NavuTraversalMean.md#navutraversalmean-65fcdcfa38d1), [NavuException](../NavuException.md#navuexception-d80fa0cb4f3f)

Factory method to retrieve an instance of this class.

**Parameters**

- `com.tailf.navu.NavuContext ctx`
- `com.tailf.navu.traversal.NavuTraversalMean travmeth`

**Returns:** an instance of this class

### iterator(NavuContext) <a href="#iterator-56e43ce23a9e" id="iterator-56e43ce23a9e"></a>

```java
public static java.util.Iterator<com.tailf.navu.NavuNode> iterator(com.tailf.navu.NavuContext ctx)
```

Types: [NavuNode](../NavuNode.md#navunode-73944820c8db), [NavuContext](../NavuContext.md#navucontext-2974e9f92a9e)

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

### iterator(NavuNode) <a href="#iterator-509e808ecab4" id="iterator-509e808ecab4"></a>

```java
public static java.util.Iterator<com.tailf.navu.NavuNode> iterator(
    com.tailf.navu.NavuNode startNode
)
```

Types: [NavuNode](../NavuNode.md#navunode-73944820c8db)

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

### printChain(NavuNode) <a href="#printchain-5285eb03e708" id="printchain-5285eb03e708"></a>

```java
public void printChain(com.tailf.navu.NavuNode node)
```

Types: [NavuNode](../NavuNode.md#navunode-73944820c8db)

**Parameters**

- `com.tailf.navu.NavuNode node`

### traverse() <a href="#traverse-4f872e3540cb" id="traverse-4f872e3540cb"></a>

```java
public java.util.Set<String> traverse() throws com.tailf.navu.NavuException
```

Types: [NavuException](../NavuException.md#navuexception-d80fa0cb4f3f)

Start the traversal process.


 For each NavuNode encountered by the process, all added filters
 will be invoked.

**Returns:** Set of all visited paths
