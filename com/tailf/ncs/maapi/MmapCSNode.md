<a id="s-MmapCSNode"></a>
# MmapCSNode

```java
public class com.tailf.ncs.maapi.MmapCSNode
    extends com.tailf.maapi.MaapiSchemas.CSNode
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode)

mmap version of CSNode for accessing data from capnproto schema file
 via the CSNode API.

**Related classes**

- [MmapCSMountPoint](MmapCSMountPoint.md#s-MmapCSMountPoint)
- [MmapCSRoot](MmapCSRoot.md#s-MmapCSRoot)

## Members

**Constructors**:

- [MmapCSNode(MmapSchemaFactory, Level, Level, int, int, String, Reader, int, CSSchema, CSNode)](#s-MmapCSNode-1)

**Fields**:

- [firstChild](../../maapi/MaapiSchemas/CSNode.md#s-firstChild) from CSNode
- [mmapSchemaFactory](#s-mmapSchemaFactory)
- [nextSibling](../../maapi/MaapiSchemas/CSNode.md#s-nextSibling) from CSNode
- [parentNode](../../maapi/MaapiSchemas/CSNode.md#s-parentNode) from CSNode
- [tag](../../maapi/MaapiSchemas/CSNode.md#s-tag) from CSNode

**Methods**:

- [equals(Object)](../../maapi/MaapiSchemas/CSNode.md#s-equals) from CSNode
- [getChild(int)](#s-getChild)
- [getChild(int, int)](#s-getChild-1)
- [getChildIdx()](#s-getChildIdx)
- [getChildren()](#s-getChildren)
- [getChildren(List<String>)](../../maapi/MaapiSchemas/CSNode.md#s-getChildren-1) from CSNode
- [getChoices()](../../maapi/MaapiSchemas/CSNode.md#s-getChoices) from CSNode
- [getDefval()](../../maapi/MaapiSchemas/CSNode.md#s-getDefval) from CSNode
- [getFirstChild()](#s-getFirstChild)
- [getKey(int)](../../maapi/MaapiSchemas/CSNode.md#s-getKey) from CSNode
- [getKeys()](../../maapi/MaapiSchemas/CSNode.md#s-getKeys) from CSNode
- [getLevel()](#s-getLevel)
- [getMaxOccurs()](../../maapi/MaapiSchemas/CSNode.md#s-getMaxOccurs) from CSNode
- [getMinOccurs()](../../maapi/MaapiSchemas/CSNode.md#s-getMinOccurs) from CSNode
- [getNextSibling()](#s-getNextSibling)
- [getNodeInfo()](#s-getNodeInfo)
- [getNS()](../../maapi/MaapiSchemas/CSNode.md#s-getNS) from CSNode
- [getNSHash()](../../maapi/MaapiSchemas/CSNode.md#s-getNSHash) from CSNode
- [getParentNode()](#s-getParentNode)
- [getSchema()](../../maapi/MaapiSchemas/CSNode.md#s-getSchema) from CSNode
- [getSibling(int)](../../maapi/MaapiSchemas/CSNode.md#s-getSibling) from CSNode
- [getSiblings()](#s-getSiblings)
- [getTag()](../../maapi/MaapiSchemas/CSNode.md#s-getTag) from CSNode
- [getTagHash()](../../maapi/MaapiSchemas/CSNode.md#s-getTagHash) from CSNode
- [getType()](../../maapi/MaapiSchemas/CSNode.md#s-getType) from CSNode
- [getXmlNS()](../../maapi/MaapiSchemas/CSNode.md#s-getXmlNS) from CSNode
- [hasChildAction()](../../maapi/MaapiSchemas/CSNode.md#s-hasChildAction) from CSNode
- [hasChildConfAction()](../../maapi/MaapiSchemas/CSNode.md#s-hasChildConfAction) from CSNode
- [hasChildOperAction()](../../maapi/MaapiSchemas/CSNode.md#s-hasChildOperAction) from CSNode
- [hasChildReadOnly()](../../maapi/MaapiSchemas/CSNode.md#s-hasChildReadOnly) from CSNode
- [hasChildReadWrite()](../../maapi/MaapiSchemas/CSNode.md#s-hasChildReadWrite) from CSNode
- [hasChildren()](../../maapi/MaapiSchemas/CSNode.md#s-hasChildren) from CSNode
- [hasDisplayWhen()](../../maapi/MaapiSchemas/CSNode.md#s-hasDisplayWhen) from CSNode
- [hasDocDescription()](../../maapi/MaapiSchemas/CSNode.md#s-hasDocDescription) from CSNode
- [hashCode()](../../maapi/MaapiSchemas/CSNode.md#s-hashCode) from CSNode
- [hasMetaData()](../../maapi/MaapiSchemas/CSNode.md#s-hasMetaData) from CSNode
- [hasMountPoint()](../../maapi/MaapiSchemas/CSNode.md#s-hasMountPoint) from CSNode
- [hasPrompt()](../../maapi/MaapiSchemas/CSNode.md#s-hasPrompt) from CSNode
- [hasServicepoint()](../../maapi/MaapiSchemas/CSNode.md#s-hasServicepoint) from CSNode
- [hasWhen()](../../maapi/MaapiSchemas/CSNode.md#s-hasWhen) from CSNode
- [isAction()](../../maapi/MaapiSchemas/CSNode.md#s-isAction) from CSNode
- [isActionParam()](../../maapi/MaapiSchemas/CSNode.md#s-isActionParam) from CSNode
- [isActionResult()](../../maapi/MaapiSchemas/CSNode.md#s-isActionResult) from CSNode
- [isCase()](../../maapi/MaapiSchemas/CSNode.md#s-isCase) from CSNode
- [isContainer()](../../maapi/MaapiSchemas/CSNode.md#s-isContainer) from CSNode
- [isEmptyLeaf()](../../maapi/MaapiSchemas/CSNode.md#s-isEmptyLeaf) from CSNode
- [isHidden()](../../maapi/MaapiSchemas/CSNode.md#s-isHidden) from CSNode
- [isLeaf()](../../maapi/MaapiSchemas/CSNode.md#s-isLeaf) from CSNode
- [isLeafList()](../../maapi/MaapiSchemas/CSNode.md#s-isLeafList) from CSNode
- [isLeafref()](../../maapi/MaapiSchemas/CSNode.md#s-isLeafref) from CSNode
- [isList()](../../maapi/MaapiSchemas/CSNode.md#s-isList) from CSNode
- [isNotif()](../../maapi/MaapiSchemas/CSNode.md#s-isNotif) from CSNode
- [isOper()](../../maapi/MaapiSchemas/CSNode.md#s-isOper) from CSNode
- [isWritable()](../../maapi/MaapiSchemas/CSNode.md#s-isWritable) from CSNode
- [printNodeType()](../../maapi/MaapiSchemas/CSNode.md#s-printNodeType) from CSNode
- [toString()](../../maapi/MaapiSchemas/CSNode.md#s-toString) from CSNode

## Constructors

<a id="s-MmapCSNode-1"></a>
### MmapCSNode(MmapSchemaFactory, Level, Level, int, int, String, Reader, int, CSSchema, CSNode)

```java
protected MmapCSNode(
    com.tailf.ncs.maapi.MmapSchemaFactory mmapSchemaFactory,
    com.tailf.ncs.maapi.MmapSchema.Level parentLevel,
    com.tailf.ncs.maapi.MmapSchema.Level level,
    int childIdx,
    int taghash,
    String tag,
    com.tailf.ncs.maapi.Schema.Cs.Reader csr,
    int csIdx,
    com.tailf.maapi.MaapiSchemas.CSSchema schema,
    com.tailf.maapi.MaapiSchemas.CSNode parentNode
)
```

Types: [MmapSchemaFactory](MmapSchemaFactory.md#s-MmapSchemaFactory), [Level](MmapSchema/Level.md#s-Level), [Reader](Schema/Cs/Reader.md#s-Reader), [CSSchema](../../maapi/MaapiSchemas/CSSchema.md#s-CSSchema), [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchemaFactory mmapSchemaFactory`
- `com.tailf.ncs.maapi.MmapSchema.Level parentLevel`
- `com.tailf.ncs.maapi.MmapSchema.Level level`
- `int childIdx`
- `int taghash`
- `String tag`
- `com.tailf.ncs.maapi.Schema.Cs.Reader csr`
- `int csIdx`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `com.tailf.maapi.MaapiSchemas.CSNode parentNode`


