# NavuParser <a href="#cls-NavuParser" id="cls-NavuParser"></a>

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
 [`NavuNode#getValues(String)`](NavuNode.md#m-getValues-c03de090764d), [`NavuNode#setValues(String)`](NavuNode.md#m-setValues-3ec9581ce266) and
 [`PreparedXMLStatement`](PreparedXMLStatement.md#cls-PreparedXMLStatement) will give necessary support for xml snippets.

## Members

**Constructors**:

- [NavuParser(String, CSNode, ConfPath, int)](#m-NavuParser-240b9fa48b57)

**Fields**:

- [MODE_GET](#m-MODE_GET)
- [MODE_SET](#m-MODE_SET)
- [MODE_SET_ACTION_PARAM](#m-MODE_SET_ACTION_PARAM)
- [MODE_SET_ACTION_RESULT](#m-MODE_SET_ACTION_RESULT)
- [MODE_SET_PREPARE](#m-MODE_SET_PREPARE)

**Methods**:

- [getParamIndexes()](#m-getParamIndexes-649d70a85bbf)
- [parse()](#m-parse-29d7b3df4ae2)

## Constructors

### NavuParser(String, CSNode, ConfPath, int) <a href="#m-NavuParser-240b9fa48b57" id="m-NavuParser-240b9fa48b57"></a>

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


- *[`MODE_GET`](NavuParser.md#m-MODE_GET)*

 Parsing the xml as preparation for a
  [`NavuNode#getValues(ConfXMLParam[])`](NavuNode.md#m-getValues-1eb02439a757) request.
- *[`MODE_SET`](NavuParser.md#m-MODE_SET)*

 Parsing the xml as preparation for a
  [`NavuNode#setValues(ConfXMLParam[])`](NavuNode.md#m-setValues-50d8edffa795) request.
- *[`MODE_SET_PREPARE`](NavuParser.md#m-MODE_SET_PREPARE)*

 Parsing the xml as preparation for a
  [`NavuNode#setValues(ConfXMLParam[])`](NavuNode.md#m-setValues-50d8edffa795) request.
  In this mode the xml snippet is expected to contain "?" as leaf values
  to be superposed before using the output.
  This superposing is handled by the [`PreparedXMLStatement`](PreparedXMLStatement.md#cls-PreparedXMLStatement) class
  which should be used in this case
- *[`MODE_SET_ACTION_PARAM`](NavuParser.md#m-MODE_SET_ACTION_PARAM)*

 Parsing the xml as preparation for a
  [`NavuNode#setValues(ConfXMLParam[])`](NavuNode.md#m-setValues-50d8edffa795) request.
  In this mode the xml is an action's or rpc's parameters
- *[`MODE_SET_ACTION_RESULT`](NavuParser.md#m-MODE_SET_ACTION_RESULT)*

 Parsing the xml as preparation for a
  [`NavuNode#setValues(ConfXMLParam[])`](NavuNode.md#m-setValues-50d8edffa795) request.
  In this mode the xml is an action's or rpc's result

**Parameters**

- `String xml` - the xml snippet
- `com.tailf.maapi.MaapiSchemas.CSNode node` - the root node start parsing from
- `com.tailf.conf.ConfPath path`
- `int mode` - one of [`MODE_GET`](NavuParser.md#m-MODE_GET), [`MODE_SET`](NavuParser.md#m-MODE_SET),
                    [`MODE_SET_PREPARE`](NavuParser.md#m-MODE_SET_PREPARE),
                    [`MODE_SET_ACTION_PARAM`](NavuParser.md#m-MODE_SET_ACTION_PARAM) or
                    [`MODE_SET_ACTION_RESULT`](NavuParser.md#m-MODE_SET_ACTION_RESULT)

**Throws**

- `NavuException`


## Fields

### MODE_GET <a href="#m-MODE_GET" id="m-MODE_GET"></a>

```java
public static final int MODE_GET = 1;
```

parse xml as preparation for a getValues call

### MODE_SET <a href="#m-MODE_SET" id="m-MODE_SET"></a>

```java
public static final int MODE_SET = 2;
```

parse xml as preparation for a setValues call

### MODE_SET_ACTION_PARAM <a href="#m-MODE_SET_ACTION_PARAM" id="m-MODE_SET_ACTION_PARAM"></a>

```java
public static final int MODE_SET_ACTION_PARAM = 4;
```

parse xml as preparation for a setValues() call
 for action's or rpc's parameters

### MODE_SET_ACTION_RESULT <a href="#m-MODE_SET_ACTION_RESULT" id="m-MODE_SET_ACTION_RESULT"></a>

```java
public static final int MODE_SET_ACTION_RESULT = 5;
```

parse xml as preparation for a setValues() call
 for action's or rpc's result

### MODE_SET_PREPARE <a href="#m-MODE_SET_PREPARE" id="m-MODE_SET_PREPARE"></a>

```java
public static final int MODE_SET_PREPARE = 3;
```

parse xml with "?" arguments as preparation for a setValues call


## Methods

### getParamIndexes() <a href="#m-getParamIndexes-649d70a85bbf" id="m-getParamIndexes-649d70a85bbf"></a>

```java
public java.util.Map<Integer,Object[]> getParamIndexes()
```

Helper array for parser mode [`MODE_SET_PREPARE`](NavuParser.md#m-MODE_SET_PREPARE) needed to
 superpose "?" arguments.

### parse() <a href="#m-parse-29d7b3df4ae2" id="m-parse-29d7b3df4ae2"></a>

```java
public com.tailf.conf.ConfXMLParam[] parse() throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

Parses the xml and produces ConfXMLParam[]

**Returns:** ConfXMLParam[] array corresponding to the xml snippet.

**Throws**

- `NavuException`
