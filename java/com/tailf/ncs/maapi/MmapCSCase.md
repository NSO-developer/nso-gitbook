# MmapCSCase <a href="#mmapcscase-32ecb25f579a" id="mmapcscase-32ecb25f579a"></a>

```java
public class com.tailf.ncs.maapi.MmapCSCase
    extends com.tailf.maapi.MaapiSchemas.CSCase
```

Types: [CSCase](../../maapi/MaapiSchemas/CSCase.md#cscase-26937f56b18d)

mmap version of CSCase, special handling of getNodes.

## Members

**Methods**:

- [getChoices\(\)](../../maapi/MaapiSchemas/CSCase.md#getchoices-818fb3fccb86) from CSCase
- [getNodes\(\)](#getnodes-0d0e9b3adfd1)
- [getNS\(\)](../../maapi/MaapiSchemas/CSCase.md#getns-3613c99d8888) from CSCase
- [getNSHash\(\)](../../maapi/MaapiSchemas/CSCase.md#getnshash-2129fb8b3cfe) from CSCase
- [getParentChoice\(\)](../../maapi/MaapiSchemas/CSCase.md#getparentchoice-4434d9347d10) from CSCase
- [getSiblings\(\)](../../maapi/MaapiSchemas/CSCase.md#getsiblings-f467dd8b6a33) from CSCase
- [getTag\(\)](../../maapi/MaapiSchemas/CSCase.md#gettag-315f45956d6f) from CSCase
- [getTagHash\(\)](../../maapi/MaapiSchemas/CSCase.md#gettaghash-8f057919039c) from CSCase
- [toString\(\)](../../maapi/MaapiSchemas/CSCase.md#tostring-e9d48c5503ef) from CSCase

## Methods

### getNodes() <a href="#getnodes-0d0e9b3adfd1" id="getnodes-0d0e9b3adfd1"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getNodes()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

*Description from* [`CSCase.getNodes()`](../../maapi/MaapiSchemas/CSCase.md#getnodes-0d0e9b3adfd1)

get List of the nodes defined in this Case. The list is a list of
 CSNode objects.

**Returns:** List of nodes
