<a id="cls-MmapCSCase"></a>
# MmapCSCase

```java
public class com.tailf.ncs.maapi.MmapCSCase
    extends com.tailf.maapi.MaapiSchemas.CSCase
```

Types: [CSCase](../../maapi/MaapiSchemas/CSCase.md#cls-CSCase)

mmap version of CSCase, special handling of getNodes.

## Members

**Constructors**:

- [MmapCSCase(Reader<Reader>, CSNode, int, String, CSSchema, CSChoice, CSCase)](#m-mmapcscase-e1cbf71e66cd)

**Fields**:

- [firstChoice](../../maapi/MaapiSchemas/CSCase.md#m-firstChoice) from CSCase

**Methods**:

- [getChoices()](../../maapi/MaapiSchemas/CSCase.md#m-getchoices-818fb3fccb86) from CSCase
- [getNodes()](#m-getnodes-0d0e9b3adfd1)
- [getNS()](../../maapi/MaapiSchemas/CSCase.md#m-getns-3613c99d8888) from CSCase
- [getNSHash()](../../maapi/MaapiSchemas/CSCase.md#m-getnshash-2129fb8b3cfe) from CSCase
- [getParentChoice()](../../maapi/MaapiSchemas/CSCase.md#m-getparentchoice-4434d9347d10) from CSCase
- [getSiblings()](../../maapi/MaapiSchemas/CSCase.md#m-getsiblings-f467dd8b6a33) from CSCase
- [getTag()](../../maapi/MaapiSchemas/CSCase.md#m-gettag-315f45956d6f) from CSCase
- [getTagHash()](../../maapi/MaapiSchemas/CSCase.md#m-gettaghash-8f057919039c) from CSCase
- [setFirstChoice(CSChoice)](#m-setfirstchoice-d4a33b33b18f)
- [toString()](../../maapi/MaapiSchemas/CSCase.md#m-tostring-e9d48c5503ef) from CSCase

## Constructors

<a id="m-mmapcscase-e1cbf71e66cd"></a>
### MmapCSCase(Reader<Reader>, CSNode, int, String, CSSchema, CSChoice, CSCase)

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

Types: [Reader](Schema/QTag/Reader.md#cls-Reader), [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [CSSchema](../../maapi/MaapiSchemas/CSSchema.md#cls-CSSchema), [CSChoice](../../maapi/MaapiSchemas/CSChoice.md#cls-CSChoice), [CSCase](../../maapi/MaapiSchemas/CSCase.md#cls-CSCase)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> qtagsr`
- `com.tailf.maapi.MaapiSchemas.CSNode parentNode`
- `int taghash`
- `String tag`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `com.tailf.maapi.MaapiSchemas.CSChoice parentChoice`
- `com.tailf.maapi.MaapiSchemas.CSCase nextSibling`


## Methods

<a id="m-getnodes-0d0e9b3adfd1"></a>
### getNodes()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getNodes()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

<a id="m-setfirstchoice-d4a33b33b18f"></a>
### setFirstChoice(CSChoice)

```java
protected void setFirstChoice(com.tailf.maapi.MaapiSchemas.CSChoice choice)
```

Types: [CSChoice](../../maapi/MaapiSchemas/CSChoice.md#cls-CSChoice)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSChoice choice`
