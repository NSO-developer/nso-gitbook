<a id="cls-NavuXMLtoConfXMLParamSetHandler"></a>
# NavuXMLtoConfXMLParamSetHandler

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

- [NavuXMLtoConfXMLParamSetHandler(CSNode, ConfPath)](#m-navuxmltoconfxmlparamsethandler-7c97e46090de)
- [NavuXMLtoConfXMLParamSetHandler(CSNode, ConfPath, int)](#m-navuxmltoconfxmlparamsethandler-8e632839436d)

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

- [accumulateChars(CSNode, String)](AbstractXMLtoConfXMLDefaultHandler.md#m-accumulatechars-913e3d2e13f2) from AbstractXMLtoConfXMLDefaultHandler
- [addAccumulateChars()](AbstractXMLtoConfXMLDefaultHandler.md#m-addaccumulatechars-be9ee6eba176) from AbstractXMLtoConfXMLDefaultHandler
- [addEndElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-addendelement-a46a4eac513e) from AbstractXMLtoConfXMLDefaultHandler
- [addLeafElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-addleafelement-19b72d17e396) from AbstractXMLtoConfXMLDefaultHandler
- [addLeafList()](AbstractXMLtoConfXMLDefaultHandler.md#m-addleaflist-742766162951) from AbstractXMLtoConfXMLDefaultHandler
- [addPreviousLeafList()](#m-addpreviousleaflist-e6bc9b69ec37)
- [addPreviousLeafList(CSNode)](#m-addpreviousleaflist-1a8267f58863)
- [addStartElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-addstartelement-681f3ec123d7) from AbstractXMLtoConfXMLDefaultHandler
- [addValueElement(CSNode, ConfValue)](AbstractXMLtoConfXMLDefaultHandler.md#m-addvalueelement-d6cd0992363c) from AbstractXMLtoConfXMLDefaultHandler
- [characters(char[], int, int)](AbstractXMLtoConfXMLDefaultHandler.md#m-characters-54e61cfbbafb) from AbstractXMLtoConfXMLDefaultHandler
- [confXMLParam()](#m-confxmlparam-334dac9dee1a)
- [createLeafListEntry(CSNode)](#m-createleaflistentry-25b4c63a9eb2)
- [doEndElement(String, String, String)](#m-doendelement-7d27409d2193)
- [doStartElement(String, String, String, Attributes)](#m-dostartelement-d6f6b3ed1adf)
- [empty()](AbstractXMLtoConfXMLDefaultHandler.md#m-empty-83bc141ca576) from AbstractXMLtoConfXMLDefaultHandler
- [endDocument()](#m-enddocument-43add802e87c)
- [endElement(String, String, String)](#m-endelement-bf7b2e1ca7dd)
- [endPrefixMapping(String)](AbstractXMLtoConfXMLDefaultHandler.md#m-endprefixmapping-e148849915f0) from AbstractXMLtoConfXMLDefaultHandler
- [error(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#m-error-a853f81b7a9c) from AbstractXMLtoConfXMLDefaultHandler
- [fatalError(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#m-fatalerror-c264673a9faf) from AbstractXMLtoConfXMLDefaultHandler
- [getAccParams()](#m-getaccparams-08582887f050)
- [getCSNode2XMLNs(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-getcsnode2xmlns-bedb63844216) from AbstractXMLtoConfXMLDefaultHandler
- [getCurrLeafListEntry()](#m-getcurrleaflistentry-f8b333878b20)
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
- [valueAdd(CSNode, String)](#m-valueadd-b812e6b46ea1)
- [warning(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#m-warning-c401f291f7f5) from AbstractXMLtoConfXMLDefaultHandler

**Nested Types**:

- [LeafListEntry](NavuXMLtoConfXMLParamSetHandler/LeafListEntry.md#cls-LeafListEntry)

## Constructors

<a id="m-navuxmltoconfxmlparamsethandler-7c97e46090de"></a>
### NavuXMLtoConfXMLParamSetHandler(CSNode, ConfPath)

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

<a id="m-navuxmltoconfxmlparamsethandler-8e632839436d"></a>
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

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [NavuException](NavuException.md#cls-NavuException)

Constructor that for initializing the handler,
 specialy for handling action/rpc.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node` - Start node (or root Node) of the document
- `com.tailf.conf.ConfPath confPath` - Start path of the document
- `int mode` - one of `#MODE_SET_ACTION_PARAM` or
                     `#MODE_SET_ACTION_RESULT`


## Fields

<a id="m-currLeafListEntry"></a>
### currLeafListEntry

```java
protected com.tailf.navu.NavuXMLtoConfXMLParamSetHandler.LeafListEntry currLeafListEntry = null;
```

Types: [LeafListEntry](NavuXMLtoConfXMLParamSetHandler/LeafListEntry.md#cls-LeafListEntry)

<a id="m-mode"></a>
### mode

```java
protected int mode = null;
```


## Methods

<a id="m-addpreviousleaflist-e6bc9b69ec37"></a>
### addPreviousLeafList()

```java
protected void addPreviousLeafList()
```

<a id="m-addpreviousleaflist-1a8267f58863"></a>
### addPreviousLeafList(CSNode)

```java
protected void addPreviousLeafList(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="m-confxmlparam-334dac9dee1a"></a>
### confXMLParam()

```java
public com.tailf.conf.ConfXMLParam[] confXMLParam()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

Get the generated ConfXMLParam array from the parsed XML-String.

**Returns:** Generated ConfXMLParam()

<a id="m-createleaflistentry-25b4c63a9eb2"></a>
### createLeafListEntry(CSNode)

```java
protected void createLeafListEntry(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="m-doendelement-7d27409d2193"></a>
### doEndElement(String, String, String)

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

<a id="m-dostartelement-d6f6b3ed1adf"></a>
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

Types: [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String uri`
- `String localName`
- `String qName`
- `org.xml.sax.Attributes atts`

<a id="m-enddocument-43add802e87c"></a>
### endDocument()

```java
public void endDocument() throws org.xml.sax.SAXException
```

<a id="m-endelement-bf7b2e1ca7dd"></a>
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

<a id="m-getaccparams-08582887f050"></a>
### getAccParams()

```java
protected java.util.List<com.tailf.conf.ConfXMLParam> getAccParams()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

<a id="m-getcurrleaflistentry-f8b333878b20"></a>
### getCurrLeafListEntry()

```java
protected com.tailf.navu.NavuXMLtoConfXMLParamSetHandler.LeafListEntry getCurrLeafListEntry()
```

Types: [LeafListEntry](NavuXMLtoConfXMLParamSetHandler/LeafListEntry.md#cls-LeafListEntry)

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


## Nested Types

- [LeafListEntry](NavuXMLtoConfXMLParamSetHandler/LeafListEntry.md#cls-LeafListEntry)
