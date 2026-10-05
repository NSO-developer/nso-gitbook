<a id="cls-CSNode"></a>
# CSNode

```java
public static class com.tailf.maapi.MaapiSchemas.CSNode
```

Class representing a Schema node, having references to parent and
 children as well as siblings

**Related classes**

- [MmapCSNode](../../ncs/maapi/MmapCSNode.md#cls-MmapCSNode)

## Members

**Constructors**:

- [CSNode()](#m-csnode-8cc5316e52e8)
- [CSNode(int, String, CSSchema, CSNodeInfo, CSNode)](#m-csnode-faa44d00067a)

**Fields**:

- [firstChild](#m-firstChild)
- [nextSibling](#m-nextSibling)
- [parentNode](#m-parentNode)
- [tag](#m-tag)

**Methods**:

- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getChild(int)](#m-getchild-65485672c186)
- [getChild(int, int)](#m-getchild-689133990b1b)
- [getChildren()](#m-getchildren-fe2038dff10d)
- [getChildren(List<String>)](#m-getchildren-41cf83dd1b0d)
- [getChoices()](#m-getchoices-818fb3fccb86)
- [getDefval()](#m-getdefval-561ad5494c47)
- [getFirstChild()](#m-getfirstchild-710377dd9fb6)
- [getKey(int)](#m-getkey-11aad55949c3)
- [getKeys()](#m-getkeys-a24b9d377db7)
- [getMaxOccurs()](#m-getmaxoccurs-365e8c5a408f)
- [getMinOccurs()](#m-getminoccurs-cac79959dff8)
- [getNextSibling()](#m-getnextsibling-e2f43ef28bf0)
- [getNodeInfo()](#m-getnodeinfo-82c0a80aac8a)
- [getNS()](#m-getns-3613c99d8888)
- [getNSHash()](#m-getnshash-2129fb8b3cfe)
- [getParentNode()](#m-getparentnode-452921385cc4)
- [getSchema()](#m-getschema-3824c0055841)
- [getSibling(int)](#m-getsibling-d70180ff4183)
- [getSiblings()](#m-getsiblings-f467dd8b6a33)
- [getTag()](#m-gettag-315f45956d6f)
- [getTagHash()](#m-gettaghash-8f057919039c)
- [getType()](#m-gettype-5a52f6f0d4c1)
- [getXmlNS()](#m-getxmlns-bff9992a49a2)
- [hasChildAction()](#m-haschildaction-91ae469ba39c)
- [hasChildConfAction()](#m-haschildconfaction-755c8c702590)
- [hasChildOperAction()](#m-haschildoperaction-8c7a5d00e78f)
- [hasChildReadOnly()](#m-haschildreadonly-f5ae648b3fd9)
- [hasChildReadWrite()](#m-haschildreadwrite-bf5f24442e9b)
- [hasChildren()](#m-haschildren-94c463ee6541)
- [hasDisplayWhen()](#m-hasdisplaywhen-878875048f53)
- [hasDocDescription()](#m-hasdocdescription-2ef89550698c)
- [hashCode()](#m-hashcode-ef797a217903)
- [hasMetaData()](#m-hasmetadata-a6da44bae224)
- [hasMountPoint()](#m-hasmountpoint-d6dc13d7393d)
- [hasPrompt()](#m-hasprompt-7ef5d0302ed2)
- [hasServicepoint()](#m-hasservicepoint-48712097633a)
- [hasWhen()](#m-haswhen-075abcb130be)
- [isAction()](#m-isaction-4ff29a7eee95)
- [isActionParam()](#m-isactionparam-e8be06f1cc55)
- [isActionResult()](#m-isactionresult-bf63fae6130e)
- [isCase()](#m-iscase-fb6be6ab6d36)
- [isContainer()](#m-iscontainer-b5ebcd6f6b32)
- [isEmptyLeaf()](#m-isemptyleaf-2ddc3d315b7a)
- [isHidden()](#m-ishidden-d555dbca8b21)
- [isLeaf()](#m-isleaf-5329f6d31dd8)
- [isLeafList()](#m-isleaflist-5410d840730d)
- [isLeafref()](#m-isleafref-631e9c131138)
- [isList()](#m-islist-c36bce63b506)
- [isNotif()](#m-isnotif-8c0813ed9a18)
- [isOper()](#m-isoper-578628dfb332)
- [isWritable()](#m-iswritable-f813255e9b26)
- [printNodeType()](#m-printnodetype-6ac11a229979)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-csnode-8cc5316e52e8"></a>
### CSNode()

```java
protected CSNode()
```

Constructor for CSNode class

<a id="m-csnode-faa44d00067a"></a>
### CSNode(int, String, CSSchema, CSNodeInfo, CSNode)

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

<a id="m-firstChild"></a>
### firstChild

```java
protected com.tailf.maapi.MaapiSchemas.CSNode firstChild = null;
```

Types: [CSNode](CSNode.md#cls-CSNode)

<a id="m-nextSibling"></a>
### nextSibling

```java
protected com.tailf.maapi.MaapiSchemas.CSNode nextSibling = null;
```

Types: [CSNode](CSNode.md#cls-CSNode)

<a id="m-parentNode"></a>
### parentNode

```java
protected com.tailf.maapi.MaapiSchemas.CSNode parentNode = null;
```

Types: [CSNode](CSNode.md#cls-CSNode)

<a id="m-tag"></a>
### tag

```java
protected String tag = null;
```


## Methods

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Return true if and onlfy if this nodes
 is equal the specified node

**Parameters**

- `Object o`

<a id="m-getchild-65485672c186"></a>
### getChild(int)

```java
public com.tailf.maapi.MaapiSchemas.CSNode getChild(int tagHash)
```

Types: [CSNode](CSNode.md#cls-CSNode)

Retrieve a child with the specified tag
 Returns null if no child exists.

**Parameters**

- `int tagHash`

**Returns:** Child node

<a id="m-getchild-689133990b1b"></a>
### getChild(int, int)

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

<a id="m-getchildren-fe2038dff10d"></a>
### getChildren()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getChildren()
```

Types: [CSNode](CSNode.md#cls-CSNode)

Retrieves children for this node as List or
 null if no children exists.

**Returns:** List of children nodes

<a id="m-getchildren-41cf83dd1b0d"></a>
### getChildren(List<String>)

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

<a id="m-getchoices-818fb3fccb86"></a>
### getChoices()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getChoices()
```

Types: [CSChoice](CSChoice.md#cls-CSChoice)

get List object of choices for this node. A Choice is represented by
 the CSChoice class, this is a List of CSChoice accordingly

**Returns:** List of Choices

<a id="m-getdefval-561ad5494c47"></a>
### getDefval()

```java
public com.tailf.conf.ConfObject getDefval()
```

Types: [ConfObject](../../conf/ConfObject.md#cls-ConfObject)

get default value represented as a subclass to ConfObject

**Returns:** ConfObject

<a id="m-getfirstchild-710377dd9fb6"></a>
### getFirstChild()

```java
protected com.tailf.maapi.MaapiSchemas.CSNode getFirstChild()
```

Types: [CSNode](CSNode.md#cls-CSNode)

<a id="m-getkey-11aad55949c3"></a>
### getKey(int)

```java
public com.tailf.maapi.MaapiSchemas.CSNode getKey(int index)
```

Types: [CSNode](CSNode.md#cls-CSNode)

Return a key at the given index. If no key is found null is
  returned

**Parameters**

- `int index`

**Returns:** return the CSNode of the key

<a id="m-getkeys-a24b9d377db7"></a>
### getKeys()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getKeys()
```

Types: [CSNode](CSNode.md#cls-CSNode)

Return a list of keys. If the node is not a YANG list then null
  is returned.

**Returns:** List of CSNodes used as keys

<a id="m-getmaxoccurs-365e8c5a408f"></a>
### getMaxOccurs()

```java
public int getMaxOccurs()
```

get MaxOccurs for the node

**Returns:** int maxOccurs

<a id="m-getminoccurs-cac79959dff8"></a>
### getMinOccurs()

```java
public int getMinOccurs()
```

get MinOccurs for the node

**Returns:** int minOccurs

<a id="m-getnextsibling-e2f43ef28bf0"></a>
### getNextSibling()

```java
protected com.tailf.maapi.MaapiSchemas.CSNode getNextSibling()
```

Types: [CSNode](CSNode.md#cls-CSNode)

<a id="m-getnodeinfo-82c0a80aac8a"></a>
### getNodeInfo()

```java
public com.tailf.maapi.MaapiSchemas.CSNodeInfo getNodeInfo()
```

Types: [CSNodeInfo](CSNodeInfo.md#cls-CSNodeInfo)

Retrieves the node information

**Returns:** CSNodeInfo node information about current (this) node

<a id="m-getns-3613c99d8888"></a>
### getNS()

```java
public String getNS()
```

get namespace represented as string

**Returns:** String namespace

<a id="m-getnshash-2129fb8b3cfe"></a>
### getNSHash()

```java
public int getNSHash()
```

Retrieves the namespace represented as hash value

**Returns:** hashvalue for the namespace

<a id="m-getparentnode-452921385cc4"></a>
### getParentNode()

```java
public com.tailf.maapi.MaapiSchemas.CSNode getParentNode()
```

Types: [CSNode](CSNode.md#cls-CSNode)

Retrieves the parent node for this node

**Returns:** CSNode parent or null if this a root node

<a id="m-getschema-3824c0055841"></a>
### getSchema()

```java
public com.tailf.maapi.MaapiSchemas.CSSchema getSchema()
```

Types: [CSSchema](CSSchema.md#cls-CSSchema)

Retrieves the schema for the node

**Returns:** schema for the node

<a id="m-getsibling-d70180ff4183"></a>
### getSibling(int)

```java
public com.tailf.maapi.MaapiSchemas.CSNode getSibling(int tagHash)
```

Types: [CSNode](CSNode.md#cls-CSNode)

Retrieves sibling with specified tag or null
 if no sibling exists.

**Parameters**

- `int tagHash`

**Returns:** a node

<a id="m-getsiblings-f467dd8b6a33"></a>
### getSiblings()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getSiblings()
```

Types: [CSNode](CSNode.md#cls-CSNode)

Retrieves siblings for this node as List or null
 if no siblings exists.


 Includes the current node in the List.

**Returns:** List of sibling nodes including the current (this)
 node

<a id="m-gettag-315f45956d6f"></a>
### getTag()

```java
public String getTag()
```

Retrieves the node tag represented as string

**Returns:** string tag

<a id="m-gettaghash-8f057919039c"></a>
### getTagHash()

```java
public int getTagHash()
```

Retrieves the node tag represented as hash value

**Returns:** int hashvalue for the tag

<a id="m-gettype-5a52f6f0d4c1"></a>
### getType()

```java
public com.tailf.maapi.MaapiSchemas.CSType getType()
```

Types: [CSType](CSType.md#cls-CSType)

get type for the node

**Returns:** CSType type for the node

<a id="m-getxmlns-bff9992a49a2"></a>
### getXmlNS()

```java
public String getXmlNS()
```

get the xml namespace represented as string

**Returns:** String xml namespace

<a id="m-haschildaction-91ae469ba39c"></a>
### hasChildAction()

```java
public boolean hasChildAction()
```

Checks if the node or any of its descendants has YANG 'tailf:action'
 statement(s).

**Returns:** true if node or any of its descendants has YANG
 'tailf:action' statement(s).

<a id="m-haschildconfaction-755c8c702590"></a>
### hasChildConfAction()

```java
public boolean hasChildConfAction()
```

Checks if the node or any of its descendants has YANG
 'tailf:cli-configure-mode' statement(s).

**Returns:** true if node or any of its descendants has YANG
 'tailf:cli-configure-mode' statement(s).

<a id="m-haschildoperaction-8c7a5d00e78f"></a>
### hasChildOperAction()

```java
public boolean hasChildOperAction()
```

Checks if the node or any of its descendants has YANG
 'tailf:cli-operational-mode' statement(s).

**Returns:** true if node or any of its descendants has YANG
 'tailf:cli-operational-mode' statement(s).

<a id="m-haschildreadonly-f5ae648b3fd9"></a>
### hasChildReadOnly()

```java
public boolean hasChildReadOnly()
```

Checks if this node is an operational (read-only) node, or if
 any of its descendants are operational nodes.

**Returns:** true if the subtree contains operational data nodes.

<a id="m-haschildreadwrite-bf5f24442e9b"></a>
### hasChildReadWrite()

```java
public boolean hasChildReadWrite()
```

Checks if this node is a configuration (read-write) node, or if any
 of its descendants are configuration data nodes.

**Returns:** true if the subtree contains configuration data nodes.

<a id="m-haschildren-94c463ee6541"></a>
### hasChildren()

```java
public boolean hasChildren()
```

Checks if a node hash children.

**Returns:** true if children exists.

<a id="m-hasdisplaywhen-878875048f53"></a>
### hasDisplayWhen()

```java
public boolean hasDisplayWhen()
```

Checks if the node has YANG 'tailf:display-when' statement(s).

**Returns:** true if node has YANG 'tailf:display-when' statement(s).

<a id="m-hasdocdescription-2ef89550698c"></a>
### hasDocDescription()

```java
public boolean hasDocDescription()
```

Checks if the node has documentation description.

**Returns:** true if node has documentation description.

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-hasmetadata-a6da44bae224"></a>
### hasMetaData()

```java
public boolean hasMetaData()
```

Checks if the node has YANG 'tailf:meta-data' statement(s).

**Returns:** true if node has YANG 'tailf:meta-data' statement(s).

<a id="m-hasmountpoint-d6dc13d7393d"></a>
### hasMountPoint()

```java
public boolean hasMountPoint()
```

<a id="m-hasprompt-7ef5d0302ed2"></a>
### hasPrompt()

```java
public boolean hasPrompt()
```

Checks if the node has YANG 'tailf:prompt' statement(s).

**Returns:** true if node has YANG 'tailf:prompt' statement(s).

<a id="m-hasservicepoint-48712097633a"></a>
### hasServicepoint()

```java
public boolean hasServicepoint()
```

Checks if the node has YANG 'ncs:servicepoint' statement(s).

**Returns:** true if node has YANG 'ncs:servicepoint' statement(s).

<a id="m-haswhen-075abcb130be"></a>
### hasWhen()

```java
public boolean hasWhen()
```

Checks if the node has YANG 'when' statement(s).

**Returns:** true if node has YANG 'when' statement(s).

<a id="m-isaction-4ff29a7eee95"></a>
### isAction()

```java
public boolean isAction()
```

Checks if a node is an action.

**Returns:** true if it is an action.

<a id="m-isactionparam-e8be06f1cc55"></a>
### isActionParam()

```java
public boolean isActionParam()
```

Checks if a node is an action parameter node.

**Returns:** true if the node is an action parameter node.

<a id="m-isactionresult-bf63fae6130e"></a>
### isActionResult()

```java
public boolean isActionResult()
```

Checks if a node is an action result node.

**Returns:** true if the node is action result node.

<a id="m-iscase-fb6be6ab6d36"></a>
### isCase()

```java
public boolean isCase()
```

Checks if a node is top level of a case.

**Returns:** true if the node is part of a case.

<a id="m-iscontainer-b5ebcd6f6b32"></a>
### isContainer()

```java
public boolean isContainer()
```

Checks if a node is a container node.

**Returns:** true if the node is a container node.

<a id="m-isemptyleaf-2ddc3d315b7a"></a>
### isEmptyLeaf()

```java
public boolean isEmptyLeaf()
```

<a id="m-ishidden-d555dbca8b21"></a>
### isHidden()

```java
public boolean isHidden()
```

Checks if the node is hidden via 'tailf:hidden' statement.

**Returns:** true if node is hidden.

<a id="m-isleaf-5329f6d31dd8"></a>
### isLeaf()

```java
public boolean isLeaf()
```

Checks if a node is a leaf node.

**Returns:** true if the node is leaf node.

<a id="m-isleaflist-5410d840730d"></a>
### isLeafList()

```java
public boolean isLeafList()
```

Checks if the node is a leaf-list node.

**Returns:** true if the node is leaf-list node.

<a id="m-isleafref-631e9c131138"></a>
### isLeafref()

```java
public boolean isLeafref()
```

Checks if the node is a YANG 'leafref'.

**Returns:** true if node is a YANG 'leafref'.

<a id="m-islist-c36bce63b506"></a>
### isList()

```java
public boolean isList()
```

Checks if a node is a list node.

**Returns:** true if the node is list node.

<a id="m-isnotif-8c0813ed9a18"></a>
### isNotif()

```java
public boolean isNotif()
```

Checks if the node is a notification

**Returns:** true if the node a notification

<a id="m-isoper-578628dfb332"></a>
### isOper()

```java
public boolean isOper()
```

**Returns:** true if node is OPER data.

<a id="m-iswritable-f813255e9b26"></a>
### isWritable()

```java
public boolean isWritable()
```

Checks if the node is writable.

**Returns:** true if the node is writable.

<a id="m-printnodetype-6ac11a229979"></a>
### printNodeType()

```java
public String printNodeType()
```

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Informative string representation of a CSNode instance

**Returns:** String
