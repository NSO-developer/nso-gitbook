# NavuXMLtoConfXMLParamSetHandler <a href="#navuxmltoconfxmlparamsethandler-1ff1b1b00b63" id="navuxmltoconfxmlparamsethandler-1ff1b1b00b63"></a>

**Package-private**

```java
class com.tailf.navu.NavuXMLtoConfXMLParamSetHandler
    extends com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler
    implements com.tailf.navu.NavuXMLtoConfXMLParamHandler
```

Types: [AbstractXMLtoConfXMLDefaultHandler](AbstractXMLtoConfXMLDefaultHandler.md#abstractxmltoconfxmldefaulthandler-e8abaaf7c43d), [NavuXMLtoConfXMLParamHandler](NavuXMLtoConfXMLParamHandler.md#navuxmltoconfxmlparamhandler-2c9b9823361c)

Handler class for SAX Parser. Contains callback methods that invokes by the
 (SAX) parser. The callback methods validates and creates ConfXMLParam[] from
 the parsed XML document. Validation is performed with help of the
 loaded MaapiSchema.

**Related classes**

- [NavuXMLtoConfXMLParamSetPrepareHandler](NavuXMLtoConfXMLParamSetPrepareHandler.md#navuxmltoconfxmlparamsetpreparehandler-fa4631e01f27)

## Members

**Constructors**:

- [NavuXMLtoConfXMLParamSetHandler(CSNode, ConfPath)](#navuxmltoconfxmlparamsethandler-7c97e46090de)
- [NavuXMLtoConfXMLParamSetHandler(CSNode, ConfPath, int)](#navuxmltoconfxmlparamsethandler-8e632839436d)

**Fields**:

- [accInfo](AbstractXMLtoConfXMLDefaultHandler.md#accinfo-d608938eea2d) from AbstractXMLtoConfXMLDefaultHandler
- [currLeafListEntry](#currleaflistentry-719f5e66ce9d)
- [depth](AbstractXMLtoConfXMLDefaultHandler.md#depth-38add9e42439) from AbstractXMLtoConfXMLDefaultHandler
- [info](AbstractXMLtoConfXMLDefaultHandler.md#info-0e3cf5dd73b2) from AbstractXMLtoConfXMLDefaultHandler
- [leafListNodes](AbstractXMLtoConfXMLDefaultHandler.md#leaflistnodes-4e2b95fdbb97) from AbstractXMLtoConfXMLDefaultHandler
- [locator](AbstractXMLtoConfXMLDefaultHandler.md#locator-2d676cc26d04) from AbstractXMLtoConfXMLDefaultHandler
- [mnsMap](AbstractXMLtoConfXMLDefaultHandler.md#mnsmap-152d5ee77450) from AbstractXMLtoConfXMLDefaultHandler
- [mode](#mode-7101d9fa40de)
- [nsPrefixMap](AbstractXMLtoConfXMLDefaultHandler.md#nsprefixmap-52c6c2f900b7) from AbstractXMLtoConfXMLDefaultHandler
- [nsStack](AbstractXMLtoConfXMLDefaultHandler.md#nsstack-4fe0ea3d668b) from AbstractXMLtoConfXMLDefaultHandler
- [params](AbstractXMLtoConfXMLDefaultHandler.md#params-989efee474a0) from AbstractXMLtoConfXMLDefaultHandler
- [path](AbstractXMLtoConfXMLDefaultHandler.md#path-d27aef81ec30) from AbstractXMLtoConfXMLDefaultHandler
- [pathNodes](AbstractXMLtoConfXMLDefaultHandler.md#pathnodes-3d4b2754b544) from AbstractXMLtoConfXMLDefaultHandler
- [pathStack](AbstractXMLtoConfXMLDefaultHandler.md#pathstack-50dad8efbd54) from AbstractXMLtoConfXMLDefaultHandler
- [schemas](AbstractXMLtoConfXMLDefaultHandler.md#schemas-d9de6465eb56) from AbstractXMLtoConfXMLDefaultHandler
- [stack](AbstractXMLtoConfXMLDefaultHandler.md#stack-e1234a745f90) from AbstractXMLtoConfXMLDefaultHandler
- [startNode](AbstractXMLtoConfXMLDefaultHandler.md#startnode-0956dedfa6c3) from AbstractXMLtoConfXMLDefaultHandler

**Methods**:

- [accumulateChars(CSNode, String)](AbstractXMLtoConfXMLDefaultHandler.md#accumulatechars-913e3d2e13f2) from AbstractXMLtoConfXMLDefaultHandler
- [addAccumulateChars()](AbstractXMLtoConfXMLDefaultHandler.md#addaccumulatechars-be9ee6eba176) from AbstractXMLtoConfXMLDefaultHandler
- [addEndElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#addendelement-a46a4eac513e) from AbstractXMLtoConfXMLDefaultHandler
- [addLeafElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#addleafelement-19b72d17e396) from AbstractXMLtoConfXMLDefaultHandler
- [addLeafList()](AbstractXMLtoConfXMLDefaultHandler.md#addleaflist-742766162951) from AbstractXMLtoConfXMLDefaultHandler
- [addPreviousLeafList()](#addpreviousleaflist-e6bc9b69ec37)
- [addPreviousLeafList(CSNode)](#addpreviousleaflist-1a8267f58863)
- [addStartElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#addstartelement-681f3ec123d7) from AbstractXMLtoConfXMLDefaultHandler
- [addValueElement(CSNode, ConfValue)](AbstractXMLtoConfXMLDefaultHandler.md#addvalueelement-d6cd0992363c) from AbstractXMLtoConfXMLDefaultHandler
- [characters(char[], int, int)](AbstractXMLtoConfXMLDefaultHandler.md#characters-54e61cfbbafb) from AbstractXMLtoConfXMLDefaultHandler
- [confXMLParam()](#confxmlparam-334dac9dee1a)
- [createLeafListEntry(CSNode)](#createleaflistentry-25b4c63a9eb2)
- [doEndElement(String, String, String)](#doendelement-7d27409d2193)
- [doStartElement(String, String, String, Attributes)](#dostartelement-d6f6b3ed1adf)
- [empty()](AbstractXMLtoConfXMLDefaultHandler.md#empty-83bc141ca576) from AbstractXMLtoConfXMLDefaultHandler
- [endDocument()](#enddocument-43add802e87c)
- [endElement(String, String, String)](#endelement-bf7b2e1ca7dd)
- [endPrefixMapping(String)](AbstractXMLtoConfXMLDefaultHandler.md#endprefixmapping-e148849915f0) from AbstractXMLtoConfXMLDefaultHandler
- [error(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#error-a853f81b7a9c) from AbstractXMLtoConfXMLDefaultHandler
- [fatalError(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#fatalerror-c264673a9faf) from AbstractXMLtoConfXMLDefaultHandler
- [getAccParams()](#getaccparams-08582887f050)
- [getCSNode2XMLNs(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#getcsnode2xmlns-bedb63844216) from AbstractXMLtoConfXMLDefaultHandler
- [getCurrLeafListEntry()](#getcurrleaflistentry-f8b333878b20)
- [ignorableWhitespace(char[], int, int)](AbstractXMLtoConfXMLDefaultHandler.md#ignorablewhitespace-175d27978a6d) from AbstractXMLtoConfXMLDefaultHandler
- [isContainmentElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#iscontainmentelement-c7d16abe6bc1) from AbstractXMLtoConfXMLDefaultHandler
- [isEmptyCharacter(String)](AbstractXMLtoConfXMLDefaultHandler.md#isemptycharacter-7210ff4039cc) from AbstractXMLtoConfXMLDefaultHandler
- [isEqual(QName, CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#isequal-3d9c7ac2a95d) from AbstractXMLtoConfXMLDefaultHandler
- [peek()](AbstractXMLtoConfXMLDefaultHandler.md#peek-a38eaaf8a6a7) from AbstractXMLtoConfXMLDefaultHandler
- [pop()](AbstractXMLtoConfXMLDefaultHandler.md#pop-1c15fa891a07) from AbstractXMLtoConfXMLDefaultHandler
- [processingInstruction(String, String)](AbstractXMLtoConfXMLDefaultHandler.md#processinginstruction-e290a99e8a1d) from AbstractXMLtoConfXMLDefaultHandler
- [push(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#push-73f33d05b8a4) from AbstractXMLtoConfXMLDefaultHandler
- [setDocumentLocator(Locator)](AbstractXMLtoConfXMLDefaultHandler.md#setdocumentlocator-d9bd10e8b8ad) from AbstractXMLtoConfXMLDefaultHandler
- [startDocument()](AbstractXMLtoConfXMLDefaultHandler.md#startdocument-aca8d484cffb) from AbstractXMLtoConfXMLDefaultHandler
- [startElement(String, String, String, Attributes)](#startelement-03aa11bd6db7)
- [startPrefixMapping(String, String)](AbstractXMLtoConfXMLDefaultHandler.md#startprefixmapping-e3d43dbd7ed4) from AbstractXMLtoConfXMLDefaultHandler
- [value(CSNode, String)](AbstractXMLtoConfXMLDefaultHandler.md#value-49c56559602a) from AbstractXMLtoConfXMLDefaultHandler
- [valueAdd(CSNode, String)](#valueadd-b812e6b46ea1)
- [warning(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#warning-c401f291f7f5) from AbstractXMLtoConfXMLDefaultHandler

**Nested Types**:

- [LeafListEntry](NavuXMLtoConfXMLParamSetHandler/LeafListEntry.md#leaflistentry-6e9f05db5809)

## Constructors

### NavuXMLtoConfXMLParamSetHandler(CSNode, ConfPath) <a href="#navuxmltoconfxmlparamsethandler-7c97e46090de" id="navuxmltoconfxmlparamsethandler-7c97e46090de"></a>

**Package-private**

```java
NavuXMLtoConfXMLParamSetHandler(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfPath confPath
)
    throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Constructor for initializing the handler.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node` - Start node (or root Node) of the document
- `com.tailf.conf.ConfPath confPath` - Start path of the document

### NavuXMLtoConfXMLParamSetHandler(CSNode, ConfPath, int) <a href="#navuxmltoconfxmlparamsethandler-8e632839436d" id="navuxmltoconfxmlparamsethandler-8e632839436d"></a>

**Package-private**

```java
NavuXMLtoConfXMLParamSetHandler(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfPath confPath,
    int mode
)
    throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Constructor that for initializing the handler,
 specialy for handling action/rpc.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node` - Start node (or root Node) of the document
- `com.tailf.conf.ConfPath confPath` - Start path of the document
- `int mode` - one of `MODE_SET_ACTION_PARAM` or
                     `MODE_SET_ACTION_RESULT`


## Fields

### currLeafListEntry <a href="#currleaflistentry-719f5e66ce9d" id="currleaflistentry-719f5e66ce9d"></a>

```java
protected com.tailf.navu.NavuXMLtoConfXMLParamSetHandler.LeafListEntry currLeafListEntry = null;
```

Types: [LeafListEntry](NavuXMLtoConfXMLParamSetHandler/LeafListEntry.md#leaflistentry-6e9f05db5809)

### mode <a href="#mode-7101d9fa40de" id="mode-7101d9fa40de"></a>

```java
protected int mode = null;
```


## Methods

### addPreviousLeafList() <a href="#addpreviousleaflist-e6bc9b69ec37" id="addpreviousleaflist-e6bc9b69ec37"></a>

```java
protected void addPreviousLeafList()
```

### addPreviousLeafList(CSNode) <a href="#addpreviousleaflist-1a8267f58863" id="addpreviousleaflist-1a8267f58863"></a>

```java
protected void addPreviousLeafList(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### confXMLParam() <a href="#confxmlparam-334dac9dee1a" id="confxmlparam-334dac9dee1a"></a>

```java
public com.tailf.conf.ConfXMLParam[] confXMLParam()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)

Get the generated ConfXMLParam array from the parsed XML-String.

**Returns:** Generated ConfXMLParam()

### createLeafListEntry(CSNode) <a href="#createleaflistentry-25b4c63a9eb2" id="createleaflistentry-25b4c63a9eb2"></a>

```java
protected void createLeafListEntry(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### doEndElement(String, String, String) <a href="#doendelement-7d27409d2193" id="doendelement-7d27409d2193"></a>

```java
public void doEndElement(
    String uri,
    String localName,
    String qName
)
    throws org.xml.sax.SAXException, com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `String uri`
- `String localName`
- `String qName`

### doStartElement(String, String, String, Attributes) <a href="#dostartelement-d6f6b3ed1adf" id="dostartelement-d6f6b3ed1adf"></a>

```java
public void doStartElement(
    String uri,
    String localName,
    String qName,
    org.xml.sax.Attributes atts
)
    throws org.xml.sax.SAXException, com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `String uri`
- `String localName`
- `String qName`
- `org.xml.sax.Attributes atts`

### endDocument() <a href="#enddocument-43add802e87c" id="enddocument-43add802e87c"></a>

```java
public void endDocument() throws org.xml.sax.SAXException
```

### endElement(String, String, String) <a href="#endelement-bf7b2e1ca7dd" id="endelement-bf7b2e1ca7dd"></a>

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

### getAccParams() <a href="#getaccparams-08582887f050" id="getaccparams-08582887f050"></a>

```java
protected java.util.List<com.tailf.conf.ConfXMLParam> getAccParams()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)

### getCurrLeafListEntry() <a href="#getcurrleaflistentry-f8b333878b20" id="getcurrleaflistentry-f8b333878b20"></a>

```java
protected com.tailf.navu.NavuXMLtoConfXMLParamSetHandler.LeafListEntry getCurrLeafListEntry()
```

Types: [LeafListEntry](NavuXMLtoConfXMLParamSetHandler/LeafListEntry.md#leaflistentry-6e9f05db5809)

### startElement(String, String, String, Attributes) <a href="#startelement-03aa11bd6db7" id="startelement-03aa11bd6db7"></a>

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


## Nested Types

- [LeafListEntry](NavuXMLtoConfXMLParamSetHandler/LeafListEntry.md#leaflistentry-6e9f05db5809)
