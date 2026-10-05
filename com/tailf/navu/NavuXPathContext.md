# NavuXPathContext <a href="#cls-NavuXPathContext" id="cls-NavuXPathContext"></a>

```java
public class com.tailf.navu.NavuXPathContext
```

This class contains Node context for
 a callback iterator implementing [`NavuNodeSetIterate`](NavuNodeSetIterate.md#cls-NavuNodeSetIterate)
 which is used by
 [`NavuNode#xPathSelectIterate(String, NavuNodeSetIterate)`](NavuNode.md#m-xPathSelectIterate-12547f34f47c)

## Members

**Constructors**:

- [NavuXPathContext()](#m-NavuXPathContext-522e7c8cb8d3)

**Methods**:

- [getNode()](#m-getNode-52e3d8224b48)
- [getValue()](#m-getValue-d93864668c40)
- [iterflag()](#m-iterflag-73a56d0d3999)
- [nextNode()](#m-nextNode-1d3dc20cc072)
- [setNode(NavuNode)](#m-setNode-512b6bf958bb)
- [setState(Object)](#m-setState-f6716d0f1f89)
- [setValue(ConfValue)](#m-setValue-cda51a6fb391)
- [state()](#m-state-54117dea2388)
- [stopNode()](#m-stopNode-114945f05435)

## Constructors

### NavuXPathContext() <a href="#m-NavuXPathContext-522e7c8cb8d3" id="m-NavuXPathContext-522e7c8cb8d3"></a>

```java
public NavuXPathContext()
```


## Methods

### getNode() <a href="#m-getNode-52e3d8224b48" id="m-getNode-52e3d8224b48"></a>

```java
public com.tailf.navu.NavuNode getNode()
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

Get current NavuNode

**Returns:** NavuNode

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public com.tailf.conf.ConfValue getValue()
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue)

get NavuNode value if applicable

**Returns:** ConfValue

### iterflag() <a href="#m-iterflag-73a56d0d3999" id="m-iterflag-73a56d0d3999"></a>

```java
protected com.tailf.maapi.XPathNodeIterateResultFlag iterflag()
```

Types: [XPathNodeIterateResultFlag](../maapi/XPathNodeIterateResultFlag.md#cls-XPathNodeIterateResultFlag)

### nextNode() <a href="#m-nextNode-1d3dc20cc072" id="m-nextNode-1d3dc20cc072"></a>

```java
public void nextNode()
```

Continue iteration to next node after this invocation

### setNode(NavuNode) <a href="#m-setNode-512b6bf958bb" id="m-setNode-512b6bf958bb"></a>

```java
protected void setNode(com.tailf.navu.NavuNode node)
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

**Parameters**

- `com.tailf.navu.NavuNode node`

### setState(Object) <a href="#m-setState-f6716d0f1f89" id="m-setState-f6716d0f1f89"></a>

```java
protected void setState(Object state)
```

**Parameters**

- `Object state`

### setValue(ConfValue) <a href="#m-setValue-cda51a6fb391" id="m-setValue-cda51a6fb391"></a>

```java
protected void setValue(com.tailf.conf.ConfValue value)
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue)

**Parameters**

- `com.tailf.conf.ConfValue value`

### state() <a href="#m-state-54117dea2388" id="m-state-54117dea2388"></a>

```java
public Object state()
```

Iteration state object, if set for the iteration

**Returns:** opaque object

### stopNode() <a href="#m-stopNode-114945f05435" id="m-stopNode-114945f05435"></a>

```java
public void stopNode()
```

Stop iteration after this invocation.
