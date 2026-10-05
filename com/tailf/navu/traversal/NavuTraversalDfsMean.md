# NavuTraversalDfsMean <a href="#cls-NavuTraversalDfsMean" id="cls-NavuTraversalDfsMean"></a>

```java
public class com.tailf.navu.traversal.NavuTraversalDfsMean
    implements com.tailf.navu.traversal.NavuTraversalMean
```

Types: [NavuTraversalMean](NavuTraversalMean.md#cls-NavuTraversalMean)

This implements the `NavuTraversalMean` for DFS
 (Depth-first traversal).



 The  means of which
 to traverse the NAVU tree is through Depth-first traversal

## Members

**Constructors**:

- [NavuTraversalDfsMean()](#m-NavuTraversalDfsMean-123820830c40)

**Methods**:

- [dfs(NavuNode)](#m-dfs-5b348f76fa8d)
- [doDfs(NavuNode, Set<String>)](#m-doDfs-ffb6caf3db53)
- [traverse(NavuNode, List<TraversalFilter>)](#m-traverse-e72c3ea2612b)

## Constructors

### NavuTraversalDfsMean() <a href="#m-NavuTraversalDfsMean-123820830c40" id="m-NavuTraversalDfsMean-123820830c40"></a>

```java
public NavuTraversalDfsMean()
```


## Methods

### dfs(NavuNode) <a href="#m-dfs-5b348f76fa8d" id="m-dfs-5b348f76fa8d"></a>

```java
protected java.util.Set<String> dfs(
    com.tailf.navu.NavuNode root
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](../NavuNode.md#cls-NavuNode), [NavuException](../NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode root`

### doDfs(NavuNode, Set<String>) <a href="#m-doDfs-ffb6caf3db53" id="m-doDfs-ffb6caf3db53"></a>

```java
protected void doDfs(
    com.tailf.navu.NavuNode root,
    java.util.Set<String> visited
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](../NavuNode.md#cls-NavuNode), [NavuException](../NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode root`
- `java.util.Set<String> visited`

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
