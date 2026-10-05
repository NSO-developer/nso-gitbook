<a id="s-MmapCSRoot"></a>
# MmapCSRoot

```java
public class com.tailf.ncs.maapi.MmapCSRoot
    extends com.tailf.ncs.maapi.MmapCSNode
```

Types: [MmapCSNode](MmapCSNode.md#s-MmapCSNode)

mmap version of CSRoot.

## Members

**Constructors**:

- [MmapCSRoot(MmapSchemaFactory, Level, int, int, String, Reader, int, CSSchema, List<CSNode>)](#s-MmapCSRoot-1)

**Fields**:

- [firstChild](../../maapi/MaapiSchemas/CSNode.md#s-firstChild) from CSNode
- [mmapSchemaFactory](MmapCSNode.md#s-mmapSchemaFactory) from MmapCSNode
- [nextSibling](../../maapi/MaapiSchemas/CSNode.md#s-nextSibling) from CSNode
- [parentNode](../../maapi/MaapiSchemas/CSNode.md#s-parentNode) from CSNode
- [tag](../../maapi/MaapiSchemas/CSNode.md#s-tag) from CSNode

**Methods**:

- [equals(Object)](../../maapi/MaapiSchemas/CSNode.md#s-equals) from CSNode
- [getChild(int)](MmapCSNode.md#s-getChild) from MmapCSNode
- [getChild(int, int)](MmapCSNode.md#s-getChild-1) from MmapCSNode
- [getChildIdx()](MmapCSNode.md#s-getChildIdx) from MmapCSNode
- [getChildren()](MmapCSNode.md#s-getChildren) from MmapCSNode
- [getChildren(List<String>)](../../maapi/MaapiSchemas/CSNode.md#s-getChildren-1) from CSNode
- [getChoices()](../../maapi/MaapiSchemas/CSNode.md#s-getChoices) from CSNode
- [getDefval()](../../maapi/MaapiSchemas/CSNode.md#s-getDefval) from CSNode
- [getFirstChild()](MmapCSNode.md#s-getFirstChild) from MmapCSNode
- [getKey(int)](../../maapi/MaapiSchemas/CSNode.md#s-getKey) from CSNode
- [getKeys()](../../maapi/MaapiSchemas/CSNode.md#s-getKeys) from CSNode
- [getLevel()](MmapCSNode.md#s-getLevel) from MmapCSNode
- [getMaxOccurs()](../../maapi/MaapiSchemas/CSNode.md#s-getMaxOccurs) from CSNode
- [getMinOccurs()](../../maapi/MaapiSchemas/CSNode.md#s-getMinOccurs) from CSNode
- [getNextSibling()](#s-getNextSibling)
- [getNodeInfo()](MmapCSNode.md#s-getNodeInfo) from MmapCSNode
- [getNS()](../../maapi/MaapiSchemas/CSNode.md#s-getNS) from CSNode
- [getNSHash()](../../maapi/MaapiSchemas/CSNode.md#s-getNSHash) from CSNode
- [getParentNode()](MmapCSNode.md#s-getParentNode) from MmapCSNode
- [getSchema()](../../maapi/MaapiSchemas/CSNode.md#s-getSchema) from CSNode
- [getSibling(int)](#s-getSibling)
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

<a id="s-MmapCSRoot-1"></a>
### MmapCSRoot(MmapSchemaFactory, Level, int, int, String, Reader, int, CSSchema, List<CSNode>)

**Package-private**

```java
MmapCSRoot(
    com.tailf.ncs.maapi.MmapSchemaFactory mmapSchemaFactory,
    com.tailf.ncs.maapi.MmapSchema.Level level,
    int childIdx,
    int tagHash,
    String tag,
    com.tailf.ncs.maapi.Schema.Cs.Reader csr,
    int csIdx,
    com.tailf.maapi.MaapiSchemas.CSSchema schema,
    java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> siblings
)
```

Types: [MmapSchemaFactory](MmapSchemaFactory.md#s-MmapSchemaFactory), [Level](MmapSchema/Level.md#s-Level), [Reader](Schema/Cs/Reader.md#s-Reader), [CSSchema](../../maapi/MaapiSchemas/CSSchema.md#s-CSSchema), [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchemaFactory mmapSchemaFactory`
- `com.tailf.ncs.maapi.MmapSchema.Level level`
- `int childIdx`
- `int tagHash`
- `String tag`
- `com.tailf.ncs.maapi.Schema.Cs.Reader csr`
- `int csIdx`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> siblings`


## Methods

<a id="s-getNextSibling"></a>
### getNextSibling()

```java
protected com.tailf.maapi.MaapiSchemas.CSNode getNextSibling()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode)

<a id="s-getSibling"></a>
### getSibling(int)

```java
public com.tailf.maapi.MaapiSchemas.CSNode getSibling(int tagHash)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `int tagHash`

<a id="s-getSiblings"></a>
### getSiblings()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getSiblings()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode)
