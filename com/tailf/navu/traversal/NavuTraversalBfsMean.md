<a id="cls-NavuTraversalBfsMean"></a>
# NavuTraversalBfsMean

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

- [NavuTraversalBfsMean()](#m-navutraversalbfsmean-c7c973dd9b7d)

**Methods**:

- [traverse(NavuNode, List<TraversalFilter>)](#m-traverse-e72c3ea2612b)

## Constructors

<a id="m-navutraversalbfsmean-c7c973dd9b7d"></a>
### NavuTraversalBfsMean()

```java
public NavuTraversalBfsMean()
```


## Methods

<a id="m-traverse-e72c3ea2612b"></a>
### traverse(NavuNode, List<TraversalFilter>)

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
