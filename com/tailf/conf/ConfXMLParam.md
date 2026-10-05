<a id="s-ConfXMLParam"></a>
# ConfXMLParam

```java
public abstract class com.tailf.conf.ConfXMLParam
    extends com.tailf.conf.ConfObject
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

Represents the base class of a flat XML structure.

 This class is used to represent arbitrary XML trees, typically
 used as input/output parameters to YANG rpc/action statements.
 It is also used in methods that set/get multiple values in one call.

 Subclasses to this class represents node elements or
 entries in a [`ConfXMLParam`](ConfXMLParam.md#s-ConfXMLParam) array. An array
 of this type form a flat XML structure.

 The array is populated, normally through a "depth first" traversal of
 the data tree, as follows:


- Optional leafs or presence containers that do not exist are
 omitted entirely from the array.

   - List and container nodes use one array element where the value
 has type [`ConfXMLParamStart`](ConfXMLParamStart.md#s-ConfXMLParamStart), and `tag` and
 `ns` set according to the node name followed by array
 elements for the sub-nodes according to this list, followed by one
 array element where the value has type
 [`ConfXMLParamStop`](ConfXMLParamStop.md#s-ConfXMLParamStop), and `tag` and `ns`
 set according to the node name.




```
 ConfXMLParam[] params =
     new ConfXMLParam[] {
         new ConfXMLParamStart(...),
         .
         .
         new ConfXMLParamStop(...),
         new ConfXMLParamStart(...),
         .
         .
         new ConfXMLParamStop(...),
         new ConfXMLParamStart(...),
         .
         .
         new ConfXMLParamStop(...),
         };
```



 Each start and stop corresponds to a opening and closing tag
 in XML.

     - Leafs with a type other than empty uses the instance
 [`ConfXMLParamValue`](ConfXMLParamValue.md#s-ConfXMLParamValue) for value element and `tag` and
 `ns` according to the node name and additional
 `value` set according to the leaf name.

       - Leafs of type empty use an array element where the value has
 type [`ConfXMLParamLeaf`](ConfXMLParamLeaf.md#s-ConfXMLParamLeaf), and `tag` and
 `ns` set according to the leaf name.

 Note that the list or container node corresponding to the complete array
 is not included in the array. In some usages, non-optional nodes may
 also be omitted from the array.

 Consider the following model:



```
  module foo {
   namespace "http://foo.org/yang/servers
   prefix fo;
   import ietf-inet-types {
     prefix inet;
   }
   import tailf-common {
     prefix tailf;
   }

  container servers {
    list server {
        key name;
        max-elements 64;

         leaf name {
           type string;
         }
         leaf ip {
           type inet:host;
           mandatory true;
         }
         leaf port {
          type inet:port-number;
        }
      }
    }
 }
```



 A instance the XML-document of the above could look like:



```
  servers xmlns="http://foo.org/yang/servers"
    fo:server
       fo:namewww0/fo:name
       fo:ip192.168.0.2/fo:ip
       fo:port80/fo:port
   /fo:server
   fo:server
       fo:namewww1/fo:name
       fo:ip192.168.0.3/fo:ip
       fo:port8080/fo:port
   /fo:server
   fo:server
       fo:namewww2/fo:name
       fo:ip192.168.0.3/fo:ip
       fo:port8081fo:port
   /fo:server
  /fo:servers
```




 To be able to encode the above XML instance document to a
 `ConfXMLParam[]` structure we need to populate a
 `ConfXMLParam` array with opening XML tags
 with instances of `ConfXMLParamStart`, closing tags
 with `ConfXMLParamStop` which represent start and end tag for
 a container and list entry, as stated above.
 To express the values we need instances of `ConfXMLParamValue`.

 The above XML snippet would be populated as follow:



```
 int i = 0;
 foo ns = new foo(); //instance of the generated namespace
 final int hash = ns.hash;
 ConfXMLParam[] xml = new ConfXMLParam[17];
  xml[i++] = new ConfXMLParamStart(hash,ns._servers);

  xml[i++] = new ConfXMLParamStart(hash,ns._server);
  xml[i++] = new ConfXMLParamValue(hash,ns._name, new ConfBuf("www0"));
  xml[i++] = new ConfXMLParamValue(hash,ns._ip, new ConfBuf("192.168.0.2"));
  xml[i++] = new ConfXMLParamValue(hash,ns._port,new ConfUInt16(80));
  xml[i++] = new ConfXMLParamStop(hash,ns._server);

  xml[i++] = new ConfXMLParamStart(hash,ns._server);
  xml[i++] = new ConfXMLParamValue(hash,ns._name, new ConfBuf("www1"));
  xml[i++] = new ConfXMLParamValue(hash,ns._ip, new ConfBuf("192.168.0.3"));
  xml[i++] = new ConfXMLParamValue(hash,ns._port,new ConfUInt16(8080));
  xml[i++] = new ConfXMLParamStop(hash,ns._server);

  xml[i++] = new ConfXMLParamStart(hash,ns._server);
  xml[i++] = new ConfXMLParamValue(hash,ns._name, new ConfBuf("www2"));
  xml[i++] = new ConfXMLParamValue(hash,ns._ip, new ConfBuf("192.168.0.4"));
  xml[i++] = new ConfXMLParamValue(hash,ns._port,new ConfUInt16(8081));
  xml[i++] = new ConfXMLParamStop(hash,ns._server);

  xml[i++] = new ConfXMLParamStop(hash,ns._servers);
