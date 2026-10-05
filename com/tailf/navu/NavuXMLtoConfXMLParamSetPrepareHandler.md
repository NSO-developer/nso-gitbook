<a id="s-NavuXMLtoConfXMLParamSetPrepareHandler"></a>
# NavuXMLtoConfXMLParamSetPrepareHandler

**Package-private**

```java
class com.tailf.navu.NavuXMLtoConfXMLParamSetPrepareHandler
    extends com.tailf.navu.NavuXMLtoConfXMLParamSetHandler
```

Types: [NavuXMLtoConfXMLParamSetHandler](NavuXMLtoConfXMLParamSetHandler.md#s-NavuXMLtoConfXMLParamSetHandler)

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

- [NavuXMLtoConfXMLParamSetPrepareHandler(CSNode, ConfPath)](#s-NavuXMLtoConfXMLParamSetPrepareHandler-1)

**Fields**:

- [accInfo](AbstractXMLtoConfXMLDefaultHandler.md#s-accInfo) from AbstractXMLtoConfXMLDefaultHandler
- [currLeafListEntry](NavuXMLtoConfXMLParamSetHandler.md#s-currLeafListEntry) from NavuXMLtoConfXMLParamSetHandler
- [depth](AbstractXMLtoConfXMLDefaultHandler.md#s-depth) from AbstractXMLtoConfXMLDefaultHandler
- [info](AbstractXMLtoConfXMLDefaultHandler.md#s-info) from AbstractXMLtoConfXMLDefaultHandler
- [leafListNodes](AbstractXMLtoConfXMLDefaultHandler.md#s-leafListNodes) from AbstractXMLtoConfXMLDefaultHandler
- [locator](AbstractXMLtoConfXMLDefaultHandler.md#s-locator) from AbstractXMLtoConfXMLDefaultHandler
- [mnsMap](AbstractXMLtoConfXMLDefaultHandler.md#s-mnsMap) from AbstractXMLtoConfXMLDefaultHandler
- [mode](NavuXMLtoConfXMLParamSetHandler.md#s-mode) from NavuXMLtoConfXMLParamSetHandler
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
- [addPreviousLeafList()](NavuXMLtoConfXMLParamSetHandler.md#s-addPreviousLeafList) from NavuXMLtoConfXMLParamSetHandler
- [addPreviousLeafList(CSNode)](#s-addPreviousLeafList)
- [addStartElement(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#s-addStartElement) from AbstractXMLtoConfXMLDefaultHandler
- [addValueElement(CSNode, ConfValue)](AbstractXMLtoConfXMLDefaultHandler.md#s-addValueElement) from AbstractXMLtoConfXMLDefaultHandler
- [characters(char[], int, int)](AbstractXMLtoConfXMLDefaultHandler.md#s-characters) from AbstractXMLtoConfXMLDefaultHandler
- [confXMLParam()](NavuXMLtoConfXMLParamSetHandler.md#s-confXMLParam) from NavuXMLtoConfXMLParamSetHandler
- [createLeafListEntry(CSNode)](NavuXMLtoConfXMLParamSetHandler.md#s-createLeafListEntry) from NavuXMLtoConfXMLParamSetHandler
- [doEndElement(String, String, String)](NavuXMLtoConfXMLParamSetHandler.md#s-doEndElement) from NavuXMLtoConfXMLParamSetHandler
- [doStartElement(String, String, String, Attributes)](NavuXMLtoConfXMLParamSetHandler.md#s-doStartElement) from NavuXMLtoConfXMLParamSetHandler
- [empty()](AbstractXMLtoConfXMLDefaultHandler.md#s-empty) from AbstractXMLtoConfXMLDefaultHandler
- [endDocument()](NavuXMLtoConfXMLParamSetHandler.md#s-endDocument) from NavuXMLtoConfXMLParamSetHandler
- [endElement(String, String, String)](NavuXMLtoConfXMLParamSetHandler.md#s-endElement) from NavuXMLtoConfXMLParamSetHandler
- [endPrefixMapping(String)](AbstractXMLtoConfXMLDefaultHandler.md#s-endPrefixMapping) from AbstractXMLtoConfXMLDefaultHandler
- [error(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#s-error) from AbstractXMLtoConfXMLDefaultHandler
- [fatalError(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#s-fatalError) from AbstractXMLtoConfXMLDefaultHandler
- [getAccParams()](NavuXMLtoConfXMLParamSetHandler.md#s-getAccParams) from NavuXMLtoConfXMLParamSetHandler
- [getCSNode2XMLNs(CSNode)](AbstractXMLtoConfXMLDefaultHandler.md#s-getCSNode2XMLNs) from AbstractXMLtoConfXMLDefaultHandler
- [getCurrLeafListEntry()](NavuXMLtoConfXMLParamSetHandler.md#s-getCurrLeafListEntry) from NavuXMLtoConfXMLParamSetHandler
- [getParamInfo()](#s-getParamInfo)
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
- [startElement(String, String, String, Attributes)](NavuXMLtoConfXMLParamSetHandler.md#s-startElement) from NavuXMLtoConfXMLParamSetHandler
- [startPrefixMapping(String, String)](AbstractXMLtoConfXMLDefaultHandler.md#s-startPrefixMapping) from AbstractXMLtoConfXMLDefaultHandler
- [value(CSNode, String)](AbstractXMLtoConfXMLDefaultHandler.md#s-value) from AbstractXMLtoConfXMLDefaultHandler
- [valueAdd(CSNode, String)](#s-valueAdd)
- [warning(SAXParseException)](AbstractXMLtoConfXMLDefaultHandler.md#s-warning) from AbstractXMLtoConfXMLDefaultHandler

## Constructors

<a id="s-NavuXMLtoConfXMLParamSetPrepareHandler-1"></a>
### NavuXMLtoConfXMLParamSetPrepareHandler(CSNode, ConfPath)

**Package-private**

```java
NavuXMLtoConfXMLParamSetPrepareHandler(
    com.tailf.maapi.MaapiSchemas.CSNode n,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [ConfPath](../conf/ConfPath.md#s-ConfPath), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode n`
- `com.tailf.conf.ConfPath path`


## Methods

<a id="s-addPreviousLeafList"></a>
### addPreviousLeafList(CSNode)

```java
protected void addPreviousLeafList(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="s-getParamInfo"></a>
### getParamInfo()

```java
protected java.util.Map<Integer,Object[]> getParamInfo()
```

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
