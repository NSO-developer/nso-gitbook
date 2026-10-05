# MmapCSChoice <a href="#cls-MmapCSChoice" id="cls-MmapCSChoice"></a>

**Package-private**

```java
class com.tailf.ncs.maapi.MmapCSChoice
    extends com.tailf.maapi.MaapiSchemas.CSChoice
```

Types: [CSChoice](../../maapi/MaapiSchemas/CSChoice.md#cls-CSChoice)

mmap version of CSChoice, extend to support setting first and default
 case after construction.

## Members

**Constructors**:

- [MmapCSChoice(int, String, CSSchema, int, CSNode, CSCase, CSChoice)](#m-MmapCSChoice-7d5f6da50c6f)

**Fields**:

- [case0](../../maapi/MaapiSchemas/CSChoice.md#m-case0) from CSChoice
- [defaultCase](../../maapi/MaapiSchemas/CSChoice.md#m-defaultCase) from CSChoice

**Methods**:

- [getCaseParent()](../../maapi/MaapiSchemas/CSChoice.md#m-getCaseParent-85381d0de39b) from CSChoice
- [getCases()](../../maapi/MaapiSchemas/CSChoice.md#m-getCases-42abc2944fb1) from CSChoice
- [getDefaultCase()](../../maapi/MaapiSchemas/CSChoice.md#m-getDefaultCase-fa7745cee0b4) from CSChoice
- [getMinOccurs()](../../maapi/MaapiSchemas/CSChoice.md#m-getMinOccurs-cac79959dff8) from CSChoice
- [getNS()](../../maapi/MaapiSchemas/CSChoice.md#m-getNS-3613c99d8888) from CSChoice
- [getNSHash()](../../maapi/MaapiSchemas/CSChoice.md#m-getNSHash-2129fb8b3cfe) from CSChoice
- [getParentNode()](../../maapi/MaapiSchemas/CSChoice.md#m-getParentNode-452921385cc4) from CSChoice
- [getSiblings()](../../maapi/MaapiSchemas/CSChoice.md#m-getSiblings-f467dd8b6a33) from CSChoice
- [getTag()](../../maapi/MaapiSchemas/CSChoice.md#m-getTag-315f45956d6f) from CSChoice
- [getTagHash()](../../maapi/MaapiSchemas/CSChoice.md#m-getTagHash-8f057919039c) from CSChoice
- [setDefaultCase(CSCase)](#m-setDefaultCase-7c0722356351)
- [setFirstCase(CSCase)](#m-setFirstCase-9d1a575d1f3a)
- [toString()](../../maapi/MaapiSchemas/CSChoice.md#m-toString-e9d48c5503ef) from CSChoice

## Constructors

### MmapCSChoice(int, String, CSSchema, int, CSNode, CSCase, CSChoice) <a href="#m-MmapCSChoice-7d5f6da50c6f" id="m-MmapCSChoice-7d5f6da50c6f"></a>

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

Types: [CSSchema](../../maapi/MaapiSchemas/CSSchema.md#cls-CSSchema), [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [CSCase](../../maapi/MaapiSchemas/CSCase.md#cls-CSCase), [CSChoice](../../maapi/MaapiSchemas/CSChoice.md#cls-CSChoice)

**Parameters**

- `int taghash`
- `String tag`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `int minOccurs`
- `com.tailf.maapi.MaapiSchemas.CSNode parentNode`
- `com.tailf.maapi.MaapiSchemas.CSCase caseParent`
- `com.tailf.maapi.MaapiSchemas.CSChoice nextSibling`


## Methods

### setDefaultCase(CSCase) <a href="#m-setDefaultCase-7c0722356351" id="m-setDefaultCase-7c0722356351"></a>

```java
protected void setDefaultCase(com.tailf.maapi.MaapiSchemas.CSCase case0)
```

Types: [CSCase](../../maapi/MaapiSchemas/CSCase.md#cls-CSCase)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSCase case0`

### setFirstCase(CSCase) <a href="#m-setFirstCase-9d1a575d1f3a" id="m-setFirstCase-9d1a575d1f3a"></a>

```java
protected void setFirstCase(com.tailf.maapi.MaapiSchemas.CSCase case0)
```

Types: [CSCase](../../maapi/MaapiSchemas/CSCase.md#cls-CSCase)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSCase case0`
