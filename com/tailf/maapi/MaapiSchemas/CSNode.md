# CSNode <a href="#cls-CSNode" id="cls-CSNode"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSNode
```

Class representing a Schema node, having references to parent and
 children as well as siblings

**Related classes**

- [MmapCSNode](../../ncs/maapi/MmapCSNode.md#cls-MmapCSNode)

## Members

**Constructors**:

- [CSNode()](#m-CSNode-8cc5316e52e8)
- [CSNode(int, String, CSSchema, CSNodeInfo, CSNode)](#m-CSNode-faa44d00067a)

**Fields**:

- [firstChild](#m-firstChild)
- [nextSibling](#m-nextSibling)
- [parentNode](#m-parentNode)
- [tag](#m-tag)

**Methods**:

- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getChild(int)](#m-getChild-65485672c186)
- [getChild(int, int)](#m-getChild-689133990b1b)
- [getChildren()](#m-getChildren-fe2038dff10d)
- [getChildren(List<String>)](#m-getChildren-41cf83dd1b0d)
- [getChoices()](#m-getChoices-818fb3fccb86)
- [getDefval()](#m-getDefval-561ad5494c47)
- [getFirstChild()](#m-getFirstChild-710377dd9fb6)
- [getKey(int)](#m-getKey-11aad55949c3)
- [getKeys()](#m-getKeys-a24b9d377db7)
- [getMaxOccurs()](#m-getMaxOccurs-365e8c5a408f)
- [getMinOccurs()](#m-getMinOccurs-cac79959dff8)
- [getNextSibling()](#m-getNextSibling-e2f43ef28bf0)
- [getNodeInfo()](#m-getNodeInfo-82c0a80aac8a)
- [getNS()](#m-getNS-3613c99d8888)
- [getNSHash()](#m-getNSHash-2129fb8b3cfe)
- [getParentNode()](#m-getParentNode-452921385cc4)
- [getSchema()](#m-getSchema-3824c0055841)
- [getSibling(int)](#m-getSibling-d70180ff4183)
- [getSiblings()](#m-getSiblings-f467dd8b6a33)
- [getTag()](#m-getTag-315f45956d6f)
- [getTagHash()](#m-getTagHash-8f057919039c)
- [getType()](#m-getType-5a52f6f0d4c1)
- [getXmlNS()](#m-getXmlNS-bff9992a49a2)
- [hasChildAction()](#m-hasChildAction-91ae469ba39c)
- [hasChildConfAction()](#m-hasChildConfAction-755c8c702590)
- [hasChildOperAction()](#m-hasChildOperAction-8c7a5d00e78f)
- [hasChildReadOnly()](#m-hasChildReadOnly-f5ae648b3fd9)
- [hasChildReadWrite()](#m-hasChildReadWrite-bf5f24442e9b)
- [hasChildren()](#m-hasChildren-94c463ee6541)
- [hasDisplayWhen()](#m-hasDisplayWhen-878875048f53)
- [hasDocDescription()](#m-hasDocDescription-2ef89550698c)
- [hashCode()](#m-hashCode-ef797a217903)
- [hasMetaData()](#m-hasMetaData-a6da44bae224)
- [hasMountPoint()](#m-hasMountPoint-d6dc13d7393d)
- [hasPrompt()](#m-hasPrompt-7ef5d0302ed2)
- [hasServicepoint()](#m-hasServicepoint-48712097633a)
- [hasWhen()](#m-hasWhen-075abcb130be)
- [isAction()](#m-isAction-4ff29a7eee95)
- [isActionParam()](#m-isActionParam-e8be06f1cc55)
- [isActionResult()](#m-isActionResult-bf63fae6130e)
- [isCase()](#m-isCase-fb6be6ab6d36)
- [isContainer()](#m-isContainer-b5ebcd6f6b32)
- [isEmptyLeaf()](#m-isEmptyLeaf-2ddc3d315b7a)
- [isHidden()](#m-isHidden-d555dbca8b21)
- [isLeaf()](#m-isLeaf-5329f6d31dd8)
- [isLeafList()](#m-isLeafList-5410d840730d)
- [isLeafref()](#m-isLeafref-631e9c131138)
- [isList()](#m-isList-c36bce63b506)
- [isNotif()](#m-isNotif-8c0813ed9a18)
- [isOper()](#m-isOper-578628dfb332)
- [isWritable()](#m-isWritable-f813255e9b26)
- [printNodeType()](#m-printNodeType-6ac11a229979)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### CSNode() <a href="#m-CSNode-8cc5316e52e8" id="m-CSNode-8cc5316e52e8"></a>

```java
protected CSNode()
```

Constructor for CSNode class

### CSNode(int, String, CSSchema, CSNodeInfo, CSNode) <a href="#m-CSNode-faa44d00067a" id="m-CSNode-faa44d00067a"></a>

```java
protected CSNode(
    int taghash,
    String tag,
    com.tailf.maapi.MaapiSchemas.CSSchema schema,
    com.tailf.maapi.MaapiSchemas.CSNodeInfo info,
    com.tailf.maapi.MaapiSchemas.CSNode parentNode
)
```

Types: [CSSchema](CSSchema.md#cls-CSSchema), [CSNodeInfo](CSNodeInfo.md#cls-CSNodeInfo), [CSNode](CSNode.md#cls-CSNode)

**Parameters**

- `int taghash`
- `String tag`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `com.tailf.maapi.MaapiSchemas.CSNodeInfo info`
- `com.tailf.maapi.MaapiSchemas.CSNode parentNode`


## Fields

### firstChild <a href="#m-firstChild" id="m-firstChild"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode firstChild = null;
```

