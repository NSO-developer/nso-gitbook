# CSCase <a href="#cls-CSCase" id="cls-CSCase"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSCase
```

Class representing a Case for a Choice

**Related classes**

- [MmapCSCase](../../ncs/maapi/MmapCSCase.md#cls-MmapCSCase)

## Members

**Constructors**:

- [CSCase()](#m-CSCase-038070fbf9a6)
- [CSCase(int, String, CSSchema, CSChoice, CSCase)](#m-CSCase-2d5825fc873f)

**Fields**:

- [firstChoice](#m-firstChoice)

**Methods**:

- [getChoices()](#m-getChoices-818fb3fccb86)
- [getNodes()](#m-getNodes-0d0e9b3adfd1)
- [getNS()](#m-getNS-3613c99d8888)
- [getNSHash()](#m-getNSHash-2129fb8b3cfe)
- [getParentChoice()](#m-getParentChoice-4434d9347d10)
- [getSiblings()](#m-getSiblings-f467dd8b6a33)
- [getTag()](#m-getTag-315f45956d6f)
- [getTagHash()](#m-getTagHash-8f057919039c)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### CSCase() <a href="#m-CSCase-038070fbf9a6" id="m-CSCase-038070fbf9a6"></a>

```java
protected CSCase()
```

Constructor for CSCase class

### CSCase(int, String, CSSchema, CSChoice, CSCase) <a href="#m-CSCase-2d5825fc873f" id="m-CSCase-2d5825fc873f"></a>

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

### firstChoice <a href="#m-firstChoice" id="m-firstChoice"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSChoice firstChoice = null;
```

Types: [CSChoice](CSChoice.md#cls-CSChoice)


## Methods

### getChoices() <a href="#m-getChoices-818fb3fccb86" id="m-getChoices-818fb3fccb86"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getChoices()
```

Types: [CSChoice](CSChoice.md#cls-CSChoice)

get List of choices defined in this Case. The list is a list of
 CSChoice objects.

**Returns:** List of nodes

### getNodes() <a href="#m-getNodes-0d0e9b3adfd1" id="m-getNodes-0d0e9b3adfd1"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getNodes()
```

Types: [CSNode](CSNode.md#cls-CSNode)

get List of the nodes defined in this Case. The list is a list of
 CSNode objects.

**Returns:** List of nodes

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

### getParentChoice() <a href="#m-getParentChoice-4434d9347d10" id="m-getParentChoice-4434d9347d10"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSChoice getParentChoice()
```

Types: [CSChoice](CSChoice.md#cls-CSChoice)

get the parent choice defining this case.

**Returns:** CSChoice parent choice

### getSiblings() <a href="#m-getSiblings-f467dd8b6a33" id="m-getSiblings-f467dd8b6a33"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSCase> getSiblings()
```

Types: [CSCase](CSCase.md#cls-CSCase)

get List of sibling cases for this case. The List is a list of CSCase
 objects and current case is included.

**Returns:** List of sibling cases

### getTag() <a href="#m-getTag-315f45956d6f" id="m-getTag-315f45956d6f"></a>

```java
public String getTag()
```

get case tag represented as string

**Returns:** string tag

### getTagHash() <a href="#m-getTagHash-8f057919039c" id="m-getTagHash-8f057919039c"></a>

```java
public int getTagHash()
```

get case tag represented as hash value

**Returns:** int hashvalue for the tag

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Informative string representation of a CSCase instance

**Returns:** String
