# NavuNodeSetIterate <a href="#navunodesetiterate-6793a6b9b4c2" id="navunodesetiterate-6793a6b9b4c2"></a>

```java
public interface com.tailf.navu.NavuNodeSetIterate
```

This class is used by
  [`NavuNode#xPathSelectIterate(String, NavuNodeSetIterate)`](NavuNode.md#xpathselectiterate-12547f34f47c)
  The iterate method is called for each node iteration.

## Members

**Methods**:

- [iterate\(NavuXPathContext\)](#iterate-adeee70ee872)

## Methods

### iterate(NavuXPathContext) <a href="#iterate-adeee70ee872" id="iterate-adeee70ee872"></a>

```java
public abstract void iterate(com.tailf.navu.NavuXPathContext ctx)
```

Types: [NavuXPathContext](NavuXPathContext.md#navuxpathcontext-b07e9b4d6361)

This callback method is called for each iteration of a
 xPathSelectIterate().
 The NavuXPathContext is used to get the node object via
 [`NavuXPathContext#getNode()`](NavuXPathContext.md#getnode-52e3d8224b48)
 and also important control iteration with calls to
 [`NavuXPathContext#nextNode()`](NavuXPathContext.md#nextnode-1d3dc20cc072) or
 [`NavuXPathContext#stopNode()`](NavuXPathContext.md#stopnode-114945f05435)

**Parameters**

- `com.tailf.navu.NavuXPathContext ctx` - context controlling the iteration.
