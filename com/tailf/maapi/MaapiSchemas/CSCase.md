# CSCase <a href="#cscase-26937f56b18d" id="cscase-26937f56b18d"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSCase
```

Class representing a Case for a Choice

**Related classes**

- [MmapCSCase](../../ncs/maapi/MmapCSCase.md#mmapcscase-32ecb25f579a)

## Members

**Constructors**:

- [CSCase()](#cscase-038070fbf9a6)
- [CSCase(int, String, CSSchema, CSChoice, CSCase)](#cscase-2d5825fc873f)

**Fields**:

- [firstChoice](#firstchoice-22665f28e22e)

**Methods**:

- [getChoices()](#getchoices-818fb3fccb86)
- [getNodes()](#getnodes-0d0e9b3adfd1)
- [getNS()](#getns-3613c99d8888)
- [getNSHash()](#getnshash-2129fb8b3cfe)
- [getParentChoice()](#getparentchoice-4434d9347d10)
- [getSiblings()](#getsiblings-f467dd8b6a33)
- [getTag()](#gettag-315f45956d6f)
- [getTagHash()](#gettaghash-8f057919039c)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### CSCase() <a href="#cscase-038070fbf9a6" id="cscase-038070fbf9a6"></a>

```java
protected CSCase()
```

Constructor for CSCase class

### CSCase(int, String, CSSchema, CSChoice, CSCase) <a href="#cscase-2d5825fc873f" id="cscase-2d5825fc873f"></a>

```java
protected CSCase(
    int taghash,
    String tag,
    com.tailf.maapi.MaapiSchemas.CSSchema schema,
    com.tailf.maapi.MaapiSchemas.CSChoice parentChoice,
    com.tailf.maapi.MaapiSchemas.CSCase nextSibling
)
```

Types: [CSSchema](CSSchema.md#csschema-f51a58180f67), [CSChoice](CSChoice.md#cschoice-7d5d5dd71270), [CSCase](CSCase.md#cscase-26937f56b18d)

**Parameters**

- `int taghash`
- `String tag`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `com.tailf.maapi.MaapiSchemas.CSChoice parentChoice`
- `com.tailf.maapi.MaapiSchemas.CSCase nextSibling`


## Fields

### firstChoice <a href="#firstchoice-22665f28e22e" id="firstchoice-22665f28e22e"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSChoice firstChoice = null;
```

Types: [CSChoice](CSChoice.md#cschoice-7d5d5dd71270)


## Methods

### getChoices() <a href="#getchoices-818fb3fccb86" id="getchoices-818fb3fccb86"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getChoices()
```

Types: [CSChoice](CSChoice.md#cschoice-7d5d5dd71270)

get List of choices defined in this Case. The list is a list of
 CSChoice objects.

**Returns:** List of nodes

### getNodes() <a href="#getnodes-0d0e9b3adfd1" id="getnodes-0d0e9b3adfd1"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getNodes()
```

Types: [CSNode](CSNode.md#csnode-f12d9ad69c28)

get List of the nodes defined in this Case. The list is a list of
 CSNode objects.

**Returns:** List of nodes

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

### getParentChoice() <a href="#getparentchoice-4434d9347d10" id="getparentchoice-4434d9347d10"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSChoice getParentChoice()
```

Types: [CSChoice](CSChoice.md#cschoice-7d5d5dd71270)

get the parent choice defining this case.

**Returns:** CSChoice parent choice

### getSiblings() <a href="#getsiblings-f467dd8b6a33" id="getsiblings-f467dd8b6a33"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSCase> getSiblings()
```

Types: [CSCase](CSCase.md#cscase-26937f56b18d)

get List of sibling cases for this case. The List is a list of CSCase
 objects and current case is included.

**Returns:** List of sibling cases

### getTag() <a href="#gettag-315f45956d6f" id="gettag-315f45956d6f"></a>

```java
public String getTag()
```

get case tag represented as string

**Returns:** string tag

### getTagHash() <a href="#gettaghash-8f057919039c" id="gettaghash-8f057919039c"></a>

```java
public int getTagHash()
```

get case tag represented as hash value

**Returns:** int hashvalue for the tag

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Informative string representation of a CSCase instance

**Returns:** String
