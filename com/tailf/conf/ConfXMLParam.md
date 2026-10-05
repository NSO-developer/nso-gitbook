# ConfXMLParam <a href="#confxmlparam-f5f4394b46a7" id="confxmlparam-f5f4394b46a7"></a>

```java
public abstract class com.tailf.conf.ConfXMLParam
    extends com.tailf.conf.ConfObject
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)

Represents the base class of a flat XML structure.

 This class is used to represent arbitrary XML trees, typically
 used as input/output parameters to YANG rpc/action statements.
 It is also used in methods that set/get multiple values in one call.

 Subclasses to this class represents node elements or
 entries in a [`ConfXMLParam`](ConfXMLParam.md#confxmlparam-f5f4394b46a7) array. An array
 of this type form a flat XML structure.

 The array is populated, normally through a "depth first" traversal of
 the data tree, as follows:


- Optional leafs or presence containers that do not exist are
 omitted entirely from the array.

   - List and container nodes use one array element where the value
 has type [`ConfXMLParamStart`](ConfXMLParamStart.md#confxmlparamstart-05eace141688), and `tag` and
 `ns` set according to the node name followed by array
 elements for the sub-nodes according to this list, followed by one
 array element where the value has type
 [`ConfXMLParamStop`](ConfXMLParamStop.md#confxmlparamstop-d1e86c4fdecc), and `tag` and `ns`
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
 [`ConfXMLParamValue`](ConfXMLParamValue.md#confxmlparamvalue-9f41fb2668c9) for value element and `tag` and
 `ns` according to the node name and additional
 `value` set according to the leaf name.

       - Leafs of type empty use an array element where the value has
 type [`ConfXMLParamLeaf`](ConfXMLParamLeaf.md#confxmlparamleaf-107412653048), and `tag` and
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
 [`Maapi#setValues(int,ConfXMLParam[],ConfPath)`](../maapi/Maapi.md#setvalues-27a83fbfcc37) or we could
 extract multiple values in one call, for example
 `Maapi#getValues(int, ConfXMLParam[],String,Object...)` or
 with MAAPI.

 And with CDB
 [`CdbSession#setValues(ConfXMLParam[],ConfPath)`](../cdb/CdbSession.md#setvalues-0755e36fbd2c).

 The `ConfXMLParam` array is also used in

 [`CdbSession#getValues(ConfXMLParam[],ConfPath)`](../cdb/CdbSession.md#getvalues-b30d01896278)
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
 for example [`Maapi#requestAction(ConfXMLParam[],String,Object...)`](../maapi/Maapi.md#requestaction-76bbfd533fa4)
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

- [ConfXMLParamLeaf](ConfXMLParamLeaf.md#confxmlparamleaf-107412653048)
- [ConfXMLParamStart](ConfXMLParamStart.md#confxmlparamstart-05eace141688)
- [ConfXMLParamStartDel](ConfXMLParamStartDel.md#confxmlparamstartdel-3d1390860b5a)
- [ConfXMLParamStop](ConfXMLParamStop.md#confxmlparamstop-d1e86c4fdecc)
- [ConfXMLParamValue](ConfXMLParamValue.md#confxmlparamvalue-9f41fb2668c9)

## Members

**Constructors**:

- [ConfXMLParam\(ConfEObject\)](#confxmlparam-1316dcbd2d76)
- [ConfXMLParam\(ConfNamespace, String, ConfObject\)](#confxmlparam-de1f4e03200f)
- [ConfXMLParam\(ConfNamespace, String, XMLParamType\)](#confxmlparam-08ceb6e049bd)
- [ConfXMLParam\(ConfPath, MountIdInterface, String, String, ConfObject\)](#confxmlparam-ee545ddced6d)
- [ConfXMLParam\(ConfPath, MountIdInterface, String, String, XMLParamType\)](#confxmlparam-4fb2eb63d2c2)
- [ConfXMLParam\(int, int\)](#confxmlparam-bde5bd68585f)
- [ConfXMLParam\(int, int, ConfObject\)](#confxmlparam-5d07eab52545)
- [ConfXMLParam\(int, int, XMLParamType\)](#confxmlparam-b7f397465f0a)
- [ConfXMLParam\(int, String, XMLParamType\)](#confxmlparam-d108a4297643)
- [ConfXMLParam\(long, long\)](#confxmlparam-6204e20f2f87)
- [ConfXMLParam\(long, long, ConfObject\)](#confxmlparam-fef602310362)
- [ConfXMLParam\(String, String, ConfObject\)](#confxmlparam-856d61cc7e2a)
- [ConfXMLParam\(String, String, XMLParamType\)](#confxmlparam-69e745801ad7)

**Fields**:

- [J\_BINARY](ConfObject.md#j_binary-f4395337afc2) from ConfObject
- [J\_BIT32](ConfObject.md#j_bit32-40251205e2bd) from ConfObject
- [J\_BIT64](ConfObject.md#j_bit64-15d68e666b90) from ConfObject
- [J\_BITBIG](ConfObject.md#j_bitbig-835affd18d2b) from ConfObject
- [J\_BOOL](ConfObject.md#j_bool-fa62aa9e1544) from ConfObject
- [J\_BUF](ConfObject.md#j_buf-d1b0b08b798f) from ConfObject
- [J\_CDBBEGIN](ConfObject.md#j_cdbbegin-07a4f9eca5c4) from ConfObject
- [J\_DATE](ConfObject.md#j_date-00cc8f6e70e6) from ConfObject
- [J\_DATETIME](ConfObject.md#j_datetime-573fe6a9a577) from ConfObject
- [J\_DECIMAL64](ConfObject.md#j_decimal64-ff02afe47ff7) from ConfObject
- [J\_DEFAULT](ConfObject.md#j_default-54b54b027809) from ConfObject
- [J\_DOUBLE](ConfObject.md#j_double-ade902bbb1aa) from ConfObject
- [J\_DQUAD](ConfObject.md#j_dquad-852ab4ec2848) from ConfObject
- [J\_DURATION](ConfObject.md#j_duration-98ef58bed1c0) from ConfObject
- [J\_EMPTY](ConfObject.md#j_empty-cca63c6cd2c7) from ConfObject
- [J\_ENUMERATION](ConfObject.md#j_enumeration-47c69754d29b) from ConfObject
- [J\_HEXSTR](ConfObject.md#j_hexstr-90b6b86efe7b) from ConfObject
- [J\_IDENTITYREF](ConfObject.md#j_identityref-977d471383c5) from ConfObject
- [J\_INSTANCE\_IDENTIFIER](ConfObject.md#j_instance_identifier-bbb4b8e5e954) from ConfObject
- [J\_INT16](ConfObject.md#j_int16-4f9df234cba7) from ConfObject
- [J\_INT32](ConfObject.md#j_int32-db4c66331284) from ConfObject
- [J\_INT64](ConfObject.md#j_int64-c290a7cb2e11) from ConfObject
- [J\_INT8](ConfObject.md#j_int8-8f73ffef0f12) from ConfObject
- [J\_IPV4](ConfObject.md#j_ipv4-54fdc3efb49b) from ConfObject
- [J\_IPV4\_AND\_PLEN](ConfObject.md#j_ipv4_and_plen-69b1e630ab12) from ConfObject
- [J\_IPV4PREFIX](ConfObject.md#j_ipv4prefix-d36121ba89ca) from ConfObject
- [J\_IPV6](ConfObject.md#j_ipv6-03903b354701) from ConfObject
- [J\_IPV6\_AND\_PLEN](ConfObject.md#j_ipv6_and_plen-ac1054abbf31) from ConfObject
- [J\_IPV6PREFIX](ConfObject.md#j_ipv6prefix-5e95c6e896d2) from ConfObject
- [J\_LIST](ConfObject.md#j_list-d74b9f073fdc) from ConfObject
- [J\_NOEXISTS](ConfObject.md#j_noexists-1f0f9b7a9591) from ConfObject
- [J\_OBJECTREF](ConfObject.md#j_objectref-577d14956cc8) from ConfObject
- [J\_OID](ConfObject.md#j_oid-2d504f7432b3) from ConfObject
- [J\_PTR](ConfObject.md#j_ptr-ef54b9484cab) from ConfObject
- [J\_QNAME](ConfObject.md#j_qname-0d2839adff4c) from ConfObject
- [J\_STR](ConfObject.md#j_str-ae3bb3034983) from ConfObject
- [J\_SYMBOL](ConfObject.md#j_symbol-25fd3742c374) from ConfObject
- [J\_TIME](ConfObject.md#j_time-3ecdebfb0af5) from ConfObject
- [J\_UINT16](ConfObject.md#j_uint16-1f95eafb4126) from ConfObject
- [J\_UINT32](ConfObject.md#j_uint32-200f00c0ee05) from ConfObject
- [J\_UINT64](ConfObject.md#j_uint64-6960c783d61f) from ConfObject
- [J\_UINT8](ConfObject.md#j_uint8-ab0567c53d7f) from ConfObject
- [J\_UNION](ConfObject.md#j_union-7c548945cda0) from ConfObject
- [J\_XMLBEGIN](ConfObject.md#j_xmlbegin-6b887ec4c61b) from ConfObject
- [J\_XMLBEGINDEL](ConfObject.md#j_xmlbegindel-6c4d37088d90) from ConfObject
- [J\_XMLEND](ConfObject.md#j_xmlend-e2b443858058) from ConfObject
- [J\_XMLMOVEAFTER](ConfObject.md#j_xmlmoveafter-e7f2fed6d94d) from ConfObject
- [J\_XMLMOVEFIRST](ConfObject.md#j_xmlmovefirst-776c36719f23) from ConfObject
- [J\_XMLTAG](ConfObject.md#j_xmltag-0a12f537271e) from ConfObject
- [namespace](#namespace-9b66d2318bf6)
- [ns](#ns-8a46ea397979)
- [prefix](#prefix-f4cd8051dc9a)
- [tag](#tag-4c1656782674)
- [tagString](#tagstring-998457362c04)
- [val](#val-a02e160da60f)

**Methods**:

- [clone\(\)](ConfObject.md#clone-164c86c45e9b) from ConfObject
- [compare\(ConfObject, ConfObject\)](ConfObject.md#compare-e78552baa2bf) from ConfObject
- [decode\(ConfEObject\)](ConfObject.md#decode-609792d36602) from ConfObject
- [decode\(ConfEObject, ConfPath\)](ConfObject.md#decode-a814ebf64edc) from ConfObject
- [decode\(ConfEObject, String\)](ConfObject.md#decode-9b92f1de40d8) from ConfObject
- [decodeParam\(ConfEObject\)](#decodeparam-6799ac4705bb)
- [decodeParams\(ConfEObject\)](#decodeparams-5a1c83464ae4)
- [encode\(\)](#encode-fbae522bba37)
- [encode\(ConfXMLParam\[\]\)](#encode-7356521b6411)
- [encode\(List\<String\>\)](#encode-da878ca7b20d)
- [encode\(List\<String\>, ConfXMLParam\[\]\)](#encode-e9fa5532e6d5)
- [encodeHKP\(\)](#encodehkp-50d4bf8d0256)
- [encodeHKP\(ConfXMLParam\[\]\)](#encodehkp-ebc927cd1ccf)
- [encodeHKP\(List\<String\>\)](#encodehkp-2ff023418b43)
- [encodeHKP\(List\<String\>, ConfXMLParam\[\]\)](#encodehkp-6bc3df5e84cb)
- [encodeIKP\(\)](#encodeikp-b160b87f6433)
- [encodeIKP\(ConfXMLParam\[\]\)](#encodeikp-ab4320a110c6)
- [encodeIKP\(List\<String\>\)](#encodeikp-6f358b789ce0)
- [encodeIKP\(List\<String\>, ConfXMLParam\[\]\)](#encodeikp-c0a89dd54349)
- [equals\(Object\)](#equals-fcd6492e0d6c)
- [getConfNamespace\(\)](#getconfnamespace-87556caf3223)
- [getNSHash\(\)](#getnshash-2129fb8b3cfe)
- [getTag\(\)](#gettag-315f45956d6f)
- [getTagHash\(\)](#gettaghash-8f057919039c)
- [getValue\(\)](#getvalue-d93864668c40)
- [hashCode\(\)](#hashcode-ef797a217903)
- [setCdbInstanceInteger\(int\)](#setcdbinstanceinteger-f7ee747b0f20)
- [setNamespace\(ConfNamespace\)](#setnamespace-30316a480cfa)
- [setNamespaceFromMountId\(List\<String\>\)](#setnamespacefrommountid-1aa3f67eb493)
- [toDOM\(ConfXMLParam\[\]\)](#todom-13fd8f87f1a2)
- [toDOM\(ConfXMLParam\[\], String, String\)](#todom-a2de025173ef)
- [toString\(\)](#tostring-e9d48c5503ef)
- [toXML\(ConfXMLParam\[\]\)](#toxml-122580fde7a8)
- [toXML\(ConfXMLParam\[\], String, String\)](#toxml-e7cef9be4b1e)
- [toXMLParams\(String, ConfPath\)](#toxmlparams-bec6ecc54070)
- [toXMLParams\(String, ConfPath, int\)](#toxmlparams-61a6fdf75a13)

## Constructors

### ConfXMLParam(ConfEObject) <a href="#confxmlparam-1316dcbd2d76" id="confxmlparam-1316dcbd2d76"></a>

```java
protected ConfXMLParam(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.proto.ConfEObject o`

### ConfXMLParam(ConfNamespace, String, ConfObject) <a href="#confxmlparam-de1f4e03200f" id="confxmlparam-de1f4e03200f"></a>

```java
protected ConfXMLParam(
    com.tailf.conf.ConfNamespace namespace,
    String tagString,
    com.tailf.conf.ConfObject val
)
```

Types: [ConfNamespace](ConfNamespace.md#confnamespace-51b928e168d1), [ConfObject](ConfObject.md#confobject-5433616953b2)

**Parameters**

- `com.tailf.conf.ConfNamespace namespace`
- `String tagString`
- `com.tailf.conf.ConfObject val`

### ConfXMLParam(ConfNamespace, String, XMLParamType) <a href="#confxmlparam-08ceb6e049bd" id="confxmlparam-08ceb6e049bd"></a>

```java
protected ConfXMLParam(
    com.tailf.conf.ConfNamespace namespace,
    String tagString,
    com.tailf.conf.XMLParamType type
)
```

Types: [ConfNamespace](ConfNamespace.md#confnamespace-51b928e168d1), [XMLParamType](XMLParamType.md#xmlparamtype-3881bed6e84d)

**Parameters**

- `com.tailf.conf.ConfNamespace namespace`
- `String tagString`
- `com.tailf.conf.XMLParamType type`

### ConfXMLParam(ConfPath, MountIdInterface, String, String, ConfObject) <a href="#confxmlparam-ee545ddced6d" id="confxmlparam-ee545ddced6d"></a>

```java
protected ConfXMLParam(
    com.tailf.conf.ConfPath path,
    com.tailf.conf.MountIdInterface mountIdGetter,
    String prefix,
    String tagString,
    com.tailf.conf.ConfObject val
)
```

Types: [ConfPath](ConfPath.md#confpath-327831c6fc7d), [MountIdInterface](MountIdInterface.md#mountidinterface-113d1b54dae0), [ConfObject](ConfObject.md#confobject-5433616953b2)

**Parameters**

- `com.tailf.conf.ConfPath path`
- `com.tailf.conf.MountIdInterface mountIdGetter`
- `String prefix`
- `String tagString`
- `com.tailf.conf.ConfObject val`

### ConfXMLParam(ConfPath, MountIdInterface, String, String, XMLParamType) <a href="#confxmlparam-4fb2eb63d2c2" id="confxmlparam-4fb2eb63d2c2"></a>

```java
protected ConfXMLParam(
    com.tailf.conf.ConfPath path,
    com.tailf.conf.MountIdInterface mountIdGetter,
    String prefix,
    String tagString,
    com.tailf.conf.XMLParamType type
)
```

Types: [ConfPath](ConfPath.md#confpath-327831c6fc7d), [MountIdInterface](MountIdInterface.md#mountidinterface-113d1b54dae0), [XMLParamType](XMLParamType.md#xmlparamtype-3881bed6e84d)

**Parameters**

- `com.tailf.conf.ConfPath path`
- `com.tailf.conf.MountIdInterface mountIdGetter`
- `String prefix`
- `String tagString`
- `com.tailf.conf.XMLParamType type`

### ConfXMLParam(int, int) <a href="#confxmlparam-bde5bd68585f" id="confxmlparam-bde5bd68585f"></a>

```java
protected ConfXMLParam(int nshash, int tag)
```

**Parameters**

- `int nshash`
- `int tag`

### ConfXMLParam(int, int, ConfObject) <a href="#confxmlparam-5d07eab52545" id="confxmlparam-5d07eab52545"></a>

```java
protected ConfXMLParam(int ns, int tag, com.tailf.conf.ConfObject val)
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)

**Parameters**

- `int ns`
- `int tag`
- `com.tailf.conf.ConfObject val`

### ConfXMLParam(int, int, XMLParamType) <a href="#confxmlparam-b7f397465f0a" id="confxmlparam-b7f397465f0a"></a>

```java
protected ConfXMLParam(int ns, int tag, com.tailf.conf.XMLParamType type)
```

Types: [XMLParamType](XMLParamType.md#xmlparamtype-3881bed6e84d)

**Parameters**

- `int ns`
- `int tag`
- `com.tailf.conf.XMLParamType type`

### ConfXMLParam(int, String, XMLParamType) <a href="#confxmlparam-d108a4297643" id="confxmlparam-d108a4297643"></a>

```java
protected ConfXMLParam(int ns, String tagString, com.tailf.conf.XMLParamType type)
```

Types: [XMLParamType](XMLParamType.md#xmlparamtype-3881bed6e84d)

**Parameters**

- `int ns`
- `String tagString`
- `com.tailf.conf.XMLParamType type`

### ConfXMLParam(long, long) <a href="#confxmlparam-6204e20f2f87" id="confxmlparam-6204e20f2f87"></a>

```java
protected ConfXMLParam(long nshash, long tag)
```

**Parameters**

- `long nshash`
- `long tag`

### ConfXMLParam(long, long, ConfObject) <a href="#confxmlparam-fef602310362" id="confxmlparam-fef602310362"></a>

```java
protected ConfXMLParam(long ns, long tag, com.tailf.conf.ConfObject val)
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)

**Parameters**

- `long ns`
- `long tag`
- `com.tailf.conf.ConfObject val`

### ConfXMLParam(String, String, ConfObject) <a href="#confxmlparam-856d61cc7e2a" id="confxmlparam-856d61cc7e2a"></a>

```java
protected ConfXMLParam(String prefix, String tagString, com.tailf.conf.ConfObject val)
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)

**Parameters**

- `String prefix`
- `String tagString`
- `com.tailf.conf.ConfObject val`

### ConfXMLParam(String, String, XMLParamType) <a href="#confxmlparam-69e745801ad7" id="confxmlparam-69e745801ad7"></a>

```java
protected ConfXMLParam(String prefix, String tagString, com.tailf.conf.XMLParamType type)
```

Types: [XMLParamType](XMLParamType.md#xmlparamtype-3881bed6e84d)

**Parameters**

- `String prefix`
- `String tagString`
- `com.tailf.conf.XMLParamType type`


## Fields

### namespace <a href="#namespace-9b66d2318bf6" id="namespace-9b66d2318bf6"></a>

```java
protected com.tailf.conf.ConfNamespace namespace = null;
```

Types: [ConfNamespace](ConfNamespace.md#confnamespace-51b928e168d1)

### ns <a href="#ns-8a46ea397979" id="ns-8a46ea397979"></a>

```java
protected Integer ns = null;
```

### prefix <a href="#prefix-f4cd8051dc9a" id="prefix-f4cd8051dc9a"></a>

```java
protected String prefix = null;
```

### tag <a href="#tag-4c1656782674" id="tag-4c1656782674"></a>

```java
protected Integer tag = null;
```

### tagString <a href="#tagstring-998457362c04" id="tagstring-998457362c04"></a>

```java
protected String tagString = null;
```

### val <a href="#val-a02e160da60f" id="val-a02e160da60f"></a>

```java
protected com.tailf.conf.ConfObject val = null;
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)


## Methods

### decodeParam(ConfEObject) <a href="#decodeparam-6799ac4705bb" id="decodeparam-6799ac4705bb"></a>

```java
public static com.tailf.conf.ConfXMLParam decodeParam(
    com.tailf.proto.ConfEObject o
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](ConfException.md#confexception-baeaab99f7f9)

Decode the internal representation to a `ConfXMLParam`
 Used internally.

**Parameters**

- `com.tailf.proto.ConfEObject o`

**Returns:** The paramter from the internal representation

### decodeParams(ConfEObject) <a href="#decodeparams-5a1c83464ae4" id="decodeparams-5a1c83464ae4"></a>

```java
public static com.tailf.conf.ConfXMLParam[] decodeParams(
    com.tailf.proto.ConfEObject o
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.proto.ConfEObject o`

### encode() <a href="#encode-fbae522bba37" id="encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

### encode(ConfXMLParam[]) <a href="#encode-7356521b6411" id="encode-7356521b6411"></a>

```java
public static com.tailf.proto.ConfEObject encode(com.tailf.conf.ConfXMLParam[] params)
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfXMLParam](ConfXMLParam.md#confxmlparam-f5f4394b46a7)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`

### encode(List&lt;String&gt;) <a href="#encode-da878ca7b20d" id="encode-da878ca7b20d"></a>

```java
public com.tailf.proto.ConfEObject encode(java.util.List<String> mountId)
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

**Parameters**

- `java.util.List<String> mountId`

### encode(List&lt;String&gt;, ConfXMLParam[]) <a href="#encode-e9fa5532e6d5" id="encode-e9fa5532e6d5"></a>

```java
public static com.tailf.proto.ConfEObject encode(
    java.util.List<String> mountId,
    com.tailf.conf.ConfXMLParam[] params
)
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfXMLParam](ConfXMLParam.md#confxmlparam-f5f4394b46a7)

**Parameters**

- `java.util.List<String> mountId`
- `com.tailf.conf.ConfXMLParam[] params`

### encodeHKP() <a href="#encodehkp-50d4bf8d0256" id="encodehkp-50d4bf8d0256"></a>

```java
public com.tailf.proto.ConfEObject encodeHKP()
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

Encode this ConfXMLParam to HKP representation
 (i.e hashbased [ns | tag] where where ns and tag are both
 in long). This does not rely on ConfNamespace.

### encodeHKP(ConfXMLParam[]) <a href="#encodehkp-ebc927cd1ccf" id="encodehkp-ebc927cd1ccf"></a>

```java
public static com.tailf.proto.ConfEObject encodeHKP(com.tailf.conf.ConfXMLParam[] params)
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfXMLParam](ConfXMLParam.md#confxmlparam-f5f4394b46a7)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`

### encodeHKP(List&lt;String&gt;) <a href="#encodehkp-2ff023418b43" id="encodehkp-2ff023418b43"></a>

```java
public com.tailf.proto.ConfEObject encodeHKP(java.util.List<String> mountId)
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

**Parameters**

- `java.util.List<String> mountId`

### encodeHKP(List&lt;String&gt;, ConfXMLParam[]) <a href="#encodehkp-6bc3df5e84cb" id="encodehkp-6bc3df5e84cb"></a>

```java
public static com.tailf.proto.ConfEObject encodeHKP(
    java.util.List<String> mountId,
    com.tailf.conf.ConfXMLParam[] params
)
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfXMLParam](ConfXMLParam.md#confxmlparam-f5f4394b46a7)

**Parameters**

- `java.util.List<String> mountId`
- `com.tailf.conf.ConfXMLParam[] params`

### encodeIKP() <a href="#encodeikp-b160b87f6433" id="encodeikp-b160b87f6433"></a>

```java
public com.tailf.proto.ConfEObject encodeIKP()
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

### encodeIKP(ConfXMLParam[]) <a href="#encodeikp-ab4320a110c6" id="encodeikp-ab4320a110c6"></a>

```java
public static com.tailf.proto.ConfEObject encodeIKP(com.tailf.conf.ConfXMLParam[] params)
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfXMLParam](ConfXMLParam.md#confxmlparam-f5f4394b46a7)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`

### encodeIKP(List&lt;String&gt;) <a href="#encodeikp-6f358b789ce0" id="encodeikp-6f358b789ce0"></a>

```java
public com.tailf.proto.ConfEObject encodeIKP(java.util.List<String> mountId)
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

**Parameters**

- `java.util.List<String> mountId`

### encodeIKP(List&lt;String&gt;, ConfXMLParam[]) <a href="#encodeikp-c0a89dd54349" id="encodeikp-c0a89dd54349"></a>

```java
public static com.tailf.proto.ConfEObject encodeIKP(
    java.util.List<String> mountId,
    com.tailf.conf.ConfXMLParam[] params
)
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfXMLParam](ConfXMLParam.md#confxmlparam-f5f4394b46a7)

**Parameters**

- `java.util.List<String> mountId`
- `com.tailf.conf.ConfXMLParam[] params`

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### getConfNamespace() <a href="#getconfnamespace-87556caf3223" id="getconfnamespace-87556caf3223"></a>

```java
public com.tailf.conf.ConfNamespace getConfNamespace()
```

Types: [ConfNamespace](ConfNamespace.md#confnamespace-51b928e168d1)

Returns the namespace for this parameter.

**Returns:** The namespace for this parameter

### getNSHash() <a href="#getnshash-2129fb8b3cfe" id="getnshash-2129fb8b3cfe"></a>

```java
public Integer getNSHash()
```

Returns the namespce hash for this parameter.

**Returns:** The namespace hash for this parameter

### getTag() <a href="#gettag-315f45956d6f" id="gettag-315f45956d6f"></a>

```java
public String getTag()
```

Returns the tag for this parameter.

**Returns:** The tag for this parameter

### getTagHash() <a href="#gettaghash-8f057919039c" id="gettaghash-8f057919039c"></a>

```java
public Integer getTagHash()
```

Returns the hash tag for this parameter.

**Returns:** The tag hash for this parameter

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public com.tailf.conf.ConfObject getValue()
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)

Returns the value for this parameter.

**Returns:** The value for this parameter

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### setCdbInstanceInteger(int) <a href="#setcdbinstanceinteger-f7ee747b0f20" id="setcdbinstanceinteger-f7ee747b0f20"></a>

```java
protected void setCdbInstanceInteger(int cdbInstanceInteger)
```

**Parameters**

- `int cdbInstanceInteger`

### setNamespace(ConfNamespace) <a href="#setnamespace-30316a480cfa" id="setnamespace-30316a480cfa"></a>

```java
protected void setNamespace(com.tailf.conf.ConfNamespace namespace)
```

Types: [ConfNamespace](ConfNamespace.md#confnamespace-51b928e168d1)

**Parameters**

- `com.tailf.conf.ConfNamespace namespace`

### setNamespaceFromMountId(List&lt;String&gt;) <a href="#setnamespacefrommountid-1aa3f67eb493" id="setnamespacefrommountid-1aa3f67eb493"></a>

```java
protected void setNamespaceFromMountId(java.util.List<String> mountId)
```

**Parameters**

- `java.util.List<String> mountId`

### toDOM(ConfXMLParam[]) <a href="#todom-13fd8f87f1a2" id="todom-13fd8f87f1a2"></a>

```java
public static org.w3c.dom.Document toDOM(
    com.tailf.conf.ConfXMLParam[] params
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](ConfException.md#confexception-baeaab99f7f9)

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

### toDOM(ConfXMLParam[], String, String) <a href="#todom-a2de025173ef" id="todom-a2de025173ef"></a>

```java
public static org.w3c.dom.Document toDOM(
    com.tailf.conf.ConfXMLParam[] params,
    String parentNode,
    String parentURI
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](ConfException.md#confexception-baeaab99f7f9)

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

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

### toXML(ConfXMLParam[]) <a href="#toxml-122580fde7a8" id="toxml-122580fde7a8"></a>

```java
public static String toXML(com.tailf.conf.ConfXMLParam[] params) throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](ConfException.md#confexception-baeaab99f7f9)

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

### toXML(ConfXMLParam[], String, String) <a href="#toxml-e7cef9be4b1e" id="toxml-e7cef9be4b1e"></a>

```java
public static String toXML(
    com.tailf.conf.ConfXMLParam[] params,
    String parentNode,
    String parentURI
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](ConfException.md#confexception-baeaab99f7f9)

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

### toXMLParams(String, ConfPath) <a href="#toxmlparams-bec6ecc54070" id="toxmlparams-bec6ecc54070"></a>

```java
public static com.tailf.conf.ConfXMLParam[] toXMLParams(
    String xml,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfPath](ConfPath.md#confpath-327831c6fc7d), [ConfException](ConfException.md#confexception-baeaab99f7f9)

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

### toXMLParams(String, ConfPath, int) <a href="#toxmlparams-61a6fdf75a13" id="toxmlparams-61a6fdf75a13"></a>

```java
public static com.tailf.conf.ConfXMLParam[] toXMLParams(
    String xml,
    com.tailf.conf.ConfPath path,
    int mode
)
    throws com.tailf.conf.ConfException
```

Types: [ConfXMLParam](ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfPath](ConfPath.md#confpath-327831c6fc7d), [ConfException](ConfException.md#confexception-baeaab99f7f9)

Converts an xml snippet to a corresponding ConfXMLParam[].
 The mode parameter controls whether this ConfXMLParam[] should be
 prepared for a getValues() call or for a setValues() call using
 using [`XMLtoConfXMLParam#MODE_GET`](../util/XMLtoConfXMLParam.md#mode_get-f993d996e8d3) or
  [`XMLtoConfXMLParam#MODE_SET`](../util/XMLtoConfXMLParam.md#mode_set-a3c0f3ec95f7) respectively.

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
- `int mode` - one of [`XMLtoConfXMLParam#MODE_GET`](../util/XMLtoConfXMLParam.md#mode_get-f993d996e8d3) or
  [`XMLtoConfXMLParam#MODE_SET`](../util/XMLtoConfXMLParam.md#mode_set-a3c0f3ec95f7)

**Returns:** The resulting ConfXMLParam[]

**Throws**

- `ConfException`
