<a id="cls-CSChoice"></a>
# CSChoice

```java
public static class com.tailf.maapi.MaapiSchemas.CSChoice
```

Class representing a Schema Choice

**Related classes**

- [MmapCSChoice](../../ncs/maapi/MmapCSChoice.md#cls-MmapCSChoice)

## Members

**Constructors**:

- [CSChoice()](#m-cschoice-68f5778b1ef7)
- [CSChoice(int, String, CSSchema, int, CSNode, CSCase, CSChoice)](#m-cschoice-c5a1557367a2)

**Fields**:

- [case0](#m-case0)
- [defaultCase](#m-defaultCase)

**Methods**:

- [getCaseParent()](#m-getcaseparent-85381d0de39b)
- [getCases()](#m-getcases-42abc2944fb1)
- [getDefaultCase()](#m-getdefaultcase-fa7745cee0b4)
- [getMinOccurs()](#m-getminoccurs-cac79959dff8)
- [getNS()](#m-getns-3613c99d8888)
- [getNSHash()](#m-getnshash-2129fb8b3cfe)
- [getParentNode()](#m-getparentnode-452921385cc4)
- [getSiblings()](#m-getsiblings-f467dd8b6a33)
- [getTag()](#m-gettag-315f45956d6f)
- [getTagHash()](#m-gettaghash-8f057919039c)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-cschoice-68f5778b1ef7"></a>
### CSChoice()

```java
protected CSChoice()
```

Constructor for CSChoice class

<a id="m-cschoice-c5a1557367a2"></a>
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

<a id="m-case0"></a>
### case0

```java
protected com.tailf.maapi.MaapiSchemas.CSCase case0 = null;
```

Types: [CSCase](CSCase.md#cls-CSCase)

<a id="m-defaultCase"></a>
### defaultCase

```java
protected com.tailf.maapi.MaapiSchemas.CSCase defaultCase = null;
```

Types: [CSCase](CSCase.md#cls-CSCase)


## Methods

<a id="m-getcaseparent-85381d0de39b"></a>
### getCaseParent()

```java
public com.tailf.maapi.MaapiSchemas.CSCase getCaseParent()
```

Types: [CSCase](CSCase.md#cls-CSCase)

If this choice is defined as a case for another choice this method
 returns the case, otherwise null is returned.

**Returns:** CsCase the case parent for this case if any

<a id="m-getcases-42abc2944fb1"></a>
### getCases()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSCase> getCases()
```

Types: [CSCase](CSCase.md#cls-CSCase)

get List of cases for this choice. Cases are represented by CSCase
 objects and the list is a list of CSCase objects accordingly

**Returns:** List of cases

<a id="m-getdefaultcase-fa7745cee0b4"></a>
### getDefaultCase()

```java
public com.tailf.maapi.MaapiSchemas.CSCase getDefaultCase()
```

Types: [CSCase](CSCase.md#cls-CSCase)

get default case for the choice. The case is represented by a CSCase
 object

**Returns:** CSCase default case or null if not defined

<a id="m-getminoccurs-cac79959dff8"></a>
### getMinOccurs()

```java
public int getMinOccurs()
```

get MinOccurs for the choice

**Returns:** int minOccurs

<a id="m-getns-3613c99d8888"></a>
### getNS()

```java
public String getNS()
```

get namespace represented as string

**Returns:** String namespace

<a id="m-getnshash-2129fb8b3cfe"></a>
### getNSHash()

```java
public int getNSHash()
```

get namespace represented as hash value

**Returns:** int hashvalue for the namespace

<a id="m-getparentnode-452921385cc4"></a>
### getParentNode()

```java
public com.tailf.maapi.MaapiSchemas.CSNode getParentNode()
```

Types: [CSNode](CSNode.md#cls-CSNode)

get parent node for the choice.

**Returns:** CSNode parent node

<a id="m-getsiblings-f467dd8b6a33"></a>
### getSiblings()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getSiblings()
```

Types: [CSChoice](CSChoice.md#cls-CSChoice)

get List of sibling choices with the same parent node. The List is a
 list of CSChoices and includes the current choice.

**Returns:** List of sibling choices

<a id="m-gettag-315f45956d6f"></a>
### getTag()

```java
public String getTag()
```

get choice tag represented as string

**Returns:** string tag

<a id="m-gettaghash-8f057919039c"></a>
### getTagHash()

```java
public int getTagHash()
```

get choice tag represented as hash value

**Returns:** int hashvalue for the tag

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Informative string representation of a CSChoice instance

**Returns:** String
