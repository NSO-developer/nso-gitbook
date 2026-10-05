<a id="s-NavuXPathSelectResultSet"></a>
# NavuXPathSelectResultSet

```java
public abstract class com.tailf.navu.NavuXPathSelectResultSet
    implements com.tailf.maapi.MaapiXPathEvalResult
```

Types: [MaapiXPathEvalResult](../maapi/MaapiXPathEvalResult.md#s-MaapiXPathEvalResult)

**Related classes**

- [NavuXPathSelectResultSetAccumulate](NavuXPathSelectResultSetAccumulate.md#s-NavuXPathSelectResultSetAccumulate)
- [NavuXPathSelectResultSetIterate](NavuXPathSelectResultSetIterate.md#s-NavuXPathSelectResultSetIterate)

## Members

**Constructors**:

- [NavuXPathSelectResultSet(NavuContext)](#s-NavuXPathSelectResultSet-1)

**Fields**:

- [ctx](#s-ctx)
- [rootTag](#s-rootTag)

**Methods**:

- [handle(NavuNode, ConfValue, Object)](#s-handle)
- [result(ConfObject[], ConfValue, Object)](#s-result)

## Constructors

<a id="s-NavuXPathSelectResultSet-1"></a>
### NavuXPathSelectResultSet(NavuContext)

```java
public NavuXPathSelectResultSet(com.tailf.navu.NavuContext ctx)
```

Types: [NavuContext](NavuContext.md#s-NavuContext)

**Parameters**

- `com.tailf.navu.NavuContext ctx`


## Fields

<a id="s-ctx"></a>
### ctx

```java
protected com.tailf.navu.NavuContext ctx = null;
```

Types: [NavuContext](NavuContext.md#s-NavuContext)

<a id="s-rootTag"></a>
### rootTag

```java
protected com.tailf.conf.ConfTag rootTag = null;
```

Types: [ConfTag](../conf/ConfTag.md#s-ConfTag)


## Methods

<a id="s-handle"></a>
### handle(NavuNode, ConfValue, Object)

```java
protected abstract com.tailf.maapi.XPathNodeIterateResultFlag handle(
    com.tailf.navu.NavuNode node,
    com.tailf.conf.ConfValue value,
    Object object
)
    throws com.tailf.navu.NavuException
```

Types: [XPathNodeIterateResultFlag](../maapi/XPathNodeIterateResultFlag.md#s-XPathNodeIterateResultFlag), [NavuNode](NavuNode.md#s-NavuNode), [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuException](NavuException.md#s-NavuException)

This method is intended to be overwritten.

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.conf.ConfValue value`
- `Object object`

<a id="s-result"></a>
### result(ConfObject[], ConfValue, Object)

```java
public com.tailf.maapi.XPathNodeIterateResultFlag result(
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfValue value,
    Object state
)
```

Types: [XPathNodeIterateResultFlag](../maapi/XPathNodeIterateResultFlag.md#s-XPathNodeIterateResultFlag), [ConfObject](../conf/ConfObject.md#s-ConfObject), [ConfValue](../conf/ConfValue.md#s-ConfValue)

For each node in a result NodeSet this
 method will be called by Maapi.xPathEval()

**Parameters**

- `com.tailf.conf.ConfObject[] kp` - - KeyPath to the
- `com.tailf.conf.ConfValue value` - - Value of this node if any or else null.
- `Object state` - - Some state object.
