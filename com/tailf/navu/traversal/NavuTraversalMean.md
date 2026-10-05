# NavuTraversalMean <a href="#cls-NavuTraversalMean" id="cls-NavuTraversalMean"></a>

```java
public interface com.tailf.navu.traversal.NavuTraversalMean
```

## Members

**Methods**:

- [traverse(NavuNode, List<TraversalFilter>)](#m-traverse-e72c3ea2612b)

## Methods

### traverse(NavuNode, List<TraversalFilter>) <a href="#m-traverse-e72c3ea2612b" id="m-traverse-e72c3ea2612b"></a>

```java
public abstract java.util.Set<String> traverse(
    com.tailf.navu.NavuNode root,
    java.util.List<com.tailf.navu.traversal.TraversalFilter> filter
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](../NavuNode.md#cls-NavuNode), [TraversalFilter](TraversalFilter.md#cls-TraversalFilter), [NavuException](../NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode root` - Starting point of the traversal
- `java.util.List<com.tailf.navu.traversal.TraversalFilter> filter`

**Returns:** Visited nodes
