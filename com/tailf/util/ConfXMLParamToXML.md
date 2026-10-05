# ConfXMLParamToXML <a href="#cls-ConfXMLParamToXML" id="cls-ConfXMLParamToXML"></a>

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

- [ConfXMLParamToXML()](#m-ConfXMLParamToXML-ee47ca2e850d)

**Methods**:

- [clear()](#m-clear-ca3baec040cb)
- [serialize(Document, OutputStream)](#m-serialize-55bd4c595c9d)
- [serialize(Document, Writer)](#m-serialize-d15119ec5ca5)
- [toXML(ConfXMLParam[])](#m-toXML-122580fde7a8)
- [toXML(ConfXMLParam[], boolean)](#m-toXML-37f46ad3cde5)
- [toXML(ConfXMLParam[], String, String)](#m-toXML-e7cef9be4b1e)
- [toXML(ConfXMLParam[], String, String, boolean)](#m-toXML-5c273ed8be98)

## Constructors

### ConfXMLParamToXML() <a href="#m-ConfXMLParamToXML-ee47ca2e850d" id="m-ConfXMLParamToXML-ee47ca2e850d"></a>

```java
public ConfXMLParamToXML()
```


## Methods

### clear() <a href="#m-clear-ca3baec040cb" id="m-clear-ca3baec040cb"></a>

```java
public void clear()
```

Clears the state of the instance of this class which permits
 multiple invocation of `toXML(ConfXMLParam[],boolean)`.

### serialize(Document, OutputStream) <a href="#m-serialize-55bd4c595c9d" id="m-serialize-55bd4c595c9d"></a>

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

### serialize(Document, Writer) <a href="#m-serialize-d15119ec5ca5" id="m-serialize-d15119ec5ca5"></a>

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

### toXML(ConfXMLParam[]) <a href="#m-toXML-122580fde7a8" id="m-toXML-122580fde7a8"></a>

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
 [`toXML(ConfXMLParam[],String,String)`](../conf/ConfXMLParam.md#m-toXML-e7cef9be4b1e) where
 root tag `name` and namespace `uri` string
 could be supplied and will be the root Node of the *Document*.


 Excludes tags with empty leaf values from the document.

**Parameters**

- `com.tailf.conf.ConfXMLParam[] param` - The source `ConfXMLParam[]` array to
 be converted to the equivalent document

**Returns:** The resulting `Document`

**Throws**

- `ConfException` - If some error occurred

### toXML(ConfXMLParam[], boolean) <a href="#m-toXML-37f46ad3cde5" id="m-toXML-37f46ad3cde5"></a>

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
 [`toXML(ConfXMLParam[],String,String)`](../conf/ConfXMLParam.md#m-toXML-e7cef9be4b1e) where
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

### toXML(ConfXMLParam[], String, String) <a href="#m-toXML-e7cef9be4b1e" id="m-toXML-e7cef9be4b1e"></a>

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

### toXML(ConfXMLParam[], String, String, boolean) <a href="#m-toXML-5c273ed8be98" id="m-toXML-5c273ed8be98"></a>

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
