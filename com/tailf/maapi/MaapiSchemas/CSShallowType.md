<a id="cls-CSShallowType"></a>
# CSShallowType

```java
public static enum com.tailf.maapi.MaapiSchemas.CSShallowType
```

Types: [CSShallowType](CSShallowType.md#cls-CSShallowType)

Enum containing all possible node values.

## Members

**Enum Constants**:

- [C_BINARY](#m-C_BINARY)
- [C_BIT32](#m-C_BIT32)
- [C_BIT64](#m-C_BIT64)
- [C_BOOL](#m-C_BOOL)
- [C_BUF](#m-C_BUF)
- [C_CDBBEGIN](#m-C_CDBBEGIN)
- [C_DATE](#m-C_DATE)
- [C_DATETIME](#m-C_DATETIME)
- [C_DECIMAL64](#m-C_DECIMAL64)
- [C_DEFAULT](#m-C_DEFAULT)
- [C_DOUBLE](#m-C_DOUBLE)
- [C_DURATION](#m-C_DURATION)
- [C_EMPTY](#m-C_EMPTY)
- [C_ENUM_HASH](#m-C_ENUM_HASH)
- [C_GDAY](#m-C_GDAY)
- [C_GMONTH](#m-C_GMONTH)
- [C_GMONTHDAY](#m-C_GMONTHDAY)
- [C_GYEAR](#m-C_GYEAR)
- [C_GYEARMONTH](#m-C_GYEARMONTH)
- [C_IDENTITYREF](#m-C_IDENTITYREF)
- [C_INT16](#m-C_INT16)
- [C_INT32](#m-C_INT32)
- [C_INT64](#m-C_INT64)
- [C_INT8](#m-C_INT8)
- [C_IPV4](#m-C_IPV4)
- [C_IPV4PREFIX](#m-C_IPV4PREFIX)
- [C_IPV6](#m-C_IPV6)
- [C_IPV6PREFIX](#m-C_IPV6PREFIX)
- [C_LIST](#m-C_LIST)
- [C_NOEXISTS](#m-C_NOEXISTS)
- [C_OBJECTREF](#m-C_OBJECTREF)
- [C_OID](#m-C_OID)
- [C_PTR](#m-C_PTR)
- [C_QNAME](#m-C_QNAME)
- [C_STR](#m-C_STR)
- [C_SYMBOL](#m-C_SYMBOL)
- [C_TIME](#m-C_TIME)
- [C_UINT16](#m-C_UINT16)
- [C_UINT32](#m-C_UINT32)
- [C_UINT64](#m-C_UINT64)
- [C_UINT8](#m-C_UINT8)
- [C_UNION](#m-C_UNION)
- [C_XMLBEGIN](#m-C_XMLBEGIN)
- [C_XMLBEGINDEL](#m-C_XMLBEGINDEL)
- [C_XMLEND](#m-C_XMLEND)
- [C_XMLMOVEAFTER](#m-C_XMLMOVEAFTER)
- [C_XMLMOVEFIRST](#m-C_XMLMOVEFIRST)
- [C_XMLTAG](#m-C_XMLTAG)

**Methods**:

- [getValue()](#m-getvalue-d93864668c40)
- [toEnum(int)](#m-toenum-ac9124750f4f)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-C_BINARY"></a>
### C_BINARY

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_BINARY;
```

(yang:object-identifier)
             confd_buf_t (binary ...)

<a id="m-C_BIT32"></a>
### C_BIT32

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_BIT32;
```

uint32_t (bits size 32)

<a id="m-C_BIT64"></a>
### C_BIT64

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_BIT64;
```

uint64_t (bits size 64)

<a id="m-C_BOOL"></a>
### C_BOOL

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_BOOL;
```

(inet:ipv6-address)
             int       (boolean)

<a id="m-C_BUF"></a>
### C_BUF

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_BUF;
```

confd_buf_t (string ...)

<a id="m-C_CDBBEGIN"></a>
### C_CDBBEGIN

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_CDBBEGIN;
```

as C_XMLBEGIN), with CDB instance index

<a id="m-C_DATE"></a>
### C_DATE

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_DATE;
```

(yang:date-and-time)
             struct confd_date (xs:date)

<a id="m-C_DATETIME"></a>
### C_DATETIME

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_DATETIME;
```

struct confd_datetime

<a id="m-C_DECIMAL64"></a>
### C_DECIMAL64

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_DECIMAL64;
```

struct confd_decimal64 (decimal64)

<a id="m-C_DEFAULT"></a>
### C_DEFAULT

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_DEFAULT;
```

(inet:ipv6-prefix)
             default value indicator

<a id="m-C_DOUBLE"></a>
### C_DOUBLE

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_DOUBLE;
```

double (xs:float),xs:double)

<a id="m-C_DURATION"></a>
### C_DURATION

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_DURATION;
```

struct confd_duration (xs:duration)

<a id="m-C_EMPTY"></a>
### C_EMPTY

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_EMPTY;
```

empty type

<a id="m-C_ENUM_HASH"></a>
### C_ENUM_HASH

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_ENUM_HASH;
```

uint32_t (string enumerations)

<a id="m-C_GDAY"></a>
### C_GDAY

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_GDAY;
```

struct confd_gDay (xs:gDay)

<a id="m-C_GMONTH"></a>
### C_GMONTH

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_GMONTH;
```

struct confd_gMonthDay (xs:gMonth)

<a id="m-C_GMONTHDAY"></a>
### C_GMONTHDAY

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_GMONTHDAY;
```

struct confd_gMonth (xs:gMonthDay)

<a id="m-C_GYEAR"></a>
### C_GYEAR

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_GYEAR;
```

struct confd_gYear (xs:gYear)

<a id="m-C_GYEARMONTH"></a>
### C_GYEARMONTH

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_GYEARMONTH;
```

struct confd_gYearMonth (xs:gYearMonth)

<a id="m-C_IDENTITYREF"></a>
### C_IDENTITYREF

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_IDENTITYREF;
```

struct confd_identityref (identityref)

<a id="m-C_INT16"></a>
### C_INT16

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_INT16;
```

int16_t   (int16)

<a id="m-C_INT32"></a>
### C_INT32

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_INT32;
```

int32_t   (int32)

<a id="m-C_INT64"></a>
### C_INT64

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_INT64;
```

int64_t   (int64)

<a id="m-C_INT8"></a>
### C_INT8

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_INT8;
```

int8_t    (int8)

<a id="m-C_IPV4"></a>
### C_IPV4

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_IPV4;
```

struct in_addr in NBO

<a id="m-C_IPV4PREFIX"></a>
### C_IPV4PREFIX

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_IPV4PREFIX;
```

struct confd_ipv4_prefix

<a id="m-C_IPV6"></a>
### C_IPV6

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_IPV6;
```

(inet:ipv4-address)
             struct in6_addr in NBO

<a id="m-C_IPV6PREFIX"></a>
### C_IPV6PREFIX

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_IPV6PREFIX;
```

(inet:ipv4-prefix)
             struct confd_ipv6_prefix

<a id="m-C_LIST"></a>
### C_LIST

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_LIST;
```

confd_list (leaf-list)

<a id="m-C_NOEXISTS"></a>
### C_NOEXISTS

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_NOEXISTS;
```

end marker

<a id="m-C_OBJECTREF"></a>
### C_OBJECTREF

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_OBJECTREF;
```

struct confd_hkeypath*

<a id="m-C_OID"></a>
### C_OID

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_OID;
```

struct confd_snmp_oid*

<a id="m-C_PTR"></a>
### C_PTR

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_PTR;
```

see cdb_get_values in confd_lib_cdb(3)

<a id="m-C_QNAME"></a>
### C_QNAME

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_QNAME;
```

struct confd_qname (xs:QName)

<a id="m-C_STR"></a>
### C_STR

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_STR;
```

NUL-terminated strings

<a id="m-C_SYMBOL"></a>
### C_SYMBOL

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_SYMBOL;
```

not yet used

<a id="m-C_TIME"></a>
### C_TIME

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_TIME;
```

struct confd_time (xs:time)

<a id="m-C_UINT16"></a>
### C_UINT16

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_UINT16;
```

uint16_t (uint16)

<a id="m-C_UINT32"></a>
### C_UINT32

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_UINT32;
```

uint32_t (uint32)

<a id="m-C_UINT64"></a>
### C_UINT64

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_UINT64;
```

uint64_t (uint64)

<a id="m-C_UINT8"></a>
### C_UINT8

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_UINT8;
```

uint8_t  (uint8)

<a id="m-C_UNION"></a>
### C_UNION

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_UNION;
```

(instance-identifier)
             (union) - not used in API

<a id="m-C_XMLBEGIN"></a>
### C_XMLBEGIN

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_XMLBEGIN;
```

struct xml_tag), start of container

<a id="m-C_XMLBEGINDEL"></a>
### C_XMLBEGINDEL

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_XMLBEGINDEL;
```

as C_XMLBEGIN, but for a deleted list instance

<a id="m-C_XMLEND"></a>
### C_XMLEND

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_XMLEND;
```

struct xml_tag), end of container

<a id="m-C_XMLMOVEAFTER"></a>
### C_XMLMOVEAFTER

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_XMLMOVEAFTER;
```

struct xml_tag

<a id="m-C_XMLMOVEFIRST"></a>
### C_XMLMOVEFIRST

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_XMLMOVEFIRST;
```

struct xml_tag

<a id="m-C_XMLTAG"></a>
### C_XMLTAG

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_XMLTAG;
```

struct xml_tag


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

**Returns:** returns the integer value of the enum.

<a id="m-toenum-ac9124750f4f"></a>
### toEnum(int)

```java
public static com.tailf.maapi.MaapiSchemas.CSShallowType toEnum(int shallowType)
```

Types: [CSShallowType](CSShallowType.md#cls-CSShallowType)

**Parameters**

- `int shallowType`

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.maapi.MaapiSchemas.CSShallowType valueOf(String name)
```

Types: [CSShallowType](CSShallowType.md#cls-CSShallowType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.maapi.MaapiSchemas.CSShallowType[] values()
```

Types: [CSShallowType](CSShallowType.md#cls-CSShallowType)
