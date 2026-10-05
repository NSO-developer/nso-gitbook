<a id="s-ConfDuration"></a>
# ConfDuration

```java
public class com.tailf.conf.ConfDuration
    extends com.tailf.conf.ConfValue
    implements Comparable<com.tailf.conf.ConfDuration>
```

Types: [ConfValue](ConfValue.md#s-ConfValue), [ConfDuration](ConfDuration.md#s-ConfDuration)

DATA_CONTAINER - Corresponds to the confspec xs:duration type.

 Corresponds to the confspec xs:duration type.

## Members

**Constructors**:

- [ConfDuration(ConfEObject)](#s-ConfDuration-1)
- [ConfDuration(int, int, int, int, int, int, int)](#s-ConfDuration-2)
- [ConfDuration(String)](#s-ConfDuration-3)

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
- [compareTo(ConfDuration)](#s-compareTo)
- [decode(ConfEObject)](ConfObject.md#s-decode) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#s-decode-1) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#s-decode-2) from ConfObject
- [encode()](#s-encode)
- [equals(Object)](#s-equals)
- [getCalendar()](#s-getCalendar)
- [getDay()](#s-getDay)
- [getHour()](#s-getHour)
- [getMicro()](#s-getMicro)
- [getMin()](#s-getMin)
- [getMonth()](#s-getMonth)
- [getSec()](#s-getSec)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#s-getStringByValue) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#s-getStringByValue-1) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#s-getValueByString) from ConfValue
- [getValueByString(String, String)](ConfValue.md#s-getValueByString-1) from ConfValue
- [getYear()](#s-getYear)
- [hashCode()](#s-hashCode)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfDuration-1"></a>
### ConfDuration(ConfEObject)

```java
public ConfDuration(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="s-ConfDuration-2"></a>
### ConfDuration(int, int, int, int, int, int, int)

```java
public ConfDuration(int year, int month, int day, int hour, int min, int sec, int micro)
```

**Parameters**

- `int year`
- `int month`
- `int day`
- `int hour`
- `int min`
- `int sec`
- `int micro`

<a id="s-ConfDuration-3"></a>
### ConfDuration(String)

```java
public ConfDuration(String str)
```

**Parameters**

- `String str`


## Methods

<a id="s-compareTo"></a>
### compareTo(ConfDuration)

```java
public int compareTo(com.tailf.conf.ConfDuration o)
```

Types: [ConfDuration](ConfDuration.md#s-ConfDuration)

**Parameters**

- `com.tailf.conf.ConfDuration o`

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

<a id="s-getCalendar"></a>
### getCalendar()

```java
public java.util.GregorianCalendar getCalendar()
```

<a id="s-getDay"></a>
### getDay()

```java
public int getDay()
```

<a id="s-getHour"></a>
### getHour()

```java
public int getHour()
```

<a id="s-getMicro"></a>
### getMicro()

```java
public int getMicro()
```

<a id="s-getMin"></a>
### getMin()

```java
public int getMin()
```

<a id="s-getMonth"></a>
### getMonth()

```java
public int getMonth()
```

<a id="s-getSec"></a>
### getSec()

```java
public int getSec()
```

<a id="s-getYear"></a>
### getYear()

```java
public int getYear()
```

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
