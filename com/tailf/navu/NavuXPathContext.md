# NavuXPathContext <a href="#navuxpathcontext-b07e9b4d6361" id="navuxpathcontext-b07e9b4d6361"></a>

```java
public class com.tailf.navu.NavuXPathContext
```

This class contains Node context for
 a callback iterator implementing [`NavuNodeSetIterate`](NavuNodeSetIterate.md#navunodesetiterate-6793a6b9b4c2)
 which is used by
 [`NavuNode#xPathSelectIterate(String, NavuNodeSetIterate)`](NavuNode.md#xpathselectiterate-12547f34f47c)

## Members

**Constructors**:

- [NavuXPathContext()](#navuxpathcontext-522e7c8cb8d3)

**Methods**:

- [getNode()](#getnode-52e3d8224b48)
- [getValue()](#getvalue-d93864668c40)
- [iterflag()](#iterflag-73a56d0d3999)
- [nextNode()](#nextnode-1d3dc20cc072)
- [setNode(NavuNode)](#setnode-512b6bf958bb)
- [setState(Object)](#setstate-f6716d0f1f89)
- [setValue(ConfValue)](#setvalue-cda51a6fb391)
- [state()](#state-54117dea2388)
- [stopNode()](#stopnode-114945f05435)

## Constructors

### NavuXPathContext() <a href="#navuxpathcontext-522e7c8cb8d3" id="navuxpathcontext-522e7c8cb8d3"></a>

```java
public NavuXPathContext()
```


## Methods

### getNode() <a href="#getnode-52e3d8224b48" id="getnode-52e3d8224b48"></a>

```java
public com.tailf.navu.NavuNode getNode()
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)

Get current NavuNode

**Returns:** NavuNode

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public com.tailf.conf.ConfValue getValue()
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d)

get NavuNode value if applicable

**Returns:** ConfValue

### iterflag() <a href="#iterflag-73a56d0d3999" id="iterflag-73a56d0d3999"></a>

```java
protected com.tailf.maapi.XPathNodeIterateResultFlag iterflag()
```

Types: [XPathNodeIterateResultFlag](../maapi/XPathNodeIterateResultFlag.md#xpathnodeiterateresultflag-a264e20c01cd)

### nextNode() <a href="#nextnode-1d3dc20cc072" id="nextnode-1d3dc20cc072"></a>

```java
public void nextNode()
```

Continue iteration to next node after this invocation

### setNode(NavuNode) <a href="#setnode-512b6bf958bb" id="setnode-512b6bf958bb"></a>

```java
protected void setNode(com.tailf.navu.NavuNode node)
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)

**Parameters**

- `com.tailf.navu.NavuNode node`

### setState(Object) <a href="#setstate-f6716d0f1f89" id="setstate-f6716d0f1f89"></a>

```java
protected void setState(Object state)
```

**Parameters**

- `Object state`

### setValue(ConfValue) <a href="#setvalue-cda51a6fb391" id="setvalue-cda51a6fb391"></a>

```java
protected void setValue(com.tailf.conf.ConfValue value)
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d)

**Parameters**

- `com.tailf.conf.ConfValue value`

### state() <a href="#state-54117dea2388" id="state-54117dea2388"></a>

```java
public Object state()
```

Iteration state object, if set for the iteration

**Returns:** opaque object

### stopNode() <a href="#stopnode-114945f05435" id="stopnode-114945f05435"></a>

```java
public void stopNode()
```

Stop iteration after this invocation.
