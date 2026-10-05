<a id="cls-NavuNodeSetIterate"></a>
# NavuNodeSetIterate

```java
public interface com.tailf.navu.NavuNodeSetIterate
```

This class is used by
  [`NavuNode#xPathSelectIterate(String, NavuNodeSetIterate)`](NavuNode.md#m-xpathselectiterate-12547f34f47c)
  The iterate method is called for each node iteration.

## Members

**Methods**:

- [iterate(NavuXPathContext)](#m-iterate-adeee70ee872)

## Methods

<a id="m-iterate-adeee70ee872"></a>
### iterate(NavuXPathContext)

```java
public abstract void iterate(com.tailf.navu.NavuXPathContext ctx)
```

Types: [NavuXPathContext](NavuXPathContext.md#cls-NavuXPathContext)

This callback method is called for each iteration of a
 xPathSelectIterate().
 The NavuXPathContext is used to get the node object via
 [`NavuXPathContext#getNode()`](NavuXPathContext.md#m-getnode-52e3d8224b48)
 and also important control iteration with calls to
 [`NavuXPathContext#nextNode()`](NavuXPathContext.md#m-nextnode-1d3dc20cc072) or
 [`NavuXPathContext#stopNode()`](NavuXPathContext.md#m-stopnode-114945f05435)

**Parameters**

- `com.tailf.navu.NavuXPathContext ctx` - context controlling the iteration.
