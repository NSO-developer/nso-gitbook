# NavuTraversalMean <a href="#navutraversalmean-65fcdcfa38d1" id="navutraversalmean-65fcdcfa38d1"></a>

```java
public interface com.tailf.navu.traversal.NavuTraversalMean
```

## Members

**Methods**:

- [traverse(NavuNode, List<TraversalFilter>)](#traverse-e72c3ea2612b)

## Methods

### traverse(NavuNode, List&lt;TraversalFilter&gt;) <a href="#traverse-e72c3ea2612b" id="traverse-e72c3ea2612b"></a>

```java
public abstract java.util.Set<String> traverse(
    com.tailf.navu.NavuNode root,
    java.util.List<com.tailf.navu.traversal.TraversalFilter> filter
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](../NavuNode.md#navunode-73944820c8db), [TraversalFilter](TraversalFilter.md#traversalfilter-4e27b24c67a1), [NavuException](../NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuNode root` - Starting point of the traversal
- `java.util.List<com.tailf.navu.traversal.TraversalFilter> filter`

**Returns:** Visited nodes
