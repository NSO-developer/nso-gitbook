# TreeIterator <a href="#cls-TreeIterator" id="cls-TreeIterator"></a>

**Package-private**

```java
class com.tailf.navu.traversal.TreeIterator
    implements java.util.Iterator<com.tailf.navu.NavuNode>
```

Types: [NavuNode](../NavuNode.md#cls-NavuNode)

## Members

**Constructors**:

- [TreeIterator(List<NavuNode>)](#m-TreeIterator-77df11da2fca)
- [TreeIterator(NavuNode)](#m-TreeIterator-a9ba852fe173)

**Fields**:

- [arguments](../NavuNode.md#m-arguments) from NavuNode
- [change](../NavuNode.md#m-change) from NavuNode
- [context](../NavuNode.md#m-context) from NavuNode
- [fmt](../NavuNode.md#m-fmt) from NavuNode
- [mountId](../NavuNode.md#m-mountId) from NavuNode
- [myConfPath](../NavuNode.md#m-myConfPath) from NavuNode
- [node](../NavuNode.md#m-node) from NavuNode
- [parent](../NavuNode.md#m-parent) from NavuNode

**Methods**:

- [children()](../NavuNode.md#m-children-7d31300d62c3) from NavuNode
- [container(ConfNamespace, String)](../NavuNode.md#m-container-31c604ba30e3) from NavuNode
- [container(Integer)](../NavuNode.md#m-container-abb10ecdc3f6) from NavuNode
- [container(String)](../NavuNode.md#m-container-76f5d191b16d) from NavuNode
- [context()](../NavuNode.md#m-context-0990f1a0bb68) from NavuNode
- [encodeValues()](../NavuNode.md#m-encodeValues-7bd911383b1a) from NavuNode
- [encodeXML()](../NavuNode.md#m-encodeXML-bdbcd52c2505) from NavuNode
- [equals(Object)](../NavuNode.md#m-equals-fcd6492e0d6c) from NavuNode
- [exists()](../NavuNode.md#m-exists-56968a4c7bda) from NavuNode
- [filterChildren(CSNode)](../NavuNode.md#m-filterChildren-e72b7b1ab25d) from NavuNode
- [getChangeFlag()](../NavuNode.md#m-getChangeFlag-33cadf5a32ba) from NavuNode
- [getChanges(NavuContext)](../NavuNode.md#m-getChanges-c106383f174d) from NavuNode
- [getChanges(NavuContext, boolean)](../NavuNode.md#m-getChanges-bcf5b6dbccf2) from NavuNode
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](../NavuNode.md#m-getChanges-9f13a683b086) from NavuNode
- [getConfPath()](../NavuNode.md#m-getConfPath-c7ca3cb63c17) from NavuNode
- [getInfo()](../NavuNode.md#m-getInfo-259a72b5d74c) from NavuNode
- [getKeyPath()](../NavuNode.md#m-getKeyPath-4c9200912948) from NavuNode
- [getName()](../NavuNode.md#m-getName-2634b18b4a25) from NavuNode
- [getNavuNode(ConfPath)](../NavuNode.md#m-getNavuNode-d19ad1dd90fc) from NavuNode
- [getParent()](../NavuNode.md#m-getParent-45c1b196ed70) from NavuNode
- [getRootNS()](../NavuNode.md#m-getRootNS-3f1d054cecd6) from NavuNode
- [getValues(ConfXMLParam[])](../NavuNode.md#m-getValues-1eb02439a757) from NavuNode
- [getValues(String)](../NavuNode.md#m-getValues-c03de090764d) from NavuNode
- [hashCode()](../NavuNode.md#m-hashCode-ef797a217903) from NavuNode
- [hasNext()](#m-hasNext-93a8c9169964)
- [leaf(ConfNamespace, String)](../NavuNode.md#m-leaf-da3758f37f21) from NavuNode
- [leaf(Integer)](../NavuNode.md#m-leaf-47fda8402c20) from NavuNode
- [leaf(String)](../NavuNode.md#m-leaf-ac189787d67d) from NavuNode
- [leafList(ConfNamespace, String)](../NavuNode.md#m-leafList-a2d5ad836b3e) from NavuNode
- [leafList(Integer)](../NavuNode.md#m-leafList-552c8007ecb4) from NavuNode
- [leafList(String)](../NavuNode.md#m-leafList-5811cbb534ec) from NavuNode
- [list(ConfNamespace, String)](../NavuNode.md#m-list-6b15381fd14a) from NavuNode
- [list(Integer)](../NavuNode.md#m-list-7dc96bdbb69a) from NavuNode
- [list(String)](../NavuNode.md#m-list-2c1a74a3cf07) from NavuNode
- [namespace(String)](../NavuNode.md#m-namespace-e29ad62ed095) from NavuNode
- [next()](#m-next-9a4cfa383e59)
- [prefix(String)](../NavuNode.md#m-prefix-fdd71b8275bb) from NavuNode
- [prepareXMLCall(String)](../NavuNode.md#m-prepareXMLCall-c22e250f2cac) from NavuNode
- [remove()](#m-remove-8a10330a964f)
- [reset()](../NavuNode.md#m-reset-6927918ac70a) from NavuNode
- [select(ConfObject[])](../NavuNode.md#m-select-336dd76cd112) from NavuNode
- [select(List<String>)](../NavuNode.md#m-select-e81f36150174) from NavuNode
- [select(String)](../NavuNode.md#m-select-5031325154b9) from NavuNode
- [setValues(ConfXMLParam[])](../NavuNode.md#m-setValues-50d8edffa795) from NavuNode
- [setValues(String)](../NavuNode.md#m-setValues-3ec9581ce266) from NavuNode
- [sharedSetValues(ConfXMLParam[])](../NavuNode.md#m-sharedSetValues-705549be9df0) from NavuNode
- [sharedSetValues(String)](../NavuNode.md#m-sharedSetValues-ad93c38b671f) from NavuNode
- [stopCdbSession()](../NavuNode.md#m-stopCdbSession-17418252a986) from NavuNode
- [xPathSelect(String)](../NavuNode.md#m-xPathSelect-0fb26b9f41e0) from NavuNode
- [xPathSelectIterate(String, NavuNodeSetIterate)](../NavuNode.md#m-xPathSelectIterate-12547f34f47c) from NavuNode

## Constructors

### TreeIterator(List<NavuNode>) <a href="#m-TreeIterator-77df11da2fca" id="m-TreeIterator-77df11da2fca"></a>

**Package-private**

```java
TreeIterator(java.util.List<com.tailf.navu.NavuNode> startNodes)
```

Types: [NavuNode](../NavuNode.md#cls-NavuNode)

**Parameters**

- `java.util.List<com.tailf.navu.NavuNode> startNodes`

### TreeIterator(NavuNode) <a href="#m-TreeIterator-a9ba852fe173" id="m-TreeIterator-a9ba852fe173"></a>

**Package-private**

```java
TreeIterator(com.tailf.navu.NavuNode startNode)
```

Types: [NavuNode](../NavuNode.md#cls-NavuNode)

**Parameters**

- `com.tailf.navu.NavuNode startNode`


## Methods

### hasNext() <a href="#m-hasNext-93a8c9169964" id="m-hasNext-93a8c9169964"></a>

```java
public boolean hasNext()
```

### next() <a href="#m-next-9a4cfa383e59" id="m-next-9a4cfa383e59"></a>

```java
public com.tailf.navu.NavuNode next()
```

Types: [NavuNode](../NavuNode.md#cls-NavuNode)

### remove() <a href="#m-remove-8a10330a964f" id="m-remove-8a10330a964f"></a>

```java
public void remove()
```
