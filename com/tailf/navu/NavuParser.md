<a id="cls-NavuParser"></a>
# NavuParser

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
 [`NavuNode#getValues(String)`](NavuNode.md#m-getvalues-c03de090764d), [`NavuNode#setValues(String)`](NavuNode.md#m-setvalues-3ec9581ce266) and
 [`PreparedXMLStatement`](PreparedXMLStatement.md#cls-PreparedXMLStatement) will give necessary support for xml snippets.

## Members

**Constructors**:

- [NavuParser(String, CSNode, ConfPath, int)](#m-navuparser-240b9fa48b57)

**Fields**:

- [MODE_GET](#m-MODE_GET)
- [MODE_SET](#m-MODE_SET)
- [MODE_SET_ACTION_PARAM](#m-MODE_SET_ACTION_PARAM)
- [MODE_SET_ACTION_RESULT](#m-MODE_SET_ACTION_RESULT)
- [MODE_SET_PREPARE](#m-MODE_SET_PREPARE)

**Methods**:

- [getParamIndexes()](#m-getparamindexes-649d70a85bbf)
- [parse()](#m-parse-29d7b3df4ae2)

## Constructors

<a id="m-navuparser-240b9fa48b57"></a>
### NavuParser(String, CSNode, ConfPath, int)

```java
public NavuParser(
    String xml,
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfPath path,
    int mode
)
    throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [NavuException](NavuException.md#cls-NavuException)

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


- *`#MODE_GET`*

 Parsing the xml as preparation for a
  [`NavuNode#getValues(ConfXMLParam[])`](NavuNode.md#m-getvalues-1eb02439a757) request.
- *`#MODE_SET`*

 Parsing the xml as preparation for a
  [`NavuNode#setValues(ConfXMLParam[])`](NavuNode.md#m-setvalues-50d8edffa795) request.
- *`#MODE_SET_PREPARE`*

 Parsing the xml as preparation for a
  [`NavuNode#setValues(ConfXMLParam[])`](NavuNode.md#m-setvalues-50d8edffa795) request.
  In this mode the xml snippet is expected to contain "?" as leaf values
  to be superposed before using the output.
  This superposing is handled by the [`PreparedXMLStatement`](PreparedXMLStatement.md#cls-PreparedXMLStatement) class
  which should be used in this case
- *`#MODE_SET_ACTION_PARAM`*

 Parsing the xml as preparation for a
  [`NavuNode#setValues(ConfXMLParam[])`](NavuNode.md#m-setvalues-50d8edffa795) request.
  In this mode the xml is an action's or rpc's parameters
- *`#MODE_SET_ACTION_RESULT`*

 Parsing the xml as preparation for a
  [`NavuNode#setValues(ConfXMLParam[])`](NavuNode.md#m-setvalues-50d8edffa795) request.
  In this mode the xml is an action's or rpc's result

**Parameters**

- `String xml` - the xml snippet
- `com.tailf.maapi.MaapiSchemas.CSNode node` - the root node start parsing from
- `com.tailf.conf.ConfPath path`
- `int mode` - one of `#MODE_GET`, `#MODE_SET`,
                    `#MODE_SET_PREPARE`,
                    `#MODE_SET_ACTION_PARAM` or
                    `#MODE_SET_ACTION_RESULT`

**Throws**

- `NavuException`


## Fields

<a id="m-MODE_GET"></a>
### MODE_GET

```java
public static final int MODE_GET = 1;
```

parse xml as preparation for a getValues call

<a id="m-MODE_SET"></a>
### MODE_SET

```java
public static final int MODE_SET = 2;
```

parse xml as preparation for a setValues call

<a id="m-MODE_SET_ACTION_PARAM"></a>
### MODE_SET_ACTION_PARAM

```java
public static final int MODE_SET_ACTION_PARAM = 4;
```

parse xml as preparation for a setValues() call
 for action's or rpc's parameters

<a id="m-MODE_SET_ACTION_RESULT"></a>
### MODE_SET_ACTION_RESULT

```java
public static final int MODE_SET_ACTION_RESULT = 5;
```

parse xml as preparation for a setValues() call
 for action's or rpc's result

<a id="m-MODE_SET_PREPARE"></a>
### MODE_SET_PREPARE

```java
public static final int MODE_SET_PREPARE = 3;
```

parse xml with "?" arguments as preparation for a setValues call


## Methods

<a id="m-getparamindexes-649d70a85bbf"></a>
### getParamIndexes()

```java
public java.util.Map<Integer,Object[]> getParamIndexes()
```

Helper array for parser mode `#MODE_SET_PREPARE` needed to
 superpose "?" arguments.

<a id="m-parse-29d7b3df4ae2"></a>
### parse()

```java
public com.tailf.conf.ConfXMLParam[] parse() throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

Parses the xml and produces ConfXMLParam[]

**Returns:** ConfXMLParam[] array corresponding to the xml snippet.

**Throws**

- `NavuException`
