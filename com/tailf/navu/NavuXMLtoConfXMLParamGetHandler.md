<a id="cls-NavuXMLtoConfXMLParamGetHandler"></a>
# NavuXMLtoConfXMLParamGetHandler

**Package-private**

```java
class com.tailf.navu.NavuXMLtoConfXMLParamGetHandler
    extends com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler
    implements com.tailf.navu.NavuXMLtoConfXMLParamHandler
```

Types: [AbstractXMLtoConfXMLDefaultHandler](AbstractXMLtoConfXMLDefaultHandler.md#cls-AbstractXMLtoConfXMLDefaultHandler), [NavuXMLtoConfXMLParamHandler](NavuXMLtoConfXMLParamHandler.md#cls-NavuXMLtoConfXMLParamHandler)

Handler class for SAX Parser. Contains callback methods
 that invokes by the (SAX) parser. The callback methods
 validates and creates ConfXMLParam from the parsed
 XML document. Validation occures with help of the
 loaded MaapiSchema.

## Members

**Constructors**:

- [NavuXMLtoConfXMLParamGetHandler(CSNode, ConfPath)](#m-navuxmltoconfxmlparamgethandler-c0166b30bff6)

**Fields**:

- [accInfo](AbstractXMLtoConfXMLDefaultHandler.md#m-accInfo) from AbstractXMLtoConfXMLDefaultHandler
- [depth](AbstractXMLtoConfXMLDefaultHandler.md#m-depth) from AbstractXMLtoConfXMLDefaultHandler
- [info](AbstractXMLtoConfXMLDefaultHandler.md#m-info) from AbstractXMLtoConfXMLDefaultHandler
- [leafListNodes](AbstractXMLtoConfXMLDefaultHandler.md#m-leafListNodes) from AbstractXMLtoConfXMLDefaultHandler
- [locator](AbstractXMLtoConfXMLDefaultHandler.md#m-locator) from AbstractXMLtoConfXMLDefaultHandler
- [mnsMap](AbstractXMLtoConfXMLDefaultHandler.md#m-mnsMap) from AbstractXMLtoConfXMLDefaultHandler
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

- [accumulateChars(CSNode, String)](AbstractXMLtoConfXMLDefaultHandler.md#m-accumulatechars-913e3d2e13f2) from AbstractXMLtoConfXMLDefaultHandler
- [addAccumulateChars()](AbstractXMLtoConfXMLDefaultHandler.md#m-addaccumulatechars-be9ee6eba176) from AbstractXMLtoConfXMLDefaultHandler
- [addEndElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-addendelement-a46a4eac513e) from AbstractXMLtoConfXMLDefaultHandler
- [addLeafElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-addleafelement-19b72d17e396) from AbstractXMLtoConfXMLDefaultHandler
- [addLeafList()](AbstractXMLtoConfXMLDefaultHandler.md#m-addleaflist-742766162951) from AbstractXMLtoConfXMLDefaultHandler
- [addStartElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-addstartelement-681f3ec123d7) from AbstractXMLtoConfXMLDefaultHandler
- [addValueElement(CSNode, ConfValue)](AbstractXMLtoConfXMLDefaultHandler.md#m-addvalueelement-d6cd0992363c) from AbstractXMLtoConfXMLDefaultHandler
- [characters(char[], int, int)](#m-characters-54e61cfbbafb)
- [confXMLParam()](#m-confxmlparam-334dac9dee1a)
- [empty()](AbstractXMLtoConfXMLDefaultHandler.md#m-empty-83bc141ca576) from AbstractXMLtoConfXMLDefaultHandler
- [endDocument()](AbstractXMLtoConfXMLDefaultHandler.md#m-enddocument-43add802e87c) from AbstractXMLtoConfXMLDefaultHandler
- [endElement(String, String, String)](#m-endelement-bf7b2e1ca7dd)
- [endPrefixMapping(String)](AbstractXMLtoConfXMLDefaultHandler.md#m-endprefixmapping-e148849915f0) from AbstractXMLtoConfXMLDefaultHandler
- [error(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#m-error-a853f81b7a9c) from AbstractXMLtoConfXMLDefaultHandler
- [fatalError(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#m-fatalerror-c264673a9faf) from AbstractXMLtoConfXMLDefaultHandler
- [getCSNode2XMLNs(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-getcsnode2xmlns-bedb63844216) from AbstractXMLtoConfXMLDefaultHandler
- [ignorableWhitespace(char[], int, int)](AbstractXMLtoConfXMLDefaultHandler.md#m-ignorablewhitespace-175d27978a6d) from AbstractXMLtoConfXMLDefaultHandler
- [isContainmentElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-iscontainmentelement-c7d16abe6bc1) from AbstractXMLtoConfXMLDefaultHandler
- [isEmptyCharacter(String)](AbstractXMLtoConfXMLDefaultHandler.md#m-isemptycharacter-7210ff4039cc) from AbstractXMLtoConfXMLDefaultHandler
- [isEqual(QName, CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-isequal-3d9c7ac2a95d) from AbstractXMLtoConfXMLDefaultHandler
- [peek()](AbstractXMLtoConfXMLDefaultHandler.md#m-peek-a38eaaf8a6a7) from AbstractXMLtoConfXMLDefaultHandler
- [pop()](AbstractXMLtoConfXMLDefaultHandler.md#m-pop-1c15fa891a07) from AbstractXMLtoConfXMLDefaultHandler
- [processingInstruction(String, String)](AbstractXMLtoConfXMLDefaultHandler.md#m-processinginstruction-e290a99e8a1d) from AbstractXMLtoConfXMLDefaultHandler
- [push(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-push-73f33d05b8a4) from AbstractXMLtoConfXMLDefaultHandler
- [setDocumentLocator(Locator)](AbstractXMLtoConfXMLDefaultHandler.md#m-setdocumentlocator-d9bd10e8b8ad) from AbstractXMLtoConfXMLDefaultHandler
- [startDocument()](AbstractXMLtoConfXMLDefaultHandler.md#m-startdocument-aca8d484cffb) from AbstractXMLtoConfXMLDefaultHandler
- [startElement(String, String, String, Attributes)](#m-startelement-03aa11bd6db7)
- [startPrefixMapping(String, String)](AbstractXMLtoConfXMLDefaultHandler.md#m-startprefixmapping-e3d43dbd7ed4) from AbstractXMLtoConfXMLDefaultHandler
- [value(CSNode, String)](AbstractXMLtoConfXMLDefaultHandler.md#m-value-49c56559602a) from AbstractXMLtoConfXMLDefaultHandler
- [valueAdd(CSNode, String)](AbstractXMLtoConfXMLDefaultHandler.md#m-valueadd-b812e6b46ea1) from AbstractXMLtoConfXMLDefaultHandler
- [warning(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#m-warning-c401f291f7f5) from AbstractXMLtoConfXMLDefaultHandler

## Constructors

<a id="m-navuxmltoconfxmlparamgethandler-c0166b30bff6"></a>
### NavuXMLtoConfXMLParamGetHandler(CSNode, ConfPath)

**Package-private**

```java
NavuXMLtoConfXMLParamGetHandler(
    com.tailf.maapi.MaapiSchemas.CSNode n,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [NavuException](NavuException.md#cls-NavuException)

Constructor that for initializing the handler.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode n` - Start node (or root Node) of the document
- `com.tailf.conf.ConfPath path`


## Methods

<a id="m-characters-54e61cfbbafb"></a>
### characters(char[], int, int)

```java
public void characters(char[] pCh, int pStart, int pLength) throws org.xml.sax.SAXException
```

**Parameters**

- `char[] pCh`
- `int pStart`
- `int pLength`

<a id="m-confxmlparam-334dac9dee1a"></a>
### confXMLParam()

```java
public com.tailf.conf.ConfXMLParam[] confXMLParam()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

<a id="m-endelement-bf7b2e1ca7dd"></a>
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

<a id="m-startelement-03aa11bd6db7"></a>
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
