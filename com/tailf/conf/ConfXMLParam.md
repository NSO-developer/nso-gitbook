<a id="cls-ConfXMLParam"></a>
# ConfXMLParam

```java
public abstract class com.tailf.conf.ConfXMLParam
    extends com.tailf.conf.ConfObject
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

Represents the base class of a flat XML structure.

 This class is used to represent arbitrary XML trees, typically
 used as input/output parameters to YANG rpc/action statements.
 It is also used in methods that set/get multiple values in one call.

 Subclasses to this class represents node elements or
 entries in a [`ConfXMLParam`](ConfXMLParam.md#cls-ConfXMLParam) array. An array
 of this type form a flat XML structure.

 The array is populated, normally through a "depth first" traversal of
 the data tree, as follows:


- Optional leafs or presence containers that do not exist are
 omitted entirely from the array.

   - List and container nodes use one array element where the value
 has type [`ConfXMLParamStart`](ConfXMLParamStart.md#cls-ConfXMLParamStart), and `tag` and
 `ns` set according to the node name followed by array
 elements for the sub-nodes according to this list, followed by one
 array element where the value has type
 [`ConfXMLParamStop`](ConfXMLParamStop.md#cls-ConfXMLParamStop), and `tag` and `ns`
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
 [`ConfXMLParamValue`](ConfXMLParamValue.md#cls-ConfXMLParamValue) for value element and `tag` and
 `ns` according to the node name and additional
 `value` set according to the leaf name.

       - Leafs of type empty use an array element where the value has
 type [`ConfXMLParamLeaf`](ConfXMLParamLeaf.md#cls-ConfXMLParamLeaf), and `tag` and
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
 [`Maapi#setValues(int,ConfXMLParam[],ConfPath)`](../maapi/Maapi.md#m-setvalues-27a83fbfcc37) or we could
 extract multiple values in one call, for example
 `Maapi#getValues(int, ConfXMLParam[],String,Object...)` or
 with MAAPI.

 And with CDB
 [`CdbSession#setValues(ConfXMLParam[],ConfPath)`](../cdb/CdbSession.md#m-setvalues-0755e36fbd2c).

 The `ConfXMLParam` array is also used in

 [`CdbSession#getValues(ConfXMLParam[],ConfPath)`](../cdb/CdbSession.md#m-getvalues-b30d01896278)
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
 for example [`Maapi#requestAction(ConfXMLParam[],String,Object...)`](../maapi/Maapi.md#m-requestaction-76bbfd533fa4)
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

- [ConfXMLParamLeaf](ConfXMLParamLeaf.md#cls-ConfXMLParamLeaf)
- [ConfXMLParamStart](ConfXMLParamStart.md#cls-ConfXMLParamStart)
- [ConfXMLParamStartDel](ConfXMLParamStartDel.md#cls-ConfXMLParamStartDel)
- [ConfXMLParamStop](ConfXMLParamStop.md#cls-ConfXMLParamStop)
- [ConfXMLParamValue](ConfXMLParamValue.md#cls-ConfXMLParamValue)

## Members

**Constructors**:

- [ConfXMLParam(ConfEObject)](#m-confxmlparam-1316dcbd2d76)
- [ConfXMLParam(ConfNamespace, String, ConfObject)](#m-confxmlparam-de1f4e03200f)
- [ConfXMLParam(ConfNamespace, String, XMLParamType)](#m-confxmlparam-08ceb6e049bd)
- [ConfXMLParam(ConfPath, MountIdInterface, String, String, ConfObject)](#m-confxmlparam-ee545ddced6d)
- [ConfXMLParam(ConfPath, MountIdInterface, String, String, XMLParamType)](#m-confxmlparam-4fb2eb63d2c2)
- [ConfXMLParam(int, int)](#m-confxmlparam-bde5bd68585f)
- [ConfXMLParam(int, int, ConfObject)](#m-confxmlparam-5d07eab52545)
- [ConfXMLParam(int, int, XMLParamType)](#m-confxmlparam-b7f397465f0a)
- [ConfXMLParam(int, String, XMLParamType)](#m-confxmlparam-d108a4297643)
- [ConfXMLParam(long, long)](#m-confxmlparam-6204e20f2f87)
- [ConfXMLParam(long, long, ConfObject)](#m-confxmlparam-fef602310362)
- [ConfXMLParam(String, String, ConfObject)](#m-confxmlparam-856d61cc7e2a)
- [ConfXMLParam(String, String, XMLParamType)](#m-confxmlparam-69e745801ad7)

**Fields**:

- [J_BINARY](ConfObject.md#m-J_BINARY) from ConfObject
- [J_BIT32](ConfObject.md#m-J_BIT32) from ConfObject
- [J_BIT64](ConfObject.md#m-J_BIT64) from ConfObject
- [J_BITBIG](ConfObject.md#m-J_BITBIG) from ConfObject
- [J_BOOL](ConfObject.md#m-J_BOOL) from ConfObject
- [J_BUF](ConfObject.md#m-J_BUF) from ConfObject
- [J_CDBBEGIN](ConfObject.md#m-J_CDBBEGIN) from ConfObject
- [J_DATE](ConfObject.md#m-J_DATE) from ConfObject
- [J_DATETIME](ConfObject.md#m-J_DATETIME) from ConfObject
- [J_DECIMAL64](ConfObject.md#m-J_DECIMAL64) from ConfObject
- [J_DEFAULT](ConfObject.md#m-J_DEFAULT) from ConfObject
- [J_DOUBLE](ConfObject.md#m-J_DOUBLE) from ConfObject
- [J_DQUAD](ConfObject.md#m-J_DQUAD) from ConfObject
- [J_DURATION](ConfObject.md#m-J_DURATION) from ConfObject
- [J_EMPTY](ConfObject.md#m-J_EMPTY) from ConfObject
- [J_ENUMERATION](ConfObject.md#m-J_ENUMERATION) from ConfObject
- [J_HEXSTR](ConfObject.md#m-J_HEXSTR) from ConfObject
- [J_IDENTITYREF](ConfObject.md#m-J_IDENTITYREF) from ConfObject
- [J_INSTANCE_IDENTIFIER](ConfObject.md#m-J_INSTANCE_IDENTIFIER) from ConfObject
- [J_INT16](ConfObject.md#m-J_INT16) from ConfObject
- [J_INT32](ConfObject.md#m-J_INT32) from ConfObject
- [J_INT64](ConfObject.md#m-J_INT64) from ConfObject
- [J_INT8](ConfObject.md#m-J_INT8) from ConfObject
- [J_IPV4](ConfObject.md#m-J_IPV4) from ConfObject
- [J_IPV4_AND_PLEN](ConfObject.md#m-J_IPV4_AND_PLEN) from ConfObject
- [J_IPV4PREFIX](ConfObject.md#m-J_IPV4PREFIX) from ConfObject
- [J_IPV6](ConfObject.md#m-J_IPV6) from ConfObject
- [J_IPV6_AND_PLEN](ConfObject.md#m-J_IPV6_AND_PLEN) from ConfObject
- [J_IPV6PREFIX](ConfObject.md#m-J_IPV6PREFIX) from ConfObject
- [J_LIST](ConfObject.md#m-J_LIST) from ConfObject
- [J_NOEXISTS](ConfObject.md#m-J_NOEXISTS) from ConfObject
- [J_OBJECTREF](ConfObject.md#m-J_OBJECTREF) from ConfObject
- [J_OID](ConfObject.md#m-J_OID) from ConfObject
- [J_PTR](ConfObject.md#m-J_PTR) from ConfObject
- [J_QNAME](ConfObject.md#m-J_QNAME) from ConfObject
- [J_STR](ConfObject.md#m-J_STR) from ConfObject
- [J_SYMBOL](ConfObject.md#m-J_SYMBOL) from ConfObject
- [J_TIME](ConfObject.md#m-J_TIME) from ConfObject
- [J_UINT16](ConfObject.md#m-J_UINT16) from ConfObject
- [J_UINT32](ConfObject.md#m-J_UINT32) from ConfObject
- [J_UINT64](ConfObject.md#m-J_UINT64) from ConfObject
- [J_UINT8](ConfObject.md#m-J_UINT8) from ConfObject
- [J_UNION](ConfObject.md#m-J_UNION) from ConfObject
- [J_XMLBEGIN](ConfObject.md#m-J_XMLBEGIN) from ConfObject
- [J_XMLBEGINDEL](ConfObject.md#m-J_XMLBEGINDEL) from ConfObject
- [J_XMLEND](ConfObject.md#m-J_XMLEND) from ConfObject
- [J_XMLMOVEAFTER](ConfObject.md#m-J_XMLMOVEAFTER) from ConfObject
- [J_XMLMOVEFIRST](ConfObject.md#m-J_XMLMOVEFIRST) from ConfObject
- [J_XMLTAG](ConfObject.md#m-J_XMLTAG) from ConfObject
- [namespace](#m-namespace)
- [ns](#m-ns)
- [prefix](#m-prefix)
- [tag](#m-tag)
- [tagString](#m-tagString)
- [val](#m-val)

**Methods**:

- [clone()](ConfObject.md#m-clone-164c86c45e9b) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#m-compare-e78552baa2bf) from ConfObject
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [decodeParam(ConfEObject)](#m-decodeparam-6799ac4705bb)
- [decodeParams(ConfEObject)](#m-decodeparams-5a1c83464ae4)
- [encode()](#m-encode-fbae522bba37)
- [encode(ConfXMLParam[])](#m-encode-7356521b6411)
- [encode(List<String>)](#m-encode-da878ca7b20d)
- [encode(List<String>, ConfXMLParam[])](#m-encode-e9fa5532e6d5)
- [encodeHKP()](#m-encodehkp-50d4bf8d0256)
- [encodeHKP(ConfXMLParam[])](#m-encodehkp-ebc927cd1ccf)
- [encodeHKP(List<String>)](#m-encodehkp-2ff023418b43)
- [encodeHKP(List<String>, ConfXMLParam[])](#m-encodehkp-6bc3df5e84cb)
- [encodeIKP()](#m-encodeikp-b160b87f6433)
- [encodeIKP(ConfXMLParam[])](#m-encodeikp-ab4320a110c6)
- [encodeIKP(List<String>)](#m-encodeikp-6f358b789ce0)
- [encodeIKP(List<String>, ConfXMLParam[])](#m-encodeikp-c0a89dd54349)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getConfNamespace()](#m-getconfnamespace-87556caf3223)
- [getNSHash()](#m-getnshash-2129fb8b3cfe)
- [getTag()](#m-gettag-315f45956d6f)
- [getTagHash()](#m-gettaghash-8f057919039c)
- [getValue()](#m-getvalue-d93864668c40)
- [hashCode()](#m-hashcode-ef797a217903)
- [setCdbInstanceInteger(int)](#m-setcdbinstanceinteger-f7ee747b0f20)
- [setNamespace(ConfNamespace)](#m-setnamespace-30316a480cfa)
- [setNamespaceFromMountId(List<String>)](#m-setnamespacefrommountid-1aa3f67eb493)
- [toDOM(ConfXMLParam[])](#m-todom-13fd8f87f1a2)
- [toDOM(ConfXMLParam[], String, String)](#m-todom-a2de025173ef)
- [toString()](#m-tostring-e9d48c5503ef)
- [toXML(ConfXMLParam[])](#m-toxml-122580fde7a8)
- [toXML(ConfXMLParam[], String, String)](#m-toxml-e7cef9be4b1e)
- [toXMLParams(String, ConfPath)](#m-toxmlparams-bec6ecc54070)
- [toXMLParams(String, ConfPath, int)](#m-toxmlparams-61a6fdf75a13)

## Constructors

<a id="m-confxmlparam-1316dcbd2d76"></a>
### ConfXMLParam(ConfEObject)

```java
protected ConfXMLParam(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="m-confxmlparam-de1f4e03200f"></a>
### ConfXMLParam(ConfNamespace, String, ConfObject)

```java
protected ConfXMLParam(
    com.tailf.conf.ConfNamespace namespace,
    String tagString,
    com.tailf.conf.ConfObject val
)
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace), [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.ConfNamespace namespace`
- `String tagString`
- `com.tailf.conf.ConfObject val`

<a id="m-confxmlparam-08ceb6e049bd"></a>
### ConfXMLParam(ConfNamespace, String, XMLParamType)

```java
protected ConfXMLParam(
    com.tailf.conf.ConfNamespace namespace,
    String tagString,
    com.tailf.conf.XMLParamType type
)
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace), [XMLParamType](XMLParamType.md#cls-XMLParamType)

**Parameters**

- `com.tailf.conf.ConfNamespace namespace`
- `String tagString`
- `com.tailf.conf.XMLParamType type`

<a id="m-confxmlparam-ee545ddced6d"></a>
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

Types: [ConfPath](ConfPath.md#cls-ConfPath), [MountIdInterface](MountIdInterface.md#cls-MountIdInterface), [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.ConfPath path`
- `com.tailf.conf.MountIdInterface mountIdGetter`
- `String prefix`
- `String tagString`
- `com.tailf.conf.ConfObject val`

<a id="m-confxmlparam-4fb2eb63d2c2"></a>
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

Types: [ConfPath](ConfPath.md#cls-ConfPath), [MountIdInterface](MountIdInterface.md#cls-MountIdInterface), [XMLParamType](XMLParamType.md#cls-XMLParamType)

**Parameters**

- `com.tailf.conf.ConfPath path`
- `com.tailf.conf.MountIdInterface mountIdGetter`
- `String prefix`
- `String tagString`
- `com.tailf.conf.XMLParamType type`

<a id="m-confxmlparam-bde5bd68585f"></a>
### ConfXMLParam(int, int)

```java
protected ConfXMLParam(int nshash, int tag)
```

**Parameters**

- `int nshash`
- `int tag`

<a id="m-confxmlparam-5d07eab52545"></a>
### ConfXMLParam(int, int, ConfObject)

```java
protected ConfXMLParam(int ns, int tag, com.tailf.conf.ConfObject val)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `int ns`
- `int tag`
- `com.tailf.conf.ConfObject val`

<a id="m-confxmlparam-b7f397465f0a"></a>
### ConfXMLParam(int, int, XMLParamType)

```java
protected ConfXMLParam(int ns, int tag, com.tailf.conf.XMLParamType type)
```

Types: [XMLParamType](XMLParamType.md#cls-XMLParamType)

**Parameters**

- `int ns`
- `int tag`
- `com.tailf.conf.XMLParamType type`

<a id="m-confxmlparam-d108a4297643"></a>
### ConfXMLParam(int, String, XMLParamType)

```java
protected ConfXMLParam(int ns, String tagString, com.tailf.conf.XMLParamType type)
```

Types: [XMLParamType](XMLParamType.md#cls-XMLParamType)

**Parameters**

- `int ns`
- `String tagString`
- `com.tailf.conf.XMLParamType type`

<a id="m-confxmlparam-6204e20f2f87"></a>
### ConfXMLParam(long, long)

```java
protected ConfXMLParam(long nshash, long tag)
```

**Parameters**

- `long nshash`
- `long tag`

<a id="m-confxmlparam-fef602310362"></a>
### ConfXMLParam(long, long, ConfObject)

```java
protected ConfXMLParam(long ns, long tag, com.tailf.conf.ConfObject val)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `long ns`
- `long tag`
- `com.tailf.conf.ConfObject val`

<a id="m-confxmlparam-856d61cc7e2a"></a>
### ConfXMLParam(String, String, ConfObject)

```java
protected ConfXMLParam(String prefix, String tagString, com.tailf.conf.ConfObject val)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `String prefix`
- `String tagString`
- `com.tailf.conf.ConfObject val`

<a id="m-confxmlparam-69e745801ad7"></a>
### ConfXMLParam(String, String, XMLParamType)

```java
protected ConfXMLParam(String prefix, String tagString, com.tailf.conf.XMLParamType type)
```

Types: [XMLParamType](XMLParamType.md#cls-XMLParamType)

**Parameters**

- `String prefix`
- `String tagString`
- `com.tailf.conf.XMLParamType type`


## Fields

<a id="m-namespace"></a>
### namespace

```java
protected com.tailf.conf.ConfNamespace namespace = null;
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

<a id="m-ns"></a>
### ns

```java
protected Integer ns = null;
```

<a id="m-prefix"></a>
### prefix

```java
protected String prefix = null;
```

<a id="m-tag"></a>
### tag

```java
protected Integer tag = null;
```

<a id="m-tagString"></a>
### tagString

```java
protected String tagString = null;
```

<a id="m-val"></a>
### val

```java
protected com.tailf.conf.ConfObject val = null;
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)


## Methods

<a id="m-decodeparam-6799ac4705bb"></a>
### decodeParam(ConfEObject)

```java
public static com.tailf.conf.ConfXMLParam decodeParam(
    com.tailf.proto.ConfEObject o
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#cls-ConfXMLParam), [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

Decode the internal representation to a `ConfXMLParam`
 Used internally.

**Parameters**

- `com.tailf.proto.ConfEObject o`

**Returns:** The paramter from the internal representation

<a id="m-decodeparams-5a1c83464ae4"></a>
### decodeParams(ConfEObject)

```java
public static com.tailf.conf.ConfXMLParam[] decodeParams(
    com.tailf.proto.ConfEObject o
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#cls-ConfXMLParam), [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="m-encode-fbae522bba37"></a>
### encode()

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

<a id="m-encode-7356521b6411"></a>
### encode(ConfXMLParam[])

```java
public static com.tailf.proto.ConfEObject encode(com.tailf.conf.ConfXMLParam[] params)
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfXMLParam](ConfXMLParam.md#cls-ConfXMLParam)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`

<a id="m-encode-da878ca7b20d"></a>
### encode(List<String>)

```java
public com.tailf.proto.ConfEObject encode(java.util.List<String> mountId)
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

**Parameters**

- `java.util.List<String> mountId`

<a id="m-encode-e9fa5532e6d5"></a>
### encode(List<String>, ConfXMLParam[])

```java
public static com.tailf.proto.ConfEObject encode(
    java.util.List<String> mountId,
    com.tailf.conf.ConfXMLParam[] params
)
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfXMLParam](ConfXMLParam.md#cls-ConfXMLParam)

**Parameters**

- `java.util.List<String> mountId`
- `com.tailf.conf.ConfXMLParam[] params`

<a id="m-encodehkp-50d4bf8d0256"></a>
### encodeHKP()

```java
public com.tailf.proto.ConfEObject encodeHKP()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

Encode this ConfXMLParam to HKP representation
 (i.e hashbased [ns | tag] where where ns and tag are both
 in long). This does not rely on ConfNamespace.

<a id="m-encodehkp-ebc927cd1ccf"></a>
### encodeHKP(ConfXMLParam[])

```java
public static com.tailf.proto.ConfEObject encodeHKP(com.tailf.conf.ConfXMLParam[] params)
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfXMLParam](ConfXMLParam.md#cls-ConfXMLParam)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`

<a id="m-encodehkp-2ff023418b43"></a>
### encodeHKP(List<String>)

```java
public com.tailf.proto.ConfEObject encodeHKP(java.util.List<String> mountId)
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

**Parameters**

- `java.util.List<String> mountId`

<a id="m-encodehkp-6bc3df5e84cb"></a>
### encodeHKP(List<String>, ConfXMLParam[])

```java
public static com.tailf.proto.ConfEObject encodeHKP(
    java.util.List<String> mountId,
    com.tailf.conf.ConfXMLParam[] params
)
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfXMLParam](ConfXMLParam.md#cls-ConfXMLParam)

**Parameters**

- `java.util.List<String> mountId`
- `com.tailf.conf.ConfXMLParam[] params`

<a id="m-encodeikp-b160b87f6433"></a>
### encodeIKP()

```java
public com.tailf.proto.ConfEObject encodeIKP()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

<a id="m-encodeikp-ab4320a110c6"></a>
### encodeIKP(ConfXMLParam[])

```java
public static com.tailf.proto.ConfEObject encodeIKP(com.tailf.conf.ConfXMLParam[] params)
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfXMLParam](ConfXMLParam.md#cls-ConfXMLParam)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`

<a id="m-encodeikp-6f358b789ce0"></a>
### encodeIKP(List<String>)

```java
public com.tailf.proto.ConfEObject encodeIKP(java.util.List<String> mountId)
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

**Parameters**

- `java.util.List<String> mountId`

<a id="m-encodeikp-c0a89dd54349"></a>
### encodeIKP(List<String>, ConfXMLParam[])

```java
public static com.tailf.proto.ConfEObject encodeIKP(
    java.util.List<String> mountId,
    com.tailf.conf.ConfXMLParam[] params
)
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfXMLParam](ConfXMLParam.md#cls-ConfXMLParam)

**Parameters**

- `java.util.List<String> mountId`
- `com.tailf.conf.ConfXMLParam[] params`

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

<a id="m-getconfnamespace-87556caf3223"></a>
### getConfNamespace()

```java
public com.tailf.conf.ConfNamespace getConfNamespace()
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

Returns the namespace for this parameter.

**Returns:** The namespace for this parameter

<a id="m-getnshash-2129fb8b3cfe"></a>
### getNSHash()

```java
public Integer getNSHash()
```

Returns the namespce hash for this parameter.

**Returns:** The namespace hash for this parameter

<a id="m-gettag-315f45956d6f"></a>
### getTag()

```java
public String getTag()
```

Returns the tag for this parameter.

**Returns:** The tag for this parameter

<a id="m-gettaghash-8f057919039c"></a>
### getTagHash()

```java
public Integer getTagHash()
```

Returns the hash tag for this parameter.

**Returns:** The tag hash for this parameter

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public com.tailf.conf.ConfObject getValue()
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

Returns the value for this parameter.

**Returns:** The value for this parameter

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-setcdbinstanceinteger-f7ee747b0f20"></a>
### setCdbInstanceInteger(int)

```java
protected void setCdbInstanceInteger(int cdbInstanceInteger)
```

**Parameters**

- `int cdbInstanceInteger`

<a id="m-setnamespace-30316a480cfa"></a>
### setNamespace(ConfNamespace)

```java
protected void setNamespace(com.tailf.conf.ConfNamespace namespace)
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

**Parameters**

- `com.tailf.conf.ConfNamespace namespace`

<a id="m-setnamespacefrommountid-1aa3f67eb493"></a>
### setNamespaceFromMountId(List<String>)

```java
protected void setNamespaceFromMountId(java.util.List<String> mountId)
```

**Parameters**

- `java.util.List<String> mountId`

<a id="m-todom-13fd8f87f1a2"></a>
### toDOM(ConfXMLParam[])

```java
public static org.w3c.dom.Document toDOM(
    com.tailf.conf.ConfXMLParam[] params
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#cls-ConfXMLParam), [ConfException](ConfException.md#cls-ConfException)

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

<a id="m-todom-a2de025173ef"></a>
### toDOM(ConfXMLParam[], String, String)

```java
public static org.w3c.dom.Document toDOM(
    com.tailf.conf.ConfXMLParam[] params,
    String parentNode,
    String parentURI
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#cls-ConfXMLParam), [ConfException](ConfException.md#cls-ConfException)

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

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

<a id="m-toxml-122580fde7a8"></a>
### toXML(ConfXMLParam[])

```java
public static String toXML(com.tailf.conf.ConfXMLParam[] params) throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#cls-ConfXMLParam), [ConfException](ConfException.md#cls-ConfException)

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

<a id="m-toxml-e7cef9be4b1e"></a>
### toXML(ConfXMLParam[], String, String)

```java
public static String toXML(
    com.tailf.conf.ConfXMLParam[] params,
    String parentNode,
    String parentURI
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#cls-ConfXMLParam), [ConfException](ConfException.md#cls-ConfException)

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

<a id="m-toxmlparams-bec6ecc54070"></a>
### toXMLParams(String, ConfPath)

```java
public static com.tailf.conf.ConfXMLParam[] toXMLParams(
    String xml,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#cls-ConfXMLParam), [ConfPath](ConfPath.md#cls-ConfPath), [ConfException](ConfException.md#cls-ConfException)

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

<a id="m-toxmlparams-61a6fdf75a13"></a>
### toXMLParams(String, ConfPath, int)

```java
public static com.tailf.conf.ConfXMLParam[] toXMLParams(
    String xml,
    com.tailf.conf.ConfPath path,
    int mode
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#cls-ConfXMLParam), [ConfPath](ConfPath.md#cls-ConfPath), [ConfException](ConfException.md#cls-ConfException)

Converts an xml snippet to a corresponding ConfXMLParam[].
 The mode parameter controls whether this ConfXMLParam[] should be
 prepared for a getValues() call or for a setValues() call using
 using [`XMLtoConfXMLParam#MODE_GET`](../util/XMLtoConfXMLParam.md#m-MODE_GET) or
  [`XMLtoConfXMLParam#MODE_SET`](../util/XMLtoConfXMLParam.md#m-MODE_SET) respectively.

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
- `int mode` - one of [`XMLtoConfXMLParam#MODE_GET`](../util/XMLtoConfXMLParam.md#m-MODE_GET) or
  [`XMLtoConfXMLParam#MODE_SET`](../util/XMLtoConfXMLParam.md#m-MODE_SET)

**Returns:** The resulting ConfXMLParam[]

**Throws**

- `ConfException`
