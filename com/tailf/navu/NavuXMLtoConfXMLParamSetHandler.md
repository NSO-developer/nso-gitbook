<a id="s-NavuXMLtoConfXMLParamSetHandler"></a>
# NavuXMLtoConfXMLParamSetHandler

**Package-private**

```java
class com.tailf.navu.NavuXMLtoConfXMLParamSetHandler
    extends com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler
    implements com.tailf.navu.NavuXMLtoConfXMLParamHandler
```

Types: [AbstractXMLtoConfXMLDefaultHandler](AbstractXMLtoConfXMLDefaultHandler.md#s-AbstractXMLtoConfXMLDefaultHandler), [NavuXMLtoConfXMLParamHandler](NavuXMLtoConfXMLParamHandler.md#s-NavuXMLtoConfXMLParamHandler)

Handler class for SAX Parser. Contains callback methods that invokes by the
 (SAX) parser. The callback methods validates and creates ConfXMLParam[] from
 the parsed XML document. Validation is performed with help of the
 loaded MaapiSchema.

**Related classes**

- [NavuXMLtoConfXMLParamSetPrepareHandler](NavuXMLtoConfXMLParamSetPrepareHandler.md#s-NavuXMLtoConfXMLParamSetPrepareHandler)

## Members

**Constructors**:

- [NavuXMLtoConfXMLParamSetHandler(CSNode, ConfPath)](#s-NavuXMLtoConfXMLParamSetHandler-1)
- [NavuXMLtoConfXMLParamSetHandler(CSNode, ConfPath, int)](#s-NavuXMLtoConfXMLParamSetHandler-2)

**Fields**:

- [accInfo](AbstractXMLtoConfXMLDefaultHandler.md#s-accInfo) from AbstractXMLtoConfXMLDefaultHandler
- [currLeafListEntry](#s-currLeafListEntry)
- [depth](AbstractXMLtoConfXMLDefaultHandler.md#s-depth) from AbstractXMLtoConfXMLDefaultHandler
- [info](AbstractXMLtoConfXMLDefaultHandler.md#s-info) from AbstractXMLtoConfXMLDefaultHandler
- [leafListNodes](AbstractXMLtoConfXMLDefaultHandler.md#s-leafListNodes) from AbstractXMLtoConfXMLDefaultHandler
- [locator](AbstractXMLtoConfXMLDefaultHandler.md#s-locator) from AbstractXMLtoConfXMLDefaultHandler
- [mnsMap](AbstractXMLtoConfXMLDefaultHandler.md#s-mnsMap) from AbstractXMLtoConfXMLDefaultHandler
- [mode](#s-mode)
- [nsPrefixMap](AbstractXMLtoConfXMLDefaultHandler.md#s-nsPrefixMap) from AbstractXMLtoConfXMLDefaultHandler
- [nsStack](AbstractXMLtoConfXMLDefaultHandler.md#s-nsStack) from AbstractXMLtoConfXMLDefaultHandler
- [params](AbstractXMLtoConfXMLDefaultHandler.md#s-params) from AbstractXMLtoConfXMLDefaultHandler
- [path](AbstractXMLtoConfXMLDefaultHandler.md#s-path) from AbstractXMLtoConfXMLDefaultHandler
- [pathNodes](AbstractXMLtoConfXMLDefaultHandler.md#s-pathNodes) from AbstractXMLtoConfXMLDefaultHandler
- [pathStack](AbstractXMLtoConfXMLDefaultHandler.md#s-pathStack) from AbstractXMLtoConfXMLDefaultHandler
- [schemas](AbstractXMLtoConfXMLDefaultHandler.md#s-schemas) from AbstractXMLtoConfXMLDefaultHandler
- [stack](AbstractXMLtoConfXMLDefaultHandler.md#s-stack) from AbstractXMLtoConfXMLDefaultHandler
- [startNode](AbstractXMLtoConfXMLDefaultHandler.md#s-startNode) from AbstractXMLtoConfXMLDefaultHandler

**Methods**:

- [accumulateChars(CSNode, String)](AbstractXMLtoConfXMLDefaultHandler.md#s-accumulateChars) from AbstractXMLtoConfXMLDefaultHandler
- [addAccumulateChars()](AbstractXMLtoConfXMLDefaultHandler.md#s-addAccumulateChars) from AbstractXMLtoConfXMLDefaultHandler
- [addEndElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#s-addEndElement) from AbstractXMLtoConfXMLDefaultHandler
- [addLeafElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#s-addLeafElement) from AbstractXMLtoConfXMLDefaultHandler
- [addLeafList()](AbstractXMLtoConfXMLDefaultHandler.md#s-addLeafList) from AbstractXMLtoConfXMLDefaultHandler
- [addPreviousLeafList()](#s-addPreviousLeafList)
- [addPreviousLeafList(CSNode)](#s-addPreviousLeafList-1)
- [addStartElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#s-addStartElement) from AbstractXMLtoConfXMLDefaultHandler
- [addValueElement(CSNode, ConfValue)](AbstractXMLtoConfXMLDefaultHandler.md#s-addValueElement) from AbstractXMLtoConfXMLDefaultHandler
- [characters(char[], int, int)](AbstractXMLtoConfXMLDefaultHandler.md#s-characters) from AbstractXMLtoConfXMLDefaultHandler
- [confXMLParam()](#s-confXMLParam)
- [createLeafListEntry(CSNode)](#s-createLeafListEntry)
- [doEndElement(String, String, String)](#s-doEndElement)
- [doStartElement(String, String, String, Attributes)](#s-doStartElement)
- [empty()](AbstractXMLtoConfXMLDefaultHandler.md#s-empty) from AbstractXMLtoConfXMLDefaultHandler
- [endDocument()](#s-endDocument)
- [endElement(String, String, String)](#s-endElement)
- [endPrefixMapping(String)](AbstractXMLtoConfXMLDefaultHandler.md#s-endPrefixMapping) from AbstractXMLtoConfXMLDefaultHandler
- [error(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#s-error) from AbstractXMLtoConfXMLDefaultHandler
- [fatalError(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#s-fatalError) from AbstractXMLtoConfXMLDefaultHandler
- [getAccParams()](#s-getAccParams)
- [getCSNode2XMLNs(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#s-getCSNode2XMLNs) from AbstractXMLtoConfXMLDefaultHandler
- [getCurrLeafListEntry()](#s-getCurrLeafListEntry)
- [ignorableWhitespace(char[], int, int)](AbstractXMLtoConfXMLDefaultHandler.md#s-ignorableWhitespace) from AbstractXMLtoConfXMLDefaultHandler
- [isContainmentElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#s-isContainmentElement) from AbstractXMLtoConfXMLDefaultHandler
- [isEmptyCharacter(String)](AbstractXMLtoConfXMLDefaultHandler.md#s-isEmptyCharacter) from AbstractXMLtoConfXMLDefaultHandler
- [isEqual(QName, CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#s-isEqual) from AbstractXMLtoConfXMLDefaultHandler
- [peek()](AbstractXMLtoConfXMLDefaultHandler.md#s-peek) from AbstractXMLtoConfXMLDefaultHandler
- [pop()](AbstractXMLtoConfXMLDefaultHandler.md#s-pop) from AbstractXMLtoConfXMLDefaultHandler
- [processingInstruction(String, String)](AbstractXMLtoConfXMLDefaultHandler.md#s-processingInstruction) from AbstractXMLtoConfXMLDefaultHandler
- [push(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#s-push) from AbstractXMLtoConfXMLDefaultHandler
- [setDocumentLocator(Locator)](AbstractXMLtoConfXMLDefaultHandler.md#s-setDocumentLocator) from AbstractXMLtoConfXMLDefaultHandler
- [startDocument()](AbstractXMLtoConfXMLDefaultHandler.md#s-startDocument) from AbstractXMLtoConfXMLDefaultHandler
- [startElement(String, String, String, Attributes)](#s-startElement)
- [startPrefixMapping(String, String)](AbstractXMLtoConfXMLDefaultHandler.md#s-startPrefixMapping) from AbstractXMLtoConfXMLDefaultHandler
- [value(CSNode, String)](AbstractXMLtoConfXMLDefaultHandler.md#s-value) from AbstractXMLtoConfXMLDefaultHandler
- [valueAdd(CSNode, String)](#s-valueAdd)
- [warning(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#s-warning) from AbstractXMLtoConfXMLDefaultHandler

**Nested Types**:

- [LeafListEntry](NavuXMLtoConfXMLParamSetHandler/LeafListEntry.md#s-LeafListEntry)

## Constructors

<a id="s-NavuXMLtoConfXMLParamSetHandler-1"></a>
### NavuXMLtoConfXMLParamSetHandler(CSNode, ConfPath)

**Package-private**

```java
NavuXMLtoConfXMLParamSetHandler(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfPath confPath
)
    throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [ConfPath](../conf/ConfPath.md#s-ConfPath), [NavuException](NavuException.md#s-NavuException)

Constructor for initializing the handler.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node` - Start node (or root Node) of the document
- `com.tailf.conf.ConfPath confPath` - Start path of the document

<a id="s-NavuXMLtoConfXMLParamSetHandler-2"></a>
### NavuXMLtoConfXMLParamSetHandler(CSNode, ConfPath, int)

**Package-private**

```java
NavuXMLtoConfXMLParamSetHandler(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfPath confPath,
    int mode
)
    throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [ConfPath](../conf/ConfPath.md#s-ConfPath), [NavuException](NavuException.md#s-NavuException)

Constructor that for initializing the handler,
 specialy for handling action/rpc.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node` - Start node (or root Node) of the document
- `com.tailf.conf.ConfPath confPath` - Start path of the document
- `int mode` - one of `#MODE_SET_ACTION_PARAM` or
                     `#MODE_SET_ACTION_RESULT`


## Fields

<a id="s-currLeafListEntry"></a>
### currLeafListEntry

```java
protected com.tailf.navu.NavuXMLtoConfXMLParamSetHandler.LeafListEntry currLeafListEntry = null;
```

Types: [LeafListEntry](NavuXMLtoConfXMLParamSetHandler/LeafListEntry.md#s-LeafListEntry)

<a id="s-mode"></a>
### mode

```java
protected int mode = null;
```


## Methods

<a id="s-addPreviousLeafList"></a>
### addPreviousLeafList()

```java
protected void addPreviousLeafList()
```

<a id="s-addPreviousLeafList-1"></a>
### addPreviousLeafList(CSNode)

```java
protected void addPreviousLeafList(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="s-confXMLParam"></a>
### confXMLParam()

```java
public com.tailf.conf.ConfXMLParam[] confXMLParam()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam)

Get the generated ConfXMLParam array from the parsed XML-String.

**Returns:** Generated ConfXMLParam()

<a id="s-createLeafListEntry"></a>
### createLeafListEntry(CSNode)

```java
protected void createLeafListEntry(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="s-doEndElement"></a>
### doEndElement(String, String, String)

```java
public void doEndElement(
    String uri,
    String localName,
    String qName
)
    throws org.xml.sax.SAXException, com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `String uri`
- `String localName`
- `String qName`

<a id="s-doStartElement"></a>
### doStartElement(String, String, String, Attributes)

```java
public void doStartElement(
    String uri,
    String localName,
    String qName,
    org.xml.sax.Attributes atts
)
    throws org.xml.sax.SAXException, com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `String uri`
- `String localName`
- `String qName`
- `org.xml.sax.Attributes atts`

<a id="s-endDocument"></a>
### endDocument()

```java
public void endDocument() throws org.xml.sax.SAXException
```

<a id="s-endElement"></a>
### endElement(String, String, String)

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

<a id="s-getAccParams"></a>
### getAccParams()

```java
protected java.util.List<com.tailf.conf.ConfXMLParam> getAccParams()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam)

<a id="s-getCurrLeafListEntry"></a>
### getCurrLeafListEntry()

```java
protected com.tailf.navu.NavuXMLtoConfXMLParamSetHandler.LeafListEntry getCurrLeafListEntry()
```

Types: [LeafListEntry](NavuXMLtoConfXMLParamSetHandler/LeafListEntry.md#s-LeafListEntry)

<a id="s-startElement"></a>
### startElement(String, String, String, Attributes)

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


## Nested Types

- [LeafListEntry](NavuXMLtoConfXMLParamSetHandler/LeafListEntry.md)