## Fields

<a id="s-mmapSchemaFactory"></a>
### mmapSchemaFactory

```java
protected final com.tailf.ncs.maapi.MmapSchemaFactory mmapSchemaFactory = null;
```

Types: [MmapSchemaFactory](MmapSchemaFactory.md#s-MmapSchemaFactory)


## Methods

<a id="s-getChild"></a>
### getChild(int)

```java
public com.tailf.maapi.MaapiSchemas.CSNode getChild(int tagHash)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `int tagHash`

<a id="s-getChild-1"></a>
### getChild(int, int)

```java
public com.tailf.maapi.MaapiSchemas.CSNode getChild(int nsHash, int tagHash)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `int nsHash`
- `int tagHash`

<a id="s-getChildIdx"></a>
### getChildIdx()

**Package-private**

```java
int getChildIdx()
```

<a id="s-getChildren"></a>
### getChildren()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getChildren()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode)

<a id="s-getFirstChild"></a>
### getFirstChild()

```java
protected com.tailf.maapi.MaapiSchemas.CSNode getFirstChild()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode)

<a id="s-getLevel"></a>
### getLevel()

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Level getLevel()
```

Types: [Level](MmapSchema/Level.md#s-Level)

<a id="s-getNextSibling"></a>
### getNextSibling()

```java
protected com.tailf.maapi.MaapiSchemas.CSNode getNextSibling()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode)

<a id="s-getNodeInfo"></a>
### getNodeInfo()

```java
public com.tailf.maapi.MaapiSchemas.CSNodeInfo getNodeInfo()
```

Types: [CSNodeInfo](../../maapi/MaapiSchemas/CSNodeInfo.md#s-CSNodeInfo)

<a id="s-getParentNode"></a>
### getParentNode()

```java
public com.tailf.maapi.MaapiSchemas.CSNode getParentNode()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode)

<a id="s-getSiblings"></a>
### getSiblings()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getSiblings()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode)
