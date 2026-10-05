# CSNode <a href="#csnode-f12d9ad69c28" id="csnode-f12d9ad69c28"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSNode
```

Class representing a Schema node, having references to parent and
 children as well as siblings

**Related classes**

- [MmapCSNode](../../ncs/maapi/MmapCSNode.md#mmapcsnode-cd078e4f36a9)

## Members

**Constructors**:

- [CSNode\(\)](#csnode-8cc5316e52e8)
- [CSNode\(int, String, CSSchema, CSNodeInfo, CSNode\)](#csnode-faa44d00067a)

**Fields**:

- [firstChild](#firstchild-0586a0455621)
- [nextSibling](#nextsibling-2acba50f3dbb)
- [parentNode](#parentnode-eec3fae29e9e)
- [tag](#tag-4c1656782674)

**Methods**:

- [equals\(Object\)](#equals-fcd6492e0d6c)
- [getChild\(int\)](#getchild-65485672c186)
- [getChild\(int, int\)](#getchild-689133990b1b)
- [getChildren\(\)](#getchildren-fe2038dff10d)
- [getChildren\(List\<String\>\)](#getchildren-41cf83dd1b0d)
- [getChoices\(\)](#getchoices-818fb3fccb86)
- [getDefval\(\)](#getdefval-561ad5494c47)
- [getFirstChild\(\)](#getfirstchild-710377dd9fb6)
- [getKey\(int\)](#getkey-11aad55949c3)
- [getKeys\(\)](#getkeys-a24b9d377db7)
- [getMaxOccurs\(\)](#getmaxoccurs-365e8c5a408f)
- [getMinOccurs\(\)](#getminoccurs-cac79959dff8)
- [getNextSibling\(\)](#getnextsibling-e2f43ef28bf0)
- [getNodeInfo\(\)](#getnodeinfo-82c0a80aac8a)
- [getNS\(\)](#getns-3613c99d8888)
- [getNSHash\(\)](#getnshash-2129fb8b3cfe)
- [getParentNode\(\)](#getparentnode-452921385cc4)
- [getSchema\(\)](#getschema-3824c0055841)
- [getSibling\(int\)](#getsibling-d70180ff4183)
- [getSiblings\(\)](#getsiblings-f467dd8b6a33)
- [getTag\(\)](#gettag-315f45956d6f)
- [getTagHash\(\)](#gettaghash-8f057919039c)
- [getType\(\)](#gettype-5a52f6f0d4c1)
- [getXmlNS\(\)](#getxmlns-bff9992a49a2)
- [hasChildAction\(\)](#haschildaction-91ae469ba39c)
- [hasChildConfAction\(\)](#haschildconfaction-755c8c702590)
- [hasChildOperAction\(\)](#haschildoperaction-8c7a5d00e78f)
- [hasChildReadOnly\(\)](#haschildreadonly-f5ae648b3fd9)
- [hasChildReadWrite\(\)](#haschildreadwrite-bf5f24442e9b)
- [hasChildren\(\)](#haschildren-94c463ee6541)
- [hasDisplayWhen\(\)](#hasdisplaywhen-878875048f53)
- [hasDocDescription\(\)](#hasdocdescription-2ef89550698c)
- [hashCode\(\)](#hashcode-ef797a217903)
- [hasMetaData\(\)](#hasmetadata-a6da44bae224)
- [hasMountPoint\(\)](#hasmountpoint-d6dc13d7393d)
- [hasPrompt\(\)](#hasprompt-7ef5d0302ed2)
- [hasServicepoint\(\)](#hasservicepoint-48712097633a)
- [hasWhen\(\)](#haswhen-075abcb130be)
- [isAction\(\)](#isaction-4ff29a7eee95)
- [isActionParam\(\)](#isactionparam-e8be06f1cc55)
- [isActionResult\(\)](#isactionresult-bf63fae6130e)
- [isCase\(\)](#iscase-fb6be6ab6d36)
- [isContainer\(\)](#iscontainer-b5ebcd6f6b32)
- [isEmptyLeaf\(\)](#isemptyleaf-2ddc3d315b7a)
- [isHidden\(\)](#ishidden-d555dbca8b21)
- [isLeaf\(\)](#isleaf-5329f6d31dd8)
- [isLeafList\(\)](#isleaflist-5410d840730d)
- [isLeafref\(\)](#isleafref-631e9c131138)
- [isList\(\)](#islist-c36bce63b506)
- [isNotif\(\)](#isnotif-8c0813ed9a18)
- [isOper\(\)](#isoper-578628dfb332)
- [isWritable\(\)](#iswritable-f813255e9b26)
- [printNodeType\(\)](#printnodetype-6ac11a229979)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### CSNode() <a href="#csnode-8cc5316e52e8" id="csnode-8cc5316e52e8"></a>

```java
protected CSNode()
```

Constructor for CSNode class

### CSNode(int, String, CSSchema, CSNodeInfo, CSNode) <a href="#csnode-faa44d00067a" id="csnode-faa44d00067a"></a>

```java
protected CSNode(
    int taghash,
    String tag,
    com.tailf.maapi.MaapiSchemas.CSSchema schema,
    com.tailf.maapi.MaapiSchemas.CSNodeInfo info,
    com.tailf.maapi.MaapiSchemas.CSNode parentNode
)
```

Types: [CSSchema](CSSchema.md#csschema-f51a58180f67), [CSNodeInfo](CSNodeInfo.md#csnodeinfo-aad17d6161cc), [CSNode](CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `int taghash`
- `String tag`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `com.tailf.maapi.MaapiSchemas.CSNodeInfo info`
- `com.tailf.maapi.MaapiSchemas.CSNode parentNode`


## Fields

### firstChild <a href="#firstchild-0586a0455621" id="firstchild-0586a0455621"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode firstChild = null;
```

