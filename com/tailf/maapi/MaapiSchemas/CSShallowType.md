# CSShallowType <a href="#cls-CSShallowType" id="cls-CSShallowType"></a>

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

- [getValue()](#m-getValue-d93864668c40)
- [toEnum(int)](#m-toEnum-ac9124750f4f)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### C_BINARY <a href="#m-C_BINARY" id="m-C_BINARY"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_BINARY;
```

(yang:object-identifier)
             confd_buf_t (binary ...)

### C_BIT32 <a href="#m-C_BIT32" id="m-C_BIT32"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_BIT32;
```

uint32_t (bits size 32)

### C_BIT64 <a href="#m-C_BIT64" id="m-C_BIT64"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_BIT64;
```

uint64_t (bits size 64)

### C_BOOL <a href="#m-C_BOOL" id="m-C_BOOL"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_BOOL;
```

(inet:ipv6-address)
             int       (boolean)

### C_BUF <a href="#m-C_BUF" id="m-C_BUF"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_BUF;
```

confd_buf_t (string ...)

### C_CDBBEGIN <a href="#m-C_CDBBEGIN" id="m-C_CDBBEGIN"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_CDBBEGIN;
```

as C_XMLBEGIN), with CDB instance index

### C_DATE <a href="#m-C_DATE" id="m-C_DATE"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_DATE;
```

(yang:date-and-time)
             struct confd_date (xs:date)

### C_DATETIME <a href="#m-C_DATETIME" id="m-C_DATETIME"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_DATETIME;
```

struct confd_datetime

### C_DECIMAL64 <a href="#m-C_DECIMAL64" id="m-C_DECIMAL64"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_DECIMAL64;
```

struct confd_decimal64 (decimal64)

### C_DEFAULT <a href="#m-C_DEFAULT" id="m-C_DEFAULT"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_DEFAULT;
```

(inet:ipv6-prefix)
             default value indicator

### C_DOUBLE <a href="#m-C_DOUBLE" id="m-C_DOUBLE"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_DOUBLE;
```

double (xs:float),xs:double)

### C_DURATION <a href="#m-C_DURATION" id="m-C_DURATION"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_DURATION;
```

struct confd_duration (xs:duration)

### C_EMPTY <a href="#m-C_EMPTY" id="m-C_EMPTY"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_EMPTY;
```

empty type

### C_ENUM_HASH <a href="#m-C_ENUM_HASH" id="m-C_ENUM_HASH"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_ENUM_HASH;
```

uint32_t (string enumerations)

### C_GDAY <a href="#m-C_GDAY" id="m-C_GDAY"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_GDAY;
```

struct confd_gDay (xs:gDay)

### C_GMONTH <a href="#m-C_GMONTH" id="m-C_GMONTH"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_GMONTH;
```

struct confd_gMonthDay (xs:gMonth)

### C_GMONTHDAY <a href="#m-C_GMONTHDAY" id="m-C_GMONTHDAY"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_GMONTHDAY;
```

struct confd_gMonth (xs:gMonthDay)

### C_GYEAR <a href="#m-C_GYEAR" id="m-C_GYEAR"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_GYEAR;
```

struct confd_gYear (xs:gYear)

### C_GYEARMONTH <a href="#m-C_GYEARMONTH" id="m-C_GYEARMONTH"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_GYEARMONTH;
```

struct confd_gYearMonth (xs:gYearMonth)

### C_IDENTITYREF <a href="#m-C_IDENTITYREF" id="m-C_IDENTITYREF"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_IDENTITYREF;
```

struct confd_identityref (identityref)

### C_INT16 <a href="#m-C_INT16" id="m-C_INT16"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_INT16;
```

int16_t   (int16)

### C_INT32 <a href="#m-C_INT32" id="m-C_INT32"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_INT32;
```

int32_t   (int32)

### C_INT64 <a href="#m-C_INT64" id="m-C_INT64"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_INT64;
```

int64_t   (int64)

### C_INT8 <a href="#m-C_INT8" id="m-C_INT8"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_INT8;
```

int8_t    (int8)

### C_IPV4 <a href="#m-C_IPV4" id="m-C_IPV4"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_IPV4;
```

struct in_addr in NBO

### C_IPV4PREFIX <a href="#m-C_IPV4PREFIX" id="m-C_IPV4PREFIX"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_IPV4PREFIX;
```

struct confd_ipv4_prefix

### C_IPV6 <a href="#m-C_IPV6" id="m-C_IPV6"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_IPV6;
```

(inet:ipv4-address)
             struct in6_addr in NBO

### C_IPV6PREFIX <a href="#m-C_IPV6PREFIX" id="m-C_IPV6PREFIX"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_IPV6PREFIX;
```

(inet:ipv4-prefix)
             struct confd_ipv6_prefix

### C_LIST <a href="#m-C_LIST" id="m-C_LIST"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_LIST;
```

confd_list (leaf-list)

### C_NOEXISTS <a href="#m-C_NOEXISTS" id="m-C_NOEXISTS"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_NOEXISTS;
```

end marker

### C_OBJECTREF <a href="#m-C_OBJECTREF" id="m-C_OBJECTREF"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_OBJECTREF;
```

struct confd_hkeypath*

### C_OID <a href="#m-C_OID" id="m-C_OID"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_OID;
```

struct confd_snmp_oid*

### C_PTR <a href="#m-C_PTR" id="m-C_PTR"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_PTR;
```

see cdb_get_values in confd_lib_cdb(3)

### C_QNAME <a href="#m-C_QNAME" id="m-C_QNAME"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_QNAME;
```

struct confd_qname (xs:QName)

### C_STR <a href="#m-C_STR" id="m-C_STR"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_STR;
```

NUL-terminated strings

### C_SYMBOL <a href="#m-C_SYMBOL" id="m-C_SYMBOL"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_SYMBOL;
```

not yet used

### C_TIME <a href="#m-C_TIME" id="m-C_TIME"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_TIME;
```

struct confd_time (xs:time)

### C_UINT16 <a href="#m-C_UINT16" id="m-C_UINT16"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_UINT16;
```

uint16_t (uint16)

### C_UINT32 <a href="#m-C_UINT32" id="m-C_UINT32"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_UINT32;
```

uint32_t (uint32)

### C_UINT64 <a href="#m-C_UINT64" id="m-C_UINT64"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_UINT64;
```

uint64_t (uint64)

### C_UINT8 <a href="#m-C_UINT8" id="m-C_UINT8"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_UINT8;
```

uint8_t  (uint8)

### C_UNION <a href="#m-C_UNION" id="m-C_UNION"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_UNION;
```

(instance-identifier)
             (union) - not used in API

### C_XMLBEGIN <a href="#m-C_XMLBEGIN" id="m-C_XMLBEGIN"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_XMLBEGIN;
```

struct xml_tag), start of container

### C_XMLBEGINDEL <a href="#m-C_XMLBEGINDEL" id="m-C_XMLBEGINDEL"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_XMLBEGINDEL;
```

as C_XMLBEGIN, but for a deleted list instance

### C_XMLEND <a href="#m-C_XMLEND" id="m-C_XMLEND"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_XMLEND;
```

struct xml_tag), end of container

### C_XMLMOVEAFTER <a href="#m-C_XMLMOVEAFTER" id="m-C_XMLMOVEAFTER"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_XMLMOVEAFTER;
```

struct xml_tag

### C_XMLMOVEFIRST <a href="#m-C_XMLMOVEFIRST" id="m-C_XMLMOVEFIRST"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_XMLMOVEFIRST;
```

struct xml_tag

### C_XMLTAG <a href="#m-C_XMLTAG" id="m-C_XMLTAG"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_XMLTAG;
```

struct xml_tag


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

**Returns:** returns the integer value of the enum.

### toEnum(int) <a href="#m-toEnum-ac9124750f4f" id="m-toEnum-ac9124750f4f"></a>

```java
public static com.tailf.maapi.MaapiSchemas.CSShallowType toEnum(int shallowType)
```

Types: [CSShallowType](CSShallowType.md#cls-CSShallowType)

**Parameters**

- `int shallowType`

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.maapi.MaapiSchemas.CSShallowType valueOf(String name)
```

Types: [CSShallowType](CSShallowType.md#cls-CSShallowType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.MaapiSchemas.CSShallowType[] values()
```

Types: [CSShallowType](CSShallowType.md#cls-CSShallowType)
