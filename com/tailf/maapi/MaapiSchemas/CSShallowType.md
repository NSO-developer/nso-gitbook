# CSShallowType <a href="#csshallowtype-383e8e4d58c6" id="csshallowtype-383e8e4d58c6"></a>

```java
public static enum com.tailf.maapi.MaapiSchemas.CSShallowType
```

Enum containing all possible node values.

## Members

**Enum Constants**:

- [C\_BINARY](#c_binary-9c42f8dc3bdb)
- [C\_BIT32](#c_bit32-29a2689dc15e)
- [C\_BIT64](#c_bit64-70b79203504c)
- [C\_BOOL](#c_bool-be84e9b010a0)
- [C\_BUF](#c_buf-c58953b79e0c)
- [C\_CDBBEGIN](#c_cdbbegin-956a0b6ebb35)
- [C\_DATE](#c_date-4c69e050d4e8)
- [C\_DATETIME](#c_datetime-156ea17a91da)
- [C\_DECIMAL64](#c_decimal64-ebc3c7cd4ac6)
- [C\_DEFAULT](#c_default-3d6ce27bf987)
- [C\_DOUBLE](#c_double-c2bc476402bc)
- [C\_DURATION](#c_duration-ce55f65c6b8a)
- [C\_EMPTY](#c_empty-04cb84b3e72e)
- [C\_ENUM\_HASH](#c_enum_hash-fd8bf053674f)
- [C\_GDAY](#c_gday-86bccc1db644)
- [C\_GMONTH](#c_gmonth-ad68e96e478e)
- [C\_GMONTHDAY](#c_gmonthday-acf5d60b9d11)
- [C\_GYEAR](#c_gyear-afa7295e241b)
- [C\_GYEARMONTH](#c_gyearmonth-a1d7f6b4f0b6)
- [C\_IDENTITYREF](#c_identityref-3520f61f7223)
- [C\_INT16](#c_int16-2530845569d2)
- [C\_INT32](#c_int32-de628ccc938d)
- [C\_INT64](#c_int64-f7d718932ce0)
- [C\_INT8](#c_int8-9ef7487d9472)
- [C\_IPV4](#c_ipv4-e60175020f57)
- [C\_IPV4PREFIX](#c_ipv4prefix-6f86a4c2f327)
- [C\_IPV6](#c_ipv6-71c516a5d9ce)
- [C\_IPV6PREFIX](#c_ipv6prefix-dd3dc43094e9)
- [C\_LIST](#c_list-c50b3e6ad605)
- [C\_NOEXISTS](#c_noexists-50615ff6ae47)
- [C\_OBJECTREF](#c_objectref-909686402be3)
- [C\_OID](#c_oid-de0626b8567a)
- [C\_PTR](#c_ptr-168bfef51be1)
- [C\_QNAME](#c_qname-e18a80cb76c1)
- [C\_STR](#c_str-f76c8abc5cfa)
- [C\_SYMBOL](#c_symbol-d8a4fb5bb591)
- [C\_TIME](#c_time-472b08d2e79d)
- [C\_UINT16](#c_uint16-ec9fdb05f348)
- [C\_UINT32](#c_uint32-b770cb5b940c)
- [C\_UINT64](#c_uint64-6ac181a4dbc1)
- [C\_UINT8](#c_uint8-5e431f64f690)
- [C\_UNION](#c_union-b0683fa72214)
- [C\_XMLBEGIN](#c_xmlbegin-9fc8dd337b02)
- [C\_XMLBEGINDEL](#c_xmlbegindel-5bbf74c496a6)
- [C\_XMLEND](#c_xmlend-66eaaa180ef6)
- [C\_XMLMOVEAFTER](#c_xmlmoveafter-cf9f92fd3452)
- [C\_XMLMOVEFIRST](#c_xmlmovefirst-1623434ea746)
- [C\_XMLTAG](#c_xmltag-e9c7e1e0757e)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [toEnum\(int\)](#toenum-ac9124750f4f)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### C_BINARY <a href="#c_binary-9c42f8dc3bdb" id="c_binary-9c42f8dc3bdb"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_BINARY;
```

(yang:object-identifier)
             confd_buf_t (binary ...)

### C_BIT32 <a href="#c_bit32-29a2689dc15e" id="c_bit32-29a2689dc15e"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_BIT32;
```

uint32_t (bits size 32)

### C_BIT64 <a href="#c_bit64-70b79203504c" id="c_bit64-70b79203504c"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_BIT64;
```

uint64_t (bits size 64)

### C_BOOL <a href="#c_bool-be84e9b010a0" id="c_bool-be84e9b010a0"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_BOOL;
```

(inet:ipv6-address)
             int       (boolean)

### C_BUF <a href="#c_buf-c58953b79e0c" id="c_buf-c58953b79e0c"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_BUF;
```

confd_buf_t (string ...)

### C_CDBBEGIN <a href="#c_cdbbegin-956a0b6ebb35" id="c_cdbbegin-956a0b6ebb35"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_CDBBEGIN;
```

as C_XMLBEGIN), with CDB instance index

### C_DATE <a href="#c_date-4c69e050d4e8" id="c_date-4c69e050d4e8"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_DATE;
```

(yang:date-and-time)
             struct confd_date (xs:date)

### C_DATETIME <a href="#c_datetime-156ea17a91da" id="c_datetime-156ea17a91da"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_DATETIME;
```

struct confd_datetime

### C_DECIMAL64 <a href="#c_decimal64-ebc3c7cd4ac6" id="c_decimal64-ebc3c7cd4ac6"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_DECIMAL64;
```

struct confd_decimal64 (decimal64)

### C_DEFAULT <a href="#c_default-3d6ce27bf987" id="c_default-3d6ce27bf987"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_DEFAULT;
```

(inet:ipv6-prefix)
             default value indicator

### C_DOUBLE <a href="#c_double-c2bc476402bc" id="c_double-c2bc476402bc"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_DOUBLE;
```

double (xs:float),xs:double)

### C_DURATION <a href="#c_duration-ce55f65c6b8a" id="c_duration-ce55f65c6b8a"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_DURATION;
```

struct confd_duration (xs:duration)

### C_EMPTY <a href="#c_empty-04cb84b3e72e" id="c_empty-04cb84b3e72e"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_EMPTY;
```

empty type

### C_ENUM_HASH <a href="#c_enum_hash-fd8bf053674f" id="c_enum_hash-fd8bf053674f"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_ENUM_HASH;
```

uint32_t (string enumerations)

### C_GDAY <a href="#c_gday-86bccc1db644" id="c_gday-86bccc1db644"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_GDAY;
```

struct confd_gDay (xs:gDay)

### C_GMONTH <a href="#c_gmonth-ad68e96e478e" id="c_gmonth-ad68e96e478e"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_GMONTH;
```

struct confd_gMonthDay (xs:gMonth)

### C_GMONTHDAY <a href="#c_gmonthday-acf5d60b9d11" id="c_gmonthday-acf5d60b9d11"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_GMONTHDAY;
```

struct confd_gMonth (xs:gMonthDay)

### C_GYEAR <a href="#c_gyear-afa7295e241b" id="c_gyear-afa7295e241b"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_GYEAR;
```

struct confd_gYear (xs:gYear)

### C_GYEARMONTH <a href="#c_gyearmonth-a1d7f6b4f0b6" id="c_gyearmonth-a1d7f6b4f0b6"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_GYEARMONTH;
```

struct confd_gYearMonth (xs:gYearMonth)

### C_IDENTITYREF <a href="#c_identityref-3520f61f7223" id="c_identityref-3520f61f7223"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_IDENTITYREF;
```

struct confd_identityref (identityref)

### C_INT16 <a href="#c_int16-2530845569d2" id="c_int16-2530845569d2"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_INT16;
```

int16_t   (int16)

### C_INT32 <a href="#c_int32-de628ccc938d" id="c_int32-de628ccc938d"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_INT32;
```

int32_t   (int32)

### C_INT64 <a href="#c_int64-f7d718932ce0" id="c_int64-f7d718932ce0"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_INT64;
```

int64_t   (int64)

### C_INT8 <a href="#c_int8-9ef7487d9472" id="c_int8-9ef7487d9472"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_INT8;
```

int8_t    (int8)

### C_IPV4 <a href="#c_ipv4-e60175020f57" id="c_ipv4-e60175020f57"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_IPV4;
```

struct in_addr in NBO

### C_IPV4PREFIX <a href="#c_ipv4prefix-6f86a4c2f327" id="c_ipv4prefix-6f86a4c2f327"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_IPV4PREFIX;
```

struct confd_ipv4_prefix

### C_IPV6 <a href="#c_ipv6-71c516a5d9ce" id="c_ipv6-71c516a5d9ce"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_IPV6;
```

(inet:ipv4-address)
             struct in6_addr in NBO

### C_IPV6PREFIX <a href="#c_ipv6prefix-dd3dc43094e9" id="c_ipv6prefix-dd3dc43094e9"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_IPV6PREFIX;
```

(inet:ipv4-prefix)
             struct confd_ipv6_prefix

### C_LIST <a href="#c_list-c50b3e6ad605" id="c_list-c50b3e6ad605"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_LIST;
```

confd_list (leaf-list)

### C_NOEXISTS <a href="#c_noexists-50615ff6ae47" id="c_noexists-50615ff6ae47"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_NOEXISTS;
```

end marker

### C_OBJECTREF <a href="#c_objectref-909686402be3" id="c_objectref-909686402be3"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_OBJECTREF;
```

struct confd_hkeypath*

### C_OID <a href="#c_oid-de0626b8567a" id="c_oid-de0626b8567a"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_OID;
```

struct confd_snmp_oid*

### C_PTR <a href="#c_ptr-168bfef51be1" id="c_ptr-168bfef51be1"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_PTR;
```

see cdb_get_values in confd_lib_cdb(3)

### C_QNAME <a href="#c_qname-e18a80cb76c1" id="c_qname-e18a80cb76c1"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_QNAME;
```

struct confd_qname (xs:QName)

### C_STR <a href="#c_str-f76c8abc5cfa" id="c_str-f76c8abc5cfa"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_STR;
```

NUL-terminated strings

### C_SYMBOL <a href="#c_symbol-d8a4fb5bb591" id="c_symbol-d8a4fb5bb591"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_SYMBOL;
```

not yet used

### C_TIME <a href="#c_time-472b08d2e79d" id="c_time-472b08d2e79d"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_TIME;
```

struct confd_time (xs:time)

### C_UINT16 <a href="#c_uint16-ec9fdb05f348" id="c_uint16-ec9fdb05f348"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_UINT16;
```

uint16_t (uint16)

### C_UINT32 <a href="#c_uint32-b770cb5b940c" id="c_uint32-b770cb5b940c"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_UINT32;
```

uint32_t (uint32)

### C_UINT64 <a href="#c_uint64-6ac181a4dbc1" id="c_uint64-6ac181a4dbc1"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_UINT64;
```

uint64_t (uint64)

### C_UINT8 <a href="#c_uint8-5e431f64f690" id="c_uint8-5e431f64f690"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_UINT8;
```

uint8_t  (uint8)

### C_UNION <a href="#c_union-b0683fa72214" id="c_union-b0683fa72214"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_UNION;
```

(instance-identifier)
             (union) - not used in API

### C_XMLBEGIN <a href="#c_xmlbegin-9fc8dd337b02" id="c_xmlbegin-9fc8dd337b02"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_XMLBEGIN;
```

struct xml_tag), start of container

### C_XMLBEGINDEL <a href="#c_xmlbegindel-5bbf74c496a6" id="c_xmlbegindel-5bbf74c496a6"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_XMLBEGINDEL;
```

as C_XMLBEGIN, but for a deleted list instance

### C_XMLEND <a href="#c_xmlend-66eaaa180ef6" id="c_xmlend-66eaaa180ef6"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_XMLEND;
```

struct xml_tag), end of container

### C_XMLMOVEAFTER <a href="#c_xmlmoveafter-cf9f92fd3452" id="c_xmlmoveafter-cf9f92fd3452"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_XMLMOVEAFTER;
```

struct xml_tag

### C_XMLMOVEFIRST <a href="#c_xmlmovefirst-1623434ea746" id="c_xmlmovefirst-1623434ea746"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_XMLMOVEFIRST;
```

struct xml_tag

### C_XMLTAG <a href="#c_xmltag-e9c7e1e0757e" id="c_xmltag-e9c7e1e0757e"></a>

```java
public static final com.tailf.maapi.MaapiSchemas.CSShallowType C_XMLTAG;
```

struct xml_tag


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

**Returns:** returns the integer value of the enum.

### toEnum(int) <a href="#toenum-ac9124750f4f" id="toenum-ac9124750f4f"></a>

```java
public static com.tailf.maapi.MaapiSchemas.CSShallowType toEnum(int shallowType)
```

Types: [CSShallowType](CSShallowType.md#csshallowtype-383e8e4d58c6)

**Parameters**

- `int shallowType`

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.maapi.MaapiSchemas.CSShallowType valueOf(String name)
```

Types: [CSShallowType](CSShallowType.md#csshallowtype-383e8e4d58c6)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.MaapiSchemas.CSShallowType[] values()
```

Types: [CSShallowType](CSShallowType.md#csshallowtype-383e8e4d58c6)
