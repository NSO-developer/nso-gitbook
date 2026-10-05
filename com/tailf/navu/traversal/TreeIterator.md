# TreeIterator <a href="#treeiterator-a055e0e0311d" id="treeiterator-a055e0e0311d"></a>

**Package-private**

```java
class com.tailf.navu.traversal.TreeIterator
    implements java.util.Iterator<com.tailf.navu.NavuNode>
```

Types: [NavuNode](../NavuNode.md#navunode-73944820c8db)

## Members

**Constructors**:

- [TreeIterator\(List\<NavuNode\>\)](#treeiterator-77df11da2fca)
- [TreeIterator\(NavuNode\)](#treeiterator-a9ba852fe173)

**Fields**:

- [arguments](../NavuNode.md#arguments-28ffa3c54d2c) from NavuNode
- [change](../NavuNode.md#change-470927160c2a) from NavuNode
- [context](../NavuNode.md#context-b9bed500f8c9) from NavuNode
- [fmt](../NavuNode.md#fmt-94d3250bd2b9) from NavuNode
- [mountId](../NavuNode.md#mountid-a6b63dedba52) from NavuNode
- [myConfPath](../NavuNode.md#myconfpath-cec7a88dfaf3) from NavuNode
- [node](../NavuNode.md#node-ff68e6a3ebc6) from NavuNode
- [parent](../NavuNode.md#parent-26ad1434956a) from NavuNode

**Methods**:

- [children\(\)](../NavuNode.md#children-7d31300d62c3) from NavuNode
- [container\(ConfNamespace, String\)](../NavuNode.md#container-31c604ba30e3) from NavuNode
- [container\(Integer\)](../NavuNode.md#container-abb10ecdc3f6) from NavuNode
- [container\(String\)](../NavuNode.md#container-76f5d191b16d) from NavuNode
- [context\(\)](../NavuNode.md#context-0990f1a0bb68) from NavuNode
- [encodeValues\(\)](../NavuNode.md#encodevalues-7bd911383b1a) from NavuNode
- [encodeXML\(\)](../NavuNode.md#encodexml-bdbcd52c2505) from NavuNode
- [equals\(Object\)](../NavuNode.md#equals-fcd6492e0d6c) from NavuNode
- [exists\(\)](../NavuNode.md#exists-56968a4c7bda) from NavuNode
- [filterChildren\(CSNode\)](../NavuNode.md#filterchildren-e72b7b1ab25d) from NavuNode
- [getChangeFlag\(\)](../NavuNode.md#getchangeflag-33cadf5a32ba) from NavuNode
- [getChanges\(NavuContext\)](../NavuNode.md#getchanges-c106383f174d) from NavuNode
- [getChanges\(NavuContext, boolean\)](../NavuNode.md#getchanges-bcf5b6dbccf2) from NavuNode
- [getChanges\(NavuContext, boolean, DiffIterateOperFlag\[\]\)](../NavuNode.md#getchanges-9f13a683b086) from NavuNode
- [getConfPath\(\)](../NavuNode.md#getconfpath-c7ca3cb63c17) from NavuNode
- [getInfo\(\)](../NavuNode.md#getinfo-259a72b5d74c) from NavuNode
- [getKeyPath\(\)](../NavuNode.md#getkeypath-4c9200912948) from NavuNode
- [getName\(\)](../NavuNode.md#getname-2634b18b4a25) from NavuNode
- [getNavuNode\(ConfPath\)](../NavuNode.md#getnavunode-d19ad1dd90fc) from NavuNode
- [getParent\(\)](../NavuNode.md#getparent-45c1b196ed70) from NavuNode
- [getRootNS\(\)](../NavuNode.md#getrootns-3f1d054cecd6) from NavuNode
- [getValues\(ConfXMLParam\[\]\)](../NavuNode.md#getvalues-1eb02439a757) from NavuNode
- [getValues\(String\)](../NavuNode.md#getvalues-c03de090764d) from NavuNode
- [hashCode\(\)](../NavuNode.md#hashcode-ef797a217903) from NavuNode
- [hasNext\(\)](#hasnext-93a8c9169964)
- [leaf\(ConfNamespace, String\)](../NavuNode.md#leaf-da3758f37f21) from NavuNode
- [leaf\(Integer\)](../NavuNode.md#leaf-47fda8402c20) from NavuNode
- [leaf\(String\)](../NavuNode.md#leaf-ac189787d67d) from NavuNode
- [leafList\(ConfNamespace, String\)](../NavuNode.md#leaflist-a2d5ad836b3e) from NavuNode
- [leafList\(Integer\)](../NavuNode.md#leaflist-552c8007ecb4) from NavuNode
- [leafList\(String\)](../NavuNode.md#leaflist-5811cbb534ec) from NavuNode
- [list\(ConfNamespace, String\)](../NavuNode.md#list-6b15381fd14a) from NavuNode
- [list\(Integer\)](../NavuNode.md#list-7dc96bdbb69a) from NavuNode
- [list\(String\)](../NavuNode.md#list-2c1a74a3cf07) from NavuNode
- [namespace\(String\)](../NavuNode.md#namespace-e29ad62ed095) from NavuNode
- [next\(\)](#next-9a4cfa383e59)
- [prefix\(String\)](../NavuNode.md#prefix-fdd71b8275bb) from NavuNode
- [prepareXMLCall\(String\)](../NavuNode.md#preparexmlcall-c22e250f2cac) from NavuNode
- [remove\(\)](#remove-8a10330a964f)
- [reset\(\)](../NavuNode.md#reset-6927918ac70a) from NavuNode
- [select\(ConfObject\[\]\)](../NavuNode.md#select-336dd76cd112) from NavuNode
- [select\(List\<String\>\)](../NavuNode.md#select-e81f36150174) from NavuNode
- [select\(String\)](../NavuNode.md#select-5031325154b9) from NavuNode
- [setValues\(ConfXMLParam\[\]\)](../NavuNode.md#setvalues-50d8edffa795) from NavuNode
- [setValues\(String\)](../NavuNode.md#setvalues-3ec9581ce266) from NavuNode
- [sharedSetValues\(ConfXMLParam\[\]\)](../NavuNode.md#sharedsetvalues-705549be9df0) from NavuNode
- [sharedSetValues\(String\)](../NavuNode.md#sharedsetvalues-ad93c38b671f) from NavuNode
- [stopCdbSession\(\)](../NavuNode.md#stopcdbsession-17418252a986) from NavuNode
- [xPathSelect\(String\)](../NavuNode.md#xpathselect-0fb26b9f41e0) from NavuNode
- [xPathSelectIterate\(String, NavuNodeSetIterate\)](../NavuNode.md#xpathselectiterate-12547f34f47c) from NavuNode

## Constructors

### TreeIterator(List&lt;NavuNode&gt;) <a href="#treeiterator-77df11da2fca" id="treeiterator-77df11da2fca"></a>

**Package-private**

```java
TreeIterator(java.util.List<com.tailf.navu.NavuNode> startNodes)
```

Types: [NavuNode](../NavuNode.md#navunode-73944820c8db)

**Parameters**

- `java.util.List<com.tailf.navu.NavuNode> startNodes`

### TreeIterator(NavuNode) <a href="#treeiterator-a9ba852fe173" id="treeiterator-a9ba852fe173"></a>

**Package-private**

```java
TreeIterator(com.tailf.navu.NavuNode startNode)
```

Types: [NavuNode](../NavuNode.md#navunode-73944820c8db)

**Parameters**

- `com.tailf.navu.NavuNode startNode`


## Methods

### hasNext() <a href="#hasnext-93a8c9169964" id="hasnext-93a8c9169964"></a>

```java
public boolean hasNext()
```

### next() <a href="#next-9a4cfa383e59" id="next-9a4cfa383e59"></a>

```java
public com.tailf.navu.NavuNode next()
```

Types: [NavuNode](../NavuNode.md#navunode-73944820c8db)

### remove() <a href="#remove-8a10330a964f" id="remove-8a10330a964f"></a>

```java
public void remove()
```
