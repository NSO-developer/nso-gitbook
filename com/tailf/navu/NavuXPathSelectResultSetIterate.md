<a id="s-NavuXPathSelectResultSetIterate"></a>
# NavuXPathSelectResultSetIterate

```java
public class com.tailf.navu.NavuXPathSelectResultSetIterate
    extends com.tailf.navu.NavuXPathSelectResultSet
```

Types: [NavuXPathSelectResultSet](NavuXPathSelectResultSet.md#s-NavuXPathSelectResultSet)

## Members

**Constructors**:

- [NavuXPathSelectResultSetIterate(NavuContext, NavuNodeSetIterate)](#s-NavuXPathSelectResultSetIterate-1)

**Fields**:

- [ctx](NavuXPathSelectResultSet.md#s-ctx) from NavuXPathSelectResultSet
- [rootTag](NavuXPathSelectResultSet.md#s-rootTag) from NavuXPathSelectResultSet

**Methods**:

- [handle(NavuNode, ConfValue, Object)](#s-handle)
- [result(ConfObject[], ConfValue, Object)](NavuXPathSelectResultSet.md#s-result) from NavuXPathSelectResultSet

## Constructors

<a id="s-NavuXPathSelectResultSetIterate-1"></a>
### NavuXPathSelectResultSetIterate(NavuContext, NavuNodeSetIterate)

```java
public NavuXPathSelectResultSetIterate(
    com.tailf.navu.NavuContext ctx,
    com.tailf.navu.NavuNodeSetIterate iter
)
```

Types: [NavuContext](NavuContext.md#s-NavuContext), [NavuNodeSetIterate](NavuNodeSetIterate.md#s-NavuNodeSetIterate)

**Parameters**

- `com.tailf.navu.NavuContext ctx`
- `com.tailf.navu.NavuNodeSetIterate iter`


## Methods

<a id="s-handle"></a>
### handle(NavuNode, ConfValue, Object)

```java
protected com.tailf.maapi.XPathNodeIterateResultFlag handle(
    com.tailf.navu.NavuNode node,
    com.tailf.conf.ConfValue result,
    Object state
)
    throws com.tailf.navu.NavuException
```

Types: [XPathNodeIterateResultFlag](../maapi/XPathNodeIterateResultFlag.md#s-XPathNodeIterateResultFlag), [NavuNode](NavuNode.md#s-NavuNode), [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.conf.ConfValue result`
- `Object state`
