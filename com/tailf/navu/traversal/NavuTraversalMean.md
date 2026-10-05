<a id="s-NavuTraversalMean"></a>
# NavuTraversalMean

```java
public interface com.tailf.navu.traversal.NavuTraversalMean
```

## Members

**Methods**:

- [traverse(NavuNode, List<TraversalFilter>)](#s-traverse)

## Methods

<a id="s-traverse"></a>
### traverse(NavuNode, List<TraversalFilter>)

```java
public abstract java.util.Set<String> traverse(
    com.tailf.navu.NavuNode root,
    java.util.List<com.tailf.navu.traversal.TraversalFilter> filter
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](../NavuNode.md#s-NavuNode), [TraversalFilter](TraversalFilter.md#s-TraversalFilter), [NavuException](../NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode root` - Starting point of the traversal
- `java.util.List<com.tailf.navu.traversal.TraversalFilter> filter`

**Returns:** Visited nodes
