# NavuSAXException <a href="#cls-NavuSAXException" id="cls-NavuSAXException"></a>

**Package-private**

```java
class com.tailf.navu.NavuSAXException
    extends com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

## Members

**Constructors**:

- [NavuSAXException(String, SAXException)](#m-NavuSAXException-5b8a9661fa1c)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-getErrorCode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getOpaque-92e4945ec92d) from ConfException
- [getSAXException()](#m-getSAXException-20e1692a4a2c)
- [mk(ConfResponse)](NavuException.md#m-mk-de1cedfc6ea8) from NavuException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

### NavuSAXException(String, SAXException) <a href="#m-NavuSAXException-5b8a9661fa1c" id="m-NavuSAXException-5b8a9661fa1c"></a>

**Package-private**

```java
NavuSAXException(String msg, org.xml.sax.SAXException saxException)
```

**Parameters**

- `String msg`
- `org.xml.sax.SAXException saxException`


## Methods

### getSAXException() <a href="#m-getSAXException-20e1692a4a2c" id="m-getSAXException-20e1692a4a2c"></a>

```java
public org.xml.sax.SAXException getSAXException()
```
