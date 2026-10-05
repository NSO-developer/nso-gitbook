# CSChoice <a href="#cls-CSChoice" id="cls-CSChoice"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSChoice
```

Class representing a Schema Choice

**Related classes**

- [MmapCSChoice](../../ncs/maapi/MmapCSChoice.md#cls-MmapCSChoice)

## Members

**Constructors**:

- [CSChoice()](#m-CSChoice-68f5778b1ef7)
- [CSChoice(int, String, CSSchema, int, CSNode, CSCase, CSChoice)](#m-CSChoice-c5a1557367a2)

**Fields**:

- [case0](#m-case0)
- [defaultCase](#m-defaultCase)

**Methods**:

- [getCaseParent()](#m-getCaseParent-85381d0de39b)
- [getCases()](#m-getCases-42abc2944fb1)
- [getDefaultCase()](#m-getDefaultCase-fa7745cee0b4)
- [getMinOccurs()](#m-getMinOccurs-cac79959dff8)
- [getNS()](#m-getNS-3613c99d8888)
- [getNSHash()](#m-getNSHash-2129fb8b3cfe)
- [getParentNode()](#m-getParentNode-452921385cc4)
- [getSiblings()](#m-getSiblings-f467dd8b6a33)
- [getTag()](#m-getTag-315f45956d6f)
- [getTagHash()](#m-getTagHash-8f057919039c)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### CSChoice() <a href="#m-CSChoice-68f5778b1ef7" id="m-CSChoice-68f5778b1ef7"></a>

```java
protected CSChoice()
```

Constructor for CSChoice class

### CSChoice(int, String, CSSchema, int, CSNode, CSCase, CSChoice) <a href="#m-CSChoice-c5a1557367a2" id="m-CSChoice-c5a1557367a2"></a>

```java
public CSChoice(
    int taghash,
    String tag,
    com.tailf.maapi.MaapiSchemas.CSSchema schema,
    int minOccurs,
    com.tailf.maapi.MaapiSchemas.CSNode parentNode,
    com.tailf.maapi.MaapiSchemas.CSCase caseParent,
    com.tailf.maapi.MaapiSchemas.CSChoice nextSibling
)
```

Types: [CSSchema](CSSchema.md#cls-CSSchema), [CSNode](CSNode.md#cls-CSNode), [CSCase](CSCase.md#cls-CSCase), [CSChoice](CSChoice.md#cls-CSChoice)

**Parameters**

- `int taghash`
- `String tag`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `int minOccurs`
- `com.tailf.maapi.MaapiSchemas.CSNode parentNode`
- `com.tailf.maapi.MaapiSchemas.CSCase caseParent`
- `com.tailf.maapi.MaapiSchemas.CSChoice nextSibling`


## Fields

### case0 <a href="#m-case0" id="m-case0"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSCase case0 = null;
```

Types: [CSCase](CSCase.md#cls-CSCase)

### defaultCase <a href="#m-defaultCase" id="m-defaultCase"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSCase defaultCase = null;
```

Types: [CSCase](CSCase.md#cls-CSCase)


## Methods

### getCaseParent() <a href="#m-getCaseParent-85381d0de39b" id="m-getCaseParent-85381d0de39b"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSCase getCaseParent()
```

Types: [CSCase](CSCase.md#cls-CSCase)

If this choice is defined as a case for another choice this method
 returns the case, otherwise null is returned.

**Returns:** CsCase the case parent for this case if any

### getCases() <a href="#m-getCases-42abc2944fb1" id="m-getCases-42abc2944fb1"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSCase> getCases()
```

Types: [CSCase](CSCase.md#cls-CSCase)

get List of cases for this choice. Cases are represented by CSCase
 objects and the list is a list of CSCase objects accordingly

**Returns:** List of cases

### getDefaultCase() <a href="#m-getDefaultCase-fa7745cee0b4" id="m-getDefaultCase-fa7745cee0b4"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSCase getDefaultCase()
```

Types: [CSCase](CSCase.md#cls-CSCase)

get default case for the choice. The case is represented by a CSCase
 object

**Returns:** CSCase default case or null if not defined

### getMinOccurs() <a href="#m-getMinOccurs-cac79959dff8" id="m-getMinOccurs-cac79959dff8"></a>

```java
public int getMinOccurs()
```

get MinOccurs for the choice

**Returns:** int minOccurs

### getNS() <a href="#m-getNS-3613c99d8888" id="m-getNS-3613c99d8888"></a>

```java
public String getNS()
```

get namespace represented as string

**Returns:** String namespace

### getNSHash() <a href="#m-getNSHash-2129fb8b3cfe" id="m-getNSHash-2129fb8b3cfe"></a>

```java
public int getNSHash()
```

get namespace represented as hash value

**Returns:** int hashvalue for the namespace

### getParentNode() <a href="#m-getParentNode-452921385cc4" id="m-getParentNode-452921385cc4"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getParentNode()
```

Types: [CSNode](CSNode.md#cls-CSNode)

get parent node for the choice.

**Returns:** CSNode parent node

### getSiblings() <a href="#m-getSiblings-f467dd8b6a33" id="m-getSiblings-f467dd8b6a33"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getSiblings()
```

Types: [CSChoice](CSChoice.md#cls-CSChoice)

get List of sibling choices with the same parent node. The List is a
 list of CSChoices and includes the current choice.

**Returns:** List of sibling choices

### getTag() <a href="#m-getTag-315f45956d6f" id="m-getTag-315f45956d6f"></a>

```java
public String getTag()
```

get choice tag represented as string

**Returns:** string tag

### getTagHash() <a href="#m-getTagHash-8f057919039c" id="m-getTagHash-8f057919039c"></a>

```java
public int getTagHash()
```

get choice tag represented as hash value

**Returns:** int hashvalue for the tag

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Informative string representation of a CSChoice instance

**Returns:** String
