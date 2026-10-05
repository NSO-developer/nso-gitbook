# MmapCSCase <a href="#mmapcscase-32ecb25f579a" id="mmapcscase-32ecb25f579a"></a>

```java
public class com.tailf.ncs.maapi.MmapCSCase
    extends com.tailf.maapi.MaapiSchemas.CSCase
```

Types: [CSCase](../../maapi/MaapiSchemas/CSCase.md#cscase-26937f56b18d)

mmap version of CSCase, special handling of getNodes.

## Members

**Constructors**:

- [MmapCSCase(Reader<Reader>, CSNode, int, String, CSSchema, CSChoice, CSCase)](#mmapcscase-e1cbf71e66cd)

**Fields**:

- [firstChoice](../../maapi/MaapiSchemas/CSCase.md#firstchoice-22665f28e22e) from CSCase

**Methods**:

- [getChoices()](../../maapi/MaapiSchemas/CSCase.md#getchoices-818fb3fccb86) from CSCase
- [getNodes()](#getnodes-0d0e9b3adfd1)
- [getNS()](../../maapi/MaapiSchemas/CSCase.md#getns-3613c99d8888) from CSCase
- [getNSHash()](../../maapi/MaapiSchemas/CSCase.md#getnshash-2129fb8b3cfe) from CSCase
- [getParentChoice()](../../maapi/MaapiSchemas/CSCase.md#getparentchoice-4434d9347d10) from CSCase
- [getSiblings()](../../maapi/MaapiSchemas/CSCase.md#getsiblings-f467dd8b6a33) from CSCase
- [getTag()](../../maapi/MaapiSchemas/CSCase.md#gettag-315f45956d6f) from CSCase
- [getTagHash()](../../maapi/MaapiSchemas/CSCase.md#gettaghash-8f057919039c) from CSCase
- [setFirstChoice(CSChoice)](#setfirstchoice-d4a33b33b18f)
- [toString()](../../maapi/MaapiSchemas/CSCase.md#tostring-e9d48c5503ef) from CSCase

## Constructors

### MmapCSCase(Reader&lt;Reader&gt;, CSNode, int, String, CSSchema, CSChoice, CSCase) <a href="#mmapcscase-e1cbf71e66cd" id="mmapcscase-e1cbf71e66cd"></a>

```java
protected MmapCSCase(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> qtagsr,
    com.tailf.maapi.MaapiSchemas.CSNode parentNode,
    int taghash,
    String tag,
    com.tailf.maapi.MaapiSchemas.CSSchema schema,
    com.tailf.maapi.MaapiSchemas.CSChoice parentChoice,
    com.tailf.maapi.MaapiSchemas.CSCase nextSibling
)
```

Types: [Reader](Schema/QTag/Reader.md#reader-b2467a96ddff), [CSNode](../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [CSSchema](../../maapi/MaapiSchemas/CSSchema.md#csschema-f51a58180f67), [CSChoice](../../maapi/MaapiSchemas/CSChoice.md#cschoice-7d5d5dd71270), [CSCase](../../maapi/MaapiSchemas/CSCase.md#cscase-26937f56b18d)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> qtagsr`
- `com.tailf.maapi.MaapiSchemas.CSNode parentNode`
- `int taghash`
- `String tag`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `com.tailf.maapi.MaapiSchemas.CSChoice parentChoice`
- `com.tailf.maapi.MaapiSchemas.CSCase nextSibling`


## Methods

### getNodes() <a href="#getnodes-0d0e9b3adfd1" id="getnodes-0d0e9b3adfd1"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getNodes()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

### setFirstChoice(CSChoice) <a href="#setfirstchoice-d4a33b33b18f" id="setfirstchoice-d4a33b33b18f"></a>

```java
protected void setFirstChoice(com.tailf.maapi.MaapiSchemas.CSChoice choice)
```

Types: [CSChoice](../../maapi/MaapiSchemas/CSChoice.md#cschoice-7d5d5dd71270)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSChoice choice`
