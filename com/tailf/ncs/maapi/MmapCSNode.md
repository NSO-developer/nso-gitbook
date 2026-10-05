# MmapCSNode <a href="#cls-MmapCSNode" id="cls-MmapCSNode"></a>

```java
public class com.tailf.ncs.maapi.MmapCSNode
    extends com.tailf.maapi.MaapiSchemas.CSNode
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

mmap version of CSNode for accessing data from capnproto schema file
 via the CSNode API.

**Related classes**

- [MmapCSMountPoint](MmapCSMountPoint.md#cls-MmapCSMountPoint)
- [MmapCSRoot](MmapCSRoot.md#cls-MmapCSRoot)

## Members

**Constructors**:

- [MmapCSNode(MmapSchemaFactory, Level, Level, int, int, String, Reader, int, CSSchema, CSNode)](#m-MmapCSNode-08dea685c099)

**Fields**:

- [firstChild](../../maapi/MaapiSchemas/CSNode.md#m-firstChild) from CSNode
- [mmapSchemaFactory](#m-mmapSchemaFactory)
- [nextSibling](../../maapi/MaapiSchemas/CSNode.md#m-nextSibling) from CSNode
- [parentNode](../../maapi/MaapiSchemas/CSNode.md#m-parentNode) from CSNode
- [tag](../../maapi/MaapiSchemas/CSNode.md#m-tag) from CSNode

**Methods**:

- [equals(Object)](../../maapi/MaapiSchemas/CSNode.md#m-equals-fcd6492e0d6c) from CSNode
- [getChild(int)](#m-getChild-65485672c186)
- [getChild(int, int)](#m-getChild-689133990b1b)
- [getChildIdx()](#m-getChildIdx-4d2ec6d906ee)
- [getChildren()](#m-getChildren-fe2038dff10d)
- [getChildren(List<String>)](../../maapi/MaapiSchemas/CSNode.md#m-getChildren-41cf83dd1b0d) from CSNode
- [getChoices()](../../maapi/MaapiSchemas/CSNode.md#m-getChoices-818fb3fccb86) from CSNode
- [getDefval()](../../maapi/MaapiSchemas/CSNode.md#m-getDefval-561ad5494c47) from CSNode
- [getFirstChild()](#m-getFirstChild-710377dd9fb6)
- [getKey(int)](../../maapi/MaapiSchemas/CSNode.md#m-getKey-11aad55949c3) from CSNode
- [getKeys()](../../maapi/MaapiSchemas/CSNode.md#m-getKeys-a24b9d377db7) from CSNode
- [getLevel()](#m-getLevel-28ca1b08d456)
- [getMaxOccurs()](../../maapi/MaapiSchemas/CSNode.md#m-getMaxOccurs-365e8c5a408f) from CSNode
- [getMinOccurs()](../../maapi/MaapiSchemas/CSNode.md#m-getMinOccurs-cac79959dff8) from CSNode
- [getNextSibling()](#m-getNextSibling-e2f43ef28bf0)
- [getNodeInfo()](#m-getNodeInfo-82c0a80aac8a)
- [getNS()](../../maapi/MaapiSchemas/CSNode.md#m-getNS-3613c99d8888) from CSNode
- [getNSHash()](../../maapi/MaapiSchemas/CSNode.md#m-getNSHash-2129fb8b3cfe) from CSNode
- [getParentNode()](#m-getParentNode-452921385cc4)
- [getSchema()](../../maapi/MaapiSchemas/CSNode.md#m-getSchema-3824c0055841) from CSNode
- [getSibling(int)](../../maapi/MaapiSchemas/CSNode.md#m-getSibling-d70180ff4183) from CSNode
- [getSiblings()](#m-getSiblings-f467dd8b6a33)
- [getTag()](../../maapi/MaapiSchemas/CSNode.md#m-getTag-315f45956d6f) from CSNode
- [getTagHash()](../../maapi/MaapiSchemas/CSNode.md#m-getTagHash-8f057919039c) from CSNode
- [getType()](../../maapi/MaapiSchemas/CSNode.md#m-getType-5a52f6f0d4c1) from CSNode
- [getXmlNS()](../../maapi/MaapiSchemas/CSNode.md#m-getXmlNS-bff9992a49a2) from CSNode
- [hasChildAction()](../../maapi/MaapiSchemas/CSNode.md#m-hasChildAction-91ae469ba39c) from CSNode
- [hasChildConfAction()](../../maapi/MaapiSchemas/CSNode.md#m-hasChildConfAction-755c8c702590) from CSNode
- [hasChildOperAction()](../../maapi/MaapiSchemas/CSNode.md#m-hasChildOperAction-8c7a5d00e78f) from CSNode
- [hasChildReadOnly()](../../maapi/MaapiSchemas/CSNode.md#m-hasChildReadOnly-f5ae648b3fd9) from CSNode
- [hasChildReadWrite()](../../maapi/MaapiSchemas/CSNode.md#m-hasChildReadWrite-bf5f24442e9b) from CSNode
- [hasChildren()](../../maapi/MaapiSchemas/CSNode.md#m-hasChildren-94c463ee6541) from CSNode
- [hasDisplayWhen()](../../maapi/MaapiSchemas/CSNode.md#m-hasDisplayWhen-878875048f53) from CSNode
- [hasDocDescription()](../../maapi/MaapiSchemas/CSNode.md#m-hasDocDescription-2ef89550698c) from CSNode
- [hashCode()](../../maapi/MaapiSchemas/CSNode.md#m-hashCode-ef797a217903) from CSNode
- [hasMetaData()](../../maapi/MaapiSchemas/CSNode.md#m-hasMetaData-a6da44bae224) from CSNode
- [hasMountPoint()](../../maapi/MaapiSchemas/CSNode.md#m-hasMountPoint-d6dc13d7393d) from CSNode
- [hasPrompt()](../../maapi/MaapiSchemas/CSNode.md#m-hasPrompt-7ef5d0302ed2) from CSNode
- [hasServicepoint()](../../maapi/MaapiSchemas/CSNode.md#m-hasServicepoint-48712097633a) from CSNode
- [hasWhen()](../../maapi/MaapiSchemas/CSNode.md#m-hasWhen-075abcb130be) from CSNode
- [isAction()](../../maapi/MaapiSchemas/CSNode.md#m-isAction-4ff29a7eee95) from CSNode
- [isActionParam()](../../maapi/MaapiSchemas/CSNode.md#m-isActionParam-e8be06f1cc55) from CSNode
- [isActionResult()](../../maapi/MaapiSchemas/CSNode.md#m-isActionResult-bf63fae6130e) from CSNode
- [isCase()](../../maapi/MaapiSchemas/CSNode.md#m-isCase-fb6be6ab6d36) from CSNode
- [isContainer()](../../maapi/MaapiSchemas/CSNode.md#m-isContainer-b5ebcd6f6b32) from CSNode
- [isEmptyLeaf()](../../maapi/MaapiSchemas/CSNode.md#m-isEmptyLeaf-2ddc3d315b7a) from CSNode
- [isHidden()](../../maapi/MaapiSchemas/CSNode.md#m-isHidden-d555dbca8b21) from CSNode
- [isLeaf()](../../maapi/MaapiSchemas/CSNode.md#m-isLeaf-5329f6d31dd8) from CSNode
- [isLeafList()](../../maapi/MaapiSchemas/CSNode.md#m-isLeafList-5410d840730d) from CSNode
- [isLeafref()](../../maapi/MaapiSchemas/CSNode.md#m-isLeafref-631e9c131138) from CSNode
- [isList()](../../maapi/MaapiSchemas/CSNode.md#m-isList-c36bce63b506) from CSNode
- [isNotif()](../../maapi/MaapiSchemas/CSNode.md#m-isNotif-8c0813ed9a18) from CSNode
- [isOper()](../../maapi/MaapiSchemas/CSNode.md#m-isOper-578628dfb332) from CSNode
- [isWritable()](../../maapi/MaapiSchemas/CSNode.md#m-isWritable-f813255e9b26) from CSNode
- [printNodeType()](../../maapi/MaapiSchemas/CSNode.md#m-printNodeType-6ac11a229979) from CSNode
- [toString()](../../maapi/MaapiSchemas/CSNode.md#m-toString-e9d48c5503ef) from CSNode

## Constructors

### MmapCSNode(MmapSchemaFactory, Level, Level, int, int, String, Reader, int, CSSchema, CSNode) <a href="#m-MmapCSNode-08dea685c099" id="m-MmapCSNode-08dea685c099"></a>

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

Types: [MmapSchemaFactory](MmapSchemaFactory.md#cls-MmapSchemaFactory), [Level](MmapSchema/Level.md#cls-Level), [Reader](Schema/Cs/Reader.md#cls-Reader), [CSSchema](../../maapi/MaapiSchemas/CSSchema.md#cls-CSSchema), [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

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

### mmapSchemaFactory <a href="#m-mmapSchemaFactory" id="m-mmapSchemaFactory"></a>

```java
protected final com.tailf.ncs.maapi.MmapSchemaFactory mmapSchemaFactory = null;
```

Types: [MmapSchemaFactory](MmapSchemaFactory.md#cls-MmapSchemaFactory)


## Methods

### getChild(int) <a href="#m-getChild-65485672c186" id="m-getChild-65485672c186"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getChild(int tagHash)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `int tagHash`

### getChild(int, int) <a href="#m-getChild-689133990b1b" id="m-getChild-689133990b1b"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getChild(int nsHash, int tagHash)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `int nsHash`
- `int tagHash`

### getChildIdx() <a href="#m-getChildIdx-4d2ec6d906ee" id="m-getChildIdx-4d2ec6d906ee"></a>

**Package-private**

```java
int getChildIdx()
```

### getChildren() <a href="#m-getChildren-fe2038dff10d" id="m-getChildren-fe2038dff10d"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getChildren()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

### getFirstChild() <a href="#m-getFirstChild-710377dd9fb6" id="m-getFirstChild-710377dd9fb6"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode getFirstChild()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

### getLevel() <a href="#m-getLevel-28ca1b08d456" id="m-getLevel-28ca1b08d456"></a>

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Level getLevel()
```

Types: [Level](MmapSchema/Level.md#cls-Level)

### getNextSibling() <a href="#m-getNextSibling-e2f43ef28bf0" id="m-getNextSibling-e2f43ef28bf0"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode getNextSibling()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

### getNodeInfo() <a href="#m-getNodeInfo-82c0a80aac8a" id="m-getNodeInfo-82c0a80aac8a"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNodeInfo getNodeInfo()
```

Types: [CSNodeInfo](../../maapi/MaapiSchemas/CSNodeInfo.md#cls-CSNodeInfo)

### getParentNode() <a href="#m-getParentNode-452921385cc4" id="m-getParentNode-452921385cc4"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getParentNode()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

### getSiblings() <a href="#m-getSiblings-f467dd8b6a33" id="m-getSiblings-f467dd8b6a33"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getSiblings()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)
