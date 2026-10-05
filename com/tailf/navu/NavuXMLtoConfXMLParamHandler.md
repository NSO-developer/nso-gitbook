<a id="cls-NavuXMLtoConfXMLParamHandler"></a>
# NavuXMLtoConfXMLParamHandler

**Package-private**

```java
interface com.tailf.navu.NavuXMLtoConfXMLParamHandler
```

Handler class for SAX Parser. Contains callback methods
 that invokes by the (SAX) parser. The callback methods
 validates and creates ConfXMLParam from the parsed
 XML document. Validation occures with help of the
 loaded MaapiSchema.

## Members

**Methods**:

- [confXMLParam()](#m-confxmlparam-334dac9dee1a)

## Methods

<a id="m-confxmlparam-334dac9dee1a"></a>
### confXMLParam()

```java
public abstract com.tailf.conf.ConfXMLParam[] confXMLParam()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)
