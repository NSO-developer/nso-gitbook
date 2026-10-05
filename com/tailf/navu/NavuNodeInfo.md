<a id="cls-NavuNodeInfo"></a>
# NavuNodeInfo

```java
public class com.tailf.navu.NavuNodeInfo
```

This class contains meta information for a node.

## Members

**Constructors**:

- [NavuNodeInfo(CSNode)](#m-navunodeinfo-57ce6bff2390)
- [NavuNodeInfo(CSSchema)](#m-navunodeinfo-be24a0dfd7c6)
- [NavuNodeInfo(MaapiSchemas)](#m-navunodeinfo-323e83ba03d7)

**Methods**:

- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getCSNode()](#m-getcsnode-cf7a085aa7f5)
- [getCsNode()](#m-getcsnode-e6bf08f79626)
- [getCSSchema()](#m-getcsschema-9097d6b9dc61)
- [getCSSchemas()](#m-getcsschemas-7867d0da9a73)
- [hashCode()](#m-hashcode-ef797a217903)
- [isAction()](#m-isaction-4ff29a7eee95)
- [isActionParam()](#m-isactionparam-e8be06f1cc55)
- [isActionResult()](#m-isactionresult-bf63fae6130e)
- [isCase()](#m-iscase-fb6be6ab6d36)
- [isCdb()](#m-iscdb-20ec16d14862)
- [isChildNode()](#m-ischildnode-40e011106aee)
- [isContainer()](#m-iscontainer-b5ebcd6f6b32)
- [isEmptyLeaf()](#m-isemptyleaf-2ddc3d315b7a)
- [isLeaf()](#m-isleaf-5329f6d31dd8)
- [isLeafList()](#m-isleaflist-5410d840730d)
- [isLeafref()](#m-isleafref-631e9c131138)
- [isList()](#m-islist-c36bce63b506)
- [isListEntry()](#m-islistentry-b9733acc1ea9)
- [isListEntry(boolean)](#m-islistentry-cfb71a385976)
- [isModule()](#m-ismodule-387434ee044f)
- [isNotif()](#m-isnotif-8c0813ed9a18)
- [isOper()](#m-isoper-578628dfb332)
- [isRootOfModules()](#m-isrootofmodules-66dd95b06639)
- [isWritable()](#m-iswritable-f813255e9b26)
- [isWritableAll()](#m-iswritableall-8587e2efc611)
- [printNodeType()](#m-printnodetype-6ac11a229979)
- [toString()](#m-tostring-e9d48c5503ef)

**Nested Types**:

- [NavuNodeType](NavuNodeInfo/NavuNodeType.md#cls-NavuNodeType)

## Constructors

<a id="m-navunodeinfo-57ce6bff2390"></a>
### NavuNodeInfo(CSNode)

```java
public NavuNodeInfo(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

Creates a NavuNodeInfo based on a schema node.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="m-navunodeinfo-be24a0dfd7c6"></a>
### NavuNodeInfo(CSSchema)

```java
protected NavuNodeInfo(com.tailf.maapi.MaapiSchemas.CSSchema module)
```

Types: [CSSchema](../maapi/MaapiSchemas/CSSchema.md#cls-CSSchema)

Constructor for a module.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSSchema module`

<a id="m-navunodeinfo-323e83ba03d7"></a>
### NavuNodeInfo(MaapiSchemas)

```java
protected NavuNodeInfo(com.tailf.maapi.MaapiSchemas sch)
```

Types: [MaapiSchemas](../maapi/MaapiSchemas.md#cls-MaapiSchemas)

Constructor for the root.

**Parameters**

- `com.tailf.maapi.MaapiSchemas sch`


## Methods

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

<a id="m-getcsnode-cf7a085aa7f5"></a>
### getCSNode()

```java
public com.tailf.maapi.MaapiSchemas.CSNode getCSNode()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

<a id="m-getcsnode-e6bf08f79626"></a>
### getCsNode()

```java
public com.tailf.maapi.MaapiSchemas.CSNode getCsNode()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

Returns the schema node from which the object is derive from.

**Returns:** a given schema node.

<a id="m-getcsschema-9097d6b9dc61"></a>
### getCSSchema()

```java
public com.tailf.maapi.MaapiSchemas.CSSchema getCSSchema()
```

Types: [CSSchema](../maapi/MaapiSchemas/CSSchema.md#cls-CSSchema)

**Returns:** the schema of a module.

<a id="m-getcsschemas-7867d0da9a73"></a>
### getCSSchemas()

```java
public com.tailf.maapi.MaapiSchemas getCSSchemas()
```

Types: [MaapiSchemas](../maapi/MaapiSchemas.md#cls-MaapiSchemas)

**Returns:** the schema of a module.

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

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

<a id="m-iscdb-20ec16d14862"></a>
### isCdb()

```java
public boolean isCdb()
```

<a id="m-ischildnode-40e011106aee"></a>
### isChildNode()

```java
public boolean isChildNode()
```

**Returns:** true is this is a child node, not a module or
 root of modules.

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

<a id="m-islistentry-b9733acc1ea9"></a>
### isListEntry()

```java
public boolean isListEntry()
```

<a id="m-islistentry-cfb71a385976"></a>
### isListEntry(boolean)

**Package-private**

```java
void isListEntry(boolean listEntry)
```

**Parameters**

- `boolean listEntry`

<a id="m-ismodule-387434ee044f"></a>
### isModule()

```java
public boolean isModule()
```

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

<a id="m-isrootofmodules-66dd95b06639"></a>
### isRootOfModules()

```java
public boolean isRootOfModules()
```

**Returns:** true if this is the true root above all loaded modules.

<a id="m-iswritable-f813255e9b26"></a>
### isWritable()

```java
public boolean isWritable()
```

Checks if the node is writable.

**Returns:** true if the node is writable.

<a id="m-iswritableall-8587e2efc611"></a>
### isWritableAll()

```java
public boolean isWritableAll()
```

Checks if the node is writable for all data.

**Returns:** true if the node is writable for all data.

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


## Nested Types

- [NavuNodeType](NavuNodeInfo/NavuNodeType.md#cls-NavuNodeType)
