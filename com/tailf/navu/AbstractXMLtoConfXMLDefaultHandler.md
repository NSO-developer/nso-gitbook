<a id="cls-AbstractXMLtoConfXMLDefaultHandler"></a>
# AbstractXMLtoConfXMLDefaultHandler

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

- [AbstractXMLtoConfXMLDefaultHandler(CSNode, ConfPath)](#m-abstractxmltoconfxmldefaulthandler-4e273c948b0a)

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

- [accumulateChars(CSNode, String)](#m-accumulatechars-913e3d2e13f2)
- [addAccumulateChars()](#m-addaccumulatechars-be9ee6eba176)
- [addEndElement(CSNode)](#m-addendelement-a46a4eac513e)
- [addLeafElement(CSNode)](#m-addleafelement-19b72d17e396)
- [addLeafList()](#m-addleaflist-742766162951)
- [addStartElement(CSNode)](#m-addstartelement-681f3ec123d7)
- [addValueElement(CSNode, ConfValue)](#m-addvalueelement-d6cd0992363c)
- [characters(char[], int, int)](#m-characters-54e61cfbbafb)
- [empty()](#m-empty-83bc141ca576)
- [endDocument()](#m-enddocument-43add802e87c)
- [endElement(String, String, String)](#m-endelement-bf7b2e1ca7dd)
- [endPrefixMapping(String)](#m-endprefixmapping-e148849915f0)
- [error(SAXParseException)](#m-error-a853f81b7a9c)
- [fatalError(SAXParseException)](#m-fatalerror-c264673a9faf)
- [getCSNode2XMLNs(CSNode)](#m-getcsnode2xmlns-bedb63844216)
- [ignorableWhitespace(char[], int, int)](#m-ignorablewhitespace-175d27978a6d)
- [isContainmentElement(CSNode)](#m-iscontainmentelement-c7d16abe6bc1)
- [isEmptyCharacter(String)](#m-isemptycharacter-7210ff4039cc)
- [isEqual(QName, CSNode)](#m-isequal-3d9c7ac2a95d)
- [peek()](#m-peek-a38eaaf8a6a7)
- [pop()](#m-pop-1c15fa891a07)
- [processingInstruction(String, String)](#m-processinginstruction-e290a99e8a1d)
- [push(CSNode)](#m-push-73f33d05b8a4)
- [setDocumentLocator(Locator)](#m-setdocumentlocator-d9bd10e8b8ad)
- [startDocument()](#m-startdocument-aca8d484cffb)
- [startElement(String, String, String, Attributes)](#m-startelement-03aa11bd6db7)
- [startPrefixMapping(String, String)](#m-startprefixmapping-e3d43dbd7ed4)
- [value(CSNode, String)](#m-value-49c56559602a)
- [valueAdd(CSNode, String)](#m-valueadd-b812e6b46ea1)
- [warning(SAXParseException)](#m-warning-c401f291f7f5)

**Nested Types**:

- [QName](AbstractXMLtoConfXMLDefaultHandler/QName.md#cls-QName)

## Constructors

<a id="m-abstractxmltoconfxmldefaulthandler-4e273c948b0a"></a>
### AbstractXMLtoConfXMLDefaultHandler(CSNode, ConfPath)

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

<a id="m-accInfo"></a>
### accInfo

```java
protected com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler.AccumulateInfo accInfo = null;
```

<a id="m-depth"></a>
### depth

```java
protected int depth = null;
```

<a id="m-info"></a>
### info

```java
protected com.tailf.navu.NavuNodeInfo info = null;
```

Types: [NavuNodeInfo](NavuNodeInfo.md#cls-NavuNodeInfo)

<a id="m-leafListNodes"></a>
### leafListNodes

```java
protected java.util.Map<com.tailf.maapi.MaapiSchemas.CSNode,java.util.List<com.tailf.conf.ConfValue>> leafListNodes = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [ConfValue](../conf/ConfValue.md#cls-ConfValue)

<a id="m-locator"></a>
### locator

```java
protected org.xml.sax.Locator locator = null;
```

<a id="m-mnsMap"></a>
### mnsMap

```java
protected com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap = null;
```

Types: [CSMNsMap](../maapi/MaapiSchemas/CSMNsMap.md#cls-CSMNsMap)

<a id="m-nsPrefixMap"></a>
### nsPrefixMap

```java
protected java.util.Map<String,java.util.Stack<com.tailf.conf.ConfNamespace>> nsPrefixMap = null;
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

<a id="m-nsStack"></a>
### nsStack

```java
protected java.util.Stack<com.tailf.conf.ConfNamespace> nsStack = null;
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

<a id="m-params"></a>
### params

```java
protected java.util.List<com.tailf.conf.ConfXMLParam> params = null;
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

<a id="m-path"></a>
### path

```java
protected com.tailf.conf.ConfPath path = null;
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

<a id="m-pathNodes"></a>
### pathNodes

```java
protected java.util.LinkedList<com.tailf.maapi.MaapiSchemas.CSNode> pathNodes = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

<a id="m-pathStack"></a>
### pathStack

```java
protected java.util.Stack<com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler.PathState> pathStack = null;
```

<a id="m-schemas"></a>
### schemas

```java
protected com.tailf.maapi.MaapiSchemas schemas = null;
```

Types: [MaapiSchemas](../maapi/MaapiSchemas.md#cls-MaapiSchemas)

<a id="m-stack"></a>
### stack

```java
protected java.util.Stack<com.tailf.maapi.MaapiSchemas.CSNode> stack = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

<a id="m-startNode"></a>
### startNode

```java
protected com.tailf.maapi.MaapiSchemas.CSNode startNode = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)


## Methods

<a id="m-accumulatechars-913e3d2e13f2"></a>
### accumulateChars(CSNode, String)

```java
protected void accumulateChars(com.tailf.maapi.MaapiSchemas.CSNode node, String value)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `String value`

<a id="m-addaccumulatechars-be9ee6eba176"></a>
### addAccumulateChars()

```java
protected void addAccumulateChars() throws org.xml.sax.SAXException
```

<a id="m-addendelement-a46a4eac513e"></a>
### addEndElement(CSNode)

```java
protected void addEndElement(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="m-addleafelement-19b72d17e396"></a>
### addLeafElement(CSNode)

```java
protected void addLeafElement(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="m-addleaflist-742766162951"></a>
### addLeafList()

```java
protected void addLeafList()
```

<a id="m-addstartelement-681f3ec123d7"></a>
### addStartElement(CSNode)

```java
protected void addStartElement(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="m-addvalueelement-d6cd0992363c"></a>
### addValueElement(CSNode, ConfValue)

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

<a id="m-characters-54e61cfbbafb"></a>
### characters(char[], int, int)

```java
public void characters(char[] pCh, int pStart, int pLength) throws org.xml.sax.SAXException
```

**Parameters**

- `char[] pCh`
- `int pStart`
- `int pLength`

<a id="m-empty-83bc141ca576"></a>
### empty()

```java
protected boolean empty()
```

<a id="m-enddocument-43add802e87c"></a>
### endDocument()

```java
public void endDocument() throws org.xml.sax.SAXException
```

<a id="m-endelement-bf7b2e1ca7dd"></a>
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

<a id="m-endprefixmapping-e148849915f0"></a>
### endPrefixMapping(String)

```java
public void endPrefixMapping(String prefix) throws org.xml.sax.SAXException
```

**Parameters**

- `String prefix`

<a id="m-error-a853f81b7a9c"></a>
### error(SAXParseException)

```java
public void error(org.xml.sax.SAXParseException ex)
```

**Parameters**

- `org.xml.sax.SAXParseException ex`

<a id="m-fatalerror-c264673a9faf"></a>
### fatalError(SAXParseException)

```java
public void fatalError(org.xml.sax.SAXParseException ex) throws org.xml.sax.SAXException
```

**Parameters**

- `org.xml.sax.SAXParseException ex`

<a id="m-getcsnode2xmlns-bedb63844216"></a>
### getCSNode2XMLNs(CSNode)

```java
protected String getCSNode2XMLNs(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="m-ignorablewhitespace-175d27978a6d"></a>
### ignorableWhitespace(char[], int, int)

```java
public void ignorableWhitespace(char[] ch, int start, int length) throws org.xml.sax.SAXException
```

**Parameters**

- `char[] ch`
- `int start`
- `int length`

<a id="m-iscontainmentelement-c7d16abe6bc1"></a>
### isContainmentElement(CSNode)

**Package-private**

```java
boolean isContainmentElement(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="m-isemptycharacter-7210ff4039cc"></a>
### isEmptyCharacter(String)

```java
protected boolean isEmptyCharacter(String character)
```

**Parameters**

- `String character`

<a id="m-isequal-3d9c7ac2a95d"></a>
### isEqual(QName, CSNode)

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

<a id="m-peek-a38eaaf8a6a7"></a>
### peek()

```java
protected com.tailf.maapi.MaapiSchemas.CSNode peek()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

<a id="m-pop-1c15fa891a07"></a>
### pop()

```java
protected com.tailf.maapi.MaapiSchemas.CSNode pop() throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuException](NavuException.md#cls-NavuException)

<a id="m-processinginstruction-e290a99e8a1d"></a>
### processingInstruction(String, String)

```java
public void processingInstruction(String target, String data)
```

**Parameters**

- `String target`
- `String data`

<a id="m-push-73f33d05b8a4"></a>
### push(CSNode)

```java
protected void push(com.tailf.maapi.MaapiSchemas.CSNode node) throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="m-setdocumentlocator-d9bd10e8b8ad"></a>
### setDocumentLocator(Locator)

```java
public void setDocumentLocator(org.xml.sax.Locator locator)
```

**Parameters**

- `org.xml.sax.Locator locator`

<a id="m-startdocument-aca8d484cffb"></a>
### startDocument()

```java
public void startDocument() throws org.xml.sax.SAXException
```

<a id="m-startelement-03aa11bd6db7"></a>
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

<a id="m-startprefixmapping-e3d43dbd7ed4"></a>
### startPrefixMapping(String, String)

```java
public void startPrefixMapping(String prefix, String xmlNsUri) throws org.xml.sax.SAXException
```

**Parameters**

- `String prefix`
- `String xmlNsUri`

<a id="m-value-49c56559602a"></a>
### value(CSNode, String)

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

<a id="m-valueadd-b812e6b46ea1"></a>
### valueAdd(CSNode, String)

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

<a id="m-warning-c401f291f7f5"></a>
### warning(SAXParseException)

```java
public void warning(org.xml.sax.SAXParseException ex)
```

**Parameters**

- `org.xml.sax.SAXParseException ex`


## Nested Types

- [QName](AbstractXMLtoConfXMLDefaultHandler/QName.md#cls-QName)
