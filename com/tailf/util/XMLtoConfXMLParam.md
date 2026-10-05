# XMLtoConfXMLParam <a href="#xmltoconfxmlparam-f4845d9828ee" id="xmltoconfxmlparam-f4845d9828ee"></a>

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

- [XMLtoConfXMLParam(String, ConfPath)](#xmltoconfxmlparam-c8c5db7811e2)

**Fields**:

- [MODE_GET](#mode_get-f993d996e8d3)
- [MODE_SET](#mode_set-a3c0f3ec95f7)
- [MODE_SET_ACTION_PARAM](#mode_set_action_param-2b8bfb16378e)
- [MODE_SET_ACTION_RESULT](#mode_set_action_result-51a0a8eb8d0a)

**Methods**:

- [toXMLParam()](#toxmlparam-035915632f19)
- [toXMLParam(int)](#toxmlparam-cfa4dab14cf4)

## Constructors

### XMLtoConfXMLParam(String, ConfPath) <a href="#xmltoconfxmlparam-c8c5db7811e2" id="xmltoconfxmlparam-c8c5db7811e2"></a>

```java
public XMLtoConfXMLParam(
    String xml,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Main constructor for initializing the xml parser.

**Parameters**

- `String xml` - well formed XML string that represent
   a instance document rooted by the path
- `com.tailf.conf.ConfPath path` - Start node (or root path) of the XML document


## Fields

### MODE_GET <a href="#mode_get-f993d996e8d3" id="mode_get-f993d996e8d3"></a>

```java
public static final int MODE_GET = 1;
```

parse xml as preparation for a getValues() call

### MODE_SET <a href="#mode_set-a3c0f3ec95f7" id="mode_set-a3c0f3ec95f7"></a>

```java
public static final int MODE_SET = 2;
```

parse xml as preparation for a setValues() call

### MODE_SET_ACTION_PARAM <a href="#mode_set_action_param-2b8bfb16378e" id="mode_set_action_param-2b8bfb16378e"></a>

```java
public static final int MODE_SET_ACTION_PARAM = 4;
```

parse xml as preparation for a setValues() call
 for action's or rpc's parameters

### MODE_SET_ACTION_RESULT <a href="#mode_set_action_result-51a0a8eb8d0a" id="mode_set_action_result-51a0a8eb8d0a"></a>

```java
public static final int MODE_SET_ACTION_RESULT = 5;
```

parse xml as preparation for a setValues() call
 for action's or rpc's result


## Methods

### toXMLParam() <a href="#toxmlparam-035915632f19" id="toxmlparam-035915632f19"></a>

```java
public com.tailf.conf.ConfXMLParam[] toXMLParam() throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Converts the xml to corresponding ConfXMLParam[]
 The resulting ConfXMLParam[] is prepared for a getValues() call.

**Returns:** The resulting ConfXMLParam[]

**Throws**

- `ConfException`

### toXMLParam(int) <a href="#toxmlparam-cfa4dab14cf4" id="toxmlparam-cfa4dab14cf4"></a>

```java
public com.tailf.conf.ConfXMLParam[] toXMLParam(int mode) throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Converts the xml to corresponding ConfXMLParam[]
 The mode parameter controls whether this ConfXMLParam[] should be
 prepared for a getValues() call or for a setValues() call using
 using [`MODE_GET`](XMLtoConfXMLParam.md#mode_get-f993d996e8d3) or [`MODE_SET`](XMLtoConfXMLParam.md#mode_set-a3c0f3ec95f7) respectively.

**Parameters**

- `int mode` - one of [`MODE_GET`](XMLtoConfXMLParam.md#mode_get-f993d996e8d3), [`MODE_SET`](XMLtoConfXMLParam.md#mode_set-a3c0f3ec95f7),
 [`MODE_SET_ACTION_PARAM`](XMLtoConfXMLParam.md#mode_set_action_param-2b8bfb16378e) or [`MODE_SET_ACTION_RESULT`](XMLtoConfXMLParam.md#mode_set_action_result-51a0a8eb8d0a)

**Returns:** the resulting ConfXMLParam[]

**Throws**

- `ConfException`
