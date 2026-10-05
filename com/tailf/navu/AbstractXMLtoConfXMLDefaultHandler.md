<a id="s-AbstractXMLtoConfXMLDefaultHandler"></a>
# AbstractXMLtoConfXMLDefaultHandler

**Package-private**

```java
abstract class com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler
    extends org.xml.sax.helpers.DefaultHandler
```

**Related classes**

- [NavuXMLtoConfXMLParamGetHandler](NavuXMLtoConfXMLParamGetHandler.md#s-NavuXMLtoConfXMLParamGetHandler)
- [NavuXMLtoConfXMLParamSetHandler](NavuXMLtoConfXMLParamSetHandler.md#s-NavuXMLtoConfXMLParamSetHandler)

## Members

**Constructors**:

- [AbstractXMLtoConfXMLDefaultHandler(CSNode, ConfPath)](#s-AbstractXMLtoConfXMLDefaultHandler-1)

**Fields**:

- [accInfo](#s-accInfo)
- [depth](#s-depth)
- [info](#s-info)
- [leafListNodes](#s-leafListNodes)
- [locator](#s-locator)
- [mnsMap](#s-mnsMap)
- [nsPrefixMap](#s-nsPrefixMap)
- [nsStack](#s-nsStack)
- [params](#s-params)
- [path](#s-path)
- [pathNodes](#s-pathNodes)
- [pathStack](#s-pathStack)
- [schemas](#s-schemas)
- [stack](#s-stack)
- [startNode](#s-startNode)

**Methods**:

- [accumulateChars(CSNode, String)](#s-accumulateChars)
- [addAccumulateChars()](#s-addAccumulateChars)
- [addEndElement(CSNode)](#s-addEndElement)
- [addLeafElement(CSNode)](#s-addLeafElement)
- [addLeafList()](#s-addLeafList)
- [addStartElement(CSNode)](#s-addStartElement)
- [addValueElement(CSNode, ConfValue)](#s-addValueElement)
- [characters(char[], int, int)](#s-characters)
- [empty()](#s-empty)
- [endDocument()](#s-endDocument)
- [endElement(String, String, String)](#s-endElement)
- [endPrefixMapping(String)](#s-endPrefixMapping)
- [error(SAXParseException)](#s-error)
- [fatalError(SAXParseException)](#s-fatalError)
- [getCSNode2XMLNs(CSNode)](#s-getCSNode2XMLNs)
- [ignorableWhitespace(char[], int, int)](#s-ignorableWhitespace)
- [isContainmentElement(CSNode)](#s-isContainmentElement)
- [isEmptyCharacter(String)](#s-isEmptyCharacter)
- [isEqual(QName, CSNode)](#s-isEqual)
- [peek()](#s-peek)
- [pop()](#s-pop)
- [processingInstruction(String, String)](#s-processingInstruction)
- [push(CSNode)](#s-push)
- [setDocumentLocator(Locator)](#s-setDocumentLocator)
- [startDocument()](#s-startDocument)
- [startElement(String, String, String, Attributes)](#s-startElement)
- [startPrefixMapping(String, String)](#s-startPrefixMapping)
- [value(CSNode, String)](#s-value)
- [valueAdd(CSNode, String)](#s-valueAdd)
- [warning(SAXParseException)](#s-warning)

**Nested Types**:

- [QName](AbstractXMLtoConfXMLDefaultHandler/QName.md#s-QName)

## Constructors

<a id="s-AbstractXMLtoConfXMLDefaultHandler-1"></a>
### AbstractXMLtoConfXMLDefaultHandler(CSNode, ConfPath)

```java
protected AbstractXMLtoConfXMLDefaultHandler(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [ConfPath](../conf/ConfPath.md#s-ConfPath), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.conf.ConfPath path`


## Fields

<a id="s-accInfo"></a>
### accInfo

```java
protected com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler.AccumulateInfo accInfo = null;
```

<a id="s-depth"></a>
### depth

```java
protected int depth = null;
```

<a id="s-info"></a>
### info

```java
protected com.tailf.navu.NavuNodeInfo info = null;
```

Types: [NavuNodeInfo](NavuNodeInfo.md#s-NavuNodeInfo)

<a id="s-leafListNodes"></a>
### leafListNodes

```java
protected java.util.Map<com.tailf.maapi.MaapiSchemas.CSNode,java.util.List<com.tailf.conf.ConfValue>> leafListNodes = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [ConfValue](../conf/ConfValue.md#s-ConfValue)

<a id="s-locator"></a>
### locator

```java
protected org.xml.sax.Locator locator = null;
```

<a id="s-mnsMap"></a>
### mnsMap

```java
protected com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap = null;
```

Types: [CSMNsMap](../maapi/MaapiSchemas/CSMNsMap.md#s-CSMNsMap)

<a id="s-nsPrefixMap"></a>
### nsPrefixMap

```java
protected java.util.Map<String,java.util.Stack<com.tailf.conf.ConfNamespace>> nsPrefixMap = null;
```

Types: [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace)

<a id="s-nsStack"></a>
### nsStack

```java
protected java.util.Stack<com.tailf.conf.ConfNamespace> nsStack = null;
```

Types: [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace)

<a id="s-params"></a>
### params

```java
protected java.util.List<com.tailf.conf.ConfXMLParam> params = null;
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam)

<a id="s-path"></a>
### path

```java
protected com.tailf.conf.ConfPath path = null;
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath)

<a id="s-pathNodes"></a>
### pathNodes

```java
protected java.util.LinkedList<com.tailf.maapi.MaapiSchemas.CSNode> pathNodes = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

<a id="s-pathStack"></a>
### pathStack

```java
protected java.util.Stack<com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler.PathState> pathStack = null;
```

<a id="s-schemas"></a>
### schemas

```java
protected com.tailf.maapi.MaapiSchemas schemas = null;
```

Types: [MaapiSchemas](../maapi/MaapiSchemas.md#s-MaapiSchemas)

<a id="s-stack"></a>
### stack

```java
protected java.util.Stack<com.tailf.maapi.MaapiSchemas.CSNode> stack = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

<a id="s-startNode"></a>
### startNode

```java
protected com.tailf.maapi.MaapiSchemas.CSNode startNode = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)


## Methods

<a id="s-accumulateChars"></a>
### accumulateChars(CSNode, String)

```java
protected void accumulateChars(com.tailf.maapi.MaapiSchemas.CSNode node, String value)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `String value`

<a id="s-addAccumulateChars"></a>
### addAccumulateChars()

```java
protected void addAccumulateChars() throws org.xml.sax.SAXException
```

<a id="s-addEndElement"></a>
### addEndElement(CSNode)

```java
protected void addEndElement(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="s-addLeafElement"></a>
### addLeafElement(CSNode)

```java
protected void addLeafElement(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="s-addLeafList"></a>
### addLeafList()

```java
protected void addLeafList()
```

<a id="s-addStartElement"></a>
### addStartElement(CSNode)

```java
protected void addStartElement(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="s-addValueElement"></a>
### addValueElement(CSNode, ConfValue)

```java
protected void addValueElement(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfValue value
)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [ConfValue](../conf/ConfValue.md#s-ConfValue)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.conf.ConfValue value`

<a id="s-characters"></a>
### characters(char[], int, int)

```java
public void characters(char[] pCh, int pStart, int pLength) throws org.xml.sax.SAXException
```

**Parameters**

- `char[] pCh`
- `int pStart`
- `int pLength`

<a id="s-empty"></a>
### empty()

```java
protected boolean empty()
```

<a id="s-endDocument"></a>
### endDocument()

```java
public void endDocument() throws org.xml.sax.SAXException
```

<a id="s-endElement"></a>
### endElement(String, String, String)

```java
public abstract void endElement(
    String uri,
    String localName,
    String qName
)
    throws org.xml.sax.SAXException
```

**Parameters**

- `String uri`
- `String localName`
- `String qName`

<a id="s-endPrefixMapping"></a>
### endPrefixMapping(String)

```java
public void endPrefixMapping(String prefix) throws org.xml.sax.SAXException
```

**Parameters**

- `String prefix`

<a id="s-error"></a>
### error(SAXParseException)

```java
public void error(org.xml.sax.SAXParseException ex)
```

**Parameters**

- `org.xml.sax.SAXParseException ex`

<a id="s-fatalError"></a>
### fatalError(SAXParseException)

```java
public void fatalError(org.xml.sax.SAXParseException ex) throws org.xml.sax.SAXException
```

**Parameters**

- `org.xml.sax.SAXParseException ex`

<a id="s-getCSNode2XMLNs"></a>
### getCSNode2XMLNs(CSNode)

```java
protected String getCSNode2XMLNs(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="s-ignorableWhitespace"></a>
### ignorableWhitespace(char[], int, int)

```java
public void ignorableWhitespace(char[] ch, int start, int length) throws org.xml.sax.SAXException
```

**Parameters**

- `char[] ch`
- `int start`
- `int length`

<a id="s-isContainmentElement"></a>
### isContainmentElement(CSNode)

**Package-private**

```java
boolean isContainmentElement(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="s-isEmptyCharacter"></a>
### isEmptyCharacter(String)

```java
protected boolean isEmptyCharacter(String character)
```

**Parameters**

- `String character`

<a id="s-isEqual"></a>
### isEqual(QName, CSNode)

```java
protected boolean isEqual(
    com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler.QName tag,
    com.tailf.maapi.MaapiSchemas.CSNode node
)
```

Types: [QName](AbstractXMLtoConfXMLDefaultHandler/QName.md#s-QName), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler.QName tag`
- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="s-peek"></a>
### peek()

```java
protected com.tailf.maapi.MaapiSchemas.CSNode peek()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

<a id="s-pop"></a>
### pop()

```java
protected com.tailf.maapi.MaapiSchemas.CSNode pop() throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [NavuException](NavuException.md#s-NavuException)

<a id="s-processingInstruction"></a>
### processingInstruction(String, String)

```java
public void processingInstruction(String target, String data)
```

**Parameters**

- `String target`
- `String data`

<a id="s-push"></a>
### push(CSNode)

```java
protected void push(com.tailf.maapi.MaapiSchemas.CSNode node) throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="s-setDocumentLocator"></a>
### setDocumentLocator(Locator)

```java
public void setDocumentLocator(org.xml.sax.Locator locator)
```

**Parameters**

- `org.xml.sax.Locator locator`

<a id="s-startDocument"></a>
### startDocument()

```java
public void startDocument() throws org.xml.sax.SAXException
```

<a id="s-startElement"></a>
### startElement(String, String, String, Attributes)

```java
public abstract void startElement(
    String uri,
    String localName,
    String qName,
    org.xml.sax.Attributes atts
)
    throws org.xml.sax.SAXException
```

**Parameters**

- `String uri`
- `String localName`
- `String qName`
- `org.xml.sax.Attributes atts`

<a id="s-startPrefixMapping"></a>
### startPrefixMapping(String, String)

```java
public void startPrefixMapping(String prefix, String xmlNsUri) throws org.xml.sax.SAXException
```

**Parameters**

- `String prefix`
- `String xmlNsUri`

<a id="s-value"></a>
### value(CSNode, String)

```java
protected com.tailf.conf.ConfValue value(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    String val
)
    throws org.xml.sax.SAXException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `String val`

<a id="s-valueAdd"></a>
### valueAdd(CSNode, String)

```java
protected void valueAdd(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    String val
)
    throws org.xml.sax.SAXException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `String val`

<a id="s-warning"></a>
### warning(SAXParseException)

```java
public void warning(org.xml.sax.SAXParseException ex)
```

**Parameters**

- `org.xml.sax.SAXParseException ex`


## Nested Types

- [QName](AbstractXMLtoConfXMLDefaultHandler/QName.md)
