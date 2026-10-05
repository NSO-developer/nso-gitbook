<a id="s-ConfDottedQuad"></a>
# ConfDottedQuad

```java
public class com.tailf.conf.ConfDottedQuad
    extends com.tailf.conf.ConfValue
    implements Comparable<com.tailf.conf.ConfDottedQuad>
```

Types: [ConfValue](ConfValue.md#s-ConfValue), [ConfDottedQuad](ConfDottedQuad.md#s-ConfDottedQuad)

DATA_CONTAINER - Corresponds to the YANG dotted-quad type.



```
    type string {
      pattern
          '(([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.){3}'
        + '([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])';
      }
    }
```



 An unsigned 32-bit number expressed in the dotted-quad
 notation, i.e., four octets written as decimal numbers
 and separated with the '.' (full stop) character.";

## Members

**Constructors**:

- [ConfDottedQuad(byte, byte, byte, byte)](#s-ConfDottedQuad-1)
- [ConfDottedQuad(byte[])](#s-ConfDottedQuad-2)
- [ConfDottedQuad(ConfBinary)](#s-ConfDottedQuad-3)
- [ConfDottedQuad(ConfEObject)](#s-ConfDottedQuad-4)
- [ConfDottedQuad(String)](#s-ConfDottedQuad-5)

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
- [compareTo(ConfDottedQuad)](#s-compareTo)
- [decode(ConfEObject)](ConfObject.md#s-decode) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#s-decode-1) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#s-decode-2) from ConfObject
- [encode()](#s-encode)
- [equals(Object)](#s-equals)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#s-getStringByValue) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#s-getStringByValue-1) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#s-getValueByString) from ConfValue
- [getValueByString(String, String)](ConfValue.md#s-getValueByString-1) from ConfValue
- [hashCode()](#s-hashCode)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfDottedQuad-1"></a>
### ConfDottedQuad(byte, byte, byte, byte)

```java
public ConfDottedQuad(byte q1, byte q2, byte q3, byte q4)
```

Constructs a ConfdDottedQuad from 4 bytes.

**Parameters**

- `byte q1` - First byte of quad.
- `byte q2` - Second byte of quad.
- `byte q3` - Third byte of quad.
- `byte q4` - Fourth byte of quad.

<a id="s-ConfDottedQuad-2"></a>
### ConfDottedQuad(byte[])

```java
public ConfDottedQuad(byte[] val) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `byte[] val`

<a id="s-ConfDottedQuad-3"></a>
### ConfDottedQuad(ConfBinary)

```java
public ConfDottedQuad(com.tailf.conf.ConfBinary obj) throws com.tailf.conf.ConfException
```

Types: [ConfBinary](ConfBinary.md#s-ConfBinary), [ConfException](ConfException.md#s-ConfException)

Constructs a ConfDottedQuad from a ConfBinary object.

**Parameters**

- `com.tailf.conf.ConfBinary obj`

<a id="s-ConfDottedQuad-4"></a>
### ConfDottedQuad(ConfEObject)

```java
public ConfDottedQuad(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="s-ConfDottedQuad-5"></a>
### ConfDottedQuad(String)

```java
public ConfDottedQuad(String str) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Construct a ConfDottedQuad from a string of bytes in the format of octets
 (decimal values) separated with dots.

**Parameters**

- `String str`


## Methods

<a id="s-compareTo"></a>
### compareTo(ConfDottedQuad)

```java
public int compareTo(com.tailf.conf.ConfDottedQuad o)
```

Types: [ConfDottedQuad](ConfDottedQuad.md#s-ConfDottedQuad)

**Parameters**

- `com.tailf.conf.ConfDottedQuad o`

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

Format a dottedQuad as octets separated with dots, as for example:
 "1.2.4.192"
