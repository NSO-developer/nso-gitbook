# NavuTraversalDfsMean <a href="#navutraversaldfsmean-0966a625a51d" id="navutraversaldfsmean-0966a625a51d"></a>

```java
public class com.tailf.navu.traversal.NavuTraversalDfsMean
    implements com.tailf.navu.traversal.NavuTraversalMean
```

Types: [NavuTraversalMean](NavuTraversalMean.md#navutraversalmean-65fcdcfa38d1)

This implements the `NavuTraversalMean` for DFS
 (Depth-first traversal).

The  means of which
 to traverse the NAVU tree is through Depth-first traversal

## Members

**Constructors**:

- [NavuTraversalDfsMean\(\)](#navutraversaldfsmean-123820830c40)

**Methods**:

- [traverse\(NavuNode, List\<TraversalFilter\>\)](#traverse-e72c3ea2612b)

## Constructors

### NavuTraversalDfsMean() <a href="#navutraversaldfsmean-123820830c40" id="navutraversaldfsmean-123820830c40"></a>

```java
public NavuTraversalDfsMean()
```


## Methods

### traverse(NavuNode, List&lt;TraversalFilter&gt;) <a href="#traverse-e72c3ea2612b" id="traverse-e72c3ea2612b"></a>

```java
public java.util.Set<String> traverse(
    com.tailf.navu.NavuNode root,
    java.util.List<com.tailf.navu.traversal.TraversalFilter> filters
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](../NavuNode.md#navunode-73944820c8db), [TraversalFilter](TraversalFilter.md#traversalfilter-4e27b24c67a1), [NavuException](../NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuNode root` - Starting point of the traversal
- `java.util.List<com.tailf.navu.traversal.TraversalFilter> filters`

**Returns:** Visited nodes
