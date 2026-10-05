# ConfTypeDescriptor <a href="#cls-ConfTypeDescriptor" id="cls-ConfTypeDescriptor"></a>

```java
public class com.tailf.conf.ConfTypeDescriptor
    extends com.tailf.conf.ConfObject
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

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

- [ConfTypeDescriptor(int)](#m-ConfTypeDescriptor-a78131cc6882)

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
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [encode()](#m-encode-fbae522bba37)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getConfTypeDescriptor(ConfObject)](#m-getConfTypeDescriptor-4b309980c132)
- [getType()](#m-getType-5a52f6f0d4c1)
- [hashCode()](#m-hashCode-ef797a217903)
- [newInstance(String)](#m-newInstance-2c61b9c50ad3)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ConfTypeDescriptor(int) <a href="#m-ConfTypeDescriptor-a78131cc6882" id="m-ConfTypeDescriptor-a78131cc6882"></a>

```java
public ConfTypeDescriptor(int type)
```

Constructor for ConfTypeDescriptor class

**Parameters**

- `int type` - int representation for ConfValue type
            [`ConfObject`](ConfObject.md#cls-ConfObject)


## Methods

### encode() <a href="#m-encode-fbae522bba37" id="m-encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### getConfTypeDescriptor(ConfObject) <a href="#m-getConfTypeDescriptor-4b309980c132" id="m-getConfTypeDescriptor-4b309980c132"></a>

```java
public static com.tailf.conf.ConfTypeDescriptor getConfTypeDescriptor(com.tailf.conf.ConfObject o)
```

Types: [ConfTypeDescriptor](ConfTypeDescriptor.md#cls-ConfTypeDescriptor), [ConfObject](ConfObject.md#cls-ConfObject)

Generates a ConfTypeDescriptor representing the type of a specified
 ConfObject.

**Parameters**

- `com.tailf.conf.ConfObject o` - ConfObject instance from which a ConfTypeDescriptor should be
            generated

**Returns:** the ConfTypeDescriptor or null if ConfObject is of unknown type

### getType() <a href="#m-getType-5a52f6f0d4c1" id="m-getType-5a52f6f0d4c1"></a>

```java
public int getType()
```

**Returns:** int representation for ConfValue type
         [`ConfObject`](ConfObject.md#cls-ConfObject)

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### newInstance(String) <a href="#m-newInstance-2c61b9c50ad3" id="m-newInstance-2c61b9c50ad3"></a>

```java
public com.tailf.conf.ConfValue newInstance(String str) throws com.tailf.conf.ConfException
```

Types: [ConfValue](ConfValue.md#cls-ConfValue), [ConfException](ConfException.md#cls-ConfException)

Creates a new ConfValue instance of the type described by this
 ConfTypeDescriptor and with a value represented by a string.

**Parameters**

- `String str` - the string representation of the value

**Returns:** the created ConfValue instance

**Throws**

- `ConfException`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
