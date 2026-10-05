<a id="cls-MmapCSMountPoint"></a>
# MmapCSMountPoint

```java
public class com.tailf.ncs.maapi.MmapCSMountPoint
    extends com.tailf.ncs.maapi.MmapCSNode
```

Types: [MmapCSNode](MmapCSNode.md#cls-MmapCSNode)

mmap version of CSMountPoint ensuring getChildren specifics are overridden
 to match mmap usage pattern.

## Members

**Constructors**:

- [MmapCSMountPoint(MmapSchemaFactory, SchemaLookup, Level, Level, int, int, String, Reader, int, CSSchema, CSNode)](#m-mmapcsmountpoint-026e06cffc48)

**Fields**:

- [firstChild](../../maapi/MaapiSchemas/CSNode.md#m-firstChild) from CSNode
- [mmapSchemaFactory](MmapCSNode.md#m-mmapSchemaFactory) from MmapCSNode
- [nextSibling](../../maapi/MaapiSchemas/CSNode.md#m-nextSibling) from CSNode
- [parentNode](../../maapi/MaapiSchemas/CSNode.md#m-parentNode) from CSNode
- [tag](../../maapi/MaapiSchemas/CSNode.md#m-tag) from CSNode

**Methods**:

- [equals(Object)](../../maapi/MaapiSchemas/CSNode.md#m-equals-fcd6492e0d6c) from CSNode
- [getChild(int)](MmapCSNode.md#m-getchild-65485672c186) from MmapCSNode
- [getChild(int, int)](MmapCSNode.md#m-getchild-689133990b1b) from MmapCSNode
- [getChildIdx()](MmapCSNode.md#m-getchildidx-4d2ec6d906ee) from MmapCSNode
- [getChildren()](#m-getchildren-fe2038dff10d)
- [getChildren(List<String>)](#m-getchildren-41cf83dd1b0d)
- [getChoices()](../../maapi/MaapiSchemas/CSNode.md#m-getchoices-818fb3fccb86) from CSNode
- [getDefval()](../../maapi/MaapiSchemas/CSNode.md#m-getdefval-561ad5494c47) from CSNode
- [getFirstChild()](MmapCSNode.md#m-getfirstchild-710377dd9fb6) from MmapCSNode
- [getKey(int)](../../maapi/MaapiSchemas/CSNode.md#m-getkey-11aad55949c3) from CSNode
- [getKeys()](../../maapi/MaapiSchemas/CSNode.md#m-getkeys-a24b9d377db7) from CSNode
- [getLevel()](MmapCSNode.md#m-getlevel-28ca1b08d456) from MmapCSNode
- [getMaxOccurs()](../../maapi/MaapiSchemas/CSNode.md#m-getmaxoccurs-365e8c5a408f) from CSNode
- [getMinOccurs()](../../maapi/MaapiSchemas/CSNode.md#m-getminoccurs-cac79959dff8) from CSNode
- [getNextSibling()](MmapCSNode.md#m-getnextsibling-e2f43ef28bf0) from MmapCSNode
- [getNodeInfo()](MmapCSNode.md#m-getnodeinfo-82c0a80aac8a) from MmapCSNode
- [getNS()](../../maapi/MaapiSchemas/CSNode.md#m-getns-3613c99d8888) from CSNode
- [getNSHash()](../../maapi/MaapiSchemas/CSNode.md#m-getnshash-2129fb8b3cfe) from CSNode
- [getParentNode()](MmapCSNode.md#m-getparentnode-452921385cc4) from MmapCSNode
- [getSchema()](../../maapi/MaapiSchemas/CSNode.md#m-getschema-3824c0055841) from CSNode
- [getSibling(int)](../../maapi/MaapiSchemas/CSNode.md#m-getsibling-d70180ff4183) from CSNode
- [getSiblings()](MmapCSNode.md#m-getsiblings-f467dd8b6a33) from MmapCSNode
- [getTag()](../../maapi/MaapiSchemas/CSNode.md#m-gettag-315f45956d6f) from CSNode
- [getTagHash()](../../maapi/MaapiSchemas/CSNode.md#m-gettaghash-8f057919039c) from CSNode
- [getType()](../../maapi/MaapiSchemas/CSNode.md#m-gettype-5a52f6f0d4c1) from CSNode
- [getXmlNS()](../../maapi/MaapiSchemas/CSNode.md#m-getxmlns-bff9992a49a2) from CSNode
- [hasChildAction()](../../maapi/MaapiSchemas/CSNode.md#m-haschildaction-91ae469ba39c) from CSNode
- [hasChildConfAction()](../../maapi/MaapiSchemas/CSNode.md#m-haschildconfaction-755c8c702590) from CSNode
- [hasChildOperAction()](../../maapi/MaapiSchemas/CSNode.md#m-haschildoperaction-8c7a5d00e78f) from CSNode
- [hasChildReadOnly()](../../maapi/MaapiSchemas/CSNode.md#m-haschildreadonly-f5ae648b3fd9) from CSNode
- [hasChildReadWrite()](../../maapi/MaapiSchemas/CSNode.md#m-haschildreadwrite-bf5f24442e9b) from CSNode
- [hasChildren()](../../maapi/MaapiSchemas/CSNode.md#m-haschildren-94c463ee6541) from CSNode
- [hasDisplayWhen()](../../maapi/MaapiSchemas/CSNode.md#m-hasdisplaywhen-878875048f53) from CSNode
- [hasDocDescription()](../../maapi/MaapiSchemas/CSNode.md#m-hasdocdescription-2ef89550698c) from CSNode
- [hashCode()](../../maapi/MaapiSchemas/CSNode.md#m-hashcode-ef797a217903) from CSNode
- [hasMetaData()](../../maapi/MaapiSchemas/CSNode.md#m-hasmetadata-a6da44bae224) from CSNode
- [hasMountPoint()](../../maapi/MaapiSchemas/CSNode.md#m-hasmountpoint-d6dc13d7393d) from CSNode
- [hasPrompt()](../../maapi/MaapiSchemas/CSNode.md#m-hasprompt-7ef5d0302ed2) from CSNode
- [hasServicepoint()](../../maapi/MaapiSchemas/CSNode.md#m-hasservicepoint-48712097633a) from CSNode
- [hasWhen()](../../maapi/MaapiSchemas/CSNode.md#m-haswhen-075abcb130be) from CSNode
- [isAction()](../../maapi/MaapiSchemas/CSNode.md#m-isaction-4ff29a7eee95) from CSNode
- [isActionParam()](../../maapi/MaapiSchemas/CSNode.md#m-isactionparam-e8be06f1cc55) from CSNode
- [isActionResult()](../../maapi/MaapiSchemas/CSNode.md#m-isactionresult-bf63fae6130e) from CSNode
- [isCase()](../../maapi/MaapiSchemas/CSNode.md#m-iscase-fb6be6ab6d36) from CSNode
- [isContainer()](../../maapi/MaapiSchemas/CSNode.md#m-iscontainer-b5ebcd6f6b32) from CSNode
- [isEmptyLeaf()](../../maapi/MaapiSchemas/CSNode.md#m-isemptyleaf-2ddc3d315b7a) from CSNode
- [isHidden()](../../maapi/MaapiSchemas/CSNode.md#m-ishidden-d555dbca8b21) from CSNode
- [isLeaf()](../../maapi/MaapiSchemas/CSNode.md#m-isleaf-5329f6d31dd8) from CSNode
- [isLeafList()](../../maapi/MaapiSchemas/CSNode.md#m-isleaflist-5410d840730d) from CSNode
- [isLeafref()](../../maapi/MaapiSchemas/CSNode.md#m-isleafref-631e9c131138) from CSNode
- [isList()](../../maapi/MaapiSchemas/CSNode.md#m-islist-c36bce63b506) from CSNode
- [isNotif()](../../maapi/MaapiSchemas/CSNode.md#m-isnotif-8c0813ed9a18) from CSNode
- [isOper()](../../maapi/MaapiSchemas/CSNode.md#m-isoper-578628dfb332) from CSNode
- [isWritable()](../../maapi/MaapiSchemas/CSNode.md#m-iswritable-f813255e9b26) from CSNode
- [printNodeType()](../../maapi/MaapiSchemas/CSNode.md#m-printnodetype-6ac11a229979) from CSNode
- [toString()](../../maapi/MaapiSchemas/CSNode.md#m-tostring-e9d48c5503ef) from CSNode

## Constructors

<a id="m-mmapcsmountpoint-026e06cffc48"></a>
### MmapCSMountPoint(MmapSchemaFactory, SchemaLookup, Level, Level, int, int, String, Reader, int, CSSchema, CSNode)

```java
protected MmapCSMountPoint(
    com.tailf.ncs.maapi.MmapSchemaFactory mmapSchemaFactory,
    com.tailf.ncs.maapi.MmapMaapiSchemas.SchemaLookup schemaLookup,
    com.tailf.ncs.maapi.MmapSchema.Level parentLevel,
    com.tailf.ncs.maapi.MmapSchema.Level level,
    int childIdx,
    int taghash,
    String tag,
    com.tailf.ncs.maapi.Schema.Cs.Reader csReader,
    int csPos,
    com.tailf.maapi.MaapiSchemas.CSSchema schema,
    com.tailf.maapi.MaapiSchemas.CSNode parentNode
)
```

Types: [MmapSchemaFactory](MmapSchemaFactory.md#cls-MmapSchemaFactory), [SchemaLookup](MmapMaapiSchemas/SchemaLookup.md#cls-SchemaLookup), [Level](MmapSchema/Level.md#cls-Level), [Reader](Schema/Cs/Reader.md#cls-Reader), [CSSchema](../../maapi/MaapiSchemas/CSSchema.md#cls-CSSchema), [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchemaFactory mmapSchemaFactory`
- `com.tailf.ncs.maapi.MmapMaapiSchemas.SchemaLookup schemaLookup`
- `com.tailf.ncs.maapi.MmapSchema.Level parentLevel`
- `com.tailf.ncs.maapi.MmapSchema.Level level`
- `int childIdx`
- `int taghash`
- `String tag`
- `com.tailf.ncs.maapi.Schema.Cs.Reader csReader`
- `int csPos`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `com.tailf.maapi.MaapiSchemas.CSNode parentNode`


## Methods

<a id="m-getchildren-fe2038dff10d"></a>
### getChildren()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getChildren()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

<a id="m-getchildren-41cf83dd1b0d"></a>
### getChildren(List<String>)

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getChildren(
    java.util.List<String> mountIds
)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `java.util.List<String> mountIds`
