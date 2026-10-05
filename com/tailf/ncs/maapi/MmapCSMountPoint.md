# MmapCSMountPoint <a href="#mmapcsmountpoint-aee8d6faee4d" id="mmapcsmountpoint-aee8d6faee4d"></a>

```java
public class com.tailf.ncs.maapi.MmapCSMountPoint
    extends com.tailf.ncs.maapi.MmapCSNode
```

Types: [MmapCSNode](MmapCSNode.md#mmapcsnode-cd078e4f36a9)

mmap version of CSMountPoint ensuring getChildren specifics are overridden
 to match mmap usage pattern.

## Members

**Constructors**:

- [MmapCSMountPoint\(MmapSchemaFactory, SchemaLookup, Level, Level, int, int, String, Reader, int, CSSchema, CSNode\)](#mmapcsmountpoint-026e06cffc48)

**Fields**:

- [firstChild](../../maapi/MaapiSchemas/CSNode.md#firstchild-0586a0455621) from CSNode
- [mmapSchemaFactory](MmapCSNode.md#mmapschemafactory-3b893f1e4057) from MmapCSNode
- [nextSibling](../../maapi/MaapiSchemas/CSNode.md#nextsibling-2acba50f3dbb) from CSNode
- [parentNode](../../maapi/MaapiSchemas/CSNode.md#parentnode-eec3fae29e9e) from CSNode
- [tag](../../maapi/MaapiSchemas/CSNode.md#tag-4c1656782674) from CSNode

**Methods**:

- [equals\(Object\)](../../maapi/MaapiSchemas/CSNode.md#equals-fcd6492e0d6c) from CSNode
- [getChild\(int\)](MmapCSNode.md#getchild-65485672c186) from MmapCSNode
- [getChild\(int, int\)](MmapCSNode.md#getchild-689133990b1b) from MmapCSNode
- [getChildIdx\(\)](MmapCSNode.md#getchildidx-4d2ec6d906ee) from MmapCSNode
- [getChildren\(\)](#getchildren-fe2038dff10d)
- [getChildren\(List\<String\>\)](#getchildren-41cf83dd1b0d)
- [getChoices\(\)](../../maapi/MaapiSchemas/CSNode.md#getchoices-818fb3fccb86) from CSNode
- [getDefval\(\)](../../maapi/MaapiSchemas/CSNode.md#getdefval-561ad5494c47) from CSNode
- [getFirstChild\(\)](MmapCSNode.md#getfirstchild-710377dd9fb6) from MmapCSNode
- [getKey\(int\)](../../maapi/MaapiSchemas/CSNode.md#getkey-11aad55949c3) from CSNode
- [getKeys\(\)](../../maapi/MaapiSchemas/CSNode.md#getkeys-a24b9d377db7) from CSNode
- [getLevel\(\)](MmapCSNode.md#getlevel-28ca1b08d456) from MmapCSNode
- [getMaxOccurs\(\)](../../maapi/MaapiSchemas/CSNode.md#getmaxoccurs-365e8c5a408f) from CSNode
- [getMinOccurs\(\)](../../maapi/MaapiSchemas/CSNode.md#getminoccurs-cac79959dff8) from CSNode
- [getNextSibling\(\)](MmapCSNode.md#getnextsibling-e2f43ef28bf0) from MmapCSNode
- [getNodeInfo\(\)](MmapCSNode.md#getnodeinfo-82c0a80aac8a) from MmapCSNode
- [getNS\(\)](../../maapi/MaapiSchemas/CSNode.md#getns-3613c99d8888) from CSNode
- [getNSHash\(\)](../../maapi/MaapiSchemas/CSNode.md#getnshash-2129fb8b3cfe) from CSNode
- [getParentNode\(\)](MmapCSNode.md#getparentnode-452921385cc4) from MmapCSNode
- [getSchema\(\)](../../maapi/MaapiSchemas/CSNode.md#getschema-3824c0055841) from CSNode
- [getSibling\(int\)](../../maapi/MaapiSchemas/CSNode.md#getsibling-d70180ff4183) from CSNode
- [getSiblings\(\)](MmapCSNode.md#getsiblings-f467dd8b6a33) from MmapCSNode
- [getTag\(\)](../../maapi/MaapiSchemas/CSNode.md#gettag-315f45956d6f) from CSNode
- [getTagHash\(\)](../../maapi/MaapiSchemas/CSNode.md#gettaghash-8f057919039c) from CSNode
- [getType\(\)](../../maapi/MaapiSchemas/CSNode.md#gettype-5a52f6f0d4c1) from CSNode
- [getXmlNS\(\)](../../maapi/MaapiSchemas/CSNode.md#getxmlns-bff9992a49a2) from CSNode
- [hasChildAction\(\)](../../maapi/MaapiSchemas/CSNode.md#haschildaction-91ae469ba39c) from CSNode
- [hasChildConfAction\(\)](../../maapi/MaapiSchemas/CSNode.md#haschildconfaction-755c8c702590) from CSNode
- [hasChildOperAction\(\)](../../maapi/MaapiSchemas/CSNode.md#haschildoperaction-8c7a5d00e78f) from CSNode
- [hasChildReadOnly\(\)](../../maapi/MaapiSchemas/CSNode.md#haschildreadonly-f5ae648b3fd9) from CSNode
- [hasChildReadWrite\(\)](../../maapi/MaapiSchemas/CSNode.md#haschildreadwrite-bf5f24442e9b) from CSNode
- [hasChildren\(\)](../../maapi/MaapiSchemas/CSNode.md#haschildren-94c463ee6541) from CSNode
- [hasDisplayWhen\(\)](../../maapi/MaapiSchemas/CSNode.md#hasdisplaywhen-878875048f53) from CSNode
- [hasDocDescription\(\)](../../maapi/MaapiSchemas/CSNode.md#hasdocdescription-2ef89550698c) from CSNode
- [hashCode\(\)](../../maapi/MaapiSchemas/CSNode.md#hashcode-ef797a217903) from CSNode
- [hasMetaData\(\)](../../maapi/MaapiSchemas/CSNode.md#hasmetadata-a6da44bae224) from CSNode
- [hasMountPoint\(\)](../../maapi/MaapiSchemas/CSNode.md#hasmountpoint-d6dc13d7393d) from CSNode
- [hasPrompt\(\)](../../maapi/MaapiSchemas/CSNode.md#hasprompt-7ef5d0302ed2) from CSNode
- [hasServicepoint\(\)](../../maapi/MaapiSchemas/CSNode.md#hasservicepoint-48712097633a) from CSNode
- [hasWhen\(\)](../../maapi/MaapiSchemas/CSNode.md#haswhen-075abcb130be) from CSNode
- [isAction\(\)](../../maapi/MaapiSchemas/CSNode.md#isaction-4ff29a7eee95) from CSNode
- [isActionParam\(\)](../../maapi/MaapiSchemas/CSNode.md#isactionparam-e8be06f1cc55) from CSNode
- [isActionResult\(\)](../../maapi/MaapiSchemas/CSNode.md#isactionresult-bf63fae6130e) from CSNode
- [isCase\(\)](../../maapi/MaapiSchemas/CSNode.md#iscase-fb6be6ab6d36) from CSNode
- [isContainer\(\)](../../maapi/MaapiSchemas/CSNode.md#iscontainer-b5ebcd6f6b32) from CSNode
- [isEmptyLeaf\(\)](../../maapi/MaapiSchemas/CSNode.md#isemptyleaf-2ddc3d315b7a) from CSNode
- [isHidden\(\)](../../maapi/MaapiSchemas/CSNode.md#ishidden-d555dbca8b21) from CSNode
- [isLeaf\(\)](../../maapi/MaapiSchemas/CSNode.md#isleaf-5329f6d31dd8) from CSNode
- [isLeafList\(\)](../../maapi/MaapiSchemas/CSNode.md#isleaflist-5410d840730d) from CSNode
- [isLeafref\(\)](../../maapi/MaapiSchemas/CSNode.md#isleafref-631e9c131138) from CSNode
- [isList\(\)](../../maapi/MaapiSchemas/CSNode.md#islist-c36bce63b506) from CSNode
- [isNotif\(\)](../../maapi/MaapiSchemas/CSNode.md#isnotif-8c0813ed9a18) from CSNode
- [isOper\(\)](../../maapi/MaapiSchemas/CSNode.md#isoper-578628dfb332) from CSNode
- [isWritable\(\)](../../maapi/MaapiSchemas/CSNode.md#iswritable-f813255e9b26) from CSNode
- [printNodeType\(\)](../../maapi/MaapiSchemas/CSNode.md#printnodetype-6ac11a229979) from CSNode
- [toString\(\)](../../maapi/MaapiSchemas/CSNode.md#tostring-e9d48c5503ef) from CSNode

## Constructors

### MmapCSMountPoint(MmapSchemaFactory, SchemaLookup, Level, Level, int, int, String, Reader, int, CSSchema, CSNode) <a href="#mmapcsmountpoint-026e06cffc48" id="mmapcsmountpoint-026e06cffc48"></a>

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

Types: [MmapSchemaFactory](MmapSchemaFactory.md#mmapschemafactory-d8c770e838b5), [SchemaLookup](MmapMaapiSchemas/SchemaLookup.md#schemalookup-3497dafb56ea), [Level](MmapSchema/Level.md#level-1f9faf6c902d), [Reader](Schema/Cs/Reader.md#reader-b2467a96ddff), [CSSchema](../../maapi/MaapiSchemas/CSSchema.md#csschema-f51a58180f67), [CSNode](../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

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

### getChildren() <a href="#getchildren-fe2038dff10d" id="getchildren-fe2038dff10d"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getChildren()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

### getChildren(List&lt;String&gt;) <a href="#getchildren-41cf83dd1b0d" id="getchildren-41cf83dd1b0d"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getChildren(
    java.util.List<String> mountIds
)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `java.util.List<String> mountIds`
