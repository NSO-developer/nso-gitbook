# NavuTraversalBfsMean <a href="#navutraversalbfsmean-ea7481a5cc40" id="navutraversalbfsmean-ea7481a5cc40"></a>

```java
public class com.tailf.navu.traversal.NavuTraversalBfsMean
    implements com.tailf.navu.traversal.NavuTraversalMean
```

Types: [NavuTraversalMean](NavuTraversalMean.md#navutraversalmean-65fcdcfa38d1)

This implements the `NavuTraversalMean` for BFS
 (Breath-first traversal). .

  The  means of which
 to traverse the NAVU tree is through Breadth-first traversal

## Members

**Constructors**:

- [NavuTraversalBfsMean\(\)](#navutraversalbfsmean-c7c973dd9b7d)

**Methods**:

- [traverse\(NavuNode, List\<TraversalFilter\>\)](#traverse-e72c3ea2612b)

## Constructors

### NavuTraversalBfsMean() <a href="#navutraversalbfsmean-c7c973dd9b7d" id="navutraversalbfsmean-c7c973dd9b7d"></a>

```java
public NavuTraversalBfsMean()
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
