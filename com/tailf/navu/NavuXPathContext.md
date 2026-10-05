<a id="s-NavuXPathContext"></a>
# NavuXPathContext

```java
public class com.tailf.navu.NavuXPathContext
```

This class contains Node context for
 a callback iterator implementing [`NavuNodeSetIterate`](NavuNodeSetIterate.md#s-NavuNodeSetIterate)
 which is used by
 [`NavuNode`](NavuNode.md#s-NavuNode)

## Members

**Constructors**:

- [NavuXPathContext()](#s-NavuXPathContext-1)

**Methods**:

- [getNode()](#s-getNode)
- [getValue()](#s-getValue)
- [iterflag()](#s-iterflag)
- [nextNode()](#s-nextNode)
- [setNode(NavuNode)](#s-setNode)
- [setState(Object)](#s-setState)
- [setValue(ConfValue)](#s-setValue)
- [state()](#s-state)
- [stopNode()](#s-stopNode)

## Constructors

<a id="s-NavuXPathContext-1"></a>
### NavuXPathContext()

```java
public NavuXPathContext()
```


## Methods

<a id="s-getNode"></a>
### getNode()

```java
public com.tailf.navu.NavuNode getNode()
```

Types: [NavuNode](NavuNode.md#s-NavuNode)

Get current NavuNode

**Returns:** NavuNode

<a id="s-getValue"></a>
### getValue()

```java
public com.tailf.conf.ConfValue getValue()
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue)

get NavuNode value if applicable

**Returns:** ConfValue

<a id="s-iterflag"></a>
### iterflag()

```java
protected com.tailf.maapi.XPathNodeIterateResultFlag iterflag()
```

Types: [XPathNodeIterateResultFlag](../maapi/XPathNodeIterateResultFlag.md#s-XPathNodeIterateResultFlag)

<a id="s-nextNode"></a>
### nextNode()

```java
public void nextNode()
```

Continue iteration to next node after this invocation

<a id="s-setNode"></a>
### setNode(NavuNode)

```java
protected void setNode(com.tailf.navu.NavuNode node)
```

Types: [NavuNode](NavuNode.md#s-NavuNode)

**Parameters**

- `com.tailf.navu.NavuNode node`

<a id="s-setState"></a>
### setState(Object)

```java
protected void setState(Object state)
```

**Parameters**

- `Object state`

<a id="s-setValue"></a>
### setValue(ConfValue)

```java
protected void setValue(com.tailf.conf.ConfValue value)
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue)

**Parameters**

- `com.tailf.conf.ConfValue value`

<a id="s-state"></a>
### state()

```java
public Object state()
```

Iteration state object, if set for the iteration

**Returns:** opaque object

<a id="s-stopNode"></a>
### stopNode()

```java
public void stopNode()
```

Stop iteration after this invocation.
