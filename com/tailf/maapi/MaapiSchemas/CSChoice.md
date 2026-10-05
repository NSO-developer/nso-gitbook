<a id="s-CSChoice"></a>
# CSChoice

```java
public static class com.tailf.maapi.MaapiSchemas.CSChoice
```

Class representing a Schema Choice

**Related classes**

- [MmapCSChoice](../../ncs/maapi/MmapCSChoice.md#s-MmapCSChoice)

## Members

**Constructors**:

- [CSChoice()](#s-CSChoice-1)
- [CSChoice(int, String, CSSchema, int, CSNode, CSCase, CSChoice)](#s-CSChoice-2)

**Fields**:

- [case0](#s-case0)
- [defaultCase](#s-defaultCase)

**Methods**:

- [getCaseParent()](#s-getCaseParent)
- [getCases()](#s-getCases)
- [getDefaultCase()](#s-getDefaultCase)
- [getMinOccurs()](#s-getMinOccurs)
- [getNS()](#s-getNS)
- [getNSHash()](#s-getNSHash)
- [getParentNode()](#s-getParentNode)
- [getSiblings()](#s-getSiblings)
- [getTag()](#s-getTag)
- [getTagHash()](#s-getTagHash)
- [toString()](#s-toString)

## Constructors

<a id="s-CSChoice-1"></a>
### CSChoice()

```java
protected CSChoice()
```

Constructor for CSChoice class

<a id="s-CSChoice-2"></a>
### CSChoice(int, String, CSSchema, int, CSNode, CSCase, CSChoice)

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

Types: [CSSchema](CSSchema.md#s-CSSchema), [CSNode](CSNode.md#s-CSNode), [CSCase](CSCase.md#s-CSCase), [CSChoice](CSChoice.md#s-CSChoice)

**Parameters**

- `int taghash`
- `String tag`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `int minOccurs`
- `com.tailf.maapi.MaapiSchemas.CSNode parentNode`
- `com.tailf.maapi.MaapiSchemas.CSCase caseParent`
- `com.tailf.maapi.MaapiSchemas.CSChoice nextSibling`


## Fields

<a id="s-case0"></a>
### case0

```java
protected com.tailf.maapi.MaapiSchemas.CSCase case0 = null;
```

Types: [CSCase](CSCase.md#s-CSCase)

<a id="s-defaultCase"></a>
### defaultCase

```java
protected com.tailf.maapi.MaapiSchemas.CSCase defaultCase = null;
```

Types: [CSCase](CSCase.md#s-CSCase)


## Methods

<a id="s-getCaseParent"></a>
### getCaseParent()

```java
public com.tailf.maapi.MaapiSchemas.CSCase getCaseParent()
```

Types: [CSCase](CSCase.md#s-CSCase)

If this choice is defined as a case for another choice this method
 returns the case, otherwise null is returned.

**Returns:** CsCase the case parent for this case if any

<a id="s-getCases"></a>
### getCases()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSCase> getCases()
```

Types: [CSCase](CSCase.md#s-CSCase)

get List of cases for this choice. Cases are represented by CSCase
 objects and the list is a list of CSCase objects accordingly

**Returns:** List of cases

<a id="s-getDefaultCase"></a>
### getDefaultCase()

```java
public com.tailf.maapi.MaapiSchemas.CSCase getDefaultCase()
```

Types: [CSCase](CSCase.md#s-CSCase)

get default case for the choice. The case is represented by a CSCase
 object

**Returns:** CSCase default case or null if not defined

<a id="s-getMinOccurs"></a>
### getMinOccurs()

```java
public int getMinOccurs()
```

get MinOccurs for the choice

**Returns:** int minOccurs

<a id="s-getNS"></a>
### getNS()

```java
public String getNS()
```

get namespace represented as string

**Returns:** String namespace

<a id="s-getNSHash"></a>
### getNSHash()

```java
public int getNSHash()
```

get namespace represented as hash value

**Returns:** int hashvalue for the namespace

<a id="s-getParentNode"></a>
### getParentNode()

```java
public com.tailf.maapi.MaapiSchemas.CSNode getParentNode()
```

Types: [CSNode](CSNode.md#s-CSNode)

get parent node for the choice.

**Returns:** CSNode parent node

<a id="s-getSiblings"></a>
### getSiblings()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getSiblings()
```

Types: [CSChoice](CSChoice.md#s-CSChoice)

get List of sibling choices with the same parent node. The List is a
 list of CSChoices and includes the current choice.

**Returns:** List of sibling choices

<a id="s-getTag"></a>
### getTag()

```java
public String getTag()
```

get choice tag represented as string

**Returns:** string tag

<a id="s-getTagHash"></a>
### getTagHash()

```java
public int getTagHash()
```

get choice tag represented as hash value

**Returns:** int hashvalue for the tag

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Informative string representation of a CSChoice instance

**Returns:** String
