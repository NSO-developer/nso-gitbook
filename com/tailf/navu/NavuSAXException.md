# NavuSAXException <a href="#navusaxexception-11da52982a79" id="navusaxexception-11da52982a79"></a>

**Package-private**

```java
class com.tailf.navu.NavuSAXException
    extends com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

## Members

**Constructors**:

- [NavuSAXException\(String, SAXException\)](#navusaxexception-5b8a9661fa1c)

**Methods**:

- [getErrorCode\(\)](../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getOpaque\(\)](../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [getSAXException\(\)](#getsaxexception-20e1692a4a2c)
- [mk\(ConfResponse\)](NavuException.md#mk-de1cedfc6ea8) from NavuException
- [mk\(ConfResponse, ConfPath\)](../conf/ConfException.md#mk-79e69ffbc022) from ConfException

## Constructors

### NavuSAXException(String, SAXException) <a href="#navusaxexception-5b8a9661fa1c" id="navusaxexception-5b8a9661fa1c"></a>

**Package-private**

```java
NavuSAXException(String msg, org.xml.sax.SAXException saxException)
```

**Parameters**

- `String msg`
- `org.xml.sax.SAXException saxException`


## Methods

### getSAXException() <a href="#getsaxexception-20e1692a4a2c" id="getsaxexception-20e1692a4a2c"></a>

```java
public org.xml.sax.SAXException getSAXException()
```
