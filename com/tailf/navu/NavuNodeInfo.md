# NavuNodeInfo <a href="#navunodeinfo-ee275327d410" id="navunodeinfo-ee275327d410"></a>

```java
public class com.tailf.navu.NavuNodeInfo
```

This class contains meta information for a node.

## Members

**Constructors**:

- [NavuNodeInfo\(CSNode\)](#navunodeinfo-57ce6bff2390)
- [NavuNodeInfo\(CSSchema\)](#navunodeinfo-be24a0dfd7c6)
- [NavuNodeInfo\(MaapiSchemas\)](#navunodeinfo-323e83ba03d7)

**Methods**:

- [equals\(Object\)](#equals-fcd6492e0d6c)
- [getCSNode\(\)](#getcsnode-cf7a085aa7f5)
- [getCsNode\(\)](#getcsnode-e6bf08f79626)
- [getCSSchema\(\)](#getcsschema-9097d6b9dc61)
- [getCSSchemas\(\)](#getcsschemas-7867d0da9a73)
- [hashCode\(\)](#hashcode-ef797a217903)
- [isAction\(\)](#isaction-4ff29a7eee95)
- [isActionParam\(\)](#isactionparam-e8be06f1cc55)
- [isActionResult\(\)](#isactionresult-bf63fae6130e)
- [isCase\(\)](#iscase-fb6be6ab6d36)
- [isCdb\(\)](#iscdb-20ec16d14862)
- [isChildNode\(\)](#ischildnode-40e011106aee)
- [isContainer\(\)](#iscontainer-b5ebcd6f6b32)
- [isEmptyLeaf\(\)](#isemptyleaf-2ddc3d315b7a)
- [isLeaf\(\)](#isleaf-5329f6d31dd8)
- [isLeafList\(\)](#isleaflist-5410d840730d)
- [isLeafref\(\)](#isleafref-631e9c131138)
- [isList\(\)](#islist-c36bce63b506)
- [isListEntry\(\)](#islistentry-b9733acc1ea9)
- [isListEntry\(boolean\)](#islistentry-cfb71a385976)
- [isModule\(\)](#ismodule-387434ee044f)
- [isNotif\(\)](#isnotif-8c0813ed9a18)
- [isOper\(\)](#isoper-578628dfb332)
- [isRootOfModules\(\)](#isrootofmodules-66dd95b06639)
- [isWritable\(\)](#iswritable-f813255e9b26)
- [isWritableAll\(\)](#iswritableall-8587e2efc611)
- [printNodeType\(\)](#printnodetype-6ac11a229979)
- [toString\(\)](#tostring-e9d48c5503ef)

**Nested Types**:

- [NavuNodeType](NavuNodeInfo/NavuNodeType.md#navunodetype-6744525a3747)

## Constructors

### NavuNodeInfo(CSNode) <a href="#navunodeinfo-57ce6bff2390" id="navunodeinfo-57ce6bff2390"></a>

```java
public NavuNodeInfo(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

Creates a NavuNodeInfo based on a schema node.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### NavuNodeInfo(CSSchema) <a href="#navunodeinfo-be24a0dfd7c6" id="navunodeinfo-be24a0dfd7c6"></a>

```java
protected NavuNodeInfo(com.tailf.maapi.MaapiSchemas.CSSchema module)
```

Types: [CSSchema](../maapi/MaapiSchemas/CSSchema.md#csschema-f51a58180f67)

Constructor for a module.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSSchema module`

### NavuNodeInfo(MaapiSchemas) <a href="#navunodeinfo-323e83ba03d7" id="navunodeinfo-323e83ba03d7"></a>

```java
protected NavuNodeInfo(com.tailf.maapi.MaapiSchemas sch)
```

Types: [MaapiSchemas](../maapi/MaapiSchemas.md#maapischemas-821ac70b83b7)

Constructor for the root.

**Parameters**

- `com.tailf.maapi.MaapiSchemas sch`


## Methods

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### getCSNode() <a href="#getcsnode-cf7a085aa7f5" id="getcsnode-cf7a085aa7f5"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getCSNode()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

### getCsNode() <a href="#getcsnode-e6bf08f79626" id="getcsnode-e6bf08f79626"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getCsNode()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

Returns the schema node from which the object is derive from.

**Returns:** a given schema node.

### getCSSchema() <a href="#getcsschema-9097d6b9dc61" id="getcsschema-9097d6b9dc61"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSSchema getCSSchema()
```

Types: [CSSchema](../maapi/MaapiSchemas/CSSchema.md#csschema-f51a58180f67)

**Returns:** the schema of a module.

### getCSSchemas() <a href="#getcsschemas-7867d0da9a73" id="getcsschemas-7867d0da9a73"></a>

```java
public com.tailf.maapi.MaapiSchemas getCSSchemas()
```

Types: [MaapiSchemas](../maapi/MaapiSchemas.md#maapischemas-821ac70b83b7)

**Returns:** the schema of a module.

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

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

### isCdb() <a href="#iscdb-20ec16d14862" id="iscdb-20ec16d14862"></a>

```java
public boolean isCdb()
```

### isChildNode() <a href="#ischildnode-40e011106aee" id="ischildnode-40e011106aee"></a>

```java
public boolean isChildNode()
```

**Returns:** true is this is a child node, not a module or
 root of modules.

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

### isListEntry() <a href="#islistentry-b9733acc1ea9" id="islistentry-b9733acc1ea9"></a>

```java
public boolean isListEntry()
```

### isListEntry(boolean) <a href="#islistentry-cfb71a385976" id="islistentry-cfb71a385976"></a>

**Package-private**

```java
void isListEntry(boolean listEntry)
```

**Parameters**

- `boolean listEntry`

### isModule() <a href="#ismodule-387434ee044f" id="ismodule-387434ee044f"></a>

```java
public boolean isModule()
```

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

### isRootOfModules() <a href="#isrootofmodules-66dd95b06639" id="isrootofmodules-66dd95b06639"></a>

```java
public boolean isRootOfModules()
```

**Returns:** true if this is the true root above all loaded modules.

### isWritable() <a href="#iswritable-f813255e9b26" id="iswritable-f813255e9b26"></a>

```java
public boolean isWritable()
```

Checks if the node is writable.

**Returns:** true if the node is writable.

### isWritableAll() <a href="#iswritableall-8587e2efc611" id="iswritableall-8587e2efc611"></a>

```java
public boolean isWritableAll()
```

Checks if the node is writable for all data.

**Returns:** true if the node is writable for all data.

### printNodeType() <a href="#printnodetype-6ac11a229979" id="printnodetype-6ac11a229979"></a>

```java
public String printNodeType()
```

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```


## Nested Types

- [NavuNodeType](NavuNodeInfo/NavuNodeType.md#navunodetype-6744525a3747)