```




 Each `ConfXMLParamStart` (opening tag)  must end with a
 `ConfXMLParamStop` (end tag).

 As stated above the correct populated `ConfXMLParam`
 is used for populate a subtree within one method call, for example
 [`Maapi`](../maapi/Maapi.md#s-Maapi) or we could
 extract multiple values in one call, for example
 [`Maapi`](../maapi/Maapi.md#s-Maapi) or
 with MAAPI.

 And with CDB
 [`CdbSession`](../cdb/CdbSession.md#s-CdbSession).

 The `ConfXMLParam` array is also used in

 [`CdbSession`](../cdb/CdbSession.md#s-CdbSession)
 to retrieve multiple values in one call.

 When we need to extract or retrieve multiple values
 the `ConfXMLParamValue` is not known before hand thus
 we replace the `ConfXMLParamValue` with instances of
 `ConfXMLParamLeaf` before we issue a get request.

 For Example:



```
 int i = 0;
 foo ns = new foo(); //instance of the generated namespace
 final int hash = ns.hash;
 ConfXMLParam[] xml = new ConfXMLParam[17];
  xml[i++] = new ConfXMLParamStart(hash,ns._servers);

  xml[i++] = new ConfXMLParamStart(hash,ns._server);
  xml[i++] = new ConfXMLParamValue(hash,ns._name, new ConfBuf("www0"));
  xml[i++] = new ConfXMLParamLeaf(hash,ns._ip);
  xml[i++] = new ConfXMLParamLeaf(hash,ns._port);
  xml[i++] = new ConfXMLParamStop(hash,ns._server);

  xml[i++] = new ConfXMLParamStart(hash,ns._server);
  xml[i++] = new ConfXMLParamValue(hash,ns._name, new ConfBuf("www1"));
  xml[i++] = new ConfXMLParamLeaf(hash,ns._ip);
  xml[i++] = new ConfXMLParamLeaf(hash,ns._port);
  xml[i++] = new ConfXMLParamStop(hash,ns._server);

  xml[i++] = new ConfXMLParamStart(hash,ns._server);
  xml[i++] = new ConfXMLParamValue(hash,ns._name, new ConfBuf("www2"));
  xml[i++] = new ConfXMLParamLeaf(hash,ns._ip);
  xml[i++] = new ConfXMLParamLeaf(hash,ns._port);
  xml[i++] = new ConfXMLParamStop(hash,ns._server);

  xml[i++] = new ConfXMLParamStop(hash,ns._servers);

  ConfXMLParam[] returnValues =
      maapi.getValues(th,xml,new ConfPath(thepath));
```




 Note in the above example the list key must be known before hand.

 Another usage of the (Conf)XML-Structure is to invoke an action
 for example [`Maapi`](../maapi/Maapi.md#s-Maapi)
 of a Identifies a model element as a parameter. This is the base class
 for representing modeled parameters.

 Consider the following yang model:


```
 module cs {
     namespace "http://example.com/test/cs/1.0";
     prefix cs;
     import tailf-common {
         prefix tailf;
     }

     typedef math_op {
         type enumeration {
             enum add;
             enum sub;
             enum mul;
             enum div;
             enum square;
         }
     }

     container system {
         list computer {
             key name;
             leaf name {
                 type string;
             }
             tailf:action math {
                 tailf:actionpoint math_cs;
                 input {
                     list operation {
                         min-elements 1;
                         max-elements 3;
                         leaf number {
                             type int32;
                             mandatory true;
                         }
                         leaf type {
                             type math_op;
                             mandatory true;
                         }
                         leaf-list operands {
                             type int16;
                         }
                     }
                 }
                 output {
                     container result {
                         presence "";
                         leaf number {
                             type int32;
                             mandatory true;
                         }
                         leaf type {
                             type math_op;
                             mandatory true;
                         }
                         leaf value {
                             type int16;
                             mandatory true;
                         }
                     }
                 }
             }
         }
     }
 }
