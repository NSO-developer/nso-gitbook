<a id="s-NavuTraversalBfsMean"></a>
# NavuTraversalBfsMean

```java
public class com.tailf.navu.traversal.NavuTraversalBfsMean
    implements com.tailf.navu.traversal.NavuTraversalMean
```

Types: [NavuTraversalMean](NavuTraversalMean.md#s-NavuTraversalMean)

This implements the `NavuTraversalMean` for BFS
 (Breath-first traversal). .

  The  means of which
 to traverse the NAVU tree is through Breadth-first traversal

## Members

**Constructors**:

- [NavuTraversalBfsMean()](#s-NavuTraversalBfsMean-1)

**Methods**:

- [traverse(NavuNode, List<TraversalFilter>)](#s-traverse)

## Constructors

<a id="s-NavuTraversalBfsMean-1"></a>
### NavuTraversalBfsMean()

```java
public NavuTraversalBfsMean()
```


## Methods

<a id="s-traverse"></a>
### traverse(NavuNode, List<TraversalFilter>)

```java
public java.util.Set<String> traverse(
    com.tailf.navu.NavuNode root,
    java.util.List<com.tailf.navu.traversal.TraversalFilter> filters
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](../NavuNode.md#s-NavuNode), [TraversalFilter](TraversalFilter.md#s-TraversalFilter), [NavuException](../NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode root` - Starting point of the traversal
- `java.util.List<com.tailf.navu.traversal.TraversalFilter> filters`

**Returns:** Visited nodes
