# NavuXMLtoConfXMLParamSetHandler <a href="#cls-NavuXMLtoConfXMLParamSetHandler" id="cls-NavuXMLtoConfXMLParamSetHandler"></a>

**Package-private**

```java
class com.tailf.navu.NavuXMLtoConfXMLParamSetHandler
    extends com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler
    implements com.tailf.navu.NavuXMLtoConfXMLParamHandler
```

Types: [AbstractXMLtoConfXMLDefaultHandler](AbstractXMLtoConfXMLDefaultHandler.md#cls-AbstractXMLtoConfXMLDefaultHandler), [NavuXMLtoConfXMLParamHandler](NavuXMLtoConfXMLParamHandler.md#cls-NavuXMLtoConfXMLParamHandler)

Handler class for SAX Parser. Contains callback methods that invokes by the
 (SAX) parser. The callback methods validates and creates ConfXMLParam[] from
 the parsed XML document. Validation is performed with help of the
 loaded MaapiSchema.

**Related classes**

- [NavuXMLtoConfXMLParamSetPrepareHandler](NavuXMLtoConfXMLParamSetPrepareHandler.md#cls-NavuXMLtoConfXMLParamSetPrepareHandler)

## Members

**Constructors**:

- [NavuXMLtoConfXMLParamSetHandler(CSNode, ConfPath)](#m-NavuXMLtoConfXMLParamSetHandler-7c97e46090de)
- [NavuXMLtoConfXMLParamSetHandler(CSNode, ConfPath, int)](#m-NavuXMLtoConfXMLParamSetHandler-8e632839436d)

**Fields**:

- [accInfo](AbstractXMLtoConfXMLDefaultHandler.md#m-accInfo) from AbstractXMLtoConfXMLDefaultHandler
- [currLeafListEntry](#m-currLeafListEntry)
- [depth](AbstractXMLtoConfXMLDefaultHandler.md#m-depth) from AbstractXMLtoConfXMLDefaultHandler
- [info](AbstractXMLtoConfXMLDefaultHandler.md#m-info) from AbstractXMLtoConfXMLDefaultHandler
- [leafListNodes](AbstractXMLtoConfXMLDefaultHandler.md#m-leafListNodes) from AbstractXMLtoConfXMLDefaultHandler
- [locator](AbstractXMLtoConfXMLDefaultHandler.md#m-locator) from AbstractXMLtoConfXMLDefaultHandler
- [mnsMap](AbstractXMLtoConfXMLDefaultHandler.md#m-mnsMap) from AbstractXMLtoConfXMLDefaultHandler
- [mode](#m-mode)
- [nsPrefixMap](AbstractXMLtoConfXMLDefaultHandler.md#m-nsPrefixMap) from AbstractXMLtoConfXMLDefaultHandler
- [nsStack](AbstractXMLtoConfXMLDefaultHandler.md#m-nsStack) from AbstractXMLtoConfXMLDefaultHandler
- [params](AbstractXMLtoConfXMLDefaultHandler.md#m-params) from AbstractXMLtoConfXMLDefaultHandler
- [path](AbstractXMLtoConfXMLDefaultHandler.md#m-path) from AbstractXMLtoConfXMLDefaultHandler
- [pathNodes](AbstractXMLtoConfXMLDefaultHandler.md#m-pathNodes) from AbstractXMLtoConfXMLDefaultHandler
- [pathStack](AbstractXMLtoConfXMLDefaultHandler.md#m-pathStack) from AbstractXMLtoConfXMLDefaultHandler
- [schemas](AbstractXMLtoConfXMLDefaultHandler.md#m-schemas) from AbstractXMLtoConfXMLDefaultHandler
- [stack](AbstractXMLtoConfXMLDefaultHandler.md#m-stack) from AbstractXMLtoConfXMLDefaultHandler
- [startNode](AbstractXMLtoConfXMLDefaultHandler.md#m-startNode) from AbstractXMLtoConfXMLDefaultHandler

**Methods**:

- [accumulateChars(CSNode, String)](AbstractXMLtoConfXMLDefaultHandler.md#m-accumulateChars-913e3d2e13f2) from AbstractXMLtoConfXMLDefaultHandler
- [addAccumulateChars()](AbstractXMLtoConfXMLDefaultHandler.md#m-addAccumulateChars-be9ee6eba176) from AbstractXMLtoConfXMLDefaultHandler
- [addEndElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-addEndElement-a46a4eac513e) from AbstractXMLtoConfXMLDefaultHandler
- [addLeafElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-addLeafElement-19b72d17e396) from AbstractXMLtoConfXMLDefaultHandler
- [addLeafList()](AbstractXMLtoConfXMLDefaultHandler.md#m-addLeafList-742766162951) from AbstractXMLtoConfXMLDefaultHandler
- [addPreviousLeafList()](#m-addPreviousLeafList-e6bc9b69ec37)
- [addPreviousLeafList(CSNode)](#m-addPreviousLeafList-1a8267f58863)
- [addStartElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-addStartElement-681f3ec123d7) from AbstractXMLtoConfXMLDefaultHandler
- [addValueElement(CSNode, ConfValue)](AbstractXMLtoConfXMLDefaultHandler.md#m-addValueElement-d6cd0992363c) from AbstractXMLtoConfXMLDefaultHandler
- [characters(char[], int, int)](AbstractXMLtoConfXMLDefaultHandler.md#m-characters-54e61cfbbafb) from AbstractXMLtoConfXMLDefaultHandler
- [confXMLParam()](#m-confXMLParam-334dac9dee1a)
- [createLeafListEntry(CSNode)](#m-createLeafListEntry-25b4c63a9eb2)
- [doEndElement(String, String, String)](#m-doEndElement-7d27409d2193)
- [doStartElement(String, String, String, Attributes)](#m-doStartElement-d6f6b3ed1adf)
- [empty()](AbstractXMLtoConfXMLDefaultHandler.md#m-empty-83bc141ca576) from AbstractXMLtoConfXMLDefaultHandler
- [endDocument()](#m-endDocument-43add802e87c)
- [endElement(String, String, String)](#m-endElement-bf7b2e1ca7dd)
- [endPrefixMapping(String)](AbstractXMLtoConfXMLDefaultHandler.md#m-endPrefixMapping-e148849915f0) from AbstractXMLtoConfXMLDefaultHandler
- [error(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#m-error-a853f81b7a9c) from AbstractXMLtoConfXMLDefaultHandler
- [fatalError(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#m-fatalError-c264673a9faf) from AbstractXMLtoConfXMLDefaultHandler
- [getAccParams()](#m-getAccParams-08582887f050)
- [getCSNode2XMLNs(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-getCSNode2XMLNs-bedb63844216) from AbstractXMLtoConfXMLDefaultHandler
- [getCurrLeafListEntry()](#m-getCurrLeafListEntry-f8b333878b20)
- [ignorableWhitespace(char[], int, int)](AbstractXMLtoConfXMLDefaultHandler.md#m-ignorableWhitespace-175d27978a6d) from AbstractXMLtoConfXMLDefaultHandler
- [isContainmentElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-isContainmentElement-c7d16abe6bc1) from AbstractXMLtoConfXMLDefaultHandler
- [isEmptyCharacter(String)](AbstractXMLtoConfXMLDefaultHandler.md#m-isEmptyCharacter-7210ff4039cc) from AbstractXMLtoConfXMLDefaultHandler
- [isEqual(QName, CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-isEqual-3d9c7ac2a95d) from AbstractXMLtoConfXMLDefaultHandler
- [peek()](AbstractXMLtoConfXMLDefaultHandler.md#m-peek-a38eaaf8a6a7) from AbstractXMLtoConfXMLDefaultHandler
- [pop()](AbstractXMLtoConfXMLDefaultHandler.md#m-pop-1c15fa891a07) from AbstractXMLtoConfXMLDefaultHandler
- [processingInstruction(String, String)](AbstractXMLtoConfXMLDefaultHandler.md#m-processingInstruction-e290a99e8a1d) from AbstractXMLtoConfXMLDefaultHandler
- [push(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-push-73f33d05b8a4) from AbstractXMLtoConfXMLDefaultHandler
- [setDocumentLocator(Locator)](AbstractXMLtoConfXMLDefaultHandler.md#m-setDocumentLocator-d9bd10e8b8ad) from AbstractXMLtoConfXMLDefaultHandler
- [startDocument()](AbstractXMLtoConfXMLDefaultHandler.md#m-startDocument-aca8d484cffb) from AbstractXMLtoConfXMLDefaultHandler
- [startElement(String, String, String, Attributes)](#m-startElement-03aa11bd6db7)
- [startPrefixMapping(String, String)](AbstractXMLtoConfXMLDefaultHandler.md#m-startPrefixMapping-e3d43dbd7ed4) from AbstractXMLtoConfXMLDefaultHandler
- [value(CSNode, String)](AbstractXMLtoConfXMLDefaultHandler.md#m-value-49c56559602a) from AbstractXMLtoConfXMLDefaultHandler
- [valueAdd(CSNode, String)](#m-valueAdd-b812e6b46ea1)
- [warning(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#m-warning-c401f291f7f5) from AbstractXMLtoConfXMLDefaultHandler

**Nested Types**:

- [LeafListEntry](NavuXMLtoConfXMLParamSetHandler/LeafListEntry.md#cls-LeafListEntry)

## Constructors

### NavuXMLtoConfXMLParamSetHandler(CSNode, ConfPath) <a href="#m-NavuXMLtoConfXMLParamSetHandler-7c97e46090de" id="m-NavuXMLtoConfXMLParamSetHandler-7c97e46090de"></a>

**Package-private**

```java
NavuXMLtoConfXMLParamSetHandler(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfPath confPath
)
    throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [NavuException](NavuException.md#cls-NavuException)

Constructor for initializing the handler.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node` - Start node (or root Node) of the document
- `com.tailf.conf.ConfPath confPath` - Start path of the document

### NavuXMLtoConfXMLParamSetHandler(CSNode, ConfPath, int) <a href="#m-NavuXMLtoConfXMLParamSetHandler-8e632839436d" id="m-NavuXMLtoConfXMLParamSetHandler-8e632839436d"></a>

**Package-private**

```java
NavuXMLtoConfXMLParamSetHandler(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfPath confPath,
    int mode
)
    throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [NavuException](NavuException.md#cls-NavuException)

Constructor that for initializing the handler,
 specialy for handling action/rpc.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node` - Start node (or root Node) of the document
- `com.tailf.conf.ConfPath confPath` - Start path of the document
- `int mode` - one of `MODE_SET_ACTION_PARAM` or
                     `MODE_SET_ACTION_RESULT`


## Fields

### currLeafListEntry <a href="#m-currLeafListEntry" id="m-currLeafListEntry"></a>

```java
protected com.tailf.navu.NavuXMLtoConfXMLParamSetHandler.LeafListEntry currLeafListEntry = null;
```

Types: [LeafListEntry](NavuXMLtoConfXMLParamSetHandler/LeafListEntry.md#cls-LeafListEntry)

### mode <a href="#m-mode" id="m-mode"></a>

```java
protected int mode = null;
```


## Methods

### addPreviousLeafList() <a href="#m-addPreviousLeafList-e6bc9b69ec37" id="m-addPreviousLeafList-e6bc9b69ec37"></a>

```java
protected void addPreviousLeafList()
```

### addPreviousLeafList(CSNode) <a href="#m-addPreviousLeafList-1a8267f58863" id="m-addPreviousLeafList-1a8267f58863"></a>

```java
protected void addPreviousLeafList(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### confXMLParam() <a href="#m-confXMLParam-334dac9dee1a" id="m-confXMLParam-334dac9dee1a"></a>

```java
public com.tailf.conf.ConfXMLParam[] confXMLParam()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

Get the generated ConfXMLParam array from the parsed XML-String.

**Returns:** Generated ConfXMLParam()

### createLeafListEntry(CSNode) <a href="#m-createLeafListEntry-25b4c63a9eb2" id="m-createLeafListEntry-25b4c63a9eb2"></a>

```java
protected void createLeafListEntry(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### doEndElement(String, String, String) <a href="#m-doEndElement-7d27409d2193" id="m-doEndElement-7d27409d2193"></a>

```java
public void doEndElement(
    String uri,
    String localName,
    String qName
)
    throws org.xml.sax.SAXException, com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String uri`
- `String localName`
- `String qName`

### doStartElement(String, String, String, Attributes) <a href="#m-doStartElement-d6f6b3ed1adf" id="m-doStartElement-d6f6b3ed1adf"></a>

```java
public void doStartElement(
    String uri,
    String localName,
    String qName,
    org.xml.sax.Attributes atts
)
    throws org.xml.sax.SAXException, com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String uri`
- `String localName`
- `String qName`
- `org.xml.sax.Attributes atts`

### endDocument() <a href="#m-endDocument-43add802e87c" id="m-endDocument-43add802e87c"></a>

```java
public void endDocument() throws org.xml.sax.SAXException
```

### endElement(String, String, String) <a href="#m-endElement-bf7b2e1ca7dd" id="m-endElement-bf7b2e1ca7dd"></a>

```java
public void endElement(String uri, String localName, String qName) throws org.xml.sax.SAXException
```

The callback methods that SAX Parser will call when it encounters an
 end XML-tag. We remove the CSNode from the current stack if the current
 processing CSNode tag is equals to the XML-end tag and add a
 ConfXMLParamStop to close the ConfXMLParamStart

**Parameters**

- `String uri`
- `String localName`
- `String qName`

### getAccParams() <a href="#m-getAccParams-08582887f050" id="m-getAccParams-08582887f050"></a>

```java
protected java.util.List<com.tailf.conf.ConfXMLParam> getAccParams()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

### getCurrLeafListEntry() <a href="#m-getCurrLeafListEntry-f8b333878b20" id="m-getCurrLeafListEntry-f8b333878b20"></a>

```java
protected com.tailf.navu.NavuXMLtoConfXMLParamSetHandler.LeafListEntry getCurrLeafListEntry()
```

Types: [LeafListEntry](NavuXMLtoConfXMLParamSetHandler/LeafListEntry.md#cls-LeafListEntry)

### startElement(String, String, String, Attributes) <a href="#m-startElement-03aa11bd6db7" id="m-startElement-03aa11bd6db7"></a>

```java
public void startElement(
    String uri,
    String localName,
    String qName,
    org.xml.sax.Attributes atts
)
    throws org.xml.sax.SAXException
```

When the parser encounters a opening element this method get
 called. The first thing we need to do is validate the tag
 with the maapi schema. We also check that the start tag
 is not counted twice in case the xml string contains
 the start element (Start tag).

 For every XML-String that startElement create a ConfXMLParamStart
 if the encountered tag is not a leaf.

**Parameters**

- `String uri` - - XML namespace
- `String localName` - - tag name with any prefix stripped
- `String qName` - - tagname with prefix if it is supplied
- `org.xml.sax.Attributes atts` - - Attribute information.

**Throws**

- `SAXException`

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


## Nested Types

- [LeafListEntry](NavuXMLtoConfXMLParamSetHandler/LeafListEntry.md#cls-LeafListEntry)