```



 The following is a example of how to assemble the action parameters into
 and array of ConfXMLParam and its subclasses. The example shows how to
 populate two list entries:


```
 ConfNamespace n = new cs();
 ConfXMLParam[] params =
     new ConfXMLParam[] {
         new ConfXMLParamStart(n, cs.cs_operation_),
         new ConfXMLParamValue(n, cs.cs_number_,  new ConfInt32(13)),
         new ConfXMLParamValue(n, cs.cs_type_,    new ConfEnumeration(0)),
         new ConfXMLParamValue(n, cs.cs_operands_,
                               new ConfList(new ConfObject[] {
                                            new ConfInt16(13),
                                            new ConfInt16(25) })),
         new ConfXMLParamStop(n, cs.cs_operation_),

         new ConfXMLParamStart(n, cs.cs_operation_),
         new ConfXMLParamValue(n, cs.cs_number_,  new ConfInt32(14)),
         new ConfXMLParamValue(n, cs.cs_type_,    new ConfEnumeration(0)),
         new ConfXMLParamValue(n, cs.cs_operands_,
                               new ConfList(new ConfObject[] {
                                            new ConfInt16(15),
                                            new ConfInt16(28) })),
         new ConfXMLParamStop(n, cs.cs_operation_)};
```



 It is also possible to delete leafs and presence containers by setting the
 value of the corresponding ConfXMLParamValue to ConfNoExist().
 However to delete an list element a different approach is necessary.
 The key value of the list element that is about to be deleted is surrounded
 by a ConfXMLParamStartDel() and a ConfParamStop as in:



```
 int i = 0;
 foo ns = new foo(); //instance of the generated namespace
 final int hash = ns.hash;
 ConfXMLParam[] xml = new ConfXMLParam[] {
        new ConfXMLParamStartDel(hash,ns._servers),
        new ConfXMLParamValue(hash,ns._name, new ConfBuf("www1")),
        new ConfXMLParamStop(hash,ns._server)
    };
  maapi.setValues(th,xml,new ConfPath(thepath));
