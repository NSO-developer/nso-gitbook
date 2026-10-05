# NavuTraversalBfsMean <a href="#cls-NavuTraversalBfsMean" id="cls-NavuTraversalBfsMean"></a>

```java
public class com.tailf.navu.traversal.NavuTraversalBfsMean
    implements com.tailf.navu.traversal.NavuTraversalMean
```

Types: [NavuTraversalMean](NavuTraversalMean.md#cls-NavuTraversalMean)

This implements the `NavuTraversalMean` for BFS
 (Breath-first traversal). .

  The  means of which
 to traverse the NAVU tree is through Breadth-first traversal

## Members

**Constructors**:

- [NavuTraversalBfsMean()](#m-NavuTraversalBfsMean-c7c973dd9b7d)

**Methods**:

- [traverse(NavuNode, List<TraversalFilter>)](#m-traverse-e72c3ea2612b)

## Constructors

### NavuTraversalBfsMean() <a href="#m-NavuTraversalBfsMean-c7c973dd9b7d" id="m-NavuTraversalBfsMean-c7c973dd9b7d"></a>

```java
public NavuTraversalBfsMean()
```


## Methods

### traverse(NavuNode, List<TraversalFilter>) <a href="#m-traverse-e72c3ea2612b" id="m-traverse-e72c3ea2612b"></a>

```java
public java.util.Set<String> traverse(
    com.tailf.navu.NavuNode root,
    java.util.List<com.tailf.navu.traversal.TraversalFilter> filters
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](../NavuNode.md#cls-NavuNode), [TraversalFilter](TraversalFilter.md#cls-TraversalFilter), [NavuException](../NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode root` - Starting point of the traversal
- `java.util.List<com.tailf.navu.traversal.TraversalFilter> filters`

**Returns:** Visited nodes
