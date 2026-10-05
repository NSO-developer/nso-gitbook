<a id="s-NavuNodeInfo"></a>
# NavuNodeInfo

```java
public class com.tailf.navu.NavuNodeInfo
```

This class contains meta information for a node.

## Members

**Constructors**:

- [NavuNodeInfo(CSNode)](#s-NavuNodeInfo-1)
- [NavuNodeInfo(CSSchema)](#s-NavuNodeInfo-2)
- [NavuNodeInfo(MaapiSchemas)](#s-NavuNodeInfo-3)

**Methods**:

- [equals(Object)](#s-equals)
- [getCSNode()](#s-getCSNode)
- [getCsNode()](#s-getCsNode)
- [getCSSchema()](#s-getCSSchema)
- [getCSSchemas()](#s-getCSSchemas)
- [hashCode()](#s-hashCode)
- [isAction()](#s-isAction)
- [isActionParam()](#s-isActionParam)
- [isActionResult()](#s-isActionResult)
- [isCase()](#s-isCase)
- [isCdb()](#s-isCdb)
- [isChildNode()](#s-isChildNode)
- [isContainer()](#s-isContainer)
- [isEmptyLeaf()](#s-isEmptyLeaf)
- [isLeaf()](#s-isLeaf)
- [isLeafList()](#s-isLeafList)
- [isLeafref()](#s-isLeafref)
- [isList()](#s-isList)
- [isListEntry()](#s-isListEntry)
- [isListEntry(boolean)](#s-isListEntry-1)
- [isModule()](#s-isModule)
- [isNotif()](#s-isNotif)
- [isOper()](#s-isOper)
- [isRootOfModules()](#s-isRootOfModules)
- [isWritable()](#s-isWritable)
- [isWritableAll()](#s-isWritableAll)
- [printNodeType()](#s-printNodeType)
- [toString()](#s-toString)

**Nested Types**:

- [NavuNodeType](NavuNodeInfo/NavuNodeType.md#s-NavuNodeType)

## Constructors

<a id="s-NavuNodeInfo-1"></a>
### NavuNodeInfo(CSNode)

```java
public NavuNodeInfo(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

Creates a NavuNodeInfo based on a schema node.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="s-NavuNodeInfo-2"></a>
### NavuNodeInfo(CSSchema)

```java
protected NavuNodeInfo(com.tailf.maapi.MaapiSchemas.CSSchema module)
```

Types: [CSSchema](../maapi/MaapiSchemas/CSSchema.md#s-CSSchema)

Constructor for a module.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSSchema module`

<a id="s-NavuNodeInfo-3"></a>
### NavuNodeInfo(MaapiSchemas)

```java
protected NavuNodeInfo(com.tailf.maapi.MaapiSchemas sch)
```

Types: [MaapiSchemas](../maapi/MaapiSchemas.md#s-MaapiSchemas)

Constructor for the root.

**Parameters**

- `com.tailf.maapi.MaapiSchemas sch`


## Methods

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

<a id="s-getCSNode"></a>
### getCSNode()

```java
public com.tailf.maapi.MaapiSchemas.CSNode getCSNode()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

<a id="s-getCsNode"></a>
### getCsNode()

```java
public com.tailf.maapi.MaapiSchemas.CSNode getCsNode()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

Returns the schema node from which the object is derive from.

**Returns:** a given schema node.

<a id="s-getCSSchema"></a>
### getCSSchema()

```java
public com.tailf.maapi.MaapiSchemas.CSSchema getCSSchema()
```

Types: [CSSchema](../maapi/MaapiSchemas/CSSchema.md#s-CSSchema)

**Returns:** the schema of a module.

<a id="s-getCSSchemas"></a>
### getCSSchemas()

```java
public com.tailf.maapi.MaapiSchemas getCSSchemas()
```

Types: [MaapiSchemas](../maapi/MaapiSchemas.md#s-MaapiSchemas)

**Returns:** the schema of a module.

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-isAction"></a>
### isAction()

```java
public boolean isAction()
```

Checks if a node is an action.

**Returns:** true if it is an action.

<a id="s-isActionParam"></a>
### isActionParam()

```java
public boolean isActionParam()
```

Checks if a node is an action parameter node.

**Returns:** true if the node is an action parameter node.

<a id="s-isActionResult"></a>
### isActionResult()

```java
public boolean isActionResult()
```

Checks if a node is an action result node.

**Returns:** true if the node is action result node.

<a id="s-isCase"></a>
### isCase()

```java
public boolean isCase()
```

Checks if a node is top level of a case.

**Returns:** true if the node is part of a case.

<a id="s-isCdb"></a>
### isCdb()

```java
public boolean isCdb()
```

<a id="s-isChildNode"></a>
### isChildNode()

```java
public boolean isChildNode()
```

**Returns:** true is this is a child node, not a module or
 root of modules.

<a id="s-isContainer"></a>
### isContainer()

```java
public boolean isContainer()
```

Checks if a node is a container node.

**Returns:** true if the node is a container node.

<a id="s-isEmptyLeaf"></a>
### isEmptyLeaf()

```java
public boolean isEmptyLeaf()
```

<a id="s-isLeaf"></a>
### isLeaf()

```java
public boolean isLeaf()
```

Checks if a node is a leaf node.

**Returns:** true if the node is leaf node.

<a id="s-isLeafList"></a>
### isLeafList()

```java
public boolean isLeafList()
```

Checks if the node is a leaf-list node.

**Returns:** true if the node is leaf-list node.

<a id="s-isLeafref"></a>
### isLeafref()

```java
public boolean isLeafref()
```

Checks if the node is a YANG 'leafref'.

**Returns:** true if node is a YANG 'leafref'.

<a id="s-isList"></a>
### isList()

```java
public boolean isList()
```

Checks if a node is a list node.

**Returns:** true if the node is list node.

<a id="s-isListEntry"></a>
### isListEntry()

```java
public boolean isListEntry()
```

<a id="s-isListEntry-1"></a>
### isListEntry(boolean)

**Package-private**

```java
void isListEntry(boolean listEntry)
```

**Parameters**

- `boolean listEntry`

<a id="s-isModule"></a>
### isModule()

```java
public boolean isModule()
```

<a id="s-isNotif"></a>
### isNotif()

```java
public boolean isNotif()
```

Checks if the node is a notification

**Returns:** true if the node a notification

<a id="s-isOper"></a>
### isOper()

```java
public boolean isOper()
```

**Returns:** true if node is OPER data.

<a id="s-isRootOfModules"></a>
### isRootOfModules()

```java
public boolean isRootOfModules()
```

**Returns:** true if this is the true root above all loaded modules.

<a id="s-isWritable"></a>
### isWritable()

```java
public boolean isWritable()
```

Checks if the node is writable.

**Returns:** true if the node is writable.

<a id="s-isWritableAll"></a>
### isWritableAll()

```java
public boolean isWritableAll()
```

Checks if the node is writable for all data.

**Returns:** true if the node is writable for all data.

<a id="s-printNodeType"></a>
### printNodeType()

```java
public String printNodeType()
```

<a id="s-toString"></a>
### toString()

```java
public String toString()
```


## Nested Types

- [NavuNodeType](NavuNodeInfo/NavuNodeType.md)
