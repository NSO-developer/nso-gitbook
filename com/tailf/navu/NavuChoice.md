<a id="cls-NavuChoice"></a>
# NavuChoice

```java
public class com.tailf.navu.NavuChoice
```

This class handles YANG presentation and setting of YANG choices.

## Members

**Constructors**:

- [NavuChoice(NavuContext, CSChoice, String, Object[])](#m-navuchoice-f2ceb003f1e5)

**Fields**:

- [cases](#m-cases)

**Methods**:

- [containsCase(CSCase)](#m-containscase-d63d3edc467b)
- [containsChoice(CSChoice)](#m-containschoice-417c76bf331d)
- [containsNode(CSNode)](#m-containsnode-28ef18f0cd45)
- [getCase(CSChoice)](#m-getcase-714ec678c34c)
- [getCase(CSNode)](#m-getcase-013bf2ed6869)
- [getCaseChoices(String)](#m-getcasechoices-8969ac2420ed)
- [getCaseNodes(String)](#m-getcasenodes-00683ec03a66)
- [getCSCases()](#m-getcscases-9dfaff709202)
- [getName()](#m-getname-2634b18b4a25)
- [getPreviousCase()](#m-getpreviouscase-6c933875f8e7)
- [getSelectedCase()](#m-getselectedcase-97c467f33244)
- [isCurrentCase(CSCase)](#m-iscurrentcase-b34e8a895013)
- [isEmpty()](#m-isempty-4dde48126244)
- [isOper()](#m-isoper-578628dfb332)
- [isWritable()](#m-iswritable-f813255e9b26)
- [isWritableAll()](#m-iswritableall-8587e2efc611)
- [prefixify(int, int, String)](#m-prefixify-1a9e83400b1c)
- [prefixify(int, int, String, boolean)](#m-prefixify-4d8da8937245)
- [put(CSNode, CSCase)](#m-put-cb5804b15414)
- [putAll(Map<? extends CSNode,? extends CSCase>)](#m-putall-35e2d6a16b17)
- [size()](#m-size-c6d8505255fd)
- [update()](#m-update-401fc06ab5bd)
- [values()](#m-values-406dfe3ca270)

## Constructors

<a id="m-navuchoice-f2ceb003f1e5"></a>
### NavuChoice(NavuContext, CSChoice, String, Object[])

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

<a id="m-cases"></a>
### cases

```java
protected java.util.List<com.tailf.maapi.MaapiSchemas.CSCase> cases = null;
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase)


## Methods

<a id="m-containscase-d63d3edc467b"></a>
### containsCase(CSCase)

```java
public boolean containsCase(com.tailf.maapi.MaapiSchemas.CSCase cAse)
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase)

Checks if a given case node is a case of this choice.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSCase cAse` - the case to check.

**Returns:** true if the case is contained.

<a id="m-containschoice-417c76bf331d"></a>
### containsChoice(CSChoice)

```java
public boolean containsChoice(com.tailf.maapi.MaapiSchemas.CSChoice choice)
```

Types: [CSChoice](../maapi/MaapiSchemas/CSChoice.md#cls-CSChoice)

Checks if a choice is contained in a case of this choice.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSChoice choice` - - the schema choice to check for.

**Returns:** true if is contained.

<a id="m-containsnode-28ef18f0cd45"></a>
### containsNode(CSNode)

```java
public boolean containsNode(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

Checks if a node is contained directly within this choice.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node` - - the schema node to check for.

**Returns:** true if is contained.

<a id="m-getcase-714ec678c34c"></a>
### getCase(CSChoice)

```java
public com.tailf.maapi.MaapiSchemas.CSCase getCase(com.tailf.maapi.MaapiSchemas.CSChoice choice)
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase), [CSChoice](../maapi/MaapiSchemas/CSChoice.md#cls-CSChoice)

Returns the case in which a choice is contained within.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSChoice choice` - the choice to get the case for.

**Returns:** a case matching the given node.

<a id="m-getcase-013bf2ed6869"></a>
### getCase(CSNode)

```java
public com.tailf.maapi.MaapiSchemas.CSCase getCase(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

Returns the case in which a node is contained within.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node` - the node to get the case for.

**Returns:** a case matching the given node.

<a id="m-getcasechoices-8969ac2420ed"></a>
### getCaseChoices(String)

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getCaseChoices(String casename)
```

Types: [CSChoice](../maapi/MaapiSchemas/CSChoice.md#cls-CSChoice)

**Parameters**

- `String casename`

**Returns:** a set of CSNode for a give case name

<a id="m-getcasenodes-00683ec03a66"></a>
### getCaseNodes(String)

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getCaseNodes(String casename)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `String casename`

**Returns:** a set of CSNode for a give case name

<a id="m-getcscases-9dfaff709202"></a>
### getCSCases()

```java
protected java.util.List<com.tailf.maapi.MaapiSchemas.CSCase> getCSCases()
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase)

<a id="m-getname-2634b18b4a25"></a>
### getName()

```java
public String getName()
```

Returns the choice name according to the YANG model.

**Returns:** the name of the choice.

<a id="m-getpreviouscase-6c933875f8e7"></a>
### getPreviousCase()

```java
public com.tailf.maapi.MaapiSchemas.CSCase getPreviousCase()
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase)

Returns the previous case of the choice.

**Returns:** the previous case. null if the case has not been changed.

<a id="m-getselectedcase-97c467f33244"></a>
### getSelectedCase()

```java
public com.tailf.maapi.MaapiSchemas.CSCase getSelectedCase()
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase)

Returns the current case.

**Returns:** the current case. null if no case has been selected yet.

<a id="m-iscurrentcase-b34e8a895013"></a>
### isCurrentCase(CSCase)

```java
public boolean isCurrentCase(com.tailf.maapi.MaapiSchemas.CSCase cAse)
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase)

Checks if a given case is the currently selected case.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSCase cAse` - the case to check against.

**Returns:** true if it is a match.

<a id="m-isempty-4dde48126244"></a>
### isEmpty()

```java
public boolean isEmpty()
```

Checks if it is an empty choice. I.e. if no case nodes exist.

**Returns:** true, if no nodes are contained in the choice.

<a id="m-isoper-578628dfb332"></a>
### isOper()

```java
public boolean isOper()
```

<a id="m-iswritable-f813255e9b26"></a>
### isWritable()

```java
public boolean isWritable()
```

Checks if the node is writable.

**Returns:** true if the node is writable.

<a id="m-iswritableall-8587e2efc611"></a>
### isWritableAll()

```java
public boolean isWritableAll()
```

Checks if the node is writable for all data.

**Returns:** true if the node is writable for all data.

<a id="m-prefixify-1a9e83400b1c"></a>
### prefixify(int, int, String)

```java
protected static String prefixify(int nsOther, int nsThis, String name)
```

**Parameters**

- `int nsOther`
- `int nsThis`
- `String name`

<a id="m-prefixify-4d8da8937245"></a>
### prefixify(int, int, String, boolean)

```java
protected static String prefixify(int nsOther, int nsThis, String name, boolean skipIfColon)
```

**Parameters**

- `int nsOther`
- `int nsThis`
- `String name`
- `boolean skipIfColon`

<a id="m-put-cb5804b15414"></a>
### put(CSNode, CSCase)

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

<a id="m-putall-35e2d6a16b17"></a>
### putAll(Map<? extends CSNode,? extends CSCase>)

```java
public void putAll(
    java.util.Map<? extends com.tailf.maapi.MaapiSchemas.CSNode,? extends com.tailf.maapi.MaapiSchemas.CSCase> m
)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase)

Adds a node-case map to the choice.

**Parameters**

- `java.util.Map<? extends com.tailf.maapi.MaapiSchemas.CSNode,? extends com.tailf.maapi.MaapiSchemas.CSCase> m` - a node-case map.

<a id="m-size-c6d8505255fd"></a>
### size()

```java
public int size()
```

The number of cases contained in the choice.

**Returns:** number of cases contained within the choice.

<a id="m-update-401fc06ab5bd"></a>
### update()

```java
public boolean update()
```

**Returns:** true if the case was updated.

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public java.util.Collection<com.tailf.maapi.MaapiSchemas.CSCase> values()
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase)

Return a list of cases contained within this choice.

**Returns:** a list of cases.
