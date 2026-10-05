# ConfIPv4 <a href="#cls-ConfIPv4" id="cls-ConfIPv4"></a>

```java
public class com.tailf.conf.ConfIPv4
    extends com.tailf.conf.ConfIP
    implements Comparable<com.tailf.conf.ConfIPv4>
```

Types: [ConfIP](ConfIP.md#cls-ConfIP), [ConfIPv4](ConfIPv4.md#cls-ConfIPv4)

DATA_CONTAINER - Corresponds to the YANG inet:ipv4-address type.

## Members

**Constructors**:

- [ConfIPv4(ConfEObject)](#m-ConfIPv4-8dcacfb05794)
- [ConfIPv4(ConfETuple)](#m-ConfIPv4-d3f86ae66c3a)
- [ConfIPv4(InetAddress)](#m-ConfIPv4-bac98202aa6d)
- [ConfIPv4(int, int, int, int)](#m-ConfIPv4-aaa3b71c4274)
- [ConfIPv4(int[])](#m-ConfIPv4-fbdc6bcb08f5)
- [ConfIPv4(String)](#m-ConfIPv4-f6d2aab879fd)

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
- [compareTo(ConfIPv4)](#m-compareTo-cce8ff959d69)
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [encode()](#m-encode-fbae522bba37)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getAddress()](#m-getAddress-08b11cceec4c)
- [getRawAddress()](#m-getRawAddress-2dacae94069b)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#m-getStringByValue-841fa68ad0f9) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#m-getStringByValue-8ed173dcf8dc) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#m-getValueByString-e75fd0337a87) from ConfValue
- [getValueByString(String, String)](ConfValue.md#m-getValueByString-7804643cb027) from ConfValue
- [hashCode()](#m-hashCode-ef797a217903)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ConfIPv4(ConfEObject) <a href="#m-ConfIPv4-8dcacfb05794" id="m-ConfIPv4-8dcacfb05794"></a>

```java
public ConfIPv4(com.tailf.proto.ConfEObject vtup) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject vtup`

### ConfIPv4(ConfETuple) <a href="#m-ConfIPv4-d3f86ae66c3a" id="m-ConfIPv4-d3f86ae66c3a"></a>

```java
public ConfIPv4(com.tailf.proto.ConfETuple vtup) throws com.tailf.conf.ConfException
```

Types: [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfETuple vtup`

### ConfIPv4(InetAddress) <a href="#m-ConfIPv4-bac98202aa6d" id="m-ConfIPv4-bac98202aa6d"></a>

```java
public ConfIPv4(java.net.InetAddress addr)
```

**Parameters**

- `java.net.InetAddress addr`

### ConfIPv4(int, int, int, int) <a href="#m-ConfIPv4-aaa3b71c4274" id="m-ConfIPv4-aaa3b71c4274"></a>

```java
public ConfIPv4(int a, int b, int c, int d)
```

**Parameters**

- `int a`
- `int b`
- `int c`
- `int d`

### ConfIPv4(int[]) <a href="#m-ConfIPv4-fbdc6bcb08f5" id="m-ConfIPv4-fbdc6bcb08f5"></a>

```java
public ConfIPv4(int[] addr)
```

**Parameters**

- `int[] addr`

### ConfIPv4(String) <a href="#m-ConfIPv4-f6d2aab879fd" id="m-ConfIPv4-f6d2aab879fd"></a>

```java
public ConfIPv4(String s) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `String s`


## Methods

### compareTo(ConfIPv4) <a href="#m-compareTo-cce8ff959d69" id="m-compareTo-cce8ff959d69"></a>

```java
public int compareTo(com.tailf.conf.ConfIPv4 o)
```

Types: [ConfIPv4](ConfIPv4.md#cls-ConfIPv4)

**Parameters**

- `com.tailf.conf.ConfIPv4 o`

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

### getAddress() <a href="#m-getAddress-08b11cceec4c" id="m-getAddress-08b11cceec4c"></a>

```java
public java.net.InetAddress getAddress()
```

### getRawAddress() <a href="#m-getRawAddress-2dacae94069b" id="m-getRawAddress-2dacae94069b"></a>

```java
public int[] getRawAddress()
```

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
