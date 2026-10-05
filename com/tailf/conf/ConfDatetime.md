# ConfDatetime <a href="#cls-ConfDatetime" id="cls-ConfDatetime"></a>

```java
public class com.tailf.conf.ConfDatetime
    extends com.tailf.conf.ConfValue
    implements Cloneable, java.io.Serializable, Comparable<com.tailf.conf.ConfDatetime>
```

Types: [ConfValue](ConfValue.md#cls-ConfValue), [ConfDatetime](ConfDatetime.md#cls-ConfDatetime)

DATA_CONTAINER - Corresponds to the YANG date-and-time type.

## Members

**Constructors**:

- [ConfDatetime(ConfEObject)](#m-ConfDatetime-860b6df919e9)
- [ConfDatetime(int, int, int, int, int, int, int, int, int)](#m-ConfDatetime-de3ca2266d87)
- [ConfDatetime(String)](#m-ConfDatetime-d9bfdff5ab83)

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
- [compareTo(ConfDatetime)](#m-compareTo-43622009e5d1)
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [encode()](#m-encode-fbae522bba37)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getConfDatetime()](#m-getConfDatetime-4da636349f79)
- [getDay()](#m-getDay-3b07996cd5f6)
- [getHour()](#m-getHour-32c719f425c9)
- [getMicro()](#m-getMicro-37aa6b436572)
- [getMin()](#m-getMin-8654ceab94db)
- [getMonth()](#m-getMonth-3813513d5069)
- [getSec()](#m-getSec-c0fe657f6906)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#m-getStringByValue-841fa68ad0f9) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#m-getStringByValue-8ed173dcf8dc) from ConfValue
- [getTimezone()](#m-getTimezone-9573790f24e6)
- [getTimezoneMinutes()](#m-getTimezoneMinutes-b20d3de8d152)
- [getValueByString(ConfPath, String)](ConfValue.md#m-getValueByString-e75fd0337a87) from ConfValue
- [getValueByString(String, String)](ConfValue.md#m-getValueByString-7804643cb027) from ConfValue
- [getYear()](#m-getYear-584af4457cda)
- [hashCode()](#m-hashCode-ef797a217903)
- [isTimezoneSet()](#m-isTimezoneSet-bea37cc8df0f)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ConfDatetime(ConfEObject) <a href="#m-ConfDatetime-860b6df919e9" id="m-ConfDatetime-860b6df919e9"></a>

```java
public ConfDatetime(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

For internal usage.

**Parameters**

- `com.tailf.proto.ConfEObject o`

### ConfDatetime(int, int, int, int, int, int, int, int, int) <a href="#m-ConfDatetime-de3ca2266d87" id="m-ConfDatetime-de3ca2266d87"></a>

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

### ConfDatetime(String) <a href="#m-ConfDatetime-d9bfdff5ab83" id="m-ConfDatetime-d9bfdff5ab83"></a>

```java
public ConfDatetime(String str)
```

**Parameters**

- `String str`


## Methods

### compareTo(ConfDatetime) <a href="#m-compareTo-43622009e5d1" id="m-compareTo-43622009e5d1"></a>

```java
public int compareTo(com.tailf.conf.ConfDatetime o)
```

Types: [ConfDatetime](ConfDatetime.md#cls-ConfDatetime)

**Parameters**

- `com.tailf.conf.ConfDatetime o`

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

### getConfDatetime() <a href="#m-getConfDatetime-4da636349f79" id="m-getConfDatetime-4da636349f79"></a>

```java
public static com.tailf.conf.ConfDatetime getConfDatetime()
```

Types: [ConfDatetime](ConfDatetime.md#cls-ConfDatetime)

**Returns:** Returns the current time in UTC TimeZone.

### getDay() <a href="#m-getDay-3b07996cd5f6" id="m-getDay-3b07996cd5f6"></a>

```java
public int getDay()
```

### getHour() <a href="#m-getHour-32c719f425c9" id="m-getHour-32c719f425c9"></a>

```java
public int getHour()
```

### getMicro() <a href="#m-getMicro-37aa6b436572" id="m-getMicro-37aa6b436572"></a>

```java
public int getMicro()
```

### getMin() <a href="#m-getMin-8654ceab94db" id="m-getMin-8654ceab94db"></a>

```java
public int getMin()
```

### getMonth() <a href="#m-getMonth-3813513d5069" id="m-getMonth-3813513d5069"></a>

```java
public int getMonth()
```

### getSec() <a href="#m-getSec-c0fe657f6906" id="m-getSec-c0fe657f6906"></a>

```java
public int getSec()
```

### getTimezone() <a href="#m-getTimezone-9573790f24e6" id="m-getTimezone-9573790f24e6"></a>

```java
public int getTimezone()
```

**Returns:** The Hour timezone in hours, for example
          02:00 will return 2 hours

### getTimezoneMinutes() <a href="#m-getTimezoneMinutes-b20d3de8d152" id="m-getTimezoneMinutes-b20d3de8d152"></a>

```java
public int getTimezoneMinutes()
```

**Returns:** The Minutes timezone in minutes, for example
         02:30 will return 30 minutes

### getYear() <a href="#m-getYear-584af4457cda" id="m-getYear-584af4457cda"></a>

```java
public int getYear()
```

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### isTimezoneSet() <a href="#m-isTimezoneSet-bea37cc8df0f" id="m-isTimezoneSet-bea37cc8df0f"></a>

```java
public boolean isTimezoneSet()
```

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
