<a id="cls-TreeIterator"></a>
# TreeIterator

**Package-private**

```java
class com.tailf.navu.traversal.TreeIterator
    implements java.util.Iterator<com.tailf.navu.NavuNode>
```

Types: [NavuNode](../NavuNode.md#cls-NavuNode)

## Members

**Constructors**:

- [TreeIterator(List<NavuNode>)](#m-treeiterator-77df11da2fca)
- [TreeIterator(NavuNode)](#m-treeiterator-a9ba852fe173)

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
- [encodeValues()](../NavuNode.md#m-encodevalues-7bd911383b1a) from NavuNode
- [encodeXML()](../NavuNode.md#m-encodexml-bdbcd52c2505) from NavuNode
- [equals(Object)](../NavuNode.md#m-equals-fcd6492e0d6c) from NavuNode
- [exists()](../NavuNode.md#m-exists-56968a4c7bda) from NavuNode
- [filterChildren(CSNode)](../NavuNode.md#m-filterchildren-e72b7b1ab25d) from NavuNode
- [getChangeFlag()](../NavuNode.md#m-getchangeflag-33cadf5a32ba) from NavuNode
- [getChanges(NavuContext)](../NavuNode.md#m-getchanges-c106383f174d) from NavuNode
- [getChanges(NavuContext, boolean)](../NavuNode.md#m-getchanges-bcf5b6dbccf2) from NavuNode
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](../NavuNode.md#m-getchanges-9f13a683b086) from NavuNode
- [getConfPath()](../NavuNode.md#m-getconfpath-c7ca3cb63c17) from NavuNode
- [getInfo()](../NavuNode.md#m-getinfo-259a72b5d74c) from NavuNode
- [getKeyPath()](../NavuNode.md#m-getkeypath-4c9200912948) from NavuNode
- [getName()](../NavuNode.md#m-getname-2634b18b4a25) from NavuNode
- [getNavuNode(ConfPath)](../NavuNode.md#m-getnavunode-d19ad1dd90fc) from NavuNode
- [getParent()](../NavuNode.md#m-getparent-45c1b196ed70) from NavuNode
- [getRootNS()](../NavuNode.md#m-getrootns-3f1d054cecd6) from NavuNode
- [getValues(ConfXMLParam[])](../NavuNode.md#m-getvalues-1eb02439a757) from NavuNode
- [getValues(String)](../NavuNode.md#m-getvalues-c03de090764d) from NavuNode
- [hashCode()](../NavuNode.md#m-hashcode-ef797a217903) from NavuNode
- [hasNext()](#m-hasnext-93a8c9169964)
- [leaf(ConfNamespace, String)](../NavuNode.md#m-leaf-da3758f37f21) from NavuNode
- [leaf(Integer)](../NavuNode.md#m-leaf-47fda8402c20) from NavuNode
- [leaf(String)](../NavuNode.md#m-leaf-ac189787d67d) from NavuNode
- [leafList(ConfNamespace, String)](../NavuNode.md#m-leaflist-a2d5ad836b3e) from NavuNode
- [leafList(Integer)](../NavuNode.md#m-leaflist-552c8007ecb4) from NavuNode
- [leafList(String)](../NavuNode.md#m-leaflist-5811cbb534ec) from NavuNode
- [list(ConfNamespace, String)](../NavuNode.md#m-list-6b15381fd14a) from NavuNode
- [list(Integer)](../NavuNode.md#m-list-7dc96bdbb69a) from NavuNode
- [list(String)](../NavuNode.md#m-list-2c1a74a3cf07) from NavuNode
- [namespace(String)](../NavuNode.md#m-namespace-e29ad62ed095) from NavuNode
- [next()](#m-next-9a4cfa383e59)
- [prefix(String)](../NavuNode.md#m-prefix-fdd71b8275bb) from NavuNode
- [prepareXMLCall(String)](../NavuNode.md#m-preparexmlcall-c22e250f2cac) from NavuNode
- [remove()](#m-remove-8a10330a964f)
- [reset()](../NavuNode.md#m-reset-6927918ac70a) from NavuNode
- [select(ConfObject[])](../NavuNode.md#m-select-336dd76cd112) from NavuNode
- [select(List<String>)](../NavuNode.md#m-select-e81f36150174) from NavuNode
- [select(String)](../NavuNode.md#m-select-5031325154b9) from NavuNode
- [setValues(ConfXMLParam[])](../NavuNode.md#m-setvalues-50d8edffa795) from NavuNode
- [setValues(String)](../NavuNode.md#m-setvalues-3ec9581ce266) from NavuNode
- [sharedSetValues(ConfXMLParam[])](../NavuNode.md#m-sharedsetvalues-705549be9df0) from NavuNode
- [sharedSetValues(String)](../NavuNode.md#m-sharedsetvalues-ad93c38b671f) from NavuNode
- [stopCdbSession()](../NavuNode.md#m-stopcdbsession-17418252a986) from NavuNode
- [xPathSelect(String)](../NavuNode.md#m-xpathselect-0fb26b9f41e0) from NavuNode
- [xPathSelectIterate(String, NavuNodeSetIterate)](../NavuNode.md#m-xpathselectiterate-12547f34f47c) from NavuNode

## Constructors

<a id="m-treeiterator-77df11da2fca"></a>
### TreeIterator(List<NavuNode>)

**Package-private**

```java
TreeIterator(java.util.List<com.tailf.navu.NavuNode> startNodes)
```

Types: [NavuNode](../NavuNode.md#cls-NavuNode)

**Parameters**

- `java.util.List<com.tailf.navu.NavuNode> startNodes`

<a id="m-treeiterator-a9ba852fe173"></a>
### TreeIterator(NavuNode)

**Package-private**

```java
TreeIterator(com.tailf.navu.NavuNode startNode)
```

Types: [NavuNode](../NavuNode.md#cls-NavuNode)

**Parameters**

- `com.tailf.navu.NavuNode startNode`


## Methods

<a id="m-hasnext-93a8c9169964"></a>
### hasNext()

```java
public boolean hasNext()
```

<a id="m-next-9a4cfa383e59"></a>
### next()

```java
public com.tailf.navu.NavuNode next()
```

Types: [NavuNode](../NavuNode.md#cls-NavuNode)

<a id="m-remove-8a10330a964f"></a>
### remove()

```java
public void remove()
```
