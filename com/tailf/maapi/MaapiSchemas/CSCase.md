<a id="s-CSCase"></a>
# CSCase

```java
public static class com.tailf.maapi.MaapiSchemas.CSCase
```

Class representing a Case for a Choice

**Related classes**

- [MmapCSCase](../../ncs/maapi/MmapCSCase.md#s-MmapCSCase)

## Members

**Constructors**:

- [CSCase()](#s-CSCase-1)
- [CSCase(int, String, CSSchema, CSChoice, CSCase)](#s-CSCase-2)

**Fields**:

- [firstChoice](#s-firstChoice)

**Methods**:

- [getChoices()](#s-getChoices)
- [getNodes()](#s-getNodes)
- [getNS()](#s-getNS)
- [getNSHash()](#s-getNSHash)
- [getParentChoice()](#s-getParentChoice)
- [getSiblings()](#s-getSiblings)
- [getTag()](#s-getTag)
- [getTagHash()](#s-getTagHash)
- [toString()](#s-toString)

## Constructors

<a id="s-CSCase-1"></a>
### CSCase()

```java
protected CSCase()
```

Constructor for CSCase class

<a id="s-CSCase-2"></a>
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

Types: [CSSchema](CSSchema.md#s-CSSchema), [CSChoice](CSChoice.md#s-CSChoice), [CSCase](CSCase.md#s-CSCase)

**Parameters**

- `int taghash`
- `String tag`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `com.tailf.maapi.MaapiSchemas.CSChoice parentChoice`
- `com.tailf.maapi.MaapiSchemas.CSCase nextSibling`


## Fields

<a id="s-firstChoice"></a>
### firstChoice

```java
protected com.tailf.maapi.MaapiSchemas.CSChoice firstChoice = null;
```

Types: [CSChoice](CSChoice.md#s-CSChoice)


## Methods

<a id="s-getChoices"></a>
### getChoices()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getChoices()
```

Types: [CSChoice](CSChoice.md#s-CSChoice)

get List of choices defined in this Case. The list is a list of
 CSChoice objects.

**Returns:** List of nodes

<a id="s-getNodes"></a>
### getNodes()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getNodes()
```

Types: [CSNode](CSNode.md#s-CSNode)

get List of the nodes defined in this Case. The list is a list of
 CSNode objects.

**Returns:** List of nodes

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

<a id="s-getParentChoice"></a>
### getParentChoice()

```java
public com.tailf.maapi.MaapiSchemas.CSChoice getParentChoice()
```

Types: [CSChoice](CSChoice.md#s-CSChoice)

get the parent choice defining this case.

**Returns:** CSChoice parent choice

<a id="s-getSiblings"></a>
### getSiblings()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSCase> getSiblings()
```

Types: [CSCase](CSCase.md#s-CSCase)

get List of sibling cases for this case. The List is a list of CSCase
 objects and current case is included.

**Returns:** List of sibling cases

<a id="s-getTag"></a>
### getTag()

```java
public String getTag()
```

get case tag represented as string

**Returns:** string tag

<a id="s-getTagHash"></a>
### getTagHash()

```java
public int getTagHash()
```

get case tag represented as hash value

**Returns:** int hashvalue for the tag

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Informative string representation of a CSCase instance

**Returns:** String
