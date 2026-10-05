<a id="cls-NavuXPathContext"></a>
# NavuXPathContext

```java
public class com.tailf.navu.NavuXPathContext
```

This class contains Node context for
 a callback iterator implementing [`NavuNodeSetIterate`](NavuNodeSetIterate.md#cls-NavuNodeSetIterate)
 which is used by
 [`NavuNode#xPathSelectIterate(String, NavuNodeSetIterate)`](NavuNode.md#m-xpathselectiterate-12547f34f47c)

## Members

**Constructors**:

- [NavuXPathContext()](#m-navuxpathcontext-522e7c8cb8d3)

**Methods**:

- [getNode()](#m-getnode-52e3d8224b48)
- [getValue()](#m-getvalue-d93864668c40)
- [iterflag()](#m-iterflag-73a56d0d3999)
- [nextNode()](#m-nextnode-1d3dc20cc072)
- [setNode(NavuNode)](#m-setnode-512b6bf958bb)
- [setState(Object)](#m-setstate-f6716d0f1f89)
- [setValue(ConfValue)](#m-setvalue-cda51a6fb391)
- [state()](#m-state-54117dea2388)
- [stopNode()](#m-stopnode-114945f05435)

## Constructors

<a id="m-navuxpathcontext-522e7c8cb8d3"></a>
### NavuXPathContext()

```java
public NavuXPathContext()
```


## Methods

<a id="m-getnode-52e3d8224b48"></a>
### getNode()

```java
public com.tailf.navu.NavuNode getNode()
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

Get current NavuNode

**Returns:** NavuNode

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public com.tailf.conf.ConfValue getValue()
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue)

get NavuNode value if applicable

**Returns:** ConfValue

<a id="m-iterflag-73a56d0d3999"></a>
### iterflag()

```java
protected com.tailf.maapi.XPathNodeIterateResultFlag iterflag()
```

Types: [XPathNodeIterateResultFlag](../maapi/XPathNodeIterateResultFlag.md#cls-XPathNodeIterateResultFlag)

<a id="m-nextnode-1d3dc20cc072"></a>
### nextNode()

```java
public void nextNode()
```

Continue iteration to next node after this invocation

<a id="m-setnode-512b6bf958bb"></a>
### setNode(NavuNode)

```java
protected void setNode(com.tailf.navu.NavuNode node)
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

**Parameters**

- `com.tailf.navu.NavuNode node`

<a id="m-setstate-f6716d0f1f89"></a>
### setState(Object)

```java
protected void setState(Object state)
```

**Parameters**

- `Object state`

<a id="m-setvalue-cda51a6fb391"></a>
### setValue(ConfValue)

```java
protected void setValue(com.tailf.conf.ConfValue value)
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue)

**Parameters**

- `com.tailf.conf.ConfValue value`

<a id="m-state-54117dea2388"></a>
### state()

```java
public Object state()
```

Iteration state object, if set for the iteration

**Returns:** opaque object

<a id="m-stopnode-114945f05435"></a>
### stopNode()

```java
public void stopNode()
```

Stop iteration after this invocation.
