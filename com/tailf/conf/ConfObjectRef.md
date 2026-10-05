<a id="cls-ConfObjectRef"></a>
# ConfObjectRef

```java
public class com.tailf.conf.ConfObjectRef
    extends com.tailf.conf.ConfValue
    implements Comparable<com.tailf.conf.ConfObjectRef>
```

Types: [ConfValue](ConfValue.md#cls-ConfValue), [ConfObjectRef](ConfObjectRef.md#cls-ConfObjectRef)

DATA_CONTAINER - Corresponds to the YANG instance-identifier type.

 Corresponds to the YANG instance-identifier type


```


    The following are examples of instance identifiers:

        // instance-identifier for a container
         /ex:system/ex:services/ex:ssh

        // instance-identifier for a leaf
         /ex:system/ex:services/ex:ssh/ex:port

       // instance-identifier for a list entry
        /ex:system/ex:user[ex:name='fred']

        // instance-identifier for a leaf in a list entry
     /ex:system/ex:user[ex:name='fred']/ex:type

        // instance-identifier for a list entry with two keys
     /ex:system/server[ip='192.0.2.1'][port='80']/system/
       server[ip='192.0.2.1' ex:port='80']

   // instance-identifier for a leaf-list entry
      /ex:system/ex:services/ex:ssh/ex:cipher[.='blowfish-cbc']

      // instance-identifier for a list entry without keys
       /ex:stats/ex:port[3]

       // instance-identifier for a leaf-list entry
      /ex:system/ex:services/ex:ssh/ex:cipher[.='blowfish-cbc']
```

## Members

**Constructors**:

- [ConfObjectRef(ConfEObject)](#m-confobjectref-869a91fa17a4)
- [ConfObjectRef(ConfObject[])](#m-confobjectref-97c85f2135c4)
- [ConfObjectRef(ConfPath)](#m-confobjectref-77a7177f0a69)
- [ConfObjectRef(String)](#m-confobjectref-74fd21358172)
- [ConfObjectRef(String, MountIdInterface)](#m-confobjectref-965cdc7987b6)

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

**Methods**:

- [clone()](ConfObject.md#m-clone-164c86c45e9b) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#m-compare-e78552baa2bf) from ConfObject
- [compareTo(ConfObjectRef)](#m-compareto-c2036e4c3394)
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [encode()](#m-encode-fbae522bba37)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getElems()](#m-getelems-030df7d28888)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#m-getstringbyvalue-841fa68ad0f9) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#m-getstringbyvalue-8ed173dcf8dc) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#m-getvaluebystring-e75fd0337a87) from ConfValue
- [getValueByString(String, String)](ConfValue.md#m-getvaluebystring-7804643cb027) from ConfValue
- [hashCode()](#m-hashcode-ef797a217903)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-confobjectref-869a91fa17a4"></a>
### ConfObjectRef(ConfEObject)

```java
public ConfObjectRef(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

It assumes that param is of type ConfEList.

**Parameters**

- `com.tailf.proto.ConfEObject o` - is a ConfEList

<a id="m-confobjectref-97c85f2135c4"></a>
### ConfObjectRef(ConfObject[])

```java
public ConfObjectRef(com.tailf.conf.ConfObject[] elems)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

Constructor using the autoloaded namespaces.
 It assumes that schemas have been loaded
 using Maapi.loadschermas().

**Parameters**

- `com.tailf.conf.ConfObject[] elems`

<a id="m-confobjectref-77a7177f0a69"></a>
### ConfObjectRef(ConfPath)

```java
public ConfObjectRef(com.tailf.conf.ConfPath path) throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#cls-ConfPath), [ConfException](ConfException.md#cls-ConfException)

Construct a ConfObjectRef from a given Absolute ConfPath.

**Parameters**

- `com.tailf.conf.ConfPath path`

**Throws**

- `ConfException` - if the given path is relative.

<a id="m-confobjectref-74fd21358172"></a>
### ConfObjectRef(String)

```java
public ConfObjectRef(String xpath) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `String xpath`

<a id="m-confobjectref-965cdc7987b6"></a>
### ConfObjectRef(String, MountIdInterface)

```java
public ConfObjectRef(
    String xpath,
    com.tailf.conf.MountIdInterface mountGetter
)
    throws com.tailf.conf.ConfException
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `String xpath`
- `com.tailf.conf.MountIdInterface mountGetter`


## Methods

<a id="m-compareto-c2036e4c3394"></a>
### compareTo(ConfObjectRef)

```java
public int compareTo(com.tailf.conf.ConfObjectRef o)
```

Types: [ConfObjectRef](ConfObjectRef.md#cls-ConfObjectRef)

**Parameters**

- `com.tailf.conf.ConfObjectRef o`

<a id="m-encode-fbae522bba37"></a>
### encode()

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

<a id="m-getelems-030df7d28888"></a>
### getElems()

```java
public com.tailf.conf.ConfObject[] getElems()
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
