<a id="s-XMLtoConfXMLParam"></a>
# XMLtoConfXMLParam

```java
public class com.tailf.util.XMLtoConfXMLParam
```

Convenience utility class for transformation from
  a XML String to a ConfXMLParam[] structure.

 Handler class for SAX Parser. Contains callback methods
 that invokes by the (SAX) parser. The callback methods
 validates and creates ConfXMLParam from the parsed
 XML document. Validation occures with help of the
 loaded MaapiSchema.

## Members

**Constructors**:

- [XMLtoConfXMLParam(InputStream, ConfPath)](#s-XMLtoConfXMLParam-1)
- [XMLtoConfXMLParam(String, ConfPath)](#s-XMLtoConfXMLParam-2)

**Fields**:

- [MODE_GET](#s-MODE_GET)
- [MODE_SET](#s-MODE_SET)
- [MODE_SET_ACTION_PARAM](#s-MODE_SET_ACTION_PARAM)
- [MODE_SET_ACTION_RESULT](#s-MODE_SET_ACTION_RESULT)

**Methods**:

- [toXMLParam()](#s-toXMLParam)
- [toXMLParam(int)](#s-toXMLParam-1)

## Constructors

<a id="s-XMLtoConfXMLParam-1"></a>
### XMLtoConfXMLParam(InputStream, ConfPath)

```java
public XMLtoConfXMLParam(
    java.io.InputStream xml,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `java.io.InputStream xml` - InputStream that produces well formed
   XML representing a instance document rooted by the path.
- `com.tailf.conf.ConfPath path` - Start node (or root path) of the XML document

<a id="s-XMLtoConfXMLParam-2"></a>
### XMLtoConfXMLParam(String, ConfPath)

```java
public XMLtoConfXMLParam(
    String xml,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

Main constructor for initializing the xml parser.

**Parameters**

- `String xml` - well formed XML string that represent
   a instance document rooted by the path
- `com.tailf.conf.ConfPath path` - Start node (or root path) of the XML document


## Fields

<a id="s-MODE_GET"></a>
### MODE_GET

```java
public static final int MODE_GET = 1;
```

parse xml as preparation for a getValues() call

<a id="s-MODE_SET"></a>
### MODE_SET

```java
public static final int MODE_SET = 2;
```

parse xml as preparation for a setValues() call

<a id="s-MODE_SET_ACTION_PARAM"></a>
### MODE_SET_ACTION_PARAM

```java
public static final int MODE_SET_ACTION_PARAM = 4;
```

parse xml as preparation for a setValues() call
 for action's or rpc's parameters

<a id="s-MODE_SET_ACTION_RESULT"></a>
### MODE_SET_ACTION_RESULT

```java
public static final int MODE_SET_ACTION_RESULT = 5;
```

parse xml as preparation for a setValues() call
 for action's or rpc's result


## Methods

<a id="s-toXMLParam"></a>
### toXMLParam()

```java
public com.tailf.conf.ConfXMLParam[] toXMLParam() throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [ConfException](../conf/ConfException.md#s-ConfException)

Converts the xml to corresponding ConfXMLParam[]
 The resulting ConfXMLParam[] is prepared for a getValues() call.

**Returns:** The resulting ConfXMLParam[]

**Throws**

- `ConfException`

<a id="s-toXMLParam-1"></a>
### toXMLParam(int)

```java
public com.tailf.conf.ConfXMLParam[] toXMLParam(int mode) throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [ConfException](../conf/ConfException.md#s-ConfException)

Converts the xml to corresponding ConfXMLParam[]
 The mode parameter controls whether this ConfXMLParam[] should be
 prepared for a getValues() call or for a setValues() call using
 using `#MODE_GET` or `#MODE_SET` respectively.

**Parameters**

- `int mode` - one of `#MODE_GET`, `#MODE_SET`,
 `#MODE_SET_ACTION_PARAM` or `#MODE_SET_ACTION_RESULT`

**Returns:** the resulting ConfXMLParam[]

**Throws**

- `ConfException`
