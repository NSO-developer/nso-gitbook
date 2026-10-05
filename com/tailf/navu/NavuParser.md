# NavuParser <a href="#navuparser-248c0ebe248d" id="navuparser-248c0ebe248d"></a>

```java
public class com.tailf.navu.NavuParser
```

XML parser capable of producing a ConfXMLParam[] from an xml snippet.

 The XML input can be provided in two forms:


- A complete fragment rooted at the start node, e.g.
     `<server xmlns="..."><name>s1</name></server>`
   - A fragment of the children only, e.g.
     `<name>s1</name>`
 In both cases, the start node identifies the root schema node.
 The parser normalizes the input internally so that both forms
 produce the same result.

 Normally this class should not be used directly, instead
 [`NavuNode#getValues(String)`](NavuNode.md#getvalues-c03de090764d), [`NavuNode#setValues(String)`](NavuNode.md#setvalues-3ec9581ce266) and
 [`PreparedXMLStatement`](PreparedXMLStatement.md#preparedxmlstatement-abf8aaf04b3a) will give necessary support for xml snippets.

## Members

**Constructors**:

- [NavuParser(String, CSNode, ConfPath, int)](#navuparser-240b9fa48b57)

**Fields**:

- [MODE_GET](#mode_get-f993d996e8d3)
- [MODE_SET](#mode_set-a3c0f3ec95f7)
- [MODE_SET_ACTION_PARAM](#mode_set_action_param-2b8bfb16378e)
- [MODE_SET_ACTION_RESULT](#mode_set_action_result-51a0a8eb8d0a)
- [MODE_SET_PREPARE](#mode_set_prepare-91e45bef1d55)

**Methods**:

- [getParamIndexes()](#getparamindexes-649d70a85bbf)
- [parse()](#parse-29d7b3df4ae2)

## Constructors

### NavuParser(String, CSNode, ConfPath, int) <a href="#navuparser-240b9fa48b57" id="navuparser-240b9fa48b57"></a>

```java
public NavuParser(
    String xml,
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfPath path,
    int mode
)
    throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Constructor for the XML parser.

 The xml snippet may optionally include a root tag corresponding
 to the start CSNode. If present, it is treated as a wrapper and
 stripped. If absent, the snippet is assumed to contain the
 children of the start node directly.

 Exception: if the start node has a child with the same name
 (e.g. `container parent { container parent {...} }`), the
 element is only stripped as a wrapper when its XML children belong
 to the start node's schema. Otherwise it is kept as content for
 the same-name child.

 The parser works in one of five modes:


- *[`MODE_GET`](NavuParser.md#mode_get-f993d996e8d3)*

 Parsing the xml as preparation for a
  [`NavuNode#getValues(ConfXMLParam[])`](NavuNode.md#getvalues-1eb02439a757) request.
- *[`MODE_SET`](NavuParser.md#mode_set-a3c0f3ec95f7)*

 Parsing the xml as preparation for a
  [`NavuNode#setValues(ConfXMLParam[])`](NavuNode.md#setvalues-50d8edffa795) request.
- *[`MODE_SET_PREPARE`](NavuParser.md#mode_set_prepare-91e45bef1d55)*

 Parsing the xml as preparation for a
  [`NavuNode#setValues(ConfXMLParam[])`](NavuNode.md#setvalues-50d8edffa795) request.
  In this mode the xml snippet is expected to contain "?" as leaf values
  to be superposed before using the output.
  This superposing is handled by the [`PreparedXMLStatement`](PreparedXMLStatement.md#preparedxmlstatement-abf8aaf04b3a) class
  which should be used in this case
- *[`MODE_SET_ACTION_PARAM`](NavuParser.md#mode_set_action_param-2b8bfb16378e)*

 Parsing the xml as preparation for a
  [`NavuNode#setValues(ConfXMLParam[])`](NavuNode.md#setvalues-50d8edffa795) request.
  In this mode the xml is an action's or rpc's parameters
- *[`MODE_SET_ACTION_RESULT`](NavuParser.md#mode_set_action_result-51a0a8eb8d0a)*

 Parsing the xml as preparation for a
  [`NavuNode#setValues(ConfXMLParam[])`](NavuNode.md#setvalues-50d8edffa795) request.
  In this mode the xml is an action's or rpc's result

**Parameters**

- `String xml` - the xml snippet
- `com.tailf.maapi.MaapiSchemas.CSNode node` - the root node start parsing from
- `com.tailf.conf.ConfPath path`
- `int mode` - one of [`MODE_GET`](NavuParser.md#mode_get-f993d996e8d3), [`MODE_SET`](NavuParser.md#mode_set-a3c0f3ec95f7),
                    [`MODE_SET_PREPARE`](NavuParser.md#mode_set_prepare-91e45bef1d55),
                    [`MODE_SET_ACTION_PARAM`](NavuParser.md#mode_set_action_param-2b8bfb16378e) or
                    [`MODE_SET_ACTION_RESULT`](NavuParser.md#mode_set_action_result-51a0a8eb8d0a)

**Throws**

- `NavuException`


## Fields

### MODE_GET <a href="#mode_get-f993d996e8d3" id="mode_get-f993d996e8d3"></a>

```java
public static final int MODE_GET = 1;
```

parse xml as preparation for a getValues call

### MODE_SET <a href="#mode_set-a3c0f3ec95f7" id="mode_set-a3c0f3ec95f7"></a>

```java
public static final int MODE_SET = 2;
```

parse xml as preparation for a setValues call

### MODE_SET_ACTION_PARAM <a href="#mode_set_action_param-2b8bfb16378e" id="mode_set_action_param-2b8bfb16378e"></a>

```java
public static final int MODE_SET_ACTION_PARAM = 4;
```

parse xml as preparation for a setValues() call
 for action's or rpc's parameters

### MODE_SET_ACTION_RESULT <a href="#mode_set_action_result-51a0a8eb8d0a" id="mode_set_action_result-51a0a8eb8d0a"></a>

```java
public static final int MODE_SET_ACTION_RESULT = 5;
```

parse xml as preparation for a setValues() call
 for action's or rpc's result

### MODE_SET_PREPARE <a href="#mode_set_prepare-91e45bef1d55" id="mode_set_prepare-91e45bef1d55"></a>

```java
public static final int MODE_SET_PREPARE = 3;
```

parse xml with "?" arguments as preparation for a setValues call


## Methods

### getParamIndexes() <a href="#getparamindexes-649d70a85bbf" id="getparamindexes-649d70a85bbf"></a>

```java
public java.util.Map<Integer,Object[]> getParamIndexes()
```

Helper array for parser mode [`MODE_SET_PREPARE`](NavuParser.md#mode_set_prepare-91e45bef1d55) needed to
 superpose "?" arguments.

### parse() <a href="#parse-29d7b3df4ae2" id="parse-29d7b3df4ae2"></a>

```java
public com.tailf.conf.ConfXMLParam[] parse() throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Parses the xml and produces ConfXMLParam[]

**Returns:** ConfXMLParam[] array corresponding to the xml snippet.

**Throws**

- `NavuException`
