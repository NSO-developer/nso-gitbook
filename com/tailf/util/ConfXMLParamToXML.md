<a id="cls-ConfXMLParamToXML"></a>
# ConfXMLParamToXML

```java
public class com.tailf.util.ConfXMLParamToXML
```

Utility class to transform `ConfXMLParam[]`
 which represents a *XML-fragment* to a equivalent
 *DOM* (`org.w3c.dom.Document`) or to a string
 *XML* representation.

 A fragment refer to part of a *XML* document that may be useful to
 use interchange in the absence of the rest of the XML
 document.

 A fragment must be well-balanced and may or may not contain a surrounding
 root element. In either case a root element will always be created
 and it will always be the documents direct descendant node.

 The parent tag may be supplied or omitted. If omitted
 a root element will be created with the name "fragment" without
 any namespace.



```
  fragment
   ...
  /fragment
```

**See also:** [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#cls-ConfXMLParamValue), [`ConfXMLParamStart`](../conf/ConfXMLParamStart.md#cls-ConfXMLParamStart), [`ConfXMLParamStop`](../conf/ConfXMLParamStop.md#cls-ConfXMLParamStop), [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam), [`ConfXMLParamLeaf`](../conf/ConfXMLParamLeaf.md#cls-ConfXMLParamLeaf)

## Members

**Constructors**:

- [ConfXMLParamToXML()](#m-confxmlparamtoxml-ee47ca2e850d)

**Methods**:

- [clear()](#m-clear-ca3baec040cb)
- [serialize(Document, OutputStream)](#m-serialize-55bd4c595c9d)
- [serialize(Document, Writer)](#m-serialize-d15119ec5ca5)
- [toXML(ConfXMLParam[])](#m-toxml-122580fde7a8)
- [toXML(ConfXMLParam[], boolean)](#m-toxml-37f46ad3cde5)
- [toXML(ConfXMLParam[], String, String)](#m-toxml-e7cef9be4b1e)
- [toXML(ConfXMLParam[], String, String, boolean)](#m-toxml-5c273ed8be98)

## Constructors

<a id="m-confxmlparamtoxml-ee47ca2e850d"></a>
### ConfXMLParamToXML()

```java
public ConfXMLParamToXML()
```


## Methods

<a id="m-clear-ca3baec040cb"></a>
### clear()

```java
public void clear()
```

Clears the state of the instance of this class which permits
 multiple invocation of `ConfXMLParam#toXML(ConfXMLParam[],boolean)`.

<a id="m-serialize-55bd4c595c9d"></a>
### serialize(Document, OutputStream)

```java
public void serialize(
    org.w3c.dom.Document doc,
    java.io.OutputStream out
)
    throws com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Flushes the source document `doc` to
  the target `out`.

**Parameters**

- `org.w3c.dom.Document doc` - The source document
- `java.io.OutputStream out` - The destination stream

**Throws**

- `ConfException` - if occurred while flushing the document

<a id="m-serialize-d15119ec5ca5"></a>
### serialize(Document, Writer)

```java
public void serialize(
    org.w3c.dom.Document doc,
    java.io.Writer out
)
    throws com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Flushes the source document `doc` to
   the target `out`

**Parameters**

- `org.w3c.dom.Document doc` - The source document
- `java.io.Writer out` - The destination writer

**Throws**

- `ConfException` - if occurred while flushing the document

<a id="m-toxml-122580fde7a8"></a>
### toXML(ConfXMLParam[])

```java
public org.w3c.dom.Document toXML(
    com.tailf.conf.ConfXMLParam[] param
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [ConfException](../conf/ConfException.md#cls-ConfException)

Transforms the supplied parameter `ConfXMLParam[]`
 to a document (`Document`).

 The `root` tag which encloses the structure will be set
 to a dummy tag *fragment*.



```
  fragment
   ...
  /fragment
```




 If another root tag is desired use the method
 [`ConfXMLParam#toXML(ConfXMLParam[],String,String)`](../conf/ConfXMLParam.md#m-toxml-e7cef9be4b1e) where
 root tag `name` and namespace `uri` string
 could be supplied and will be the root Node of the *Document*.


 Excludes tags with empty leaf values from the document.

**Parameters**

- `com.tailf.conf.ConfXMLParam[] param` - The source `ConfXMLParam[]` array to
 be converted to the equivalent document

**Returns:** The resulting `Document`

**Throws**

- `ConfException` - If some error occurred

<a id="m-toxml-37f46ad3cde5"></a>
### toXML(ConfXMLParam[], boolean)

```java
public org.w3c.dom.Document toXML(
    com.tailf.conf.ConfXMLParam[] param,
    boolean includeEmpty
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [ConfException](../conf/ConfException.md#cls-ConfException)

Transforms the supplied parameter `ConfXMLParam[]`
 to a document (`Document`).

 The `root` tag which encloses the structure will be set
 to a dummy tag *fragment*.




```
  fragment
   ...
  /fragment
```




 If another root tag is desired use the method
 [`ConfXMLParam#toXML(ConfXMLParam[],String,String)`](../conf/ConfXMLParam.md#m-toxml-e7cef9be4b1e) where
 root tag `name` and namespace `uri` string
 could be supplied and will
 be the root Node of the returning `Document`.

**Parameters**

- `com.tailf.conf.ConfXMLParam[] param` - The target array to be converted
- `boolean includeEmpty` - Include empty leaf values
        as `ConfNoExists.toString()`

**Returns:** The resulting `Document`

**Throws**

- `ConfException` - If some error occurred

<a id="m-toxml-e7cef9be4b1e"></a>
### toXML(ConfXMLParam[], String, String)

```java
public org.w3c.dom.Document toXML(
    com.tailf.conf.ConfXMLParam[] param,
    String parentNode,
    String parentURI
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [ConfException](../conf/ConfException.md#cls-ConfException)

Transforms the supplied `ConfXMLParam[]`
 to a document (`Document`).

 Excludes tags with empty leaf values from the resulting document.

**Parameters**

- `com.tailf.conf.ConfXMLParam[] param` - The source `ConfXMLParam` structure
 (tag value array) to be converted to a document
- `String parentNode` - the parent tag that should be the
 the parent node of the source array.
- `String parentURI` - the namespace uri that the parentNode belongs to

**Throws**

- `ConfException` - if a error occurred

<a id="m-toxml-5c273ed8be98"></a>
### toXML(ConfXMLParam[], String, String, boolean)

```java
public org.w3c.dom.Document toXML(
    com.tailf.conf.ConfXMLParam[] param,
    String parentNode,
    String parentURI,
    boolean includeEmpty
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [ConfException](../conf/ConfException.md#cls-ConfException)

Transforms the supplied parameter `ConfXMLParam[]`
 to a document (`Document`).

**Parameters**

- `com.tailf.conf.ConfXMLParam[] param` - The source `ConfXMLParam[]`
 to be converted to the equivalent document
- `String parentNode` - the parent tag that should be the
 the parent node of the source array.
- `String parentURI` - the namespace uri that the parentNode belongs to
- `boolean includeEmpty` - Include empty leaf values as `ConfNoExists.toString()`

**Throws**

- `ConfException` - if error occurred
