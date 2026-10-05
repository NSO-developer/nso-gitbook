<a id="s-TreeIterator"></a>
# TreeIterator

**Package-private**

```java
class com.tailf.navu.traversal.TreeIterator
    implements java.util.Iterator<com.tailf.navu.NavuNode>
```

Types: [NavuNode](../NavuNode.md#s-NavuNode)

## Members

**Constructors**:

- [TreeIterator(List<NavuNode>)](#s-TreeIterator-1)
- [TreeIterator(NavuNode)](#s-TreeIterator-2)

**Fields**:

- [arguments](../NavuNode.md#s-arguments) from NavuNode
- [change](../NavuNode.md#s-change) from NavuNode
- [context](../NavuNode.md#s-context) from NavuNode
- [fmt](../NavuNode.md#s-fmt) from NavuNode
- [mountId](../NavuNode.md#s-mountId) from NavuNode
- [myConfPath](../NavuNode.md#s-myConfPath) from NavuNode
- [node](../NavuNode.md#s-node) from NavuNode
- [parent](../NavuNode.md#s-parent) from NavuNode

**Methods**:

- [children()](../NavuNode.md#s-children) from NavuNode
- [container(ConfNamespace, String)](../NavuNode.md#s-container) from NavuNode
- [container(Integer)](../NavuNode.md#s-container-1) from NavuNode
- [container(String)](../NavuNode.md#s-container-2) from NavuNode
- [context()](../NavuNode.md#s-context-1) from NavuNode
- [encodeValues()](../NavuNode.md#s-encodeValues) from NavuNode
- [encodeXML()](../NavuNode.md#s-encodeXML) from NavuNode
- [equals(Object)](../NavuNode.md#s-equals) from NavuNode
- [exists()](../NavuNode.md#s-exists) from NavuNode
- [filterChildren(CSNode)](../NavuNode.md#s-filterChildren) from NavuNode
- [getChangeFlag()](../NavuNode.md#s-getChangeFlag) from NavuNode
- [getChanges(NavuContext)](../NavuNode.md#s-getChanges) from NavuNode
- [getChanges(NavuContext, boolean)](../NavuNode.md#s-getChanges-1) from NavuNode
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](../NavuNode.md#s-getChanges-2) from NavuNode
- [getConfPath()](../NavuNode.md#s-getConfPath) from NavuNode
- [getInfo()](../NavuNode.md#s-getInfo) from NavuNode
- [getKeyPath()](../NavuNode.md#s-getKeyPath) from NavuNode
- [getName()](../NavuNode.md#s-getName) from NavuNode
- [getNavuNode(ConfPath)](../NavuNode.md#s-getNavuNode) from NavuNode
- [getParent()](../NavuNode.md#s-getParent) from NavuNode
- [getRootNS()](../NavuNode.md#s-getRootNS) from NavuNode
- [getValues(ConfXMLParam[])](../NavuNode.md#s-getValues) from NavuNode
- [getValues(String)](../NavuNode.md#s-getValues-1) from NavuNode
- [hashCode()](../NavuNode.md#s-hashCode) from NavuNode
- [hasNext()](#s-hasNext)
- [leaf(ConfNamespace, String)](../NavuNode.md#s-leaf) from NavuNode
- [leaf(Integer)](../NavuNode.md#s-leaf-1) from NavuNode
- [leaf(String)](../NavuNode.md#s-leaf-2) from NavuNode
- [leafList(ConfNamespace, String)](../NavuNode.md#s-leafList) from NavuNode
- [leafList(Integer)](../NavuNode.md#s-leafList-1) from NavuNode
- [leafList(String)](../NavuNode.md#s-leafList-2) from NavuNode
- [list(ConfNamespace, String)](../NavuNode.md#s-list) from NavuNode
- [list(Integer)](../NavuNode.md#s-list-1) from NavuNode
- [list(String)](../NavuNode.md#s-list-2) from NavuNode
- [namespace(String)](../NavuNode.md#s-namespace) from NavuNode
- [next()](#s-next)
- [prefix(String)](../NavuNode.md#s-prefix) from NavuNode
- [prepareXMLCall(String)](../NavuNode.md#s-prepareXMLCall) from NavuNode
- [refresh()](../NavuNode.md#s-refresh) from NavuNode
- [remove()](#s-remove)
- [reset()](../NavuNode.md#s-reset) from NavuNode
- [select(ConfObject[])](../NavuNode.md#s-select) from NavuNode
- [select(List<String>)](../NavuNode.md#s-select-1) from NavuNode
- [select(String)](../NavuNode.md#s-select-2) from NavuNode
- [setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)](../NavuNode.md#s-setChange) from NavuNode
- [setValues(ConfXMLParam[])](../NavuNode.md#s-setValues) from NavuNode
- [setValues(String)](../NavuNode.md#s-setValues-1) from NavuNode
- [sharedSetValues(ConfXMLParam[])](../NavuNode.md#s-sharedSetValues) from NavuNode
- [sharedSetValues(String)](../NavuNode.md#s-sharedSetValues-1) from NavuNode
- [stopCdbSession()](../NavuNode.md#s-stopCdbSession) from NavuNode
- [valueUpdateInd(NavuNode)](../NavuNode.md#s-valueUpdateInd) from NavuNode
- [xPathSelect(String)](../NavuNode.md#s-xPathSelect) from NavuNode
- [xPathSelectIterate(String, NavuNodeSetIterate)](../NavuNode.md#s-xPathSelectIterate) from NavuNode

## Constructors

<a id="s-TreeIterator-1"></a>
### TreeIterator(List<NavuNode>)

**Package-private**

```java
TreeIterator(java.util.List<com.tailf.navu.NavuNode> startNodes)
```

Types: [NavuNode](../NavuNode.md#s-NavuNode)

**Parameters**

- `java.util.List<com.tailf.navu.NavuNode> startNodes`

<a id="s-TreeIterator-2"></a>
### TreeIterator(NavuNode)

**Package-private**

```java
TreeIterator(com.tailf.navu.NavuNode startNode)
```

Types: [NavuNode](../NavuNode.md#s-NavuNode)

**Parameters**

- `com.tailf.navu.NavuNode startNode`


## Methods

<a id="s-hasNext"></a>
### hasNext()

```java
public boolean hasNext()
```

<a id="s-next"></a>
### next()

```java
public com.tailf.navu.NavuNode next()
```

Types: [NavuNode](../NavuNode.md#s-NavuNode)

<a id="s-remove"></a>
### remove()

```java
public void remove()
```
