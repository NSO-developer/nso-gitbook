<a id="s-NavuChoice"></a>
# NavuChoice

```java
public class com.tailf.navu.NavuChoice
```

This class handles YANG presentation and setting of YANG choices.

## Members

**Constructors**:

- [NavuChoice(NavuContext, CSChoice, String, Object[])](#s-NavuChoice-1)

**Fields**:

- [cases](#s-cases)

**Methods**:

- [containsCase(CSCase)](#s-containsCase)
- [containsChoice(CSChoice)](#s-containsChoice)
- [containsNode(CSNode)](#s-containsNode)
- [getCase(CSChoice)](#s-getCase)
- [getCase(CSNode)](#s-getCase-1)
- [getCaseChoices(String)](#s-getCaseChoices)
- [getCaseNodes(String)](#s-getCaseNodes)
- [getCSCases()](#s-getCSCases)
- [getName()](#s-getName)
- [getPreviousCase()](#s-getPreviousCase)
- [getSelectedCase()](#s-getSelectedCase)
- [isCurrentCase(CSCase)](#s-isCurrentCase)
- [isEmpty()](#s-isEmpty)
- [isOper()](#s-isOper)
- [isWritable()](#s-isWritable)
- [isWritableAll()](#s-isWritableAll)
- [prefixify(int, int, String)](#s-prefixify)
- [prefixify(int, int, String, boolean)](#s-prefixify-1)
- [put(CSNode, CSCase)](#s-put)
- [putAll(Map<? extends CSNode,? extends CSCase>)](#s-putAll)
- [size()](#s-size)
- [update()](#s-update)
- [values()](#s-values)

## Constructors

<a id="s-NavuChoice-1"></a>
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

Types: [NavuContext](NavuContext.md#s-NavuContext), [CSChoice](../maapi/MaapiSchemas/CSChoice.md#s-CSChoice), [ConfException](../conf/ConfException.md#s-ConfException)

Creates a Navu presentation of a schema choice node.

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSChoice choice` - a schema choice node to derive the data from.
- `String fmt`
- `Object[] arguments`


## Fields

<a id="s-cases"></a>
### cases

```java
protected java.util.List<com.tailf.maapi.MaapiSchemas.CSCase> cases = null;
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#s-CSCase)


## Methods

<a id="s-containsCase"></a>
### containsCase(CSCase)

```java
public boolean containsCase(com.tailf.maapi.MaapiSchemas.CSCase cAse)
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#s-CSCase)

Checks if a given case node is a case of this choice.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSCase cAse` - the case to check.

**Returns:** true if the case is contained.

<a id="s-containsChoice"></a>
### containsChoice(CSChoice)

```java
public boolean containsChoice(com.tailf.maapi.MaapiSchemas.CSChoice choice)
```

Types: [CSChoice](../maapi/MaapiSchemas/CSChoice.md#s-CSChoice)

Checks if a choice is contained in a case of this choice.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSChoice choice` - - the schema choice to check for.

**Returns:** true if is contained.

<a id="s-containsNode"></a>
### containsNode(CSNode)

```java
public boolean containsNode(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

Checks if a node is contained directly within this choice.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node` - - the schema node to check for.

**Returns:** true if is contained.

<a id="s-getCase"></a>
### getCase(CSChoice)

```java
public com.tailf.maapi.MaapiSchemas.CSCase getCase(com.tailf.maapi.MaapiSchemas.CSChoice choice)
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#s-CSCase), [CSChoice](../maapi/MaapiSchemas/CSChoice.md#s-CSChoice)

Returns the case in which a choice is contained within.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSChoice choice` - the choice to get the case for.

**Returns:** a case matching the given node.

<a id="s-getCase-1"></a>
### getCase(CSNode)

```java
public com.tailf.maapi.MaapiSchemas.CSCase getCase(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#s-CSCase), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

Returns the case in which a node is contained within.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node` - the node to get the case for.

**Returns:** a case matching the given node.

<a id="s-getCaseChoices"></a>
### getCaseChoices(String)

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getCaseChoices(String casename)
```

Types: [CSChoice](../maapi/MaapiSchemas/CSChoice.md#s-CSChoice)

**Parameters**

- `String casename`

**Returns:** a set of CSNode for a give case name

<a id="s-getCaseNodes"></a>
### getCaseNodes(String)

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getCaseNodes(String casename)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `String casename`

**Returns:** a set of CSNode for a give case name

<a id="s-getCSCases"></a>
### getCSCases()

```java
protected java.util.List<com.tailf.maapi.MaapiSchemas.CSCase> getCSCases()
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#s-CSCase)

<a id="s-getName"></a>
### getName()

```java
public String getName()
```

Returns the choice name according to the YANG model.

**Returns:** the name of the choice.

<a id="s-getPreviousCase"></a>
### getPreviousCase()

```java
public com.tailf.maapi.MaapiSchemas.CSCase getPreviousCase()
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#s-CSCase)

Returns the previous case of the choice.

**Returns:** the previous case. null if the case has not been changed.

<a id="s-getSelectedCase"></a>
### getSelectedCase()

```java
public com.tailf.maapi.MaapiSchemas.CSCase getSelectedCase()
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#s-CSCase)

Returns the current case.

**Returns:** the current case. null if no case has been selected yet.

<a id="s-isCurrentCase"></a>
### isCurrentCase(CSCase)

```java
public boolean isCurrentCase(com.tailf.maapi.MaapiSchemas.CSCase cAse)
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#s-CSCase)

Checks if a given case is the currently selected case.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSCase cAse` - the case to check against.

**Returns:** true if it is a match.

<a id="s-isEmpty"></a>
### isEmpty()

```java
public boolean isEmpty()
```

Checks if it is an empty choice. I.e. if no case nodes exist.

**Returns:** true, if no nodes are contained in the choice.

<a id="s-isOper"></a>
### isOper()

```java
public boolean isOper()
```

<a id="s-isWritable"></a>
### isWritable()

```java
public boolean isWritable()
```

Checks if the node is writable.

**Returns:** true if the node is writable.

<a id="s-isWritableAll"></a>
### isWritableAll()

```java
public boolean isWritableAll()
```

Checks if the node is writable for all data.

**Returns:** true if the node is writable for all data.

<a id="s-prefixify"></a>
### prefixify(int, int, String)

```java
protected static String prefixify(int nsOther, int nsThis, String name)
```

**Parameters**

- `int nsOther`
- `int nsThis`
- `String name`

<a id="s-prefixify-1"></a>
### prefixify(int, int, String, boolean)

```java
protected static String prefixify(int nsOther, int nsThis, String name, boolean skipIfColon)
```

**Parameters**

- `int nsOther`
- `int nsThis`
- `String name`
- `boolean skipIfColon`

<a id="s-put"></a>
### put(CSNode, CSCase)

```java
public com.tailf.maapi.MaapiSchemas.CSCase put(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.maapi.MaapiSchemas.CSCase cAse
)
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#s-CSCase), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

Adds node-case relation to the choice.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.maapi.MaapiSchemas.CSCase cAse`

**Returns:** the inserted case.

<a id="s-putAll"></a>
### putAll(Map<? extends CSNode,? extends CSCase>)

```java
public void putAll(
    java.util.Map<? extends com.tailf.maapi.MaapiSchemas.CSNode,? extends com.tailf.maapi.MaapiSchemas.CSCase> m
)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [CSCase](../maapi/MaapiSchemas/CSCase.md#s-CSCase)

Adds a node-case map to the choice.

**Parameters**

- `java.util.Map<? extends com.tailf.maapi.MaapiSchemas.CSNode,? extends com.tailf.maapi.MaapiSchemas.CSCase> m` - a node-case map.

<a id="s-size"></a>
### size()

```java
public int size()
```

The number of cases contained in the choice.

**Returns:** number of cases contained within the choice.

<a id="s-update"></a>
### update()

```java
public boolean update()
```

**Returns:** true if the case was updated.

<a id="s-values"></a>
### values()

```java
public java.util.Collection<com.tailf.maapi.MaapiSchemas.CSCase> values()
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#s-CSCase)

Return a list of cases contained within this choice.

**Returns:** a list of cases.
