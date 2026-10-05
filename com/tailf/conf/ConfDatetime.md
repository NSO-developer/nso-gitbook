<a id="cls-ConfDatetime"></a>
# ConfDatetime

```java
public class com.tailf.conf.ConfDatetime
    extends com.tailf.conf.ConfValue
    implements Cloneable, java.io.Serializable, Comparable<com.tailf.conf.ConfDatetime>
```

Types: [ConfValue](ConfValue.md#cls-ConfValue), [ConfDatetime](ConfDatetime.md#cls-ConfDatetime)

DATA_CONTAINER - Corresponds to the YANG date-and-time type.

## Members

**Constructors**:

- [ConfDatetime(ConfEObject)](#m-confdatetime-860b6df919e9)
- [ConfDatetime(int, int, int, int, int, int, int, int, int)](#m-confdatetime-de3ca2266d87)
- [ConfDatetime(String)](#m-confdatetime-d9bfdff5ab83)

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
- [compareTo(ConfDatetime)](#m-compareto-43622009e5d1)
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [encode()](#m-encode-fbae522bba37)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getConfDatetime()](#m-getconfdatetime-4da636349f79)
- [getDay()](#m-getday-3b07996cd5f6)
- [getHour()](#m-gethour-32c719f425c9)
- [getMicro()](#m-getmicro-37aa6b436572)
- [getMin()](#m-getmin-8654ceab94db)
- [getMonth()](#m-getmonth-3813513d5069)
- [getSec()](#m-getsec-c0fe657f6906)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#m-getstringbyvalue-841fa68ad0f9) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#m-getstringbyvalue-8ed173dcf8dc) from ConfValue
- [getTimezone()](#m-gettimezone-9573790f24e6)
- [getTimezoneMinutes()](#m-gettimezoneminutes-b20d3de8d152)
- [getValueByString(ConfPath, String)](ConfValue.md#m-getvaluebystring-e75fd0337a87) from ConfValue
- [getValueByString(String, String)](ConfValue.md#m-getvaluebystring-7804643cb027) from ConfValue
- [getYear()](#m-getyear-584af4457cda)
- [hashCode()](#m-hashcode-ef797a217903)
- [isTimezoneSet()](#m-istimezoneset-bea37cc8df0f)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-confdatetime-860b6df919e9"></a>
### ConfDatetime(ConfEObject)

```java
public ConfDatetime(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

For internal usage.

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="m-confdatetime-de3ca2266d87"></a>
### ConfDatetime(int, int, int, int, int, int, int, int, int)

```java
public ConfDatetime(
    int year,
    int month,
    int day,
    int hour,
    int min,
    int sec,
    int micro,
    int timezone,
    int timezoneMinutes
)
```

**Parameters**

- `int year` - -
- `int month` - - month from 1 to 12
- `int day` - -
- `int hour` - -
- `int min` - -
- `int sec` - -
- `int micro`
- `int timezone` - - Timezone Hour in unit hours
- `int timezoneMinutes` - - Timezone Minutes in unit minutes

<a id="m-confdatetime-d9bfdff5ab83"></a>
### ConfDatetime(String)

```java
public ConfDatetime(String str)
```

**Parameters**

- `String str`


## Methods

<a id="m-compareto-43622009e5d1"></a>
### compareTo(ConfDatetime)

```java
public int compareTo(com.tailf.conf.ConfDatetime o)
```

Types: [ConfDatetime](ConfDatetime.md#cls-ConfDatetime)

**Parameters**

- `com.tailf.conf.ConfDatetime o`

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

<a id="m-getconfdatetime-4da636349f79"></a>
### getConfDatetime()

```java
public static com.tailf.conf.ConfDatetime getConfDatetime()
```

Types: [ConfDatetime](ConfDatetime.md#cls-ConfDatetime)

**Returns:** Returns the current time in UTC TimeZone.

<a id="m-getday-3b07996cd5f6"></a>
### getDay()

```java
public int getDay()
```

<a id="m-gethour-32c719f425c9"></a>
### getHour()

```java
public int getHour()
```

<a id="m-getmicro-37aa6b436572"></a>
### getMicro()

```java
public int getMicro()
```

<a id="m-getmin-8654ceab94db"></a>
### getMin()

```java
public int getMin()
```

<a id="m-getmonth-3813513d5069"></a>
### getMonth()

```java
public int getMonth()
```

<a id="m-getsec-c0fe657f6906"></a>
### getSec()

```java
public int getSec()
```

<a id="m-gettimezone-9573790f24e6"></a>
### getTimezone()

```java
public int getTimezone()
```

**Returns:** The Hour timezone in hours, for example
          02:00 will return 2 hours

<a id="m-gettimezoneminutes-b20d3de8d152"></a>
### getTimezoneMinutes()

```java
public int getTimezoneMinutes()
```

**Returns:** The Minutes timezone in minutes, for example
         02:30 will return 30 minutes

<a id="m-getyear-584af4457cda"></a>
### getYear()

```java
public int getYear()
```

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-istimezoneset-bea37cc8df0f"></a>
### isTimezoneSet()

```java
public boolean isTimezoneSet()
```

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
