<a id="s-NavuXPathSelectResultSetAccumulate"></a>
# NavuXPathSelectResultSetAccumulate

```java
public class com.tailf.navu.NavuXPathSelectResultSetAccumulate
    extends com.tailf.navu.NavuXPathSelectResultSet
```

Types: [NavuXPathSelectResultSet](NavuXPathSelectResultSet.md#s-NavuXPathSelectResultSet)

## Members

**Constructors**:

- [NavuXPathSelectResultSetAccumulate(NavuContext)](#s-NavuXPathSelectResultSetAccumulate-1)

**Fields**:

- [ctx](NavuXPathSelectResultSet.md#s-ctx) from NavuXPathSelectResultSet
- [rootTag](NavuXPathSelectResultSet.md#s-rootTag) from NavuXPathSelectResultSet

**Methods**:

- [getNodeSet()](#s-getNodeSet)
- [handle(NavuNode, ConfValue, Object)](#s-handle)
- [result(ConfObject[], ConfValue, Object)](NavuXPathSelectResultSet.md#s-result) from NavuXPathSelectResultSet

## Constructors

<a id="s-NavuXPathSelectResultSetAccumulate-1"></a>
### NavuXPathSelectResultSetAccumulate(NavuContext)

```java
public NavuXPathSelectResultSetAccumulate(com.tailf.navu.NavuContext ctx)
```

Types: [NavuContext](NavuContext.md#s-NavuContext)

**Parameters**

- `com.tailf.navu.NavuContext ctx`


## Methods

<a id="s-getNodeSet"></a>
### getNodeSet()

```java
public java.util.List<com.tailf.navu.NavuNode> getNodeSet()
```

Types: [NavuNode](NavuNode.md#s-NavuNode)

<a id="s-handle"></a>
### handle(NavuNode, ConfValue, Object)

```java
protected com.tailf.maapi.XPathNodeIterateResultFlag handle(
    com.tailf.navu.NavuNode node,
    com.tailf.conf.ConfValue value,
    Object state
)
    throws com.tailf.navu.NavuException
```

Types: [XPathNodeIterateResultFlag](../maapi/XPathNodeIterateResultFlag.md#s-XPathNodeIterateResultFlag), [NavuNode](NavuNode.md#s-NavuNode), [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.conf.ConfValue value`
- `Object state`
