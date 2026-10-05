# NavuXMLtoConfXMLParamSetPrepareHandler <a href="#navuxmltoconfxmlparamsetpreparehandler-fa4631e01f27" id="navuxmltoconfxmlparamsetpreparehandler-fa4631e01f27"></a>

**Package-private**

```java
class com.tailf.navu.NavuXMLtoConfXMLParamSetPrepareHandler
    extends com.tailf.navu.NavuXMLtoConfXMLParamSetHandler
```

Types: [NavuXMLtoConfXMLParamSetHandler](NavuXMLtoConfXMLParamSetHandler.md#navuxmltoconfxmlparamsethandler-1ff1b1b00b63)

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

- [NavuXMLtoConfXMLParamSetPrepareHandler(CSNode, ConfPath)](#navuxmltoconfxmlparamsetpreparehandler-c72aeb0372ee)

**Fields**:

- [accInfo](AbstractXMLtoConfXMLDefaultHandler.md#accinfo-d608938eea2d) from AbstractXMLtoConfXMLDefaultHandler
- [currLeafListEntry](NavuXMLtoConfXMLParamSetHandler.md#currleaflistentry-719f5e66ce9d) from NavuXMLtoConfXMLParamSetHandler
- [depth](AbstractXMLtoConfXMLDefaultHandler.md#depth-38add9e42439) from AbstractXMLtoConfXMLDefaultHandler
- [info](AbstractXMLtoConfXMLDefaultHandler.md#info-0e3cf5dd73b2) from AbstractXMLtoConfXMLDefaultHandler
- [leafListNodes](AbstractXMLtoConfXMLDefaultHandler.md#leaflistnodes-4e2b95fdbb97) from AbstractXMLtoConfXMLDefaultHandler
- [locator](AbstractXMLtoConfXMLDefaultHandler.md#locator-2d676cc26d04) from AbstractXMLtoConfXMLDefaultHandler
- [mnsMap](AbstractXMLtoConfXMLDefaultHandler.md#mnsmap-152d5ee77450) from AbstractXMLtoConfXMLDefaultHandler
- [mode](NavuXMLtoConfXMLParamSetHandler.md#mode-7101d9fa40de) from NavuXMLtoConfXMLParamSetHandler
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
- [addPreviousLeafList()](NavuXMLtoConfXMLParamSetHandler.md#addpreviousleaflist-e6bc9b69ec37) from NavuXMLtoConfXMLParamSetHandler
- [addPreviousLeafList(CSNode)](#addpreviousleaflist-1a8267f58863)
- [addStartElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#addstartelement-681f3ec123d7) from AbstractXMLtoConfXMLDefaultHandler
- [addValueElement(CSNode, ConfValue)](AbstractXMLtoConfXMLDefaultHandler.md#addvalueelement-d6cd0992363c) from AbstractXMLtoConfXMLDefaultHandler
- [characters(char[], int, int)](AbstractXMLtoConfXMLDefaultHandler.md#characters-54e61cfbbafb) from AbstractXMLtoConfXMLDefaultHandler
- [confXMLParam()](NavuXMLtoConfXMLParamSetHandler.md#confxmlparam-334dac9dee1a) from NavuXMLtoConfXMLParamSetHandler
- [createLeafListEntry(CSNode)](NavuXMLtoConfXMLParamSetHandler.md#createleaflistentry-25b4c63a9eb2) from NavuXMLtoConfXMLParamSetHandler
- [doEndElement(String, String, String)](NavuXMLtoConfXMLParamSetHandler.md#doendelement-7d27409d2193) from NavuXMLtoConfXMLParamSetHandler
- [doStartElement(String, String, String, Attributes)](NavuXMLtoConfXMLParamSetHandler.md#dostartelement-d6f6b3ed1adf) from NavuXMLtoConfXMLParamSetHandler
- [empty()](AbstractXMLtoConfXMLDefaultHandler.md#empty-83bc141ca576) from AbstractXMLtoConfXMLDefaultHandler
- [endDocument()](NavuXMLtoConfXMLParamSetHandler.md#enddocument-43add802e87c) from NavuXMLtoConfXMLParamSetHandler
- [endElement(String, String, String)](NavuXMLtoConfXMLParamSetHandler.md#endelement-bf7b2e1ca7dd) from NavuXMLtoConfXMLParamSetHandler
- [endPrefixMapping(String)](AbstractXMLtoConfXMLDefaultHandler.md#endprefixmapping-e148849915f0) from AbstractXMLtoConfXMLDefaultHandler
- [error(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#error-a853f81b7a9c) from AbstractXMLtoConfXMLDefaultHandler
- [fatalError(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#fatalerror-c264673a9faf) from AbstractXMLtoConfXMLDefaultHandler
- [getAccParams()](NavuXMLtoConfXMLParamSetHandler.md#getaccparams-08582887f050) from NavuXMLtoConfXMLParamSetHandler
- [getCSNode2XMLNs(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#getcsnode2xmlns-bedb63844216) from AbstractXMLtoConfXMLDefaultHandler
- [getCurrLeafListEntry()](NavuXMLtoConfXMLParamSetHandler.md#getcurrleaflistentry-f8b333878b20) from NavuXMLtoConfXMLParamSetHandler
- [getParamInfo()](#getparaminfo-8de3a9a50978)
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
- [startElement(String, String, String, Attributes)](NavuXMLtoConfXMLParamSetHandler.md#startelement-03aa11bd6db7) from NavuXMLtoConfXMLParamSetHandler
- [startPrefixMapping(String, String)](AbstractXMLtoConfXMLDefaultHandler.md#startprefixmapping-e3d43dbd7ed4) from AbstractXMLtoConfXMLDefaultHandler
- [value(CSNode, String)](AbstractXMLtoConfXMLDefaultHandler.md#value-49c56559602a) from AbstractXMLtoConfXMLDefaultHandler
- [valueAdd(CSNode, String)](#valueadd-b812e6b46ea1)
- [warning(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#warning-c401f291f7f5) from AbstractXMLtoConfXMLDefaultHandler

## Constructors

### NavuXMLtoConfXMLParamSetPrepareHandler(CSNode, ConfPath) <a href="#navuxmltoconfxmlparamsetpreparehandler-c72aeb0372ee" id="navuxmltoconfxmlparamsetpreparehandler-c72aeb0372ee"></a>

**Package-private**

```java
NavuXMLtoConfXMLParamSetPrepareHandler(
    com.tailf.maapi.MaapiSchemas.CSNode n,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode n`
- `com.tailf.conf.ConfPath path`


## Methods

### addPreviousLeafList(CSNode) <a href="#addpreviousleaflist-1a8267f58863" id="addpreviousleaflist-1a8267f58863"></a>

```java
protected void addPreviousLeafList(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### getParamInfo() <a href="#getparaminfo-8de3a9a50978" id="getparaminfo-8de3a9a50978"></a>

```java
protected java.util.Map<Integer,Object[]> getParamInfo()
```

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
