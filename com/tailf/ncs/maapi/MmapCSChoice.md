<a id="s-MmapCSChoice"></a>
# MmapCSChoice

**Package-private**

```java
class com.tailf.ncs.maapi.MmapCSChoice
    extends com.tailf.maapi.MaapiSchemas.CSChoice
```

Types: [CSChoice](../../maapi/MaapiSchemas/CSChoice.md#s-CSChoice)

mmap version of CSChoice, extend to support setting first and default
 case after construction.

## Members

**Constructors**:

- [MmapCSChoice(int, String, CSSchema, int, CSNode, CSCase, CSChoice)](#s-MmapCSChoice-1)

**Fields**:

- [case0](../../maapi/MaapiSchemas/CSChoice.md#s-case0) from CSChoice
- [defaultCase](../../maapi/MaapiSchemas/CSChoice.md#s-defaultCase) from CSChoice

**Methods**:

- [getCaseParent()](../../maapi/MaapiSchemas/CSChoice.md#s-getCaseParent) from CSChoice
- [getCases()](../../maapi/MaapiSchemas/CSChoice.md#s-getCases) from CSChoice
- [getDefaultCase()](../../maapi/MaapiSchemas/CSChoice.md#s-getDefaultCase) from CSChoice
- [getMinOccurs()](../../maapi/MaapiSchemas/CSChoice.md#s-getMinOccurs) from CSChoice
- [getNS()](../../maapi/MaapiSchemas/CSChoice.md#s-getNS) from CSChoice
- [getNSHash()](../../maapi/MaapiSchemas/CSChoice.md#s-getNSHash) from CSChoice
- [getParentNode()](../../maapi/MaapiSchemas/CSChoice.md#s-getParentNode) from CSChoice
- [getSiblings()](../../maapi/MaapiSchemas/CSChoice.md#s-getSiblings) from CSChoice
- [getTag()](../../maapi/MaapiSchemas/CSChoice.md#s-getTag) from CSChoice
- [getTagHash()](../../maapi/MaapiSchemas/CSChoice.md#s-getTagHash) from CSChoice
- [setDefaultCase(CSCase)](#s-setDefaultCase)
- [setFirstCase(CSCase)](#s-setFirstCase)
- [toString()](../../maapi/MaapiSchemas/CSChoice.md#s-toString) from CSChoice

## Constructors

<a id="s-MmapCSChoice-1"></a>
### MmapCSChoice(int, String, CSSchema, int, CSNode, CSCase, CSChoice)

```java
protected MmapCSChoice(
    int taghash,
    String tag,
    com.tailf.maapi.MaapiSchemas.CSSchema schema,
    int minOccurs,
    com.tailf.maapi.MaapiSchemas.CSNode parentNode,
    com.tailf.maapi.MaapiSchemas.CSCase caseParent,
    com.tailf.maapi.MaapiSchemas.CSChoice nextSibling
)
```

Types: [CSSchema](../../maapi/MaapiSchemas/CSSchema.md#s-CSSchema), [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode), [CSCase](../../maapi/MaapiSchemas/CSCase.md#s-CSCase), [CSChoice](../../maapi/MaapiSchemas/CSChoice.md#s-CSChoice)

**Parameters**

- `int taghash`
- `String tag`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `int minOccurs`
- `com.tailf.maapi.MaapiSchemas.CSNode parentNode`
- `com.tailf.maapi.MaapiSchemas.CSCase caseParent`
- `com.tailf.maapi.MaapiSchemas.CSChoice nextSibling`


## Methods

<a id="s-setDefaultCase"></a>
### setDefaultCase(CSCase)

```java
protected void setDefaultCase(com.tailf.maapi.MaapiSchemas.CSCase case0)
```

Types: [CSCase](../../maapi/MaapiSchemas/CSCase.md#s-CSCase)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSCase case0`

<a id="s-setFirstCase"></a>
### setFirstCase(CSCase)

```java
protected void setFirstCase(com.tailf.maapi.MaapiSchemas.CSCase case0)
```

Types: [CSCase](../../maapi/MaapiSchemas/CSCase.md#s-CSCase)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSCase case0`
