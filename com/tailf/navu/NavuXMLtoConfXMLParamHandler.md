# NavuXMLtoConfXMLParamHandler <a href="#navuxmltoconfxmlparamhandler-2c9b9823361c" id="navuxmltoconfxmlparamhandler-2c9b9823361c"></a>

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

- [confXMLParam()](#confxmlparam-334dac9dee1a)

## Methods

### confXMLParam() <a href="#confxmlparam-334dac9dee1a" id="confxmlparam-334dac9dee1a"></a>

```java
public abstract com.tailf.conf.ConfXMLParam[] confXMLParam()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)
