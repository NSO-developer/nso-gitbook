# NavuChoice <a href="#cls-NavuChoice" id="cls-NavuChoice"></a>

```java
public class com.tailf.navu.NavuChoice
```

This class handles YANG presentation and setting of YANG choices.

## Members

**Constructors**:

- [NavuChoice(NavuContext, CSChoice, String, Object[])](#m-NavuChoice-f2ceb003f1e5)

**Fields**:

- [cases](#m-cases)

**Methods**:

- [containsCase(CSCase)](#m-containsCase-d63d3edc467b)
- [containsChoice(CSChoice)](#m-containsChoice-417c76bf331d)
- [containsNode(CSNode)](#m-containsNode-28ef18f0cd45)
- [getCase(CSChoice)](#m-getCase-714ec678c34c)
- [getCase(CSNode)](#m-getCase-013bf2ed6869)
- [getCaseChoices(String)](#m-getCaseChoices-8969ac2420ed)
- [getCaseNodes(String)](#m-getCaseNodes-00683ec03a66)
- [getCSCases()](#m-getCSCases-9dfaff709202)
- [getName()](#m-getName-2634b18b4a25)
- [getPreviousCase()](#m-getPreviousCase-6c933875f8e7)
- [getSelectedCase()](#m-getSelectedCase-97c467f33244)
- [isCurrentCase(CSCase)](#m-isCurrentCase-b34e8a895013)
- [isEmpty()](#m-isEmpty-4dde48126244)
- [isOper()](#m-isOper-578628dfb332)
- [isWritable()](#m-isWritable-f813255e9b26)
- [isWritableAll()](#m-isWritableAll-8587e2efc611)
- [prefixify(int, int, String)](#m-prefixify-1a9e83400b1c)
- [prefixify(int, int, String, boolean)](#m-prefixify-4d8da8937245)
- [put(CSNode, CSCase)](#m-put-cb5804b15414)
- [putAll(Map<? extends CSNode,? extends CSCase>)](#m-putAll-35e2d6a16b17)
- [size()](#m-size-c6d8505255fd)
- [update()](#m-update-401fc06ab5bd)
- [values()](#m-values-406dfe3ca270)

## Constructors

### NavuChoice(NavuContext, CSChoice, String, Object[]) <a href="#m-NavuChoice-f2ceb003f1e5" id="m-NavuChoice-f2ceb003f1e5"></a>

```java
protected NavuChoice(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas.CSChoice choice,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [NavuContext](NavuContext.md#cls-NavuContext), [CSChoice](../maapi/MaapiSchemas/CSChoice.md#cls-CSChoice), [ConfException](../conf/ConfException.md#cls-ConfException)

Creates a Navu presentation of a schema choice node.

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSChoice choice` - a schema choice node to derive the data from.
- `String fmt`
- `Object[] arguments`


## Fields

### cases <a href="#m-cases" id="m-cases"></a>

```java
protected java.util.List<com.tailf.maapi.MaapiSchemas.CSCase> cases = null;
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase)


## Methods

### containsCase(CSCase) <a href="#m-containsCase-d63d3edc467b" id="m-containsCase-d63d3edc467b"></a>

```java
public boolean containsCase(com.tailf.maapi.MaapiSchemas.CSCase cAse)
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase)

Checks if a given case node is a case of this choice.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSCase cAse` - the case to check.

**Returns:** true if the case is contained.

### containsChoice(CSChoice) <a href="#m-containsChoice-417c76bf331d" id="m-containsChoice-417c76bf331d"></a>

```java
public boolean containsChoice(com.tailf.maapi.MaapiSchemas.CSChoice choice)
```

Types: [CSChoice](../maapi/MaapiSchemas/CSChoice.md#cls-CSChoice)

Checks if a choice is contained in a case of this choice.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSChoice choice` - - the schema choice to check for.

**Returns:** true if is contained.

### containsNode(CSNode) <a href="#m-containsNode-28ef18f0cd45" id="m-containsNode-28ef18f0cd45"></a>

```java
public boolean containsNode(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

Checks if a node is contained directly within this choice.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node` - - the schema node to check for.

**Returns:** true if is contained.

### getCase(CSChoice) <a href="#m-getCase-714ec678c34c" id="m-getCase-714ec678c34c"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSCase getCase(com.tailf.maapi.MaapiSchemas.CSChoice choice)
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase), [CSChoice](../maapi/MaapiSchemas/CSChoice.md#cls-CSChoice)

Returns the case in which a choice is contained within.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSChoice choice` - the choice to get the case for.

**Returns:** a case matching the given node.

### getCase(CSNode) <a href="#m-getCase-013bf2ed6869" id="m-getCase-013bf2ed6869"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSCase getCase(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

Returns the case in which a node is contained within.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node` - the node to get the case for.

**Returns:** a case matching the given node.

### getCaseChoices(String) <a href="#m-getCaseChoices-8969ac2420ed" id="m-getCaseChoices-8969ac2420ed"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getCaseChoices(String casename)
```

Types: [CSChoice](../maapi/MaapiSchemas/CSChoice.md#cls-CSChoice)

**Parameters**

- `String casename`

**Returns:** a set of CSNode for a give case name

### getCaseNodes(String) <a href="#m-getCaseNodes-00683ec03a66" id="m-getCaseNodes-00683ec03a66"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getCaseNodes(String casename)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `String casename`

**Returns:** a set of CSNode for a give case name

### getCSCases() <a href="#m-getCSCases-9dfaff709202" id="m-getCSCases-9dfaff709202"></a>

```java
protected java.util.List<com.tailf.maapi.MaapiSchemas.CSCase> getCSCases()
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase)

### getName() <a href="#m-getName-2634b18b4a25" id="m-getName-2634b18b4a25"></a>

```java
public String getName()
```

Returns the choice name according to the YANG model.

**Returns:** the name of the choice.

### getPreviousCase() <a href="#m-getPreviousCase-6c933875f8e7" id="m-getPreviousCase-6c933875f8e7"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSCase getPreviousCase()
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase)

Returns the previous case of the choice.

**Returns:** the previous case. null if the case has not been changed.

### getSelectedCase() <a href="#m-getSelectedCase-97c467f33244" id="m-getSelectedCase-97c467f33244"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSCase getSelectedCase()
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase)

Returns the current case.

**Returns:** the current case. null if no case has been selected yet.

### isCurrentCase(CSCase) <a href="#m-isCurrentCase-b34e8a895013" id="m-isCurrentCase-b34e8a895013"></a>

```java
public boolean isCurrentCase(com.tailf.maapi.MaapiSchemas.CSCase cAse)
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase)

Checks if a given case is the currently selected case.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSCase cAse` - the case to check against.

**Returns:** true if it is a match.

### isEmpty() <a href="#m-isEmpty-4dde48126244" id="m-isEmpty-4dde48126244"></a>

```java
public boolean isEmpty()
```

Checks if it is an empty choice. I.e. if no case nodes exist.

**Returns:** true, if no nodes are contained in the choice.

### isOper() <a href="#m-isOper-578628dfb332" id="m-isOper-578628dfb332"></a>

```java
public boolean isOper()
```

### isWritable() <a href="#m-isWritable-f813255e9b26" id="m-isWritable-f813255e9b26"></a>

```java
public boolean isWritable()
```

Checks if the node is writable.

**Returns:** true if the node is writable.

### isWritableAll() <a href="#m-isWritableAll-8587e2efc611" id="m-isWritableAll-8587e2efc611"></a>

```java
public boolean isWritableAll()
```

Checks if the node is writable for all data.

**Returns:** true if the node is writable for all data.

### prefixify(int, int, String) <a href="#m-prefixify-1a9e83400b1c" id="m-prefixify-1a9e83400b1c"></a>

```java
protected static String prefixify(int nsOther, int nsThis, String name)
```

**Parameters**

- `int nsOther`
- `int nsThis`
- `String name`

### prefixify(int, int, String, boolean) <a href="#m-prefixify-4d8da8937245" id="m-prefixify-4d8da8937245"></a>

```java
protected static String prefixify(int nsOther, int nsThis, String name, boolean skipIfColon)
```

**Parameters**

- `int nsOther`
- `int nsThis`
- `String name`
- `boolean skipIfColon`

### put(CSNode, CSCase) <a href="#m-put-cb5804b15414" id="m-put-cb5804b15414"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSCase put(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.maapi.MaapiSchemas.CSCase cAse
)
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

Adds node-case relation to the choice.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.maapi.MaapiSchemas.CSCase cAse`

**Returns:** the inserted case.

### putAll(Map<? extends CSNode,? extends CSCase>) <a href="#m-putAll-35e2d6a16b17" id="m-putAll-35e2d6a16b17"></a>

```java
public void putAll(
    java.util.Map<? extends com.tailf.maapi.MaapiSchemas.CSNode,? extends com.tailf.maapi.MaapiSchemas.CSCase> m
)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase)

Adds a node-case map to the choice.

**Parameters**

- `java.util.Map<? extends com.tailf.maapi.MaapiSchemas.CSNode,? extends com.tailf.maapi.MaapiSchemas.CSCase> m` - a node-case map.

### size() <a href="#m-size-c6d8505255fd" id="m-size-c6d8505255fd"></a>

```java
public int size()
```

The number of cases contained in the choice.

**Returns:** number of cases contained within the choice.

### update() <a href="#m-update-401fc06ab5bd" id="m-update-401fc06ab5bd"></a>

```java
public boolean update()
```

**Returns:** true if the case was updated.

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public java.util.Collection<com.tailf.maapi.MaapiSchemas.CSCase> values()
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase)

Return a list of cases contained within this choice.

**Returns:** a list of cases.
