<a id="s-ConfObjectRef"></a>
# ConfObjectRef

```java
public class com.tailf.conf.ConfObjectRef
    extends com.tailf.conf.ConfValue
    implements Comparable<com.tailf.conf.ConfObjectRef>
```

Types: [ConfValue](ConfValue.md#s-ConfValue), [ConfObjectRef](ConfObjectRef.md#s-ConfObjectRef)

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

- [ConfObjectRef(ConfEObject)](#s-ConfObjectRef-1)
- [ConfObjectRef(ConfObject[])](#s-ConfObjectRef-2)
- [ConfObjectRef(ConfPath)](#s-ConfObjectRef-3)
- [ConfObjectRef(String)](#s-ConfObjectRef-4)
- [ConfObjectRef(String, MountIdInterface)](#s-ConfObjectRef-5)

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

**Methods**:

- [clone()](ConfObject.md#s-clone) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#s-compare) from ConfObject
- [compareTo(ConfObjectRef)](#s-compareTo)
- [decode(ConfEObject)](ConfObject.md#s-decode) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#s-decode-1) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#s-decode-2) from ConfObject
- [encode()](#s-encode)
- [equals(Object)](#s-equals)
- [getElems()](#s-getElems)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#s-getStringByValue) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#s-getStringByValue-1) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#s-getValueByString) from ConfValue
- [getValueByString(String, String)](ConfValue.md#s-getValueByString-1) from ConfValue
- [hashCode()](#s-hashCode)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfObjectRef-1"></a>
### ConfObjectRef(ConfEObject)

```java
public ConfObjectRef(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

It assumes that param is of type ConfEList.

**Parameters**

- `com.tailf.proto.ConfEObject o` - is a ConfEList

<a id="s-ConfObjectRef-2"></a>
### ConfObjectRef(ConfObject[])

```java
public ConfObjectRef(com.tailf.conf.ConfObject[] elems)
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

Constructor using the autoloaded namespaces.
 It assumes that schemas have been loaded
 using Maapi.loadschermas().

**Parameters**

- `com.tailf.conf.ConfObject[] elems`

<a id="s-ConfObjectRef-3"></a>
### ConfObjectRef(ConfPath)

```java
public ConfObjectRef(com.tailf.conf.ConfPath path) throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#s-ConfPath), [ConfException](ConfException.md#s-ConfException)

Construct a ConfObjectRef from a given Absolute ConfPath.

**Parameters**

- `com.tailf.conf.ConfPath path`

**Throws**

- `ConfException` - if the given path is relative.

<a id="s-ConfObjectRef-4"></a>
### ConfObjectRef(String)

```java
public ConfObjectRef(String xpath) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `String xpath`

<a id="s-ConfObjectRef-5"></a>
### ConfObjectRef(String, MountIdInterface)

```java
public ConfObjectRef(
    String xpath,
    com.tailf.conf.MountIdInterface mountGetter
)
    throws com.tailf.conf.ConfException
```

Types: [MountIdInterface](MountIdInterface.md#s-MountIdInterface), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `String xpath`
- `com.tailf.conf.MountIdInterface mountGetter`


## Methods

<a id="s-compareTo"></a>
### compareTo(ConfObjectRef)

```java
public int compareTo(com.tailf.conf.ConfObjectRef o)
```

Types: [ConfObjectRef](ConfObjectRef.md#s-ConfObjectRef)

**Parameters**

- `com.tailf.conf.ConfObjectRef o`

<a id="s-encode"></a>
### encode()

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

<a id="s-getElems"></a>
### getElems()

```java
public com.tailf.conf.ConfObject[] getElems()
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
