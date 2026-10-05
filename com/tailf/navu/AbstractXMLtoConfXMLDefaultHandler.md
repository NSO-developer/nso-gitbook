# AbstractXMLtoConfXMLDefaultHandler <a href="#cls-AbstractXMLtoConfXMLDefaultHandler" id="cls-AbstractXMLtoConfXMLDefaultHandler"></a>

**Package-private**

```java
abstract class com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler
    extends org.xml.sax.helpers.DefaultHandler
```

**Related classes**

- [NavuXMLtoConfXMLParamGetHandler](NavuXMLtoConfXMLParamGetHandler.md#cls-NavuXMLtoConfXMLParamGetHandler)
- [NavuXMLtoConfXMLParamSetHandler](NavuXMLtoConfXMLParamSetHandler.md#cls-NavuXMLtoConfXMLParamSetHandler)

## Members

**Constructors**:

- [AbstractXMLtoConfXMLDefaultHandler(CSNode, ConfPath)](#m-AbstractXMLtoConfXMLDefaultHandler-4e273c948b0a)

**Fields**:

- [accInfo](#m-accInfo)
- [depth](#m-depth)
- [info](#m-info)
- [leafListNodes](#m-leafListNodes)
- [locator](#m-locator)
- [mnsMap](#m-mnsMap)
- [nsPrefixMap](#m-nsPrefixMap)
- [nsStack](#m-nsStack)
- [params](#m-params)
- [path](#m-path)
- [pathNodes](#m-pathNodes)
- [pathStack](#m-pathStack)
- [schemas](#m-schemas)
- [stack](#m-stack)
- [startNode](#m-startNode)

**Methods**:

- [accumulateChars(CSNode, String)](#m-accumulateChars-913e3d2e13f2)
- [addAccumulateChars()](#m-addAccumulateChars-be9ee6eba176)
- [addEndElement(CSNode)](#m-addEndElement-a46a4eac513e)
- [addLeafElement(CSNode)](#m-addLeafElement-19b72d17e396)
- [addLeafList()](#m-addLeafList-742766162951)
- [addStartElement(CSNode)](#m-addStartElement-681f3ec123d7)
- [addValueElement(CSNode, ConfValue)](#m-addValueElement-d6cd0992363c)
- [characters(char[], int, int)](#m-characters-54e61cfbbafb)
- [empty()](#m-empty-83bc141ca576)
- [endDocument()](#m-endDocument-43add802e87c)
- [endElement(String, String, String)](#m-endElement-bf7b2e1ca7dd)
- [endPrefixMapping(String)](#m-endPrefixMapping-e148849915f0)
- [error(SAXParseException)](#m-error-a853f81b7a9c)
- [fatalError(SAXParseException)](#m-fatalError-c264673a9faf)
- [getCSNode2XMLNs(CSNode)](#m-getCSNode2XMLNs-bedb63844216)
- [ignorableWhitespace(char[], int, int)](#m-ignorableWhitespace-175d27978a6d)
- [isContainmentElement(CSNode)](#m-isContainmentElement-c7d16abe6bc1)
- [isEmptyCharacter(String)](#m-isEmptyCharacter-7210ff4039cc)
- [isEqual(QName, CSNode)](#m-isEqual-3d9c7ac2a95d)
- [peek()](#m-peek-a38eaaf8a6a7)
- [pop()](#m-pop-1c15fa891a07)
- [processingInstruction(String, String)](#m-processingInstruction-e290a99e8a1d)
- [push(CSNode)](#m-push-73f33d05b8a4)
- [setDocumentLocator(Locator)](#m-setDocumentLocator-d9bd10e8b8ad)
- [startDocument()](#m-startDocument-aca8d484cffb)
- [startElement(String, String, String, Attributes)](#m-startElement-03aa11bd6db7)
- [startPrefixMapping(String, String)](#m-startPrefixMapping-e3d43dbd7ed4)
- [value(CSNode, String)](#m-value-49c56559602a)
- [valueAdd(CSNode, String)](#m-valueAdd-b812e6b46ea1)
- [warning(SAXParseException)](#m-warning-c401f291f7f5)

**Nested Types**:

- [QName](AbstractXMLtoConfXMLDefaultHandler/QName.md#cls-QName)

## Constructors

### AbstractXMLtoConfXMLDefaultHandler(CSNode, ConfPath) <a href="#m-AbstractXMLtoConfXMLDefaultHandler-4e273c948b0a" id="m-AbstractXMLtoConfXMLDefaultHandler-4e273c948b0a"></a>

```java
protected AbstractXMLtoConfXMLDefaultHandler(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.conf.ConfPath path`


## Fields

### accInfo <a href="#m-accInfo" id="m-accInfo"></a>

```java
protected com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler.AccumulateInfo accInfo = null;
```

### depth <a href="#m-depth" id="m-depth"></a>

```java
protected int depth = null;
```

### info <a href="#m-info" id="m-info"></a>

```java
protected com.tailf.navu.NavuNodeInfo info = null;
```

Types: [NavuNodeInfo](NavuNodeInfo.md#cls-NavuNodeInfo)

### leafListNodes <a href="#m-leafListNodes" id="m-leafListNodes"></a>

```java
protected java.util.Map<com.tailf.maapi.MaapiSchemas.CSNode,java.util.List<com.tailf.conf.ConfValue>> leafListNodes = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [ConfValue](../conf/ConfValue.md#cls-ConfValue)

### locator <a href="#m-locator" id="m-locator"></a>

```java
protected org.xml.sax.Locator locator = null;
```

### mnsMap <a href="#m-mnsMap" id="m-mnsMap"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap = null;
```

Types: [CSMNsMap](../maapi/MaapiSchemas/CSMNsMap.md#cls-CSMNsMap)

### nsPrefixMap <a href="#m-nsPrefixMap" id="m-nsPrefixMap"></a>

```java
protected java.util.Map<String,java.util.Stack<com.tailf.conf.ConfNamespace>> nsPrefixMap = null;
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

### nsStack <a href="#m-nsStack" id="m-nsStack"></a>

```java
protected java.util.Stack<com.tailf.conf.ConfNamespace> nsStack = null;
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

### params <a href="#m-params" id="m-params"></a>

```java
protected java.util.List<com.tailf.conf.ConfXMLParam> params = null;
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

### path <a href="#m-path" id="m-path"></a>

```java
protected com.tailf.conf.ConfPath path = null;
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

### pathNodes <a href="#m-pathNodes" id="m-pathNodes"></a>

```java
protected java.util.LinkedList<com.tailf.maapi.MaapiSchemas.CSNode> pathNodes = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

### pathStack <a href="#m-pathStack" id="m-pathStack"></a>

```java
protected java.util.Stack<com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler.PathState> pathStack = null;
```

### schemas <a href="#m-schemas" id="m-schemas"></a>

```java
protected com.tailf.maapi.MaapiSchemas schemas = null;
```

Types: [MaapiSchemas](../maapi/MaapiSchemas.md#cls-MaapiSchemas)

### stack <a href="#m-stack" id="m-stack"></a>

```java
protected java.util.Stack<com.tailf.maapi.MaapiSchemas.CSNode> stack = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

### startNode <a href="#m-startNode" id="m-startNode"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode startNode = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)


## Methods

### accumulateChars(CSNode, String) <a href="#m-accumulateChars-913e3d2e13f2" id="m-accumulateChars-913e3d2e13f2"></a>

```java
protected void accumulateChars(com.tailf.maapi.MaapiSchemas.CSNode node, String value)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `String value`

### addAccumulateChars() <a href="#m-addAccumulateChars-be9ee6eba176" id="m-addAccumulateChars-be9ee6eba176"></a>

```java
protected void addAccumulateChars() throws org.xml.sax.SAXException
```

### addEndElement(CSNode) <a href="#m-addEndElement-a46a4eac513e" id="m-addEndElement-a46a4eac513e"></a>

```java
protected void addEndElement(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### addLeafElement(CSNode) <a href="#m-addLeafElement-19b72d17e396" id="m-addLeafElement-19b72d17e396"></a>

```java
protected void addLeafElement(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### addLeafList() <a href="#m-addLeafList-742766162951" id="m-addLeafList-742766162951"></a>

```java
protected void addLeafList()
```

### addStartElement(CSNode) <a href="#m-addStartElement-681f3ec123d7" id="m-addStartElement-681f3ec123d7"></a>

```java
protected void addStartElement(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### addValueElement(CSNode, ConfValue) <a href="#m-addValueElement-d6cd0992363c" id="m-addValueElement-d6cd0992363c"></a>

```java
protected void addValueElement(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfValue value
)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [ConfValue](../conf/ConfValue.md#cls-ConfValue)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.conf.ConfValue value`

### characters(char[], int, int) <a href="#m-characters-54e61cfbbafb" id="m-characters-54e61cfbbafb"></a>

```java
public void characters(char[] pCh, int pStart, int pLength) throws org.xml.sax.SAXException
```

**Parameters**

- `char[] pCh`
- `int pStart`
- `int pLength`

### empty() <a href="#m-empty-83bc141ca576" id="m-empty-83bc141ca576"></a>

```java
protected boolean empty()
```

### endDocument() <a href="#m-endDocument-43add802e87c" id="m-endDocument-43add802e87c"></a>

```java
public void endDocument() throws org.xml.sax.SAXException
```

### endElement(String, String, String) <a href="#m-endElement-bf7b2e1ca7dd" id="m-endElement-bf7b2e1ca7dd"></a>

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

### endPrefixMapping(String) <a href="#m-endPrefixMapping-e148849915f0" id="m-endPrefixMapping-e148849915f0"></a>

```java
public void endPrefixMapping(String prefix) throws org.xml.sax.SAXException
```

**Parameters**

- `String prefix`

### error(SAXParseException) <a href="#m-error-a853f81b7a9c" id="m-error-a853f81b7a9c"></a>

```java
public void error(org.xml.sax.SAXParseException ex)
```

**Parameters**

- `org.xml.sax.SAXParseException ex`

### fatalError(SAXParseException) <a href="#m-fatalError-c264673a9faf" id="m-fatalError-c264673a9faf"></a>

```java
public void fatalError(org.xml.sax.SAXParseException ex) throws org.xml.sax.SAXException
```

**Parameters**

- `org.xml.sax.SAXParseException ex`

### getCSNode2XMLNs(CSNode) <a href="#m-getCSNode2XMLNs-bedb63844216" id="m-getCSNode2XMLNs-bedb63844216"></a>

```java
protected String getCSNode2XMLNs(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### ignorableWhitespace(char[], int, int) <a href="#m-ignorableWhitespace-175d27978a6d" id="m-ignorableWhitespace-175d27978a6d"></a>

```java
public void ignorableWhitespace(char[] ch, int start, int length) throws org.xml.sax.SAXException
```

**Parameters**

- `char[] ch`
- `int start`
- `int length`

### isContainmentElement(CSNode) <a href="#m-isContainmentElement-c7d16abe6bc1" id="m-isContainmentElement-c7d16abe6bc1"></a>

**Package-private**

```java
boolean isContainmentElement(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### isEmptyCharacter(String) <a href="#m-isEmptyCharacter-7210ff4039cc" id="m-isEmptyCharacter-7210ff4039cc"></a>

```java
protected boolean isEmptyCharacter(String character)
```

**Parameters**

- `String character`

### isEqual(QName, CSNode) <a href="#m-isEqual-3d9c7ac2a95d" id="m-isEqual-3d9c7ac2a95d"></a>

```java
protected boolean isEqual(
    com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler.QName tag,
    com.tailf.maapi.MaapiSchemas.CSNode node
)
```

Types: [QName](AbstractXMLtoConfXMLDefaultHandler/QName.md#cls-QName), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler.QName tag`
- `com.tailf.maapi.MaapiSchemas.CSNode node`

### peek() <a href="#m-peek-a38eaaf8a6a7" id="m-peek-a38eaaf8a6a7"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode peek()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

### pop() <a href="#m-pop-1c15fa891a07" id="m-pop-1c15fa891a07"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode pop() throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuException](NavuException.md#cls-NavuException)

### processingInstruction(String, String) <a href="#m-processingInstruction-e290a99e8a1d" id="m-processingInstruction-e290a99e8a1d"></a>

```java
public void processingInstruction(String target, String data)
```

**Parameters**

- `String target`
- `String data`

### push(CSNode) <a href="#m-push-73f33d05b8a4" id="m-push-73f33d05b8a4"></a>

```java
protected void push(com.tailf.maapi.MaapiSchemas.CSNode node) throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### setDocumentLocator(Locator) <a href="#m-setDocumentLocator-d9bd10e8b8ad" id="m-setDocumentLocator-d9bd10e8b8ad"></a>

```java
public void setDocumentLocator(org.xml.sax.Locator locator)
```

**Parameters**

- `org.xml.sax.Locator locator`

### startDocument() <a href="#m-startDocument-aca8d484cffb" id="m-startDocument-aca8d484cffb"></a>

```java
public void startDocument() throws org.xml.sax.SAXException
```

### startElement(String, String, String, Attributes) <a href="#m-startElement-03aa11bd6db7" id="m-startElement-03aa11bd6db7"></a>

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

### startPrefixMapping(String, String) <a href="#m-startPrefixMapping-e3d43dbd7ed4" id="m-startPrefixMapping-e3d43dbd7ed4"></a>

```java
public void startPrefixMapping(String prefix, String xmlNsUri) throws org.xml.sax.SAXException
```

**Parameters**

- `String prefix`
- `String xmlNsUri`

### value(CSNode, String) <a href="#m-value-49c56559602a" id="m-value-49c56559602a"></a>

```java
protected com.tailf.conf.ConfValue value(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    String val
)
    throws org.xml.sax.SAXException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `String val`

### valueAdd(CSNode, String) <a href="#m-valueAdd-b812e6b46ea1" id="m-valueAdd-b812e6b46ea1"></a>

```java
protected void valueAdd(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    String val
)
    throws org.xml.sax.SAXException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `String val`

### warning(SAXParseException) <a href="#m-warning-c401f291f7f5" id="m-warning-c401f291f7f5"></a>

```java
public void warning(org.xml.sax.SAXParseException ex)
```

**Parameters**

- `org.xml.sax.SAXParseException ex`


## Nested Types

- [QName](AbstractXMLtoConfXMLDefaultHandler/QName.md#cls-QName)
