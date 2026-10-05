<a id="s-NavuXMLtoConfXMLParamGetHandler"></a>
# NavuXMLtoConfXMLParamGetHandler

**Package-private**

```java
class com.tailf.navu.NavuXMLtoConfXMLParamGetHandler
    extends com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler
    implements com.tailf.navu.NavuXMLtoConfXMLParamHandler
```

Types: [AbstractXMLtoConfXMLDefaultHandler](AbstractXMLtoConfXMLDefaultHandler.md#s-AbstractXMLtoConfXMLDefaultHandler), [NavuXMLtoConfXMLParamHandler](NavuXMLtoConfXMLParamHandler.md#s-NavuXMLtoConfXMLParamHandler)

Handler class for SAX Parser. Contains callback methods
 that invokes by the (SAX) parser. The callback methods
 validates and creates ConfXMLParam from the parsed
 XML document. Validation occures with help of the
 loaded MaapiSchema.

## Members

**Constructors**:

- [NavuXMLtoConfXMLParamGetHandler(CSNode, ConfPath)](#s-NavuXMLtoConfXMLParamGetHandler-1)

**Fields**:

- [accInfo](AbstractXMLtoConfXMLDefaultHandler.md#s-accInfo) from AbstractXMLtoConfXMLDefaultHandler
- [depth](AbstractXMLtoConfXMLDefaultHandler.md#s-depth) from AbstractXMLtoConfXMLDefaultHandler
- [info](AbstractXMLtoConfXMLDefaultHandler.md#s-info) from AbstractXMLtoConfXMLDefaultHandler
- [leafListNodes](AbstractXMLtoConfXMLDefaultHandler.md#s-leafListNodes) from AbstractXMLtoConfXMLDefaultHandler
- [locator](AbstractXMLtoConfXMLDefaultHandler.md#s-locator) from AbstractXMLtoConfXMLDefaultHandler
- [mnsMap](AbstractXMLtoConfXMLDefaultHandler.md#s-mnsMap) from AbstractXMLtoConfXMLDefaultHandler
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
- [addStartElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#s-addStartElement) from AbstractXMLtoConfXMLDefaultHandler
- [addValueElement(CSNode, ConfValue)](AbstractXMLtoConfXMLDefaultHandler.md#s-addValueElement) from AbstractXMLtoConfXMLDefaultHandler
- [characters(char[], int, int)](#s-characters)
- [confXMLParam()](#s-confXMLParam)
- [empty()](AbstractXMLtoConfXMLDefaultHandler.md#s-empty) from AbstractXMLtoConfXMLDefaultHandler
- [endDocument()](AbstractXMLtoConfXMLDefaultHandler.md#s-endDocument) from AbstractXMLtoConfXMLDefaultHandler
- [endElement(String, String, String)](#s-endElement)
- [endPrefixMapping(String)](AbstractXMLtoConfXMLDefaultHandler.md#s-endPrefixMapping) from AbstractXMLtoConfXMLDefaultHandler
- [error(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#s-error) from AbstractXMLtoConfXMLDefaultHandler
- [fatalError(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#s-fatalError) from AbstractXMLtoConfXMLDefaultHandler
- [getCSNode2XMLNs(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#s-getCSNode2XMLNs) from AbstractXMLtoConfXMLDefaultHandler
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
- [valueAdd(CSNode, String)](AbstractXMLtoConfXMLDefaultHandler.md#s-valueAdd) from AbstractXMLtoConfXMLDefaultHandler
- [warning(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#s-warning) from AbstractXMLtoConfXMLDefaultHandler

## Constructors

<a id="s-NavuXMLtoConfXMLParamGetHandler-1"></a>
### NavuXMLtoConfXMLParamGetHandler(CSNode, ConfPath)

**Package-private**

```java
NavuXMLtoConfXMLParamGetHandler(
    com.tailf.maapi.MaapiSchemas.CSNode n,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [ConfPath](../conf/ConfPath.md#s-ConfPath), [NavuException](NavuException.md#s-NavuException)

Constructor that for initializing the handler.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode n` - Start node (or root Node) of the document
- `com.tailf.conf.ConfPath path`


## Methods

<a id="s-characters"></a>
### characters(char[], int, int)

```java
public void characters(char[] pCh, int pStart, int pLength) throws org.xml.sax.SAXException
```

**Parameters**

- `char[] pCh`
- `int pStart`
- `int pLength`

<a id="s-confXMLParam"></a>
### confXMLParam()

```java
public com.tailf.conf.ConfXMLParam[] confXMLParam()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam)

<a id="s-endElement"></a>
### endElement(String, String, String)

```java
public void endElement(String uri, String localName, String qName) throws org.xml.sax.SAXException
```

The callback methods that SAX Parser will call
 when it encounters a ending tag.

**Parameters**

- `String uri`
- `String localName`
- `String qName`

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
 invoked.

**Parameters**

- `String uri`
- `String localName`
- `String qName`
- `org.xml.sax.Attributes atts`
