<a id="s-MmapCSCase"></a>
# MmapCSCase

```java
public class com.tailf.ncs.maapi.MmapCSCase
    extends com.tailf.maapi.MaapiSchemas.CSCase
```

Types: [CSCase](../../maapi/MaapiSchemas/CSCase.md#s-CSCase)

mmap version of CSCase, special handling of getNodes.

## Members

**Constructors**:

- [MmapCSCase(Reader<Reader>, CSNode, int, String, CSSchema, CSChoice, CSCase)](#s-MmapCSCase-1)

**Fields**:

- [firstChoice](../../maapi/MaapiSchemas/CSCase.md#s-firstChoice) from CSCase

**Methods**:

- [getChoices()](../../maapi/MaapiSchemas/CSCase.md#s-getChoices) from CSCase
- [getNodes()](#s-getNodes)
- [getNS()](../../maapi/MaapiSchemas/CSCase.md#s-getNS) from CSCase
- [getNSHash()](../../maapi/MaapiSchemas/CSCase.md#s-getNSHash) from CSCase
- [getParentChoice()](../../maapi/MaapiSchemas/CSCase.md#s-getParentChoice) from CSCase
- [getSiblings()](../../maapi/MaapiSchemas/CSCase.md#s-getSiblings) from CSCase
- [getTag()](../../maapi/MaapiSchemas/CSCase.md#s-getTag) from CSCase
- [getTagHash()](../../maapi/MaapiSchemas/CSCase.md#s-getTagHash) from CSCase
- [setFirstChoice(CSChoice)](#s-setFirstChoice)
- [toString()](../../maapi/MaapiSchemas/CSCase.md#s-toString) from CSCase

## Constructors

<a id="s-MmapCSCase-1"></a>
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

Types: [Reader](Schema/QTag/Reader.md#s-Reader), [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode), [CSSchema](../../maapi/MaapiSchemas/CSSchema.md#s-CSSchema), [CSChoice](../../maapi/MaapiSchemas/CSChoice.md#s-CSChoice), [CSCase](../../maapi/MaapiSchemas/CSCase.md#s-CSCase)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> qtagsr`
- `com.tailf.maapi.MaapiSchemas.CSNode parentNode`
- `int taghash`
- `String tag`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `com.tailf.maapi.MaapiSchemas.CSChoice parentChoice`
- `com.tailf.maapi.MaapiSchemas.CSCase nextSibling`


## Methods

<a id="s-getNodes"></a>
### getNodes()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getNodes()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode)

<a id="s-setFirstChoice"></a>
### setFirstChoice(CSChoice)

```java
protected void setFirstChoice(com.tailf.maapi.MaapiSchemas.CSChoice choice)
```

Types: [CSChoice](../../maapi/MaapiSchemas/CSChoice.md#s-CSChoice)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSChoice choice`