Types: [CSNode](CSNode.md#csnode-f12d9ad69c28)

### nextSibling <a href="#nextsibling-2acba50f3dbb" id="nextsibling-2acba50f3dbb"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode nextSibling = null;
```

Types: [CSNode](CSNode.md#csnode-f12d9ad69c28)

### parentNode <a href="#parentnode-eec3fae29e9e" id="parentnode-eec3fae29e9e"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode parentNode = null;
```

Types: [CSNode](CSNode.md#csnode-f12d9ad69c28)

### tag <a href="#tag-4c1656782674" id="tag-4c1656782674"></a>

```java
protected String tag = null;
```


## Methods

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Return true if and onlfy if this nodes
 is equal the specified node

**Parameters**

- `Object o`

### getChild(int) <a href="#getchild-65485672c186" id="getchild-65485672c186"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getChild(int tagHash)
```

Types: [CSNode](CSNode.md#csnode-f12d9ad69c28)

Retrieve a child with the specified tag
 Returns null if no child exists.

**Parameters**

- `int tagHash`

**Returns:** Child node

### getChild(int, int) <a href="#getchild-689133990b1b" id="getchild-689133990b1b"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getChild(int nsHash, int tagHash)
```

Types: [CSNode](CSNode.md#csnode-f12d9ad69c28)

Retrieve a child with the specified namespace and tag
 Returns null if no child exists.

**Parameters**

- `int nsHash`
- `int tagHash`

**Returns:** Child node

### getChildren() <a href="#getchildren-fe2038dff10d" id="getchildren-fe2038dff10d"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getChildren()
```

Types: [CSNode](CSNode.md#csnode-f12d9ad69c28)

Retrieves children for this node as List or
 null if no children exists.

**Returns:** List of children nodes

### getChildren(List&lt;String&gt;) <a href="#getchildren-41cf83dd1b0d" id="getchildren-41cf83dd1b0d"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getChildren(
    java.util.List<String> mountId
)
```

Types: [CSNode](CSNode.md#csnode-f12d9ad69c28)

Retrieves children for this node given a mount id as List or
 null if no children exists.

**Parameters**

- `java.util.List<String> mountId`

**Returns:** List of children nodes

### getChoices() <a href="#getchoices-818fb3fccb86" id="getchoices-818fb3fccb86"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getChoices()
```

Types: [CSChoice](CSChoice.md#cschoice-7d5d5dd71270)

get List object of choices for this node. A Choice is represented by
 the CSChoice class, this is a List of CSChoice accordingly

**Returns:** List of Choices

### getDefval() <a href="#getdefval-561ad5494c47" id="getdefval-561ad5494c47"></a>

```java
public com.tailf.conf.ConfObject getDefval()
```

Types: [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2)

get default value represented as a subclass to ConfObject

**Returns:** ConfObject

### getFirstChild() <a href="#getfirstchild-710377dd9fb6" id="getfirstchild-710377dd9fb6"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode getFirstChild()
```

Types: [CSNode](CSNode.md#csnode-f12d9ad69c28)

### getKey(int) <a href="#getkey-11aad55949c3" id="getkey-11aad55949c3"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getKey(int index)
```

Types: [CSNode](CSNode.md#csnode-f12d9ad69c28)

Return a key at the given index. If no key is found null is
  returned

**Parameters**

- `int index`

**Returns:** return the CSNode of the key

### getKeys() <a href="#getkeys-a24b9d377db7" id="getkeys-a24b9d377db7"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getKeys()
```

Types: [CSNode](CSNode.md#csnode-f12d9ad69c28)

Return a list of keys. If the node is not a YANG list then null
  is returned.

**Returns:** List of CSNodes used as keys

### getMaxOccurs() <a href="#getmaxoccurs-365e8c5a408f" id="getmaxoccurs-365e8c5a408f"></a>

```java
public int getMaxOccurs()
```

get MaxOccurs for the node

**Returns:** int maxOccurs

### getMinOccurs() <a href="#getminoccurs-cac79959dff8" id="getminoccurs-cac79959dff8"></a>

```java
public int getMinOccurs()
```

get MinOccurs for the node

**Returns:** int minOccurs

### getNextSibling() <a href="#getnextsibling-e2f43ef28bf0" id="getnextsibling-e2f43ef28bf0"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode getNextSibling()
```

Types: [CSNode](CSNode.md#csnode-f12d9ad69c28)

### getNodeInfo() <a href="#getnodeinfo-82c0a80aac8a" id="getnodeinfo-82c0a80aac8a"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNodeInfo getNodeInfo()
```

Types: [CSNodeInfo](CSNodeInfo.md#csnodeinfo-aad17d6161cc)

Retrieves the node information

**Returns:** CSNodeInfo node information about current (this) node

### getNS() <a href="#getns-3613c99d8888" id="getns-3613c99d8888"></a>

```java
public String getNS()
```

get namespace represented as string

**Returns:** String namespace

### getNSHash() <a href="#getnshash-2129fb8b3cfe" id="getnshash-2129fb8b3cfe"></a>

```java
public int getNSHash()
```

Retrieves the namespace represented as hash value

**Returns:** hashvalue for the namespace

### getParentNode() <a href="#getparentnode-452921385cc4" id="getparentnode-452921385cc4"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getParentNode()
```

Types: [CSNode](CSNode.md#csnode-f12d9ad69c28)

Retrieves the parent node for this node

**Returns:** CSNode parent or null if this a root node

### getSchema() <a href="#getschema-3824c0055841" id="getschema-3824c0055841"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSSchema getSchema()
```

Types: [CSSchema](CSSchema.md#csschema-f51a58180f67)

Retrieves the schema for the node

**Returns:** schema for the node

### getSibling(int) <a href="#getsibling-d70180ff4183" id="getsibling-d70180ff4183"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getSibling(int tagHash)
```

Types: [CSNode](CSNode.md#csnode-f12d9ad69c28)

Retrieves sibling with specified tag or null
 if no sibling exists.

**Parameters**

- `int tagHash`

**Returns:** a node

### getSiblings() <a href="#getsiblings-f467dd8b6a33" id="getsiblings-f467dd8b6a33"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getSiblings()
```

Types: [CSNode](CSNode.md#csnode-f12d9ad69c28)

Retrieves siblings for this node as List or null
 if no siblings exists.


 Includes the current node in the List.

**Returns:** List of sibling nodes including the current (this)
 node

### getTag() <a href="#gettag-315f45956d6f" id="gettag-315f45956d6f"></a>

```java
public String getTag()
```

Retrieves the node tag represented as string

**Returns:** string tag

### getTagHash() <a href="#gettaghash-8f057919039c" id="gettaghash-8f057919039c"></a>

```java
public int getTagHash()
```

Retrieves the node tag represented as hash value

**Returns:** int hashvalue for the tag

### getType() <a href="#gettype-5a52f6f0d4c1" id="gettype-5a52f6f0d4c1"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSType getType()
```

Types: [CSType](CSType.md#cstype-8bf086cc0595)

get type for the node

**Returns:** CSType type for the node

### getXmlNS() <a href="#getxmlns-bff9992a49a2" id="getxmlns-bff9992a49a2"></a>

```java
public String getXmlNS()
```

get the xml namespace represented as string

**Returns:** String xml namespace

### hasChildAction() <a href="#haschildaction-91ae469ba39c" id="haschildaction-91ae469ba39c"></a>

```java
public boolean hasChildAction()
```

Checks if the node or any of its descendants has YANG 'tailf:action'
 statement(s).

**Returns:** true if node or any of its descendants has YANG
 'tailf:action' statement(s).

### hasChildConfAction() <a href="#haschildconfaction-755c8c702590" id="haschildconfaction-755c8c702590"></a>

```java
public boolean hasChildConfAction()
```

Checks if the node or any of its descendants has YANG
 'tailf:cli-configure-mode' statement(s).

**Returns:** true if node or any of its descendants has YANG
 'tailf:cli-configure-mode' statement(s).

### hasChildOperAction() <a href="#haschildoperaction-8c7a5d00e78f" id="haschildoperaction-8c7a5d00e78f"></a>

```java
public boolean hasChildOperAction()
```

Checks if the node or any of its descendants has YANG
 'tailf:cli-operational-mode' statement(s).

**Returns:** true if node or any of its descendants has YANG
 'tailf:cli-operational-mode' statement(s).

### hasChildReadOnly() <a href="#haschildreadonly-f5ae648b3fd9" id="haschildreadonly-f5ae648b3fd9"></a>

```java
public boolean hasChildReadOnly()
```

Checks if this node is an operational (read-only) node, or if
 any of its descendants are operational nodes.

**Returns:** true if the subtree contains operational data nodes.

### hasChildReadWrite() <a href="#haschildreadwrite-bf5f24442e9b" id="haschildreadwrite-bf5f24442e9b"></a>

```java
public boolean hasChildReadWrite()
```

Checks if this node is a configuration (read-write) node, or if any
 of its descendants are configuration data nodes.

**Returns:** true if the subtree contains configuration data nodes.

### hasChildren() <a href="#haschildren-94c463ee6541" id="haschildren-94c463ee6541"></a>

```java
public boolean hasChildren()
```

Checks if a node hash children.

**Returns:** true if children exists.

### hasDisplayWhen() <a href="#hasdisplaywhen-878875048f53" id="hasdisplaywhen-878875048f53"></a>

```java
public boolean hasDisplayWhen()
```

Checks if the node has YANG 'tailf:display-when' statement(s).

**Returns:** true if node has YANG 'tailf:display-when' statement(s).

### hasDocDescription() <a href="#hasdocdescription-2ef89550698c" id="hasdocdescription-2ef89550698c"></a>

```java
public boolean hasDocDescription()
```

Checks if the node has documentation description.

**Returns:** true if node has documentation description.

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### hasMetaData() <a href="#hasmetadata-a6da44bae224" id="hasmetadata-a6da44bae224"></a>

```java
public boolean hasMetaData()
```

Checks if the node has YANG 'tailf:meta-data' statement(s).

**Returns:** true if node has YANG 'tailf:meta-data' statement(s).

### hasMountPoint() <a href="#hasmountpoint-d6dc13d7393d" id="hasmountpoint-d6dc13d7393d"></a>

```java
public boolean hasMountPoint()
```

### hasPrompt() <a href="#hasprompt-7ef5d0302ed2" id="hasprompt-7ef5d0302ed2"></a>

```java
public boolean hasPrompt()
```

Checks if the node has YANG 'tailf:prompt' statement(s).

**Returns:** true if node has YANG 'tailf:prompt' statement(s).

### hasServicepoint() <a href="#hasservicepoint-48712097633a" id="hasservicepoint-48712097633a"></a>

```java
public boolean hasServicepoint()
```

Checks if the node has YANG 'ncs:servicepoint' statement(s).

**Returns:** true if node has YANG 'ncs:servicepoint' statement(s).

### hasWhen() <a href="#haswhen-075abcb130be" id="haswhen-075abcb130be"></a>

```java
public boolean hasWhen()
```

Checks if the node has YANG 'when' statement(s).

**Returns:** true if node has YANG 'when' statement(s).

### isAction() <a href="#isaction-4ff29a7eee95" id="isaction-4ff29a7eee95"></a>

```java
public boolean isAction()
```

Checks if a node is an action.

**Returns:** true if it is an action.

### isActionParam() <a href="#isactionparam-e8be06f1cc55" id="isactionparam-e8be06f1cc55"></a>

```java
public boolean isActionParam()
```

Checks if a node is an action parameter node.

**Returns:** true if the node is an action parameter node.

### isActionResult() <a href="#isactionresult-bf63fae6130e" id="isactionresult-bf63fae6130e"></a>

```java
public boolean isActionResult()
```

Checks if a node is an action result node.

**Returns:** true if the node is action result node.

### isCase() <a href="#iscase-fb6be6ab6d36" id="iscase-fb6be6ab6d36"></a>

```java
public boolean isCase()
```

Checks if a node is top level of a case.

**Returns:** true if the node is part of a case.

### isContainer() <a href="#iscontainer-b5ebcd6f6b32" id="iscontainer-b5ebcd6f6b32"></a>

```java
public boolean isContainer()
```

Checks if a node is a container node.

**Returns:** true if the node is a container node.

### isEmptyLeaf() <a href="#isemptyleaf-2ddc3d315b7a" id="isemptyleaf-2ddc3d315b7a"></a>

```java
public boolean isEmptyLeaf()
```

### isHidden() <a href="#ishidden-d555dbca8b21" id="ishidden-d555dbca8b21"></a>

```java
public boolean isHidden()
```

Checks if the node is hidden via 'tailf:hidden' statement.

**Returns:** true if node is hidden.

### isLeaf() <a href="#isleaf-5329f6d31dd8" id="isleaf-5329f6d31dd8"></a>

```java
public boolean isLeaf()
```

Checks if a node is a leaf node.

**Returns:** true if the node is leaf node.

### isLeafList() <a href="#isleaflist-5410d840730d" id="isleaflist-5410d840730d"></a>

```java
public boolean isLeafList()
```

Checks if the node is a leaf-list node.

**Returns:** true if the node is leaf-list node.

### isLeafref() <a href="#isleafref-631e9c131138" id="isleafref-631e9c131138"></a>

```java
public boolean isLeafref()
```

Checks if the node is a YANG 'leafref'.

**Returns:** true if node is a YANG 'leafref'.

### isList() <a href="#islist-c36bce63b506" id="islist-c36bce63b506"></a>

```java
public boolean isList()
```

Checks if a node is a list node.

**Returns:** true if the node is list node.

### isNotif() <a href="#isnotif-8c0813ed9a18" id="isnotif-8c0813ed9a18"></a>

```java
public boolean isNotif()
```

Checks if the node is a notification

**Returns:** true if the node a notification

### isOper() <a href="#isoper-578628dfb332" id="isoper-578628dfb332"></a>

```java
public boolean isOper()
```

**Returns:** true if node is OPER data.

### isWritable() <a href="#iswritable-f813255e9b26" id="iswritable-f813255e9b26"></a>

```java
public boolean isWritable()
```

Checks if the node is writable.

**Returns:** true if the node is writable.

### printNodeType() <a href="#printnodetype-6ac11a229979" id="printnodetype-6ac11a229979"></a>

```java
public String printNodeType()
```

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Informative string representation of a CSNode instance

**Returns:** String
