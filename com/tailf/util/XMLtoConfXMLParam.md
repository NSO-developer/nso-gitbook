# XMLtoConfXMLParam <a href="#cls-XMLtoConfXMLParam" id="cls-XMLtoConfXMLParam"></a>

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

- [XMLtoConfXMLParam(String, ConfPath)](#m-XMLtoConfXMLParam-c8c5db7811e2)

**Fields**:

- [MODE_GET](#m-MODE_GET)
- [MODE_SET](#m-MODE_SET)
- [MODE_SET_ACTION_PARAM](#m-MODE_SET_ACTION_PARAM)
- [MODE_SET_ACTION_RESULT](#m-MODE_SET_ACTION_RESULT)

**Methods**:

- [toXMLParam()](#m-toXMLParam-035915632f19)
- [toXMLParam(int)](#m-toXMLParam-cfa4dab14cf4)

## Constructors

### XMLtoConfXMLParam(String, ConfPath) <a href="#m-XMLtoConfXMLParam-c8c5db7811e2" id="m-XMLtoConfXMLParam-c8c5db7811e2"></a>

```java
public XMLtoConfXMLParam(
    String xml,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

Main constructor for initializing the xml parser.

**Parameters**

- `String xml` - well formed XML string that represent
   a instance document rooted by the path
- `com.tailf.conf.ConfPath path` - Start node (or root path) of the XML document


## Fields

### MODE_GET <a href="#m-MODE_GET" id="m-MODE_GET"></a>

```java
public static final int MODE_GET = 1;
```

parse xml as preparation for a getValues() call

### MODE_SET <a href="#m-MODE_SET" id="m-MODE_SET"></a>

```java
public static final int MODE_SET = 2;
```

parse xml as preparation for a setValues() call

### MODE_SET_ACTION_PARAM <a href="#m-MODE_SET_ACTION_PARAM" id="m-MODE_SET_ACTION_PARAM"></a>

```java
public static final int MODE_SET_ACTION_PARAM = 4;
```

parse xml as preparation for a setValues() call
 for action's or rpc's parameters

### MODE_SET_ACTION_RESULT <a href="#m-MODE_SET_ACTION_RESULT" id="m-MODE_SET_ACTION_RESULT"></a>

```java
public static final int MODE_SET_ACTION_RESULT = 5;
```

parse xml as preparation for a setValues() call
 for action's or rpc's result


## Methods

### toXMLParam() <a href="#m-toXMLParam-035915632f19" id="m-toXMLParam-035915632f19"></a>

```java
public com.tailf.conf.ConfXMLParam[] toXMLParam() throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [ConfException](../conf/ConfException.md#cls-ConfException)

Converts the xml to corresponding ConfXMLParam[]
 The resulting ConfXMLParam[] is prepared for a getValues() call.

**Returns:** The resulting ConfXMLParam[]

**Throws**

- `ConfException`

### toXMLParam(int) <a href="#m-toXMLParam-cfa4dab14cf4" id="m-toXMLParam-cfa4dab14cf4"></a>

```java
public com.tailf.conf.ConfXMLParam[] toXMLParam(int mode) throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [ConfException](../conf/ConfException.md#cls-ConfException)

Converts the xml to corresponding ConfXMLParam[]
 The mode parameter controls whether this ConfXMLParam[] should be
 prepared for a getValues() call or for a setValues() call using
 using [`MODE_GET`](XMLtoConfXMLParam.md#m-MODE_GET) or [`MODE_SET`](XMLtoConfXMLParam.md#m-MODE_SET) respectively.

**Parameters**

- `int mode` - one of [`MODE_GET`](XMLtoConfXMLParam.md#m-MODE_GET), [`MODE_SET`](XMLtoConfXMLParam.md#m-MODE_SET),
 [`MODE_SET_ACTION_PARAM`](XMLtoConfXMLParam.md#m-MODE_SET_ACTION_PARAM) or [`MODE_SET_ACTION_RESULT`](XMLtoConfXMLParam.md#m-MODE_SET_ACTION_RESULT)

**Returns:** the resulting ConfXMLParam[]

**Throws**

- `ConfException`
