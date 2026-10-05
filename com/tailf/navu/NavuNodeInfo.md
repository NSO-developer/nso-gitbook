# NavuNodeInfo <a href="#cls-NavuNodeInfo" id="cls-NavuNodeInfo"></a>

```java
public class com.tailf.navu.NavuNodeInfo
```

This class contains meta information for a node.

## Members

**Constructors**:

- [NavuNodeInfo(CSNode)](#m-NavuNodeInfo-57ce6bff2390)
- [NavuNodeInfo(CSSchema)](#m-NavuNodeInfo-be24a0dfd7c6)
- [NavuNodeInfo(MaapiSchemas)](#m-NavuNodeInfo-323e83ba03d7)

**Methods**:

- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getCSNode()](#m-getCSNode-cf7a085aa7f5)
- [getCsNode()](#m-getCsNode-e6bf08f79626)
- [getCSSchema()](#m-getCSSchema-9097d6b9dc61)
- [getCSSchemas()](#m-getCSSchemas-7867d0da9a73)
- [hashCode()](#m-hashCode-ef797a217903)
- [isAction()](#m-isAction-4ff29a7eee95)
- [isActionParam()](#m-isActionParam-e8be06f1cc55)
- [isActionResult()](#m-isActionResult-bf63fae6130e)
- [isCase()](#m-isCase-fb6be6ab6d36)
- [isCdb()](#m-isCdb-20ec16d14862)
- [isChildNode()](#m-isChildNode-40e011106aee)
- [isContainer()](#m-isContainer-b5ebcd6f6b32)
- [isEmptyLeaf()](#m-isEmptyLeaf-2ddc3d315b7a)
- [isLeaf()](#m-isLeaf-5329f6d31dd8)
- [isLeafList()](#m-isLeafList-5410d840730d)
- [isLeafref()](#m-isLeafref-631e9c131138)
- [isList()](#m-isList-c36bce63b506)
- [isListEntry()](#m-isListEntry-b9733acc1ea9)
- [isListEntry(boolean)](#m-isListEntry-cfb71a385976)
- [isModule()](#m-isModule-387434ee044f)
- [isNotif()](#m-isNotif-8c0813ed9a18)
- [isOper()](#m-isOper-578628dfb332)
- [isRootOfModules()](#m-isRootOfModules-66dd95b06639)
- [isWritable()](#m-isWritable-f813255e9b26)
- [isWritableAll()](#m-isWritableAll-8587e2efc611)
- [printNodeType()](#m-printNodeType-6ac11a229979)
- [toString()](#m-toString-e9d48c5503ef)

**Nested Types**:

- [NavuNodeType](NavuNodeInfo/NavuNodeType.md#cls-NavuNodeType)

## Constructors

### NavuNodeInfo(CSNode) <a href="#m-NavuNodeInfo-57ce6bff2390" id="m-NavuNodeInfo-57ce6bff2390"></a>

```java
public NavuNodeInfo(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

Creates a NavuNodeInfo based on a schema node.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### NavuNodeInfo(CSSchema) <a href="#m-NavuNodeInfo-be24a0dfd7c6" id="m-NavuNodeInfo-be24a0dfd7c6"></a>

```java
protected NavuNodeInfo(com.tailf.maapi.MaapiSchemas.CSSchema module)
```

Types: [CSSchema](../maapi/MaapiSchemas/CSSchema.md#cls-CSSchema)

Constructor for a module.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSSchema module`

### NavuNodeInfo(MaapiSchemas) <a href="#m-NavuNodeInfo-323e83ba03d7" id="m-NavuNodeInfo-323e83ba03d7"></a>

```java
protected NavuNodeInfo(com.tailf.maapi.MaapiSchemas sch)
```

Types: [MaapiSchemas](../maapi/MaapiSchemas.md#cls-MaapiSchemas)

Constructor for the root.

**Parameters**

- `com.tailf.maapi.MaapiSchemas sch`


## Methods

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### getCSNode() <a href="#m-getCSNode-cf7a085aa7f5" id="m-getCSNode-cf7a085aa7f5"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getCSNode()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

### getCsNode() <a href="#m-getCsNode-e6bf08f79626" id="m-getCsNode-e6bf08f79626"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getCsNode()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

Returns the schema node from which the object is derive from.

**Returns:** a given schema node.

### getCSSchema() <a href="#m-getCSSchema-9097d6b9dc61" id="m-getCSSchema-9097d6b9dc61"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSSchema getCSSchema()
```

Types: [CSSchema](../maapi/MaapiSchemas/CSSchema.md#cls-CSSchema)

**Returns:** the schema of a module.

### getCSSchemas() <a href="#m-getCSSchemas-7867d0da9a73" id="m-getCSSchemas-7867d0da9a73"></a>

```java
public com.tailf.maapi.MaapiSchemas getCSSchemas()
```

Types: [MaapiSchemas](../maapi/MaapiSchemas.md#cls-MaapiSchemas)

**Returns:** the schema of a module.

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

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

### isCdb() <a href="#m-isCdb-20ec16d14862" id="m-isCdb-20ec16d14862"></a>

```java
public boolean isCdb()
```

### isChildNode() <a href="#m-isChildNode-40e011106aee" id="m-isChildNode-40e011106aee"></a>

```java
public boolean isChildNode()
```

**Returns:** true is this is a child node, not a module or
 root of modules.

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

### isListEntry() <a href="#m-isListEntry-b9733acc1ea9" id="m-isListEntry-b9733acc1ea9"></a>

```java
public boolean isListEntry()
```

### isListEntry(boolean) <a href="#m-isListEntry-cfb71a385976" id="m-isListEntry-cfb71a385976"></a>

**Package-private**

```java
void isListEntry(boolean listEntry)
```

**Parameters**

- `boolean listEntry`

### isModule() <a href="#m-isModule-387434ee044f" id="m-isModule-387434ee044f"></a>

```java
public boolean isModule()
```

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

### isRootOfModules() <a href="#m-isRootOfModules-66dd95b06639" id="m-isRootOfModules-66dd95b06639"></a>

```java
public boolean isRootOfModules()
```

**Returns:** true if this is the true root above all loaded modules.

### isWritable() <a href="#m-isWritable-f813255e9b26" id="m-isWritable-f813255e9b26"></a>

```java
public boolean isWritable()
```

Checks if the node is writable.

**Returns:** true if the node is writable.

### isWritableAll() <a href="#m-isWritableAll-8587e2efc611" id="m-isWritableAll-8587e2efc611"></a>

```java
public boolean isWritableAll()
```

Checks if the node is writable for all data.

**Returns:** true if the node is writable for all data.

### printNodeType() <a href="#m-printNodeType-6ac11a229979" id="m-printNodeType-6ac11a229979"></a>

```java
public String printNodeType()
```

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```


## Nested Types

- [NavuNodeType](NavuNodeInfo/NavuNodeType.md#cls-NavuNodeType)
