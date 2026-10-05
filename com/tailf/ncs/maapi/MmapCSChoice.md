# MmapCSChoice <a href="#mmapcschoice-47e12534067f" id="mmapcschoice-47e12534067f"></a>

**Package-private**

```java
class com.tailf.ncs.maapi.MmapCSChoice
    extends com.tailf.maapi.MaapiSchemas.CSChoice
```

Types: [CSChoice](../../maapi/MaapiSchemas/CSChoice.md#cschoice-7d5d5dd71270)

mmap version of CSChoice, extend to support setting first and default
 case after construction.

## Members

**Constructors**:

- [MmapCSChoice\(int, String, CSSchema, int, CSNode, CSCase, CSChoice\)](#mmapcschoice-7d5f6da50c6f)

**Fields**:

- [case0](../../maapi/MaapiSchemas/CSChoice.md#case0-29ac777b3b38) from CSChoice
- [defaultCase](../../maapi/MaapiSchemas/CSChoice.md#defaultcase-5d8142d107fb) from CSChoice

**Methods**:

- [getCaseParent\(\)](../../maapi/MaapiSchemas/CSChoice.md#getcaseparent-85381d0de39b) from CSChoice
- [getCases\(\)](../../maapi/MaapiSchemas/CSChoice.md#getcases-42abc2944fb1) from CSChoice
- [getDefaultCase\(\)](../../maapi/MaapiSchemas/CSChoice.md#getdefaultcase-fa7745cee0b4) from CSChoice
- [getMinOccurs\(\)](../../maapi/MaapiSchemas/CSChoice.md#getminoccurs-cac79959dff8) from CSChoice
- [getNS\(\)](../../maapi/MaapiSchemas/CSChoice.md#getns-3613c99d8888) from CSChoice
- [getNSHash\(\)](../../maapi/MaapiSchemas/CSChoice.md#getnshash-2129fb8b3cfe) from CSChoice
- [getParentNode\(\)](../../maapi/MaapiSchemas/CSChoice.md#getparentnode-452921385cc4) from CSChoice
- [getSiblings\(\)](../../maapi/MaapiSchemas/CSChoice.md#getsiblings-f467dd8b6a33) from CSChoice
- [getTag\(\)](../../maapi/MaapiSchemas/CSChoice.md#gettag-315f45956d6f) from CSChoice
- [getTagHash\(\)](../../maapi/MaapiSchemas/CSChoice.md#gettaghash-8f057919039c) from CSChoice
- [setDefaultCase\(CSCase\)](#setdefaultcase-7c0722356351)
- [setFirstCase\(CSCase\)](#setfirstcase-9d1a575d1f3a)
- [toString\(\)](../../maapi/MaapiSchemas/CSChoice.md#tostring-e9d48c5503ef) from CSChoice

## Constructors

### MmapCSChoice(int, String, CSSchema, int, CSNode, CSCase, CSChoice) <a href="#mmapcschoice-7d5f6da50c6f" id="mmapcschoice-7d5f6da50c6f"></a>

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

Types: [CSSchema](../../maapi/MaapiSchemas/CSSchema.md#csschema-f51a58180f67), [CSNode](../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [CSCase](../../maapi/MaapiSchemas/CSCase.md#cscase-26937f56b18d), [CSChoice](../../maapi/MaapiSchemas/CSChoice.md#cschoice-7d5d5dd71270)

**Parameters**

- `int taghash`
- `String tag`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `int minOccurs`
- `com.tailf.maapi.MaapiSchemas.CSNode parentNode`
- `com.tailf.maapi.MaapiSchemas.CSCase caseParent`
- `com.tailf.maapi.MaapiSchemas.CSChoice nextSibling`


## Methods

### setDefaultCase(CSCase) <a href="#setdefaultcase-7c0722356351" id="setdefaultcase-7c0722356351"></a>

```java
protected void setDefaultCase(com.tailf.maapi.MaapiSchemas.CSCase case0)
```

Types: [CSCase](../../maapi/MaapiSchemas/CSCase.md#cscase-26937f56b18d)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSCase case0`

### setFirstCase(CSCase) <a href="#setfirstcase-9d1a575d1f3a" id="setfirstcase-9d1a575d1f3a"></a>

```java
protected void setFirstCase(com.tailf.maapi.MaapiSchemas.CSCase case0)
```

Types: [CSCase](../../maapi/MaapiSchemas/CSCase.md#cscase-26937f56b18d)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSCase case0`
