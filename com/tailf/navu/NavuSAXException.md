<a id="s-NavuSAXException"></a>
# NavuSAXException

**Package-private**

```java
class com.tailf.navu.NavuSAXException
    extends com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

## Members

**Constructors**:

- [NavuSAXException(String, SAXException)](#s-NavuSAXException-1)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#s-getErrorCode) from ConfException
- [getOpaque()](../conf/ConfException.md#s-getOpaque) from ConfException
- [getSAXException()](#s-getSAXException)
- [mk(ConfResponse)](NavuException.md#s-mk) from NavuException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#s-mk-1) from ConfException

## Constructors

<a id="s-NavuSAXException-1"></a>
### NavuSAXException(String, SAXException)

**Package-private**

```java
NavuSAXException(String msg, org.xml.sax.SAXException saxException)
```

**Parameters**

- `String msg`
- `org.xml.sax.SAXException saxException`


## Methods

<a id="s-getSAXException"></a>
### getSAXException()

```java
public org.xml.sax.SAXException getSAXException()
```