Types: [CSNode](CSNode.md#cls-CSNode)

### nextSibling <a href="#m-nextSibling" id="m-nextSibling"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode nextSibling = null;
```

Types: [CSNode](CSNode.md#cls-CSNode)

### parentNode <a href="#m-parentNode" id="m-parentNode"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode parentNode = null;
```

Types: [CSNode](CSNode.md#cls-CSNode)

### tag <a href="#m-tag" id="m-tag"></a>

```java
protected String tag = null;
```


## Methods

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Return true if and onlfy if this nodes
 is equal the specified node

**Parameters**

- `Object o`

### getChild(int) <a href="#m-getChild-65485672c186" id="m-getChild-65485672c186"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getChild(int tagHash)
```

Types: [CSNode](CSNode.md#cls-CSNode)

Retrieve a child with the specified tag
 Returns null if no child exists.

**Parameters**

- `int tagHash`

**Returns:** Child node

### getChild(int, int) <a href="#m-getChild-689133990b1b" id="m-getChild-689133990b1b"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getChild(int nsHash, int tagHash)
```

Types: [CSNode](CSNode.md#cls-CSNode)

Retrieve a child with the specified namespace and tag
 Returns null if no child exists.

**Parameters**

- `int nsHash`
- `int tagHash`

**Returns:** Child node

### getChildren() <a href="#m-getChildren-fe2038dff10d" id="m-getChildren-fe2038dff10d"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getChildren()
```

Types: [CSNode](CSNode.md#cls-CSNode)

Retrieves children for this node as List or
 null if no children exists.

**Returns:** List of children nodes

### getChildren(List<String>) <a href="#m-getChildren-41cf83dd1b0d" id="m-getChildren-41cf83dd1b0d"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getChildren(
    java.util.List<String> mountId
)
```

Types: [CSNode](CSNode.md#cls-CSNode)

Retrieves children for this node given a mount id as List or
 null if no children exists.

**Parameters**

- `java.util.List<String> mountId`

**Returns:** List of children nodes

### getChoices() <a href="#m-getChoices-818fb3fccb86" id="m-getChoices-818fb3fccb86"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getChoices()
```

Types: [CSChoice](CSChoice.md#cls-CSChoice)

get List object of choices for this node. A Choice is represented by
 the CSChoice class, this is a List of CSChoice accordingly

**Returns:** List of Choices

### getDefval() <a href="#m-getDefval-561ad5494c47" id="m-getDefval-561ad5494c47"></a>

```java
public com.tailf.conf.ConfObject getDefval()
```

Types: [ConfObject](../../conf/ConfObject.md#cls-ConfObject)

get default value represented as a subclass to ConfObject

**Returns:** ConfObject

### getFirstChild() <a href="#m-getFirstChild-710377dd9fb6" id="m-getFirstChild-710377dd9fb6"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode getFirstChild()
```

Types: [CSNode](CSNode.md#cls-CSNode)

### getKey(int) <a href="#m-getKey-11aad55949c3" id="m-getKey-11aad55949c3"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getKey(int index)
```

Types: [CSNode](CSNode.md#cls-CSNode)

Return a key at the given index. If no key is found null is
  returned

**Parameters**

- `int index`

**Returns:** return the CSNode of the key

### getKeys() <a href="#m-getKeys-a24b9d377db7" id="m-getKeys-a24b9d377db7"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getKeys()
```

Types: [CSNode](CSNode.md#cls-CSNode)

Return a list of keys. If the node is not a YANG list then null
  is returned.

**Returns:** List of CSNodes used as keys

### getMaxOccurs() <a href="#m-getMaxOccurs-365e8c5a408f" id="m-getMaxOccurs-365e8c5a408f"></a>

```java
public int getMaxOccurs()
```

get MaxOccurs for the node

**Returns:** int maxOccurs

### getMinOccurs() <a href="#m-getMinOccurs-cac79959dff8" id="m-getMinOccurs-cac79959dff8"></a>

```java
public int getMinOccurs()
```

get MinOccurs for the node

**Returns:** int minOccurs

### getNextSibling() <a href="#m-getNextSibling-e2f43ef28bf0" id="m-getNextSibling-e2f43ef28bf0"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode getNextSibling()
```

Types: [CSNode](CSNode.md#cls-CSNode)

### getNodeInfo() <a href="#m-getNodeInfo-82c0a80aac8a" id="m-getNodeInfo-82c0a80aac8a"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNodeInfo getNodeInfo()
```

Types: [CSNodeInfo](CSNodeInfo.md#cls-CSNodeInfo)

Retrieves the node information

**Returns:** CSNodeInfo node information about current (this) node

### getNS() <a href="#m-getNS-3613c99d8888" id="m-getNS-3613c99d8888"></a>

```java
public String getNS()
```

get namespace represented as string

**Returns:** String namespace

### getNSHash() <a href="#m-getNSHash-2129fb8b3cfe" id="m-getNSHash-2129fb8b3cfe"></a>

```java
public int getNSHash()
```

Retrieves the namespace represented as hash value

**Returns:** hashvalue for the namespace

### getParentNode() <a href="#m-getParentNode-452921385cc4" id="m-getParentNode-452921385cc4"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getParentNode()
```

Types: [CSNode](CSNode.md#cls-CSNode)

Retrieves the parent node for this node

**Returns:** CSNode parent or null if this a root node

### getSchema() <a href="#m-getSchema-3824c0055841" id="m-getSchema-3824c0055841"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSSchema getSchema()
```

Types: [CSSchema](CSSchema.md#cls-CSSchema)

Retrieves the schema for the node

**Returns:** schema for the node

### getSibling(int) <a href="#m-getSibling-d70180ff4183" id="m-getSibling-d70180ff4183"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getSibling(int tagHash)
```

Types: [CSNode](CSNode.md#cls-CSNode)

Retrieves sibling with specified tag or null
 if no sibling exists.

**Parameters**

- `int tagHash`

**Returns:** a node

### getSiblings() <a href="#m-getSiblings-f467dd8b6a33" id="m-getSiblings-f467dd8b6a33"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getSiblings()
```

Types: [CSNode](CSNode.md#cls-CSNode)

Retrieves siblings for this node as List or null
 if no siblings exists.


 Includes the current node in the List.

**Returns:** List of sibling nodes including the current (this)
 node

### getTag() <a href="#m-getTag-315f45956d6f" id="m-getTag-315f45956d6f"></a>

```java
public String getTag()
```

Retrieves the node tag represented as string

**Returns:** string tag

### getTagHash() <a href="#m-getTagHash-8f057919039c" id="m-getTagHash-8f057919039c"></a>

```java
public int getTagHash()
```

Retrieves the node tag represented as hash value

**Returns:** int hashvalue for the tag

### getType() <a href="#m-getType-5a52f6f0d4c1" id="m-getType-5a52f6f0d4c1"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSType getType()
```

Types: [CSType](CSType.md#cls-CSType)

get type for the node

**Returns:** CSType type for the node

### getXmlNS() <a href="#m-getXmlNS-bff9992a49a2" id="m-getXmlNS-bff9992a49a2"></a>

```java
public String getXmlNS()
```

get the xml namespace represented as string

**Returns:** String xml namespace

### hasChildAction() <a href="#m-hasChildAction-91ae469ba39c" id="m-hasChildAction-91ae469ba39c"></a>

```java
public boolean hasChildAction()
```

Checks if the node or any of its descendants has YANG 'tailf:action'
 statement(s).

**Returns:** true if node or any of its descendants has YANG
 'tailf:action' statement(s).

### hasChildConfAction() <a href="#m-hasChildConfAction-755c8c702590" id="m-hasChildConfAction-755c8c702590"></a>

```java
public boolean hasChildConfAction()
```

Checks if the node or any of its descendants has YANG
 'tailf:cli-configure-mode' statement(s).

**Returns:** true if node or any of its descendants has YANG
 'tailf:cli-configure-mode' statement(s).

### hasChildOperAction() <a href="#m-hasChildOperAction-8c7a5d00e78f" id="m-hasChildOperAction-8c7a5d00e78f"></a>

```java
public boolean hasChildOperAction()
```

Checks if the node or any of its descendants has YANG
 'tailf:cli-operational-mode' statement(s).

**Returns:** true if node or any of its descendants has YANG
 'tailf:cli-operational-mode' statement(s).

### hasChildReadOnly() <a href="#m-hasChildReadOnly-f5ae648b3fd9" id="m-hasChildReadOnly-f5ae648b3fd9"></a>

```java
public boolean hasChildReadOnly()
```

Checks if this node is an operational (read-only) node, or if
 any of its descendants are operational nodes.

**Returns:** true if the subtree contains operational data nodes.

### hasChildReadWrite() <a href="#m-hasChildReadWrite-bf5f24442e9b" id="m-hasChildReadWrite-bf5f24442e9b"></a>

```java
public boolean hasChildReadWrite()
```

Checks if this node is a configuration (read-write) node, or if any
 of its descendants are configuration data nodes.

**Returns:** true if the subtree contains configuration data nodes.

### hasChildren() <a href="#m-hasChildren-94c463ee6541" id="m-hasChildren-94c463ee6541"></a>

```java
public boolean hasChildren()
```

Checks if a node hash children.

**Returns:** true if children exists.

### hasDisplayWhen() <a href="#m-hasDisplayWhen-878875048f53" id="m-hasDisplayWhen-878875048f53"></a>

```java
public boolean hasDisplayWhen()
```

Checks if the node has YANG 'tailf:display-when' statement(s).

**Returns:** true if node has YANG 'tailf:display-when' statement(s).

### hasDocDescription() <a href="#m-hasDocDescription-2ef89550698c" id="m-hasDocDescription-2ef89550698c"></a>

```java
public boolean hasDocDescription()
```

Checks if the node has documentation description.

**Returns:** true if node has documentation description.

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### hasMetaData() <a href="#m-hasMetaData-a6da44bae224" id="m-hasMetaData-a6da44bae224"></a>

```java
public boolean hasMetaData()
```

Checks if the node has YANG 'tailf:meta-data' statement(s).

**Returns:** true if node has YANG 'tailf:meta-data' statement(s).

### hasMountPoint() <a href="#m-hasMountPoint-d6dc13d7393d" id="m-hasMountPoint-d6dc13d7393d"></a>

```java
public boolean hasMountPoint()
```

### hasPrompt() <a href="#m-hasPrompt-7ef5d0302ed2" id="m-hasPrompt-7ef5d0302ed2"></a>

```java
public boolean hasPrompt()
```

Checks if the node has YANG 'tailf:prompt' statement(s).

**Returns:** true if node has YANG 'tailf:prompt' statement(s).

### hasServicepoint() <a href="#m-hasServicepoint-48712097633a" id="m-hasServicepoint-48712097633a"></a>

```java
public boolean hasServicepoint()
```

Checks if the node has YANG 'ncs:servicepoint' statement(s).

**Returns:** true if node has YANG 'ncs:servicepoint' statement(s).

### hasWhen() <a href="#m-hasWhen-075abcb130be" id="m-hasWhen-075abcb130be"></a>

```java
public boolean hasWhen()
```

Checks if the node has YANG 'when' statement(s).

**Returns:** true if node has YANG 'when' statement(s).

### isAction() <a href="#m-isAction-4ff29a7eee95" id="m-isAction-4ff29a7eee95"></a>

```java
public boolean isAction()
```

Checks if a node is an action.

**Returns:** true if it is an action.

### isActionParam() <a href="#m-isActionParam-e8be06f1cc55" id="m-isActionParam-e8be06f1cc55"></a>

```java
public boolean isActionParam()
```

Checks if a node is an action parameter node.

**Returns:** true if the node is an action parameter node.

### isActionResult() <a href="#m-isActionResult-bf63fae6130e" id="m-isActionResult-bf63fae6130e"></a>

```java
public boolean isActionResult()
```

Checks if a node is an action result node.

**Returns:** true if the node is action result node.

### isCase() <a href="#m-isCase-fb6be6ab6d36" id="m-isCase-fb6be6ab6d36"></a>

```java
public boolean isCase()
```

Checks if a node is top level of a case.

**Returns:** true if the node is part of a case.

### isContainer() <a href="#m-isContainer-b5ebcd6f6b32" id="m-isContainer-b5ebcd6f6b32"></a>

```java
public boolean isContainer()
```

Checks if a node is a container node.

**Returns:** true if the node is a container node.

### isEmptyLeaf() <a href="#m-isEmptyLeaf-2ddc3d315b7a" id="m-isEmptyLeaf-2ddc3d315b7a"></a>

```java
public boolean isEmptyLeaf()
```

### isHidden() <a href="#m-isHidden-d555dbca8b21" id="m-isHidden-d555dbca8b21"></a>

```java
public boolean isHidden()
```

Checks if the node is hidden via 'tailf:hidden' statement.

**Returns:** true if node is hidden.

### isLeaf() <a href="#m-isLeaf-5329f6d31dd8" id="m-isLeaf-5329f6d31dd8"></a>

```java
public boolean isLeaf()
```

Checks if a node is a leaf node.

**Returns:** true if the node is leaf node.

### isLeafList() <a href="#m-isLeafList-5410d840730d" id="m-isLeafList-5410d840730d"></a>

```java
public boolean isLeafList()
```

Checks if the node is a leaf-list node.

**Returns:** true if the node is leaf-list node.

### isLeafref() <a href="#m-isLeafref-631e9c131138" id="m-isLeafref-631e9c131138"></a>

```java
public boolean isLeafref()
```

Checks if the node is a YANG 'leafref'.

**Returns:** true if node is a YANG 'leafref'.

### isList() <a href="#m-isList-c36bce63b506" id="m-isList-c36bce63b506"></a>

```java
public boolean isList()
```

Checks if a node is a list node.

**Returns:** true if the node is list node.

### isNotif() <a href="#m-isNotif-8c0813ed9a18" id="m-isNotif-8c0813ed9a18"></a>

```java
public boolean isNotif()
```

Checks if the node is a notification

**Returns:** true if the node a notification

### isOper() <a href="#m-isOper-578628dfb332" id="m-isOper-578628dfb332"></a>

```java
public boolean isOper()
```

**Returns:** true if node is OPER data.

### isWritable() <a href="#m-isWritable-f813255e9b26" id="m-isWritable-f813255e9b26"></a>

```java
public boolean isWritable()
```

Checks if the node is writable.

**Returns:** true if the node is writable.

### printNodeType() <a href="#m-printNodeType-6ac11a229979" id="m-printNodeType-6ac11a229979"></a>

```java
public String printNodeType()
```

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Informative string representation of a CSNode instance

**Returns:** String
