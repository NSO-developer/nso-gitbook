<a id="s-NavuTraversalDfsMean"></a>
# NavuTraversalDfsMean

```java
public class com.tailf.navu.traversal.NavuTraversalDfsMean
    implements com.tailf.navu.traversal.NavuTraversalMean
```

Types: [NavuTraversalMean](NavuTraversalMean.md#s-NavuTraversalMean)

This implements the `NavuTraversalMean` for DFS
 (Depth-first traversal).



 The  means of which
 to traverse the NAVU tree is through Depth-first traversal

## Members

**Constructors**:

- [NavuTraversalDfsMean()](#s-NavuTraversalDfsMean-1)

**Methods**:

- [dfs(NavuNode)](#s-dfs)
- [doDfs(NavuNode, Set<String>)](#s-doDfs)
- [traverse(NavuNode, List<TraversalFilter>)](#s-traverse)

## Constructors

<a id="s-NavuTraversalDfsMean-1"></a>
### NavuTraversalDfsMean()

```java
public NavuTraversalDfsMean()
```


## Methods

<a id="s-dfs"></a>
### dfs(NavuNode)

```java
protected java.util.Set<String> dfs(
    com.tailf.navu.NavuNode root
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](../NavuNode.md#s-NavuNode), [NavuException](../NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode root`

<a id="s-doDfs"></a>
### doDfs(NavuNode, Set<String>)

```java
protected void doDfs(
    com.tailf.navu.NavuNode root,
    java.util.Set<String> visited
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](../NavuNode.md#s-NavuNode), [NavuException](../NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode root`
- `java.util.Set<String> visited`

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