```

**Related classes**

- [ConfXMLParamLeaf](ConfXMLParamLeaf.md#s-ConfXMLParamLeaf)
- [ConfXMLParamStart](ConfXMLParamStart.md#s-ConfXMLParamStart)
- [ConfXMLParamStartDel](ConfXMLParamStartDel.md#s-ConfXMLParamStartDel)
- [ConfXMLParamStop](ConfXMLParamStop.md#s-ConfXMLParamStop)
- [ConfXMLParamValue](ConfXMLParamValue.md#s-ConfXMLParamValue)

## Members

**Constructors**:

- [ConfXMLParam(ConfEObject)](#s-ConfXMLParam-1)
- [ConfXMLParam(ConfNamespace, String, ConfObject)](#s-ConfXMLParam-2)
- [ConfXMLParam(ConfNamespace, String, XMLParamType)](#s-ConfXMLParam-3)
- [ConfXMLParam(ConfPath, MountIdInterface, String, String, ConfObject)](#s-ConfXMLParam-4)
- [ConfXMLParam(ConfPath, MountIdInterface, String, String, XMLParamType)](#s-ConfXMLParam-5)
- [ConfXMLParam(int, int)](#s-ConfXMLParam-6)
- [ConfXMLParam(int, int, ConfObject)](#s-ConfXMLParam-7)
- [ConfXMLParam(int, int, XMLParamType)](#s-ConfXMLParam-8)
- [ConfXMLParam(int, String, XMLParamType)](#s-ConfXMLParam-9)
- [ConfXMLParam(long, long)](#s-ConfXMLParam-10)
- [ConfXMLParam(long, long, ConfObject)](#s-ConfXMLParam-11)
- [ConfXMLParam(String, String, ConfObject)](#s-ConfXMLParam-12)
- [ConfXMLParam(String, String, XMLParamType)](#s-ConfXMLParam-13)

**Fields**:

- [J_BINARY](ConfObject.md#s-J_BINARY) from ConfObject
- [J_BIT32](ConfObject.md#s-J_BIT32) from ConfObject
- [J_BIT64](ConfObject.md#s-J_BIT64) from ConfObject
- [J_BITBIG](ConfObject.md#s-J_BITBIG) from ConfObject
- [J_BOOL](ConfObject.md#s-J_BOOL) from ConfObject
- [J_BUF](ConfObject.md#s-J_BUF) from ConfObject
- [J_CDBBEGIN](ConfObject.md#s-J_CDBBEGIN) from ConfObject
- [J_DATE](ConfObject.md#s-J_DATE) from ConfObject
- [J_DATETIME](ConfObject.md#s-J_DATETIME) from ConfObject
- [J_DECIMAL64](ConfObject.md#s-J_DECIMAL64) from ConfObject
- [J_DEFAULT](ConfObject.md#s-J_DEFAULT) from ConfObject
- [J_DOUBLE](ConfObject.md#s-J_DOUBLE) from ConfObject
- [J_DQUAD](ConfObject.md#s-J_DQUAD) from ConfObject
- [J_DURATION](ConfObject.md#s-J_DURATION) from ConfObject
- [J_EMPTY](ConfObject.md#s-J_EMPTY) from ConfObject
- [J_ENUMERATION](ConfObject.md#s-J_ENUMERATION) from ConfObject
- [J_HEXSTR](ConfObject.md#s-J_HEXSTR) from ConfObject
- [J_IDENTITYREF](ConfObject.md#s-J_IDENTITYREF) from ConfObject
- [J_INSTANCE_IDENTIFIER](ConfObject.md#s-J_INSTANCE_IDENTIFIER) from ConfObject
- [J_INT16](ConfObject.md#s-J_INT16) from ConfObject
- [J_INT32](ConfObject.md#s-J_INT32) from ConfObject
- [J_INT64](ConfObject.md#s-J_INT64) from ConfObject
- [J_INT8](ConfObject.md#s-J_INT8) from ConfObject
- [J_IPV4](ConfObject.md#s-J_IPV4) from ConfObject
- [J_IPV4_AND_PLEN](ConfObject.md#s-J_IPV4_AND_PLEN) from ConfObject
- [J_IPV4PREFIX](ConfObject.md#s-J_IPV4PREFIX) from ConfObject
- [J_IPV6](ConfObject.md#s-J_IPV6) from ConfObject
- [J_IPV6_AND_PLEN](ConfObject.md#s-J_IPV6_AND_PLEN) from ConfObject
- [J_IPV6PREFIX](ConfObject.md#s-J_IPV6PREFIX) from ConfObject
- [J_LIST](ConfObject.md#s-J_LIST) from ConfObject
- [J_NOEXISTS](ConfObject.md#s-J_NOEXISTS) from ConfObject
- [J_OBJECTREF](ConfObject.md#s-J_OBJECTREF) from ConfObject
- [J_OID](ConfObject.md#s-J_OID) from ConfObject
- [J_PTR](ConfObject.md#s-J_PTR) from ConfObject
- [J_QNAME](ConfObject.md#s-J_QNAME) from ConfObject
- [J_STR](ConfObject.md#s-J_STR) from ConfObject
- [J_SYMBOL](ConfObject.md#s-J_SYMBOL) from ConfObject
- [J_TIME](ConfObject.md#s-J_TIME) from ConfObject
- [J_UINT16](ConfObject.md#s-J_UINT16) from ConfObject
- [J_UINT32](ConfObject.md#s-J_UINT32) from ConfObject
- [J_UINT64](ConfObject.md#s-J_UINT64) from ConfObject
- [J_UINT8](ConfObject.md#s-J_UINT8) from ConfObject
- [J_UNION](ConfObject.md#s-J_UNION) from ConfObject
- [J_XMLBEGIN](ConfObject.md#s-J_XMLBEGIN) from ConfObject
- [J_XMLBEGINDEL](ConfObject.md#s-J_XMLBEGINDEL) from ConfObject
- [J_XMLEND](ConfObject.md#s-J_XMLEND) from ConfObject
- [J_XMLMOVEAFTER](ConfObject.md#s-J_XMLMOVEAFTER) from ConfObject
- [J_XMLMOVEFIRST](ConfObject.md#s-J_XMLMOVEFIRST) from ConfObject
- [J_XMLTAG](ConfObject.md#s-J_XMLTAG) from ConfObject
- [namespace](#s-namespace)
- [ns](#s-ns)
- [prefix](#s-prefix)
- [tag](#s-tag)
- [tagString](#s-tagString)
- [val](#s-val)

**Methods**:

- [clone()](ConfObject.md#s-clone) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#s-compare) from ConfObject
- [decode(ConfEObject)](ConfObject.md#s-decode) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#s-decode-1) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#s-decode-2) from ConfObject
- [decodeParam(ConfEObject)](#s-decodeParam)
- [decodeParams(ConfEObject)](#s-decodeParams)
- [encode()](#s-encode)
- [encode(ConfXMLParam[])](#s-encode-1)
- [encode(List<String>)](#s-encode-2)
- [encode(List<String>, ConfXMLParam[])](#s-encode-3)
- [encodeHKP()](#s-encodeHKP)
- [encodeHKP(ConfXMLParam[])](#s-encodeHKP-1)
- [encodeHKP(List<String>)](#s-encodeHKP-2)
- [encodeHKP(List<String>, ConfXMLParam[])](#s-encodeHKP-3)
- [encodeIKP()](#s-encodeIKP)
- [encodeIKP(ConfXMLParam[])](#s-encodeIKP-1)
- [encodeIKP(List<String>)](#s-encodeIKP-2)
- [encodeIKP(List<String>, ConfXMLParam[])](#s-encodeIKP-3)
- [equals(Object)](#s-equals)
- [getConfNamespace()](#s-getConfNamespace)
- [getNSHash()](#s-getNSHash)
- [getTag()](#s-getTag)
- [getTagHash()](#s-getTagHash)
- [getValue()](#s-getValue)
- [hashCode()](#s-hashCode)
- [setCdbInstanceInteger(int)](#s-setCdbInstanceInteger)
- [setNamespace(ConfNamespace)](#s-setNamespace)
- [setNamespaceFromMountId(List<String>)](#s-setNamespaceFromMountId)
- [toDOM(ConfXMLParam[])](#s-toDOM)
- [toDOM(ConfXMLParam[], String, String)](#s-toDOM-1)
- [toString()](#s-toString)
- [toXML(ConfXMLParam[])](#s-toXML)
- [toXML(ConfXMLParam[], String, String)](#s-toXML-1)
- [toXMLParams(String, ConfPath)](#s-toXMLParams)
- [toXMLParams(String, ConfPath, int)](#s-toXMLParams-1)

## Constructors

<a id="s-ConfXMLParam-1"></a>
### ConfXMLParam(ConfEObject)

```java
protected ConfXMLParam(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="s-ConfXMLParam-2"></a>
### ConfXMLParam(ConfNamespace, String, ConfObject)

```java
protected ConfXMLParam(
    com.tailf.conf.ConfNamespace namespace,
    String tagString,
    com.tailf.conf.ConfObject val
)
```

Types: [ConfNamespace](ConfNamespace.md#s-ConfNamespace), [ConfObject](ConfObject.md#s-ConfObject)

**Parameters**

- `com.tailf.conf.ConfNamespace namespace`
- `String tagString`
- `com.tailf.conf.ConfObject val`

<a id="s-ConfXMLParam-3"></a>
### ConfXMLParam(ConfNamespace, String, XMLParamType)

```java
protected ConfXMLParam(
    com.tailf.conf.ConfNamespace namespace,
    String tagString,
    com.tailf.conf.XMLParamType type
)
```

Types: [ConfNamespace](ConfNamespace.md#s-ConfNamespace), [XMLParamType](XMLParamType.md#s-XMLParamType)

**Parameters**

- `com.tailf.conf.ConfNamespace namespace`
- `String tagString`
- `com.tailf.conf.XMLParamType type`

<a id="s-ConfXMLParam-4"></a>
### ConfXMLParam(ConfPath, MountIdInterface, String, String, ConfObject)

```java
protected ConfXMLParam(
    com.tailf.conf.ConfPath path,
    com.tailf.conf.MountIdInterface mountIdGetter,
    String prefix,
    String tagString,
    com.tailf.conf.ConfObject val
)
```

Types: [ConfPath](ConfPath.md#s-ConfPath), [MountIdInterface](MountIdInterface.md#s-MountIdInterface), [ConfObject](ConfObject.md#s-ConfObject)

**Parameters**

- `com.tailf.conf.ConfPath path`
- `com.tailf.conf.MountIdInterface mountIdGetter`
- `String prefix`
- `String tagString`
- `com.tailf.conf.ConfObject val`

<a id="s-ConfXMLParam-5"></a>
### ConfXMLParam(ConfPath, MountIdInterface, String, String, XMLParamType)

```java
protected ConfXMLParam(
    com.tailf.conf.ConfPath path,
    com.tailf.conf.MountIdInterface mountIdGetter,
    String prefix,
    String tagString,
    com.tailf.conf.XMLParamType type
)
```

Types: [ConfPath](ConfPath.md#s-ConfPath), [MountIdInterface](MountIdInterface.md#s-MountIdInterface), [XMLParamType](XMLParamType.md#s-XMLParamType)

**Parameters**

- `com.tailf.conf.ConfPath path`
- `com.tailf.conf.MountIdInterface mountIdGetter`
- `String prefix`
- `String tagString`
- `com.tailf.conf.XMLParamType type`

<a id="s-ConfXMLParam-6"></a>
### ConfXMLParam(int, int)

```java
protected ConfXMLParam(int nshash, int tag)
```

**Parameters**

- `int nshash`
- `int tag`

<a id="s-ConfXMLParam-7"></a>
### ConfXMLParam(int, int, ConfObject)

```java
protected ConfXMLParam(int ns, int tag, com.tailf.conf.ConfObject val)
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

**Parameters**

- `int ns`
- `int tag`
- `com.tailf.conf.ConfObject val`

<a id="s-ConfXMLParam-8"></a>
### ConfXMLParam(int, int, XMLParamType)

```java
protected ConfXMLParam(int ns, int tag, com.tailf.conf.XMLParamType type)
```

Types: [XMLParamType](XMLParamType.md#s-XMLParamType)

**Parameters**

- `int ns`
- `int tag`
- `com.tailf.conf.XMLParamType type`

<a id="s-ConfXMLParam-9"></a>
### ConfXMLParam(int, String, XMLParamType)

```java
protected ConfXMLParam(int ns, String tagString, com.tailf.conf.XMLParamType type)
```

Types: [XMLParamType](XMLParamType.md#s-XMLParamType)

**Parameters**

- `int ns`
- `String tagString`
- `com.tailf.conf.XMLParamType type`

<a id="s-ConfXMLParam-10"></a>
### ConfXMLParam(long, long)

```java
protected ConfXMLParam(long nshash, long tag)
```

**Parameters**

- `long nshash`
- `long tag`

<a id="s-ConfXMLParam-11"></a>
### ConfXMLParam(long, long, ConfObject)

```java
protected ConfXMLParam(long ns, long tag, com.tailf.conf.ConfObject val)
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

**Parameters**

- `long ns`
- `long tag`
- `com.tailf.conf.ConfObject val`

<a id="s-ConfXMLParam-12"></a>
### ConfXMLParam(String, String, ConfObject)

```java
protected ConfXMLParam(String prefix, String tagString, com.tailf.conf.ConfObject val)
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

**Parameters**

- `String prefix`
- `String tagString`
- `com.tailf.conf.ConfObject val`

<a id="s-ConfXMLParam-13"></a>
### ConfXMLParam(String, String, XMLParamType)

```java
protected ConfXMLParam(String prefix, String tagString, com.tailf.conf.XMLParamType type)
```

Types: [XMLParamType](XMLParamType.md#s-XMLParamType)

**Parameters**

- `String prefix`
- `String tagString`
- `com.tailf.conf.XMLParamType type`


## Fields

<a id="s-namespace"></a>
### namespace

```java
protected com.tailf.conf.ConfNamespace namespace = null;
```

Types: [ConfNamespace](ConfNamespace.md#s-ConfNamespace)

<a id="s-ns"></a>
### ns

```java
protected Integer ns = null;
```

<a id="s-prefix"></a>
### prefix

```java
protected String prefix = null;
```

<a id="s-tag"></a>
### tag

```java
protected Integer tag = null;
```

<a id="s-tagString"></a>
### tagString

```java
protected String tagString = null;
```

<a id="s-val"></a>
### val

```java
protected com.tailf.conf.ConfObject val = null;
```

Types: [ConfObject](ConfObject.md#s-ConfObject)


## Methods

<a id="s-decodeParam"></a>
### decodeParam(ConfEObject)

```java
public static com.tailf.conf.ConfXMLParam decodeParam(
    com.tailf.proto.ConfEObject o
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#s-ConfXMLParam), [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

Decode the internal representation to a `ConfXMLParam`
 Used internally.

**Parameters**

- `com.tailf.proto.ConfEObject o`

**Returns:** The paramter from the internal representation

<a id="s-decodeParams"></a>
### decodeParams(ConfEObject)

```java
public static com.tailf.conf.ConfXMLParam[] decodeParams(
    com.tailf.proto.ConfEObject o
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#s-ConfXMLParam), [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="s-encode"></a>
### encode()

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

<a id="s-encode-1"></a>
### encode(ConfXMLParam[])

```java
public static com.tailf.proto.ConfEObject encode(com.tailf.conf.ConfXMLParam[] params)
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfXMLParam](ConfXMLParam.md#s-ConfXMLParam)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`

<a id="s-encode-2"></a>
### encode(List<String>)

```java
public com.tailf.proto.ConfEObject encode(java.util.List<String> mountId)
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

**Parameters**

- `java.util.List<String> mountId`

<a id="s-encode-3"></a>
### encode(List<String>, ConfXMLParam[])

```java
public static com.tailf.proto.ConfEObject encode(
    java.util.List<String> mountId,
    com.tailf.conf.ConfXMLParam[] params
)
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfXMLParam](ConfXMLParam.md#s-ConfXMLParam)

**Parameters**

- `java.util.List<String> mountId`
- `com.tailf.conf.ConfXMLParam[] params`

<a id="s-encodeHKP"></a>
### encodeHKP()

```java
public com.tailf.proto.ConfEObject encodeHKP()
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

Encode this ConfXMLParam to HKP representation
 (i.e hashbased [ns | tag] where where ns and tag are both
 in long). This does not rely on ConfNamespace.

<a id="s-encodeHKP-1"></a>
### encodeHKP(ConfXMLParam[])

```java
public static com.tailf.proto.ConfEObject encodeHKP(com.tailf.conf.ConfXMLParam[] params)
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfXMLParam](ConfXMLParam.md#s-ConfXMLParam)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`

<a id="s-encodeHKP-2"></a>
### encodeHKP(List<String>)

```java
public com.tailf.proto.ConfEObject encodeHKP(java.util.List<String> mountId)
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

**Parameters**

- `java.util.List<String> mountId`

<a id="s-encodeHKP-3"></a>
### encodeHKP(List<String>, ConfXMLParam[])

```java
public static com.tailf.proto.ConfEObject encodeHKP(
    java.util.List<String> mountId,
    com.tailf.conf.ConfXMLParam[] params
)
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfXMLParam](ConfXMLParam.md#s-ConfXMLParam)

**Parameters**

- `java.util.List<String> mountId`
- `com.tailf.conf.ConfXMLParam[] params`

<a id="s-encodeIKP"></a>
### encodeIKP()

```java
public com.tailf.proto.ConfEObject encodeIKP()
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

<a id="s-encodeIKP-1"></a>
### encodeIKP(ConfXMLParam[])

```java
public static com.tailf.proto.ConfEObject encodeIKP(com.tailf.conf.ConfXMLParam[] params)
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfXMLParam](ConfXMLParam.md#s-ConfXMLParam)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`

<a id="s-encodeIKP-2"></a>
### encodeIKP(List<String>)

```java
public com.tailf.proto.ConfEObject encodeIKP(java.util.List<String> mountId)
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

**Parameters**

- `java.util.List<String> mountId`

<a id="s-encodeIKP-3"></a>
### encodeIKP(List<String>, ConfXMLParam[])

```java
public static com.tailf.proto.ConfEObject encodeIKP(
    java.util.List<String> mountId,
    com.tailf.conf.ConfXMLParam[] params
)
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfXMLParam](ConfXMLParam.md#s-ConfXMLParam)

**Parameters**

- `java.util.List<String> mountId`
- `com.tailf.conf.ConfXMLParam[] params`

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

<a id="s-getConfNamespace"></a>
### getConfNamespace()

```java
public com.tailf.conf.ConfNamespace getConfNamespace()
```

Types: [ConfNamespace](ConfNamespace.md#s-ConfNamespace)

Returns the namespace for this parameter.

**Returns:** The namespace for this parameter

<a id="s-getNSHash"></a>
### getNSHash()

```java
public Integer getNSHash()
```

Returns the namespce hash for this parameter.

**Returns:** The namespace hash for this parameter

<a id="s-getTag"></a>
### getTag()

```java
public String getTag()
```

Returns the tag for this parameter.

**Returns:** The tag for this parameter

<a id="s-getTagHash"></a>
### getTagHash()

```java
public Integer getTagHash()
```

Returns the hash tag for this parameter.

**Returns:** The tag hash for this parameter

<a id="s-getValue"></a>
### getValue()

```java
public com.tailf.conf.ConfObject getValue()
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

Returns the value for this parameter.

**Returns:** The value for this parameter

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-setCdbInstanceInteger"></a>
### setCdbInstanceInteger(int)

```java
protected void setCdbInstanceInteger(int cdbInstanceInteger)
```

**Parameters**

- `int cdbInstanceInteger`

<a id="s-setNamespace"></a>
### setNamespace(ConfNamespace)

```java
protected void setNamespace(com.tailf.conf.ConfNamespace namespace)
```

Types: [ConfNamespace](ConfNamespace.md#s-ConfNamespace)

**Parameters**

- `com.tailf.conf.ConfNamespace namespace`

<a id="s-setNamespaceFromMountId"></a>
### setNamespaceFromMountId(List<String>)

```java
protected void setNamespaceFromMountId(java.util.List<String> mountId)
```

**Parameters**

- `java.util.List<String> mountId`

<a id="s-toDOM"></a>
### toDOM(ConfXMLParam[])

```java
public static org.w3c.dom.Document toDOM(
    com.tailf.conf.ConfXMLParam[] params
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#s-ConfXMLParam), [ConfException](ConfException.md#s-ConfException)

Return String `DOM` document representation of a
 (Conf)XML-structure. A array of `ConfXMLParam` could
  represent a frament of a document (e.g does not have a root node)
 a root node will be created.

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params` - - A array of populated `ConfXMLParam`
                 or null if null is given or empty string is the length
                 0

**Returns:** A XML string representation of the supplied
         `ConfXMLParam` document

**Throws**

- `ConfException` - If the the populated array is not well
                        structured

<a id="s-toDOM-1"></a>
### toDOM(ConfXMLParam[], String, String)

```java
public static org.w3c.dom.Document toDOM(
    com.tailf.conf.ConfXMLParam[] params,
    String parentNode,
    String parentURI
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#s-ConfXMLParam), [ConfException](ConfException.md#s-ConfException)

Return String `DOM` representation of a
  (Conf)XML-structure. A array of `ConfXMLParam`
  could represent a frament
  of a document (e.g does not have a root node) a root node will
  be created with the specified parameter `parentNode` with
  the uri `parentURI`.

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params` - A array of populated `ConfXMLParam`
                 or null if null is given or empty string is the length
                 0
- `String parentNode` - A parent tag that represent the root node.
- `String parentURI` - The ur of the parent node

**Returns:** A `DOM` document representation of the supplied
           `ConfXMLParam` array paramter

**Throws**

- `ConfException` - If the the populated array is not well
                        structured

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

<a id="s-toXML"></a>
### toXML(ConfXMLParam[])

```java
public static String toXML(com.tailf.conf.ConfXMLParam[] params) throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#s-ConfXMLParam), [ConfException](ConfException.md#s-ConfException)

Return String XML representation of a (Conf)XML-structure. A
  array of `ConfXMLParam` could represent a frament
  of a document (e.g does not have a root node) a root node will
  be created.

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params` - - A array of populated `ConfXMLParam`
                 or null if null is given or empty string is the length
                 0

**Returns:** A XML string representation of this fragment document

**Throws**

- `ConfException` - If the the populated array is not well
                        structured

<a id="s-toXML-1"></a>
### toXML(ConfXMLParam[], String, String)

```java
public static String toXML(
    com.tailf.conf.ConfXMLParam[] params,
    String parentNode,
    String parentURI
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#s-ConfXMLParam), [ConfException](ConfException.md#s-ConfException)

Return String XML representation of a (Conf)XML-structure. A
  array of `ConfXMLParam` could represent a frament
  of a document (e.g does not have a root node) a root node will
  be created with the specified parameter `parentNode` with
  the uri `parentURI`.

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params` - A array of populated `ConfXMLParam`
                 or null if null is given or empty string is the length
                 0
- `String parentNode` - A parent tag that represent the root node.
- `String parentURI` - The ur of the parent node

**Throws**

- `ConfException` - If the the populated array is not well
                        structured

<a id="s-toXMLParams"></a>
### toXMLParams(String, ConfPath)

```java
public static com.tailf.conf.ConfXMLParam[] toXMLParams(
    String xml,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#s-ConfXMLParam), [ConfPath](ConfPath.md#s-ConfPath), [ConfException](ConfException.md#s-ConfException)

Converts an xml snippet to a corresponding ConfXMLParam[].
 The resulting ConfXMLParam[] is prepared for a getValues() call.

 The XML input can be provided in two forms:


- A complete fragment rooted at the path node, e.g.
     `<server xmlns="..."><name>s1</name></server>`
   - A fragment of the children only, e.g.
     `<name>s1</name>`
 In both cases, the path identifies the root schema node.

**Parameters**

- `String xml` - XML string representing an instance document
   at or below the path node
- `com.tailf.conf.ConfPath path` - Start node (or root path) of the XML document

**Returns:** The resulting ConfXMLParam[]

**Throws**

- `ConfException`

<a id="s-toXMLParams-1"></a>
### toXMLParams(String, ConfPath, int)

```java
public static com.tailf.conf.ConfXMLParam[] toXMLParams(
    String xml,
    com.tailf.conf.ConfPath path,
    int mode
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#s-ConfXMLParam), [ConfPath](ConfPath.md#s-ConfPath), [ConfException](ConfException.md#s-ConfException)

Converts an xml snippet to a corresponding ConfXMLParam[].
 The mode parameter controls whether this ConfXMLParam[] should be
 prepared for a getValues() call or for a setValues() call using
 using [`XMLtoConfXMLParam`](../util/XMLtoConfXMLParam.md#s-XMLtoConfXMLParam) or
  [`XMLtoConfXMLParam`](../util/XMLtoConfXMLParam.md#s-XMLtoConfXMLParam) respectively.

 The XML input can be provided in two forms:


- A complete fragment rooted at the path node, e.g.
     `<server xmlns="..."><name>s1</name></server>`
   - A fragment of the children only, e.g.
     `<name>s1</name>`
 In both cases, the path identifies the root schema node.

**Parameters**

- `String xml` - XML string representing an instance document
   at or below the path node
- `com.tailf.conf.ConfPath path` - Start node (or root path) of the XML document
- `int mode` - one of [`XMLtoConfXMLParam`](../util/XMLtoConfXMLParam.md#s-XMLtoConfXMLParam) or
  [`XMLtoConfXMLParam`](../util/XMLtoConfXMLParam.md#s-XMLtoConfXMLParam)

**Returns:** The resulting ConfXMLParam[]

**Throws**

- `ConfException`
