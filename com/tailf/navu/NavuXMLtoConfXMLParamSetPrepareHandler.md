<a id="cls-NavuXMLtoConfXMLParamSetPrepareHandler"></a>
# NavuXMLtoConfXMLParamSetPrepareHandler

**Package-private**

```java
class com.tailf.navu.NavuXMLtoConfXMLParamSetPrepareHandler
    extends com.tailf.navu.NavuXMLtoConfXMLParamSetHandler
```

Types: [NavuXMLtoConfXMLParamSetHandler](NavuXMLtoConfXMLParamSetHandler.md#cls-NavuXMLtoConfXMLParamSetHandler)

Handler class for SAX Parser. It extends functionallity from
 NavuXMLtoConfXMLSetHandler to handle parametrized values
 (ie. string representation wrapped around xml tags). The parametrized
 values are represented as the string "?" all other strings
 are treated as represenentation of a value and stringToValue() will
 be called.

 If no parametrized values are encountered the handler
 will parse the XML-string as NavuXMLtoConfXMLSetHandler will parse it.

 Validation occures with help of the loaded MaapiSchema which is
 supplied to the constructor.

 The class parses the XML-string to an ConfXMLParam[] and
 accumelates parametrized values into a resulting structure.

 The structure MapInteger,Integer[]> contains information
 of the parametrized values. The key index is the index of
 the paramtrized value ,which starts from 0 as the first index.

 The value object Integer[] contains two values. The first value
 Integer[0] is the index into the ConfXMLParam[] array and
 the second is the index into ConfList if the ConfXMLParamValue
 holds the value of that type otherwise the value is -1.

## Members

**Constructors**:

- [NavuXMLtoConfXMLParamSetPrepareHandler(CSNode, ConfPath)](#m-navuxmltoconfxmlparamsetpreparehandler-c72aeb0372ee)

**Fields**:

- [accInfo](AbstractXMLtoConfXMLDefaultHandler.md#m-accInfo) from AbstractXMLtoConfXMLDefaultHandler
- [currLeafListEntry](NavuXMLtoConfXMLParamSetHandler.md#m-currLeafListEntry) from NavuXMLtoConfXMLParamSetHandler
- [depth](AbstractXMLtoConfXMLDefaultHandler.md#m-depth) from AbstractXMLtoConfXMLDefaultHandler
- [info](AbstractXMLtoConfXMLDefaultHandler.md#m-info) from AbstractXMLtoConfXMLDefaultHandler
- [leafListNodes](AbstractXMLtoConfXMLDefaultHandler.md#m-leafListNodes) from AbstractXMLtoConfXMLDefaultHandler
- [locator](AbstractXMLtoConfXMLDefaultHandler.md#m-locator) from AbstractXMLtoConfXMLDefaultHandler
- [mnsMap](AbstractXMLtoConfXMLDefaultHandler.md#m-mnsMap) from AbstractXMLtoConfXMLDefaultHandler
- [mode](NavuXMLtoConfXMLParamSetHandler.md#m-mode) from NavuXMLtoConfXMLParamSetHandler
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
- [addPreviousLeafList()](NavuXMLtoConfXMLParamSetHandler.md#m-addpreviousleaflist-e6bc9b69ec37) from NavuXMLtoConfXMLParamSetHandler
- [addPreviousLeafList(CSNode)](#m-addpreviousleaflist-1a8267f58863)
- [addStartElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-addstartelement-681f3ec123d7) from AbstractXMLtoConfXMLDefaultHandler
- [addValueElement(CSNode, ConfValue)](AbstractXMLtoConfXMLDefaultHandler.md#m-addvalueelement-d6cd0992363c) from AbstractXMLtoConfXMLDefaultHandler
- [characters(char[], int, int)](AbstractXMLtoConfXMLDefaultHandler.md#m-characters-54e61cfbbafb) from AbstractXMLtoConfXMLDefaultHandler
- [confXMLParam()](NavuXMLtoConfXMLParamSetHandler.md#m-confxmlparam-334dac9dee1a) from NavuXMLtoConfXMLParamSetHandler
- [createLeafListEntry(CSNode)](NavuXMLtoConfXMLParamSetHandler.md#m-createleaflistentry-25b4c63a9eb2) from NavuXMLtoConfXMLParamSetHandler
- [doEndElement(String, String, String)](NavuXMLtoConfXMLParamSetHandler.md#m-doendelement-7d27409d2193) from NavuXMLtoConfXMLParamSetHandler
- [doStartElement(String, String, String, Attributes)](NavuXMLtoConfXMLParamSetHandler.md#m-dostartelement-d6f6b3ed1adf) from NavuXMLtoConfXMLParamSetHandler
- [empty()](AbstractXMLtoConfXMLDefaultHandler.md#m-empty-83bc141ca576) from AbstractXMLtoConfXMLDefaultHandler
- [endDocument()](NavuXMLtoConfXMLParamSetHandler.md#m-enddocument-43add802e87c) from NavuXMLtoConfXMLParamSetHandler
- [endElement(String, String, String)](NavuXMLtoConfXMLParamSetHandler.md#m-endelement-bf7b2e1ca7dd) from NavuXMLtoConfXMLParamSetHandler
- [endPrefixMapping(String)](AbstractXMLtoConfXMLDefaultHandler.md#m-endprefixmapping-e148849915f0) from AbstractXMLtoConfXMLDefaultHandler
- [error(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#m-error-a853f81b7a9c) from AbstractXMLtoConfXMLDefaultHandler
- [fatalError(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#m-fatalerror-c264673a9faf) from AbstractXMLtoConfXMLDefaultHandler
- [getAccParams()](NavuXMLtoConfXMLParamSetHandler.md#m-getaccparams-08582887f050) from NavuXMLtoConfXMLParamSetHandler
- [getCSNode2XMLNs(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#m-getcsnode2xmlns-bedb63844216) from AbstractXMLtoConfXMLDefaultHandler
- [getCurrLeafListEntry()](NavuXMLtoConfXMLParamSetHandler.md#m-getcurrleaflistentry-f8b333878b20) from NavuXMLtoConfXMLParamSetHandler
- [getParamInfo()](#m-getparaminfo-8de3a9a50978)
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
- [startElement(String, String, String, Attributes)](NavuXMLtoConfXMLParamSetHandler.md#m-startelement-03aa11bd6db7) from NavuXMLtoConfXMLParamSetHandler
- [startPrefixMapping(String, String)](AbstractXMLtoConfXMLDefaultHandler.md#m-startprefixmapping-e3d43dbd7ed4) from AbstractXMLtoConfXMLDefaultHandler
- [value(CSNode, String)](AbstractXMLtoConfXMLDefaultHandler.md#m-value-49c56559602a) from AbstractXMLtoConfXMLDefaultHandler
- [valueAdd(CSNode, String)](#m-valueadd-b812e6b46ea1)
- [warning(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#m-warning-c401f291f7f5) from AbstractXMLtoConfXMLDefaultHandler

## Constructors

<a id="m-navuxmltoconfxmlparamsetpreparehandler-c72aeb0372ee"></a>
### NavuXMLtoConfXMLParamSetPrepareHandler(CSNode, ConfPath)

**Package-private**

```java
NavuXMLtoConfXMLParamSetPrepareHandler(
    com.tailf.maapi.MaapiSchemas.CSNode n,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode n`
- `com.tailf.conf.ConfPath path`


## Methods

<a id="m-addpreviousleaflist-1a8267f58863"></a>
### addPreviousLeafList(CSNode)

```java
protected void addPreviousLeafList(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="m-getparaminfo-8de3a9a50978"></a>
### getParamInfo()

```java
protected java.util.Map<Integer,Object[]> getParamInfo()
```

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
