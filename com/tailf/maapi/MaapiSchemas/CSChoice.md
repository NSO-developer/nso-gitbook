# CSChoice <a href="#cschoice-7d5d5dd71270" id="cschoice-7d5d5dd71270"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSChoice
```

Class representing a Schema Choice

**Related classes**

- [MmapCSChoice](../../ncs/maapi/MmapCSChoice.md#mmapcschoice-47e12534067f)

## Members

**Constructors**:

- [CSChoice()](#cschoice-68f5778b1ef7)
- [CSChoice(int, String, CSSchema, int, CSNode, CSCase, CSChoice)](#cschoice-c5a1557367a2)

**Fields**:

- [case0](#case0-29ac777b3b38)
- [defaultCase](#defaultcase-5d8142d107fb)

**Methods**:

- [getCaseParent()](#getcaseparent-85381d0de39b)
- [getCases()](#getcases-42abc2944fb1)
- [getDefaultCase()](#getdefaultcase-fa7745cee0b4)
- [getMinOccurs()](#getminoccurs-cac79959dff8)
- [getNS()](#getns-3613c99d8888)
- [getNSHash()](#getnshash-2129fb8b3cfe)
- [getParentNode()](#getparentnode-452921385cc4)
- [getSiblings()](#getsiblings-f467dd8b6a33)
- [getTag()](#gettag-315f45956d6f)
- [getTagHash()](#gettaghash-8f057919039c)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### CSChoice() <a href="#cschoice-68f5778b1ef7" id="cschoice-68f5778b1ef7"></a>

```java
protected CSChoice()
```

Constructor for CSChoice class

### CSChoice(int, String, CSSchema, int, CSNode, CSCase, CSChoice) <a href="#cschoice-c5a1557367a2" id="cschoice-c5a1557367a2"></a>

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

Types: [CSSchema](CSSchema.md#csschema-f51a58180f67), [CSNode](CSNode.md#csnode-f12d9ad69c28), [CSCase](CSCase.md#cscase-26937f56b18d), [CSChoice](CSChoice.md#cschoice-7d5d5dd71270)

**Parameters**

- `int taghash`
- `String tag`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `int minOccurs`
- `com.tailf.maapi.MaapiSchemas.CSNode parentNode`
- `com.tailf.maapi.MaapiSchemas.CSCase caseParent`
- `com.tailf.maapi.MaapiSchemas.CSChoice nextSibling`


## Fields

### case0 <a href="#case0-29ac777b3b38" id="case0-29ac777b3b38"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSCase case0 = null;
```

Types: [CSCase](CSCase.md#cscase-26937f56b18d)

### defaultCase <a href="#defaultcase-5d8142d107fb" id="defaultcase-5d8142d107fb"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSCase defaultCase = null;
```

Types: [CSCase](CSCase.md#cscase-26937f56b18d)


## Methods

### getCaseParent() <a href="#getcaseparent-85381d0de39b" id="getcaseparent-85381d0de39b"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSCase getCaseParent()
```

Types: [CSCase](CSCase.md#cscase-26937f56b18d)

If this choice is defined as a case for another choice this method
 returns the case, otherwise null is returned.

**Returns:** CsCase the case parent for this case if any

### getCases() <a href="#getcases-42abc2944fb1" id="getcases-42abc2944fb1"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSCase> getCases()
```

Types: [CSCase](CSCase.md#cscase-26937f56b18d)

get List of cases for this choice. Cases are represented by CSCase
 objects and the list is a list of CSCase objects accordingly

**Returns:** List of cases

### getDefaultCase() <a href="#getdefaultcase-fa7745cee0b4" id="getdefaultcase-fa7745cee0b4"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSCase getDefaultCase()
```

Types: [CSCase](CSCase.md#cscase-26937f56b18d)

get default case for the choice. The case is represented by a CSCase
 object

**Returns:** CSCase default case or null if not defined

### getMinOccurs() <a href="#getminoccurs-cac79959dff8" id="getminoccurs-cac79959dff8"></a>

```java
public int getMinOccurs()
```

get MinOccurs for the choice

**Returns:** int minOccurs

### getNS() <a href="#getns-3613c99d8888" id="getns-3613c99d8888"></a>

```java
public String getNS()
```

get namespace represented as string

**Returns:** String namespace

### getNSHash() <a href="#getnshash-2129fb8b3cfe" id="getnshash-2129fb8b3cfe"></a>

```java
public int getNSHash()
```

get namespace represented as hash value

**Returns:** int hashvalue for the namespace

### getParentNode() <a href="#getparentnode-452921385cc4" id="getparentnode-452921385cc4"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getParentNode()
```

Types: [CSNode](CSNode.md#csnode-f12d9ad69c28)

get parent node for the choice.

**Returns:** CSNode parent node

### getSiblings() <a href="#getsiblings-f467dd8b6a33" id="getsiblings-f467dd8b6a33"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getSiblings()
```

Types: [CSChoice](CSChoice.md#cschoice-7d5d5dd71270)

get List of sibling choices with the same parent node. The List is a
 list of CSChoices and includes the current choice.

**Returns:** List of sibling choices

### getTag() <a href="#gettag-315f45956d6f" id="gettag-315f45956d6f"></a>

```java
public String getTag()
```

get choice tag represented as string

**Returns:** string tag

### getTagHash() <a href="#gettaghash-8f057919039c" id="gettaghash-8f057919039c"></a>

```java
public int getTagHash()
```

get choice tag represented as hash value

**Returns:** int hashvalue for the tag

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Informative string representation of a CSChoice instance

**Returns:** String
