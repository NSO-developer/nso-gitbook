<a id="cls-NavuTraversalDfsMean"></a>
# NavuTraversalDfsMean

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

- [NavuTraversalDfsMean()](#m-navutraversaldfsmean-123820830c40)

**Methods**:

- [dfs(NavuNode)](#m-dfs-5b348f76fa8d)
- [doDfs(NavuNode, Set<String>)](#m-dodfs-ffb6caf3db53)
- [traverse(NavuNode, List<TraversalFilter>)](#m-traverse-e72c3ea2612b)

## Constructors

<a id="m-navutraversaldfsmean-123820830c40"></a>
### NavuTraversalDfsMean()

```java
public NavuTraversalDfsMean()
```


## Methods

<a id="m-dfs-5b348f76fa8d"></a>
### dfs(NavuNode)

```java
protected java.util.Set<String> dfs(
    com.tailf.navu.NavuNode root
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](../NavuNode.md#cls-NavuNode), [NavuException](../NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode root`

<a id="m-dodfs-ffb6caf3db53"></a>
### doDfs(NavuNode, Set<String>)

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
