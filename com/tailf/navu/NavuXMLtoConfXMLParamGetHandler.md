# NavuXMLtoConfXMLParamGetHandler <a href="#navuxmltoconfxmlparamgethandler-2a1e3a3c3efc" id="navuxmltoconfxmlparamgethandler-2a1e3a3c3efc"></a>

**Package-private**

```java
class com.tailf.navu.NavuXMLtoConfXMLParamGetHandler
    extends com.tailf.navu.AbstractXMLtoConfXMLDefaultHandler
    implements com.tailf.navu.NavuXMLtoConfXMLParamHandler
```

Types: [AbstractXMLtoConfXMLDefaultHandler](AbstractXMLtoConfXMLDefaultHandler.md#abstractxmltoconfxmldefaulthandler-e8abaaf7c43d), [NavuXMLtoConfXMLParamHandler](NavuXMLtoConfXMLParamHandler.md#navuxmltoconfxmlparamhandler-2c9b9823361c)

Handler class for SAX Parser. Contains callback methods
 that invokes by the (SAX) parser. The callback methods
 validates and creates ConfXMLParam from the parsed
 XML document. Validation occures with help of the
 loaded MaapiSchema.

## Members

**Constructors**:

- [NavuXMLtoConfXMLParamGetHandler(CSNode, ConfPath)](#navuxmltoconfxmlparamgethandler-c0166b30bff6)

**Fields**:

- [accInfo](AbstractXMLtoConfXMLDefaultHandler.md#accinfo-d608938eea2d) from AbstractXMLtoConfXMLDefaultHandler
- [depth](AbstractXMLtoConfXMLDefaultHandler.md#depth-38add9e42439) from AbstractXMLtoConfXMLDefaultHandler
- [info](AbstractXMLtoConfXMLDefaultHandler.md#info-0e3cf5dd73b2) from AbstractXMLtoConfXMLDefaultHandler
- [leafListNodes](AbstractXMLtoConfXMLDefaultHandler.md#leaflistnodes-4e2b95fdbb97) from AbstractXMLtoConfXMLDefaultHandler
- [locator](AbstractXMLtoConfXMLDefaultHandler.md#locator-2d676cc26d04) from AbstractXMLtoConfXMLDefaultHandler
- [mnsMap](AbstractXMLtoConfXMLDefaultHandler.md#mnsmap-152d5ee77450) from AbstractXMLtoConfXMLDefaultHandler
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
- [addStartElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#addstartelement-681f3ec123d7) from AbstractXMLtoConfXMLDefaultHandler
- [addValueElement(CSNode, ConfValue)](AbstractXMLtoConfXMLDefaultHandler.md#addvalueelement-d6cd0992363c) from AbstractXMLtoConfXMLDefaultHandler
- [characters(char[], int, int)](#characters-54e61cfbbafb)
- [confXMLParam()](#confxmlparam-334dac9dee1a)
- [empty()](AbstractXMLtoConfXMLDefaultHandler.md#empty-83bc141ca576) from AbstractXMLtoConfXMLDefaultHandler
- [endDocument()](AbstractXMLtoConfXMLDefaultHandler.md#enddocument-43add802e87c) from AbstractXMLtoConfXMLDefaultHandler
- [endElement(String, String, String)](#endelement-bf7b2e1ca7dd)
- [endPrefixMapping(String)](AbstractXMLtoConfXMLDefaultHandler.md#endprefixmapping-e148849915f0) from AbstractXMLtoConfXMLDefaultHandler
- [error(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#error-a853f81b7a9c) from AbstractXMLtoConfXMLDefaultHandler
- [fatalError(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#fatalerror-c264673a9faf) from AbstractXMLtoConfXMLDefaultHandler
- [getCSNode2XMLNs(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#getcsnode2xmlns-bedb63844216) from AbstractXMLtoConfXMLDefaultHandler
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
- [valueAdd(CSNode, String)](AbstractXMLtoConfXMLDefaultHandler.md#valueadd-b812e6b46ea1) from AbstractXMLtoConfXMLDefaultHandler
- [warning(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#warning-c401f291f7f5) from AbstractXMLtoConfXMLDefaultHandler

## Constructors

### NavuXMLtoConfXMLParamGetHandler(CSNode, ConfPath) <a href="#navuxmltoconfxmlparamgethandler-c0166b30bff6" id="navuxmltoconfxmlparamgethandler-c0166b30bff6"></a>

**Package-private**

```java
NavuXMLtoConfXMLParamGetHandler(
    com.tailf.maapi.MaapiSchemas.CSNode n,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Constructor that for initializing the handler.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode n` - Start node (or root Node) of the document
- `com.tailf.conf.ConfPath path`


## Methods

### characters(char[], int, int) <a href="#characters-54e61cfbbafb" id="characters-54e61cfbbafb"></a>

```java
public void characters(char[] pCh, int pStart, int pLength) throws org.xml.sax.SAXException
```

**Parameters**

- `char[] pCh`
- `int pStart`
- `int pLength`

### confXMLParam() <a href="#confxmlparam-334dac9dee1a" id="confxmlparam-334dac9dee1a"></a>

```java
public com.tailf.conf.ConfXMLParam[] confXMLParam()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)

### endElement(String, String, String) <a href="#endelement-bf7b2e1ca7dd" id="endelement-bf7b2e1ca7dd"></a>

```java
public void endElement(String uri, String localName, String qName) throws org.xml.sax.SAXException
```

The callback methods that SAX Parser will call
 when it encounters a ending tag.

**Parameters**

- `String uri`
- `String localName`
- `String qName`

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
 invoked.

**Parameters**

- `String uri`
- `String localName`
- `String qName`
- `org.xml.sax.Attributes atts`
