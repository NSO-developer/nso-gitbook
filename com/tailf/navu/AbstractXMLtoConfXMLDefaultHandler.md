# AbstractXMLtoConfXMLDefaultHandler <a href="#abstractxmltoconfxmldefaulthandler-e8abaaf7c43d" id="abstractxmltoconfxmldefaulthandler-e8abaaf7c43d"></a>

**Package-private**

```java
abstract class com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler
    extends org.xml.sax.helpers.DefaultHandler
```

**Related classes**

- [NavuXMLtoConfXMLParamGetHandler](NavuXMLtoConfXMLParamGetHandler.md#navuxmltoconfxmlparamgethandler-2a1e3a3c3efc)
- [NavuXMLtoConfXMLParamSetHandler](NavuXMLtoConfXMLParamSetHandler.md#navuxmltoconfxmlparamsethandler-1ff1b1b00b63)

## Members

**Constructors**:

- [AbstractXMLtoConfXMLDefaultHandler\(CSNode, ConfPath\)](#abstractxmltoconfxmldefaulthandler-4e273c948b0a)

**Fields**:

- [accInfo](#accinfo-d608938eea2d)
- [depth](#depth-38add9e42439)
- [info](#info-0e3cf5dd73b2)
- [leafListNodes](#leaflistnodes-4e2b95fdbb97)
- [locator](#locator-2d676cc26d04)
- [mnsMap](#mnsmap-152d5ee77450)
- [nsPrefixMap](#nsprefixmap-52c6c2f900b7)
- [nsStack](#nsstack-4fe0ea3d668b)
- [params](#params-989efee474a0)
- [path](#path-d27aef81ec30)
- [pathNodes](#pathnodes-3d4b2754b544)
- [pathStack](#pathstack-50dad8efbd54)
- [schemas](#schemas-d9de6465eb56)
- [stack](#stack-e1234a745f90)
- [startNode](#startnode-0956dedfa6c3)

**Methods**:

- [accumulateChars\(CSNode, String\)](#accumulatechars-913e3d2e13f2)
- [addAccumulateChars\(\)](#addaccumulatechars-be9ee6eba176)
- [addEndElement\(CSNode\)](#addendelement-a46a4eac513e)
- [addLeafElement\(CSNode\)](#addleafelement-19b72d17e396)
- [addLeafList\(\)](#addleaflist-742766162951)
- [addStartElement\(CSNode\)](#addstartelement-681f3ec123d7)
- [addValueElement\(CSNode, ConfValue\)](#addvalueelement-d6cd0992363c)
- [characters\(char\[\], int, int\)](#characters-54e61cfbbafb)
- [empty\(\)](#empty-83bc141ca576)
- [endDocument\(\)](#enddocument-43add802e87c)
- [endElement\(String, String, String\)](#endelement-bf7b2e1ca7dd)
- [endPrefixMapping\(String\)](#endprefixmapping-e148849915f0)
- [error\(SAXParseException\)](#error-a853f81b7a9c)
- [fatalError\(SAXParseException\)](#fatalerror-c264673a9faf)
- [getCSNode2XMLNs\(CSNode\)](#getcsnode2xmlns-bedb63844216)
- [ignorableWhitespace\(char\[\], int, int\)](#ignorablewhitespace-175d27978a6d)
- [isContainmentElement\(CSNode\)](#iscontainmentelement-c7d16abe6bc1)
- [isEmptyCharacter\(String\)](#isemptycharacter-7210ff4039cc)
- [isEqual\(QName, CSNode\)](#isequal-3d9c7ac2a95d)
- [peek\(\)](#peek-a38eaaf8a6a7)
- [pop\(\)](#pop-1c15fa891a07)
- [processingInstruction\(String, String\)](#processinginstruction-e290a99e8a1d)
- [push\(CSNode\)](#push-73f33d05b8a4)
- [setDocumentLocator\(Locator\)](#setdocumentlocator-d9bd10e8b8ad)
- [startDocument\(\)](#startdocument-aca8d484cffb)
- [startElement\(String, String, String, Attributes\)](#startelement-03aa11bd6db7)
- [startPrefixMapping\(String, String\)](#startprefixmapping-e3d43dbd7ed4)
- [value\(CSNode, String\)](#value-49c56559602a)
- [valueAdd\(CSNode, String\)](#valueadd-b812e6b46ea1)
- [warning\(SAXParseException\)](#warning-c401f291f7f5)

**Nested Types**:

- [QName](AbstractXMLtoConfXMLDefaultHandler/QName.md#qname-0134f053f6c0)

## Constructors

### AbstractXMLtoConfXMLDefaultHandler(CSNode, ConfPath) <a href="#abstractxmltoconfxmldefaulthandler-4e273c948b0a" id="abstractxmltoconfxmldefaulthandler-4e273c948b0a"></a>

```java
protected AbstractXMLtoConfXMLDefaultHandler(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.conf.ConfPath path`


## Fields

### accInfo <a href="#accinfo-d608938eea2d" id="accinfo-d608938eea2d"></a>

```java
protected com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler.AccumulateInfo accInfo = null;
```

### depth <a href="#depth-38add9e42439" id="depth-38add9e42439"></a>

```java
protected int depth = null;
```

### info <a href="#info-0e3cf5dd73b2" id="info-0e3cf5dd73b2"></a>

```java
protected com.tailf.navu.NavuNodeInfo info = null;
```

Types: [NavuNodeInfo](NavuNodeInfo.md#navunodeinfo-ee275327d410)

### leafListNodes <a href="#leaflistnodes-4e2b95fdbb97" id="leaflistnodes-4e2b95fdbb97"></a>

```java
protected java.util.Map<com.tailf.maapi.MaapiSchemas.CSNode,java.util.List<com.tailf.conf.ConfValue>> leafListNodes = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d)

### locator <a href="#locator-2d676cc26d04" id="locator-2d676cc26d04"></a>

```java
protected org.xml.sax.Locator locator = null;
```

### mnsMap <a href="#mnsmap-152d5ee77450" id="mnsmap-152d5ee77450"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap = null;
```

Types: [CSMNsMap](../maapi/MaapiSchemas/CSMNsMap.md#csmnsmap-1123c939e6bb)

### nsPrefixMap <a href="#nsprefixmap-52c6c2f900b7" id="nsprefixmap-52c6c2f900b7"></a>

```java
protected java.util.Map<String,java.util.Stack<com.tailf.conf.ConfNamespace>> nsPrefixMap = null;
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1)

### nsStack <a href="#nsstack-4fe0ea3d668b" id="nsstack-4fe0ea3d668b"></a>

```java
protected java.util.Stack<com.tailf.conf.ConfNamespace> nsStack = null;
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1)

### params <a href="#params-989efee474a0" id="params-989efee474a0"></a>

```java
protected java.util.List<com.tailf.conf.ConfXMLParam> params = null;
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)

### path <a href="#path-d27aef81ec30" id="path-d27aef81ec30"></a>

```java
protected com.tailf.conf.ConfPath path = null;
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d)

### pathNodes <a href="#pathnodes-3d4b2754b544" id="pathnodes-3d4b2754b544"></a>

```java
protected java.util.LinkedList<com.tailf.maapi.MaapiSchemas.CSNode> pathNodes = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

### pathStack <a href="#pathstack-50dad8efbd54" id="pathstack-50dad8efbd54"></a>

```java
protected java.util.Stack<com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler.PathState> pathStack = null;
```

### schemas <a href="#schemas-d9de6465eb56" id="schemas-d9de6465eb56"></a>

```java
protected com.tailf.maapi.MaapiSchemas schemas = null;
```

Types: [MaapiSchemas](../maapi/MaapiSchemas.md#maapischemas-821ac70b83b7)

### stack <a href="#stack-e1234a745f90" id="stack-e1234a745f90"></a>

```java
protected java.util.Stack<com.tailf.maapi.MaapiSchemas.CSNode> stack = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

### startNode <a href="#startnode-0956dedfa6c3" id="startnode-0956dedfa6c3"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode startNode = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)


## Methods

### accumulateChars(CSNode, String) <a href="#accumulatechars-913e3d2e13f2" id="accumulatechars-913e3d2e13f2"></a>

```java
protected void accumulateChars(com.tailf.maapi.MaapiSchemas.CSNode node, String value)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `String value`

### addAccumulateChars() <a href="#addaccumulatechars-be9ee6eba176" id="addaccumulatechars-be9ee6eba176"></a>

```java
protected void addAccumulateChars() throws org.xml.sax.SAXException
```

### addEndElement(CSNode) <a href="#addendelement-a46a4eac513e" id="addendelement-a46a4eac513e"></a>

```java
protected void addEndElement(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### addLeafElement(CSNode) <a href="#addleafelement-19b72d17e396" id="addleafelement-19b72d17e396"></a>

```java
protected void addLeafElement(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### addLeafList() <a href="#addleaflist-742766162951" id="addleaflist-742766162951"></a>

```java
protected void addLeafList()
```

### addStartElement(CSNode) <a href="#addstartelement-681f3ec123d7" id="addstartelement-681f3ec123d7"></a>

```java
protected void addStartElement(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### addValueElement(CSNode, ConfValue) <a href="#addvalueelement-d6cd0992363c" id="addvalueelement-d6cd0992363c"></a>

```java
protected void addValueElement(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfValue value
)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.conf.ConfValue value`

### characters(char[], int, int) <a href="#characters-54e61cfbbafb" id="characters-54e61cfbbafb"></a>

```java
public void characters(char[] pCh, int pStart, int pLength) throws org.xml.sax.SAXException
```

**Parameters**

- `char[] pCh`
- `int pStart`
- `int pLength`

### empty() <a href="#empty-83bc141ca576" id="empty-83bc141ca576"></a>

```java
protected boolean empty()
```

### endDocument() <a href="#enddocument-43add802e87c" id="enddocument-43add802e87c"></a>

```java
public void endDocument() throws org.xml.sax.SAXException
```

### endElement(String, String, String) <a href="#endelement-bf7b2e1ca7dd" id="endelement-bf7b2e1ca7dd"></a>

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

### endPrefixMapping(String) <a href="#endprefixmapping-e148849915f0" id="endprefixmapping-e148849915f0"></a>

```java
public void endPrefixMapping(String prefix) throws org.xml.sax.SAXException
```

**Parameters**

- `String prefix`

### error(SAXParseException) <a href="#error-a853f81b7a9c" id="error-a853f81b7a9c"></a>

```java
public void error(org.xml.sax.SAXParseException ex)
```

**Parameters**

- `org.xml.sax.SAXParseException ex`

### fatalError(SAXParseException) <a href="#fatalerror-c264673a9faf" id="fatalerror-c264673a9faf"></a>

```java
public void fatalError(org.xml.sax.SAXParseException ex) throws org.xml.sax.SAXException
```

**Parameters**

- `org.xml.sax.SAXParseException ex`

### getCSNode2XMLNs(CSNode) <a href="#getcsnode2xmlns-bedb63844216" id="getcsnode2xmlns-bedb63844216"></a>

```java
protected String getCSNode2XMLNs(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### ignorableWhitespace(char[], int, int) <a href="#ignorablewhitespace-175d27978a6d" id="ignorablewhitespace-175d27978a6d"></a>

```java
public void ignorableWhitespace(char[] ch, int start, int length) throws org.xml.sax.SAXException
```

**Parameters**

- `char[] ch`
- `int start`
- `int length`

### isContainmentElement(CSNode) <a href="#iscontainmentelement-c7d16abe6bc1" id="iscontainmentelement-c7d16abe6bc1"></a>

**Package-private**

```java
boolean isContainmentElement(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### isEmptyCharacter(String) <a href="#isemptycharacter-7210ff4039cc" id="isemptycharacter-7210ff4039cc"></a>

```java
protected boolean isEmptyCharacter(String character)
```

**Parameters**

- `String character`

### isEqual(QName, CSNode) <a href="#isequal-3d9c7ac2a95d" id="isequal-3d9c7ac2a95d"></a>

```java
protected boolean isEqual(
    com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler.QName tag,
    com.tailf.maapi.MaapiSchemas.CSNode node
)
```

Types: [QName](AbstractXMLtoConfXMLDefaultHandler/QName.md#qname-0134f053f6c0), [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler.QName tag`
- `com.tailf.maapi.MaapiSchemas.CSNode node`

### peek() <a href="#peek-a38eaaf8a6a7" id="peek-a38eaaf8a6a7"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode peek()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

### pop() <a href="#pop-1c15fa891a07" id="pop-1c15fa891a07"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode pop() throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

### processingInstruction(String, String) <a href="#processinginstruction-e290a99e8a1d" id="processinginstruction-e290a99e8a1d"></a>

```java
public void processingInstruction(String target, String data)
```

**Parameters**

- `String target`
- `String data`

### push(CSNode) <a href="#push-73f33d05b8a4" id="push-73f33d05b8a4"></a>

```java
protected void push(com.tailf.maapi.MaapiSchemas.CSNode node) throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### setDocumentLocator(Locator) <a href="#setdocumentlocator-d9bd10e8b8ad" id="setdocumentlocator-d9bd10e8b8ad"></a>

```java
public void setDocumentLocator(org.xml.sax.Locator locator)
```

**Parameters**

- `org.xml.sax.Locator locator`

### startDocument() <a href="#startdocument-aca8d484cffb" id="startdocument-aca8d484cffb"></a>

```java
public void startDocument() throws org.xml.sax.SAXException
```

### startElement(String, String, String, Attributes) <a href="#startelement-03aa11bd6db7" id="startelement-03aa11bd6db7"></a>

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

### startPrefixMapping(String, String) <a href="#startprefixmapping-e3d43dbd7ed4" id="startprefixmapping-e3d43dbd7ed4"></a>

```java
public void startPrefixMapping(String prefix, String xmlNsUri) throws org.xml.sax.SAXException
```

**Parameters**

- `String prefix`
- `String xmlNsUri`

### value(CSNode, String) <a href="#value-49c56559602a" id="value-49c56559602a"></a>

```java
protected com.tailf.conf.ConfValue value(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    String val
)
    throws org.xml.sax.SAXException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `String val`

### valueAdd(CSNode, String) <a href="#valueadd-b812e6b46ea1" id="valueadd-b812e6b46ea1"></a>

```java
protected void valueAdd(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    String val
)
    throws org.xml.sax.SAXException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `String val`

### warning(SAXParseException) <a href="#warning-c401f291f7f5" id="warning-c401f291f7f5"></a>

```java
public void warning(org.xml.sax.SAXParseException ex)
```

**Parameters**

- `org.xml.sax.SAXParseException ex`


## Nested Types

- [QName](AbstractXMLtoConfXMLDefaultHandler/QName.md#qname-0134f053f6c0)
