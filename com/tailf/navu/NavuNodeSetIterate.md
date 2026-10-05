<a id="s-NavuNodeSetIterate"></a>
# NavuNodeSetIterate

```java
public interface com.tailf.navu.NavuNodeSetIterate
```

This class is used by
  [`NavuNode`](NavuNode.md#s-NavuNode)
  The iterate method is called for each node iteration.

## Members

**Methods**:

- [iterate(NavuXPathContext)](#s-iterate)

## Methods

<a id="s-iterate"></a>
### iterate(NavuXPathContext)

```java
public abstract void iterate(com.tailf.navu.NavuXPathContext ctx)
```

Types: [NavuXPathContext](NavuXPathContext.md#s-NavuXPathContext)

This callback method is called for each iteration of a
 xPathSelectIterate().
 The NavuXPathContext is used to get the node object via
 [`NavuXPathContext`](NavuXPathContext.md#s-NavuXPathContext)
 and also important control iteration with calls to
 [`NavuXPathContext`](NavuXPathContext.md#s-NavuXPathContext) or
 [`NavuXPathContext`](NavuXPathContext.md#s-NavuXPathContext)

**Parameters**

- `com.tailf.navu.NavuXPathContext ctx` - context controlling the iteration.
