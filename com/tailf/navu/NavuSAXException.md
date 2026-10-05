<a id="cls-NavuSAXException"></a>
# NavuSAXException

**Package-private**

```java
class com.tailf.navu.NavuSAXException
    extends com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

## Members

**Constructors**:

- [NavuSAXException(String, SAXException)](#m-navusaxexception-5b8a9661fa1c)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getopaque-92e4945ec92d) from ConfException
- [getSAXException()](#m-getsaxexception-20e1692a4a2c)
- [mk(ConfResponse)](NavuException.md#m-mk-de1cedfc6ea8) from NavuException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

<a id="m-navusaxexception-5b8a9661fa1c"></a>
### NavuSAXException(String, SAXException)

**Package-private**

```java
NavuSAXException(String msg, org.xml.sax.SAXException saxException)
```

**Parameters**

- `String msg`
- `org.xml.sax.SAXException saxException`


## Methods

<a id="m-getsaxexception-20e1692a4a2c"></a>
### getSAXException()

```java
public org.xml.sax.SAXException getSAXException()
```
