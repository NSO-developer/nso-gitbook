<a id="s-ConfTypeDescriptor"></a>
# ConfTypeDescriptor

```java
public class com.tailf.conf.ConfTypeDescriptor
    extends com.tailf.conf.ConfObject
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

Conf value type descriptor. This class is used to represent the type of an
 arbitrary Conf value. It also contains helper methods to create ConfValue
 classes from String representations

 *

 Example:



```
 ConfTypeDescriptor typeDesc = new ConfTypeDescriptor(ConfObject.J_BUF);
 ConfBuf buf = (ConfBuf) typeDesc.newInstance(Hello);
```

## Members

**Constructors**:

- [ConfTypeDescriptor(int)](#s-ConfTypeDescriptor-1)

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
- [decode(ConfEObject)](ConfObject.md#s-decode) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#s-decode-1) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#s-decode-2) from ConfObject
- [encode()](#s-encode)
- [equals(Object)](#s-equals)
- [getConfTypeDescriptor(ConfObject)](#s-getConfTypeDescriptor)
- [getType()](#s-getType)
- [hashCode()](#s-hashCode)
- [newInstance(String)](#s-newInstance)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfTypeDescriptor-1"></a>
### ConfTypeDescriptor(int)

```java
public ConfTypeDescriptor(int type)
```

Constructor for ConfTypeDescriptor class

**Parameters**

- `int type` - int representation for ConfValue type
            [`ConfObject`](ConfObject.md#s-ConfObject)


## Methods

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

<a id="s-getConfTypeDescriptor"></a>
### getConfTypeDescriptor(ConfObject)

```java
public static com.tailf.conf.ConfTypeDescriptor getConfTypeDescriptor(com.tailf.conf.ConfObject o)
```

Types: [ConfTypeDescriptor](ConfTypeDescriptor.md#s-ConfTypeDescriptor), [ConfObject](ConfObject.md#s-ConfObject)

Generates a ConfTypeDescriptor representing the type of a specified
 ConfObject.

**Parameters**

- `com.tailf.conf.ConfObject o` - ConfObject instance from which a ConfTypeDescriptor should be
            generated

**Returns:** the ConfTypeDescriptor or null if ConfObject is of unknown type

<a id="s-getType"></a>
### getType()

```java
public int getType()
```

**Returns:** int representation for ConfValue type
         [`ConfObject`](ConfObject.md#s-ConfObject)

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-newInstance"></a>
### newInstance(String)

```java
public com.tailf.conf.ConfValue newInstance(String str) throws com.tailf.conf.ConfException
```

Types: [ConfValue](ConfValue.md#s-ConfValue), [ConfException](ConfException.md#s-ConfException)

Creates a new ConfValue instance of the type described by this
 ConfTypeDescriptor and with a value represented by a string.

**Parameters**

- `String str` - the string representation of the value

**Returns:** the created ConfValue instance

**Throws**

- `ConfException`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
