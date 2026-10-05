# NavuXMLtoConfXMLParamHandler <a href="#cls-NavuXMLtoConfXMLParamHandler" id="cls-NavuXMLtoConfXMLParamHandler"></a>

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

- [confXMLParam()](#m-confXMLParam-334dac9dee1a)

## Methods

### confXMLParam() <a href="#m-confXMLParam-334dac9dee1a" id="m-confXMLParam-334dac9dee1a"></a>

```java
public abstract com.tailf.conf.ConfXMLParam[] confXMLParam()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)
