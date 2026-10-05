<a id="cls-CSCase"></a>
# CSCase

```java
public static class com.tailf.maapi.MaapiSchemas.CSCase
```

Class representing a Case for a Choice

**Related classes**

- [MmapCSCase](../../ncs/maapi/MmapCSCase.md#cls-MmapCSCase)

## Members

**Constructors**:

- [CSCase()](#m-cscase-038070fbf9a6)
- [CSCase(int, String, CSSchema, CSChoice, CSCase)](#m-cscase-2d5825fc873f)

**Fields**:

- [firstChoice](#m-firstChoice)

**Methods**:

- [getChoices()](#m-getchoices-818fb3fccb86)
- [getNodes()](#m-getnodes-0d0e9b3adfd1)
- [getNS()](#m-getns-3613c99d8888)
- [getNSHash()](#m-getnshash-2129fb8b3cfe)
- [getParentChoice()](#m-getparentchoice-4434d9347d10)
- [getSiblings()](#m-getsiblings-f467dd8b6a33)
- [getTag()](#m-gettag-315f45956d6f)
- [getTagHash()](#m-gettaghash-8f057919039c)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-cscase-038070fbf9a6"></a>
### CSCase()

```java
protected CSCase()
```

Constructor for CSCase class

<a id="m-cscase-2d5825fc873f"></a>
### CSCase(int, String, CSSchema, CSChoice, CSCase)

```java
protected CSCase(
    int taghash,
    String tag,
    com.tailf.maapi.MaapiSchemas.CSSchema schema,
    com.tailf.maapi.MaapiSchemas.CSChoice parentChoice,
    com.tailf.maapi.MaapiSchemas.CSCase nextSibling
)
```

Types: [CSSchema](CSSchema.md#cls-CSSchema), [CSChoice](CSChoice.md#cls-CSChoice), [CSCase](CSCase.md#cls-CSCase)

**Parameters**

- `int taghash`
- `String tag`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `com.tailf.maapi.MaapiSchemas.CSChoice parentChoice`
- `com.tailf.maapi.MaapiSchemas.CSCase nextSibling`


## Fields

<a id="m-firstChoice"></a>
### firstChoice

```java
protected com.tailf.maapi.MaapiSchemas.CSChoice firstChoice = null;
```

Types: [CSChoice](CSChoice.md#cls-CSChoice)


## Methods

<a id="m-getchoices-818fb3fccb86"></a>
### getChoices()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getChoices()
```

Types: [CSChoice](CSChoice.md#cls-CSChoice)

get List of choices defined in this Case. The list is a list of
 CSChoice objects.

**Returns:** List of nodes

<a id="m-getnodes-0d0e9b3adfd1"></a>
### getNodes()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getNodes()
```

Types: [CSNode](CSNode.md#cls-CSNode)

get List of the nodes defined in this Case. The list is a list of
 CSNode objects.

**Returns:** List of nodes

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

<a id="m-getparentchoice-4434d9347d10"></a>
### getParentChoice()

```java
public com.tailf.maapi.MaapiSchemas.CSChoice getParentChoice()
```

Types: [CSChoice](CSChoice.md#cls-CSChoice)

get the parent choice defining this case.

**Returns:** CSChoice parent choice

<a id="m-getsiblings-f467dd8b6a33"></a>
### getSiblings()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSCase> getSiblings()
```

Types: [CSCase](CSCase.md#cls-CSCase)

get List of sibling cases for this case. The List is a list of CSCase
 objects and current case is included.

**Returns:** List of sibling cases

<a id="m-gettag-315f45956d6f"></a>
### getTag()

```java
public String getTag()
```

get case tag represented as string

**Returns:** string tag

<a id="m-gettaghash-8f057919039c"></a>
### getTagHash()

```java
public int getTagHash()
```

get case tag represented as hash value

**Returns:** int hashvalue for the tag

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Informative string representation of a CSCase instance

**Returns:** String
