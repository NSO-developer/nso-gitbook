# confd_types Man Page

`confd_types` - NSO value representation in C

## Synopsis

    #include <confd_lib.h>

## Description

The `libconfd` library manages data values such as elements received
over the NETCONF protocol. This man page describes how these values as
well as the XML paths (`confd_hkeypath_t`) identifying the values are
represented in the C language.

## Typedefs

The following `enum` defines the different types. These are used to
represent data model types from several different sources - see the
section [DATA MODEL TYPES](confd_types.3.md#data_model) at the end of
this manual page for a full specification of how the data model types
map to these types.

<div class="informalexample">

``` c
enum confd_vtype {
    C_NOEXISTS    = 1,  /* end marker                              */
    C_XMLTAG      = 2,  /* struct xml_tag                          */
    C_SYMBOL      = 3,  /* not yet used                            */
    C_STR         = 4,  /* NUL-terminated strings                  */
    C_BUF         = 5,  /* confd_buf_t (string ...)                */
    C_INT8        = 6,  /* int8_t                                  */
    C_INT16       = 7,  /* int16_t                                 */
    C_INT32       = 8,  /* int32_t                                 */
    C_INT64       = 9,  /* int64_t                                 */
    C_UINT8       = 10, /* uint8_t                                 */
    C_UINT16      = 11, /* uint16_t                                */
    C_UINT32      = 12, /* uint32_t                                */
    C_UINT64      = 13, /* uint64_t                                */
    C_DOUBLE      = 14, /* double (xs:float,xs:double)             */
    C_IPV4        = 15, /* struct in_addr in NBO                   */
                        /*  (inet:ipv4-address)                    */
    C_IPV6        = 16, /* struct in6_addr in NBO                  */
                        /*  (inet:ipv6-address)                    */
    C_BOOL        = 17, /* int       (boolean)                     */
    C_QNAME       = 18, /* struct confd_qname (xs:QName)           */
    C_DATETIME    = 19, /* struct confd_datetime                   */
                        /*  (yang:date-and-time)                   */
    C_DATE        = 20, /* struct confd_date (xs:date)             */
    C_TIME        = 23, /* struct confd_time (xs:time)             */
    C_DURATION    = 27, /* struct confd_duration (xs:duration)     */
    C_ENUM_VALUE  = 28, /* int32_t (enumeration)                   */
    C_BIT32       = 29, /* uint32_t (bits size 32)                 */
    C_BIT64       = 30, /* uint64_t (bits size 64)                 */
    C_LIST        = 31, /* confd_list (leaf-list)                  */
    C_XMLBEGIN    = 32, /* struct xml_tag, start of container or   */
                        /*  list entry                             */
    C_XMLEND      = 33, /* struct xml_tag, end of container or     */
                        /*  list entry                             */
    C_OBJECTREF   = 34, /* struct confd_hkeypath*                  */
                        /*  (instance-identifier)                  */
    C_UNION       = 35, /* (union) - not used in API functions     */
    C_PTR         = 36, /* see cdb_get_values in confd_lib_cdb(3)  */
    C_CDBBEGIN    = 37, /* as C_XMLBEGIN, with CDB instance index  */
    C_OID         = 38, /* struct confd_snmp_oid*                  */
                        /*  (yang:object-identifier)               */
    C_BINARY      = 39, /* confd_buf_t (binary ...)                */
    C_IPV4PREFIX  = 40, /* struct confd_ipv4_prefix                */
                        /*  (inet:ipv4-prefix)                     */
    C_IPV6PREFIX  = 41, /* struct confd_ipv6_prefix                */
                        /*  (inet:ipv6-prefix)                     */
    C_DEFAULT     = 42, /* default value indicator                 */
    C_DECIMAL64   = 43, /* struct confd_decimal64 (decimal64)      */
    C_IDENTITYREF = 44, /* struct confd_identityref (identityref)  */
    C_XMLBEGINDEL = 45, /* as C_XMLBEGIN, but for a deleted list   */
                        /*  entry                                  */
    C_DQUAD       = 46, /* struct confd_dotted_quad                */
                        /*  (yang:dotted-quad)                     */
    C_HEXSTR      = 47, /* confd_buf_t (yang:hex-string)           */
    C_IPV4_AND_PLEN = 48, /* struct confd_ipv4_prefix              */
                        /*  (tailf:ipv4-address-and-prefix-length) */
    C_IPV6_AND_PLEN = 49, /* struct confd_ipv6_prefix              */
                        /*  (tailf:ipv6-address-and-prefix-length) */
    C_BITBIG      = 50, /* confd_buf_t (bits size > 64)            */
    C_XMLMOVEFIRST = 51, /* OBU list entry moved/inserted first    */
    C_XMLMOVEAFTER = 52, /* OBU list entry moved after             */
    C_EMPTY = 53,       /* Represents type empty in list keys      */
                        /* and unions.                             */
    C_MAXTYPE           /* maximum marker; add new values above    */
};
```

</div>

A concrete value is represented as a `confd_value_t` C struct:

<div class="informalexample">

``` c
typedef struct confd_value {
    enum confd_vtype type;  /* as defined above */
    union {
        struct xml_tag xmltag;
        uint32_t symbol;
        confd_buf_t buf;
        confd_buf_const_t c_buf;
        char *s;
        const char *c_s;
        int8_t i8;
        int16_t i16;
        int32_t i32;
        int64_t i64;
        uint8_t u8;
        uint16_t u16;
        uint32_t u32;
        uint64_t u64;
        double d;
        struct in_addr ip;
        struct in6_addr ip6;
        int boolean;
        struct confd_qname qname;
        struct confd_datetime datetime;
        struct confd_date date;
        struct confd_time time;
        struct confd_duration duration;
        int32_t enumvalue;
        uint32_t b32;
        uint64_t b64;
        struct confd_list list;
        struct confd_hkeypath *hkp;
        struct confd_vptr ptr;
        struct confd_snmp_oid *oidp;
        struct confd_ipv4_prefix ipv4prefix;
        struct confd_ipv6_prefix ipv6prefix;
        struct confd_decimal64 d64;
        struct confd_identityref idref;
        struct confd_dotted_quad dquad;
        uint32_t enumhash; /* backwards compat */
    } val;
} confd_value_t;
```

</div>

`C_NOEXISTS`  
> This is used internally by ConfD, as an end marker in
> `confd_hkeypath_t` arrays, and as a "value does not exist" indicator
> in arrays of values.

`C_DEFAULT`  
> This is used to indicate that an element with a default value defined
> in the data model does not have a value set. When reading data from
> ConfD, we will only get this indication if we specifically request it,
> otherwise the default value is returned.

`C_XMLTAG`  
> An C_XMLTAG value is represented as a struct:
>
> <div class="informalexample">
>
> ``` c
> struct xml_tag {
>     uint32_t tag;
>     uint32_t ns;
> };
> ```
>
> </div>
>
> When a YANG module is compiled by the [confdc(1)](ncsc.1.md)
> compiler, the `--emit-h` flag is used to generate a .h file containing
> definitions for all the nodes in the module. For example if we compile
> the following YANG module:
>
> <div class="informalexample">
>
>     # cat blaster.yang
>     module blaster {
>       namespace "http://tail-f.com/ns/blaster";
>       prefix blaster;
>
>       import tailf-common {
>         prefix tailf;
>       }
>
>       typedef Fruit {
>         type enumeration {
>           enum apple;
>           enum orange;
>           enum pear;
>         }
>       }
>       container tiny {
>         tailf:callpoint xcp;
>         leaf foo {
>           type int8;
>         }
>         leaf bad {
>           type int16;
>         }
>       }
>     }
>
>     # confdc -c blaster.yang
>     # confdc --emit-h blaster.h blaster.fxs
>
> </div>
>
> We get the following contents in blaster.h
>
> <div class="informalexample">
>
>     # cat blaster.h
>     /*
>      * BEWARE BEWARE BEWARE BEWARE BEWARE BEWARE BEWARE BEWARE BEWARE
>      * This file has been auto-generated by the confdc compiler.
>      * Source: blaster.fxs
>      * BEWARE BEWARE BEWARE BEWARE BEWARE BEWARE BEWARE BEWARE BEWARE
>      */
>
>     #ifndef _BLASTER_H_
>     #define _BLASTER_H_
>
>     #ifdef __cplusplus
>     extern "C" {
>     #endif /* __cplusplus */
>
>     #ifndef blaster__ns
>     #define blaster__ns 670579579
>     #define blaster__ns_id "http://tail-f.com/ns/blaster"
>     #define blaster__ns_uri "http://tail-f.com/ns/blaster"
>     #endif
>
>     #define blaster_orange 1
>     #define blaster_apple 0
>     #define blaster_pear 2
>     #define blaster_foo 161968632
>     #define blaster_tiny 1046642021
>     #define blaster_bad 1265139696
>     #define blaster__callpointid_xcp "xcp"
>
>     #ifdef __cplusplus
>     }
>     #endif
>
>     #endif
>
> </div>
>
> The integers in the .h file are used in the `struct xml_tag`, thus the
> container node tiny is represented as a `xml_tag` C struct
> `{tag=1046642021, ns=670579579}` or, using the \#defines
> `{tag=blaster_tiny, ns=blaster__ns}`.
>
> Each callpoint, actionpoint, and validate statement also yields a
> preprocessor symbol. If the symbol is used rather than the literal
> string in calls to ConfD, the C compiler will catch the potential
> problem when the id in the data model has changed but the C code
> hasn't been updated.
>
> Sometimes we wish to retrieve a string representation of defined hash
> values. This can be done with the function `confd_hash2str()`, see the
> [USING SCHEMA
> INFORMATION](confd_types.3.md#using_schema_information) section
> below.

`C_BUF`  
> This type is used to represent the YANG built-in type `string` and the
> `xs:token` type. The struct which is used is:
>
> <div class="informalexample">
>
> ``` c
> typedef struct confd_buf {
>     unsigned int size;
>     unsigned char *ptr;
> } confd_buf_t;
> ```
>
> </div>
>
> Strings passed to the application from ConfD are always
> NUL-terminated. When values of this type are received by the callback
> functions in [confd_lib_dp(3)](confd_lib_dp.3.md), the `ptr` field
> is a pointer to libconfd private memory, and the data will not survive
> unless copied by the application.
>
> To create and extract values of type C_BUF we do:
>
> <div class="informalexample">
>
>     confd_value_t myval;
>     char *x; int len;
>
>     CONFD_SET_BUF(&myval, "foo", 3)
>     x = CONFD_GET_BUFPTR(&myval);
>     len = CONFD_GET_BUFSIZE(&myval);
>
> </div>
>
> It is important to realize that C_BUF data received by the application
> through either `maapi_get_elem()` or `cdb_get()` which are of type
> C_BUF must be freed by the application.

`C_STR`  
> This tag is never received by the application. Values and keys
> received in the various data callbacks (See `confd_register_data_cb()`
> in [confd_lib_dp(3)](confd_lib_dp.3.md) never have this type. It is
> only used when the application replies with values to ConfD. (See
> `confd_data_reply_value()` in [confd_lib_dp(3)](confd_lib_dp.3.md)).
>
> It is used to represent regular NUL-terminated char\* values. Example:
>
> <div class="informalexample">
>
>     confd_value_t myval;
>     myval.type = C_STR;
>     myval.val.s = "Zaphod";
>     /* or alternatively and recommended */
>     CONFD_SET_STR(&myval, "Beeblebrox");
>
> </div>

`C_INT8`  
> Used to represent the YANG built-in type `int8`, which is a signed 8
> bit integer. The corresponding C type is `int8_t`. Example:
>
> <div class="informalexample">
>
>     int8_t ival;
>     confd_value_t myval;
>
>     CONFD_SET_INT8(&myval, -32);
>     ival = CONFD_GET_INT8(&myval);
>
> </div>

`C_INT16`  
> Used to represent the YANG built-in type `int16`, which is a signed 16
> bit integer. The corresponding C type is `int16_t`. Example:
>
> <div class="informalexample">
>
>     int16_t ival;
>     confd_value_t myval;
>
>     CONFD_SET_INT16(&myval, -3277);
>     ival = CONFD_GET_INT16(&myval);
>
> </div>

`C_INT32`  
> Used to represent the YANG built-in type `int32`, which is a signed 32
> bit integer. The corresponding C type is `int32_t`. Example:
>
> <div class="informalexample">
>
>     int32_t ival;
>     confd_value_t myval;
>
>     CONFD_SET_INT32(&myval, -77732);
>     ival = CONFD_GET_INT32(&myval);
>
> </div>

`C_INT64`  
> Used to represent the YANG built-in type `int64`, which is a signed 64
> bit integer. The corresponding C type is `int64_t`. Example:
>
> <div class="informalexample">
>
>     int64_t ival;
>     confd_value_t myval;
>
>     CONFD_SET_INT64(&myval, -32);
>     ival = CONFD_GET_INT64(&myval);
>
> </div>

`C_UINT8`  
> Used to represent the YANG built-in type `uint8`, which is an unsigned
> 8 bit integer. The corresponding C type is `uint8_t`. Example:
>
> <div class="informalexample">
>
>     uint8_t ival;
>     confd_value_t myval;
>
>     CONFD_SET_UINT8(&myval, 32);
>     ival = CONFD_GET_UINT8(&myval);
>
> </div>

`C_UINT16`  
> Used to represent the YANG built-in type `uint16`, which is an
> unsigned 16 bit integer. The corresponding C type is `uint16_t`.
> Example:
>
> <div class="informalexample">
>
>     uint16_t ival;
>     confd_value_t myval;
>
>     CONFD_SET_UINT16(&myval, 3277);
>     ival = CONFD_GET_UINT16(&myval);
>
> </div>

`C_UINT32`  
> Used to represent the YANG built-in type `uint32`, which is an
> unsigned 32 bit integer. The corresponding C type is `uint32_t`.
> Example:
>
> <div class="informalexample">
>
>     uint32_t ival;
>     confd_value_t myval;
>
>     CONFD_SET_UINT32(&myval, 77732);
>     ival = CONFD_GET_UINT32(&myval);
>
> </div>

`C_UINT64`  
> Used to represent the YANG built-in type `uint64`, which is an
> unsigned 64 bit integer. The corresponding C type is `uint64_t`.
> Example:
>
> <div class="informalexample">
>
>     uint64_t ival;
>     confd_value_t myval;
>
>     CONFD_SET_UINT64(&myval, 32);
>     ival = CONFD_GET_UINT64(&myval);
>
> </div>

`C_DOUBLE`  
> Used to represent the XML schema types `xs:decimal`, `xs:float` and
> `xs:double`. They are all coerced into the C type `double`. Example:
>
> <div class="informalexample">
>
>     double d;
>     confd_value_t myval;
>
>     CONFD_SET_DOUBLE(&myval, 3.14);
>     d = CONFD_GET_DOUBLE(&myval);
>
> </div>

`C_BOOL`  
> Used to represent the YANG built-in type `boolean`. The C
> representation is an integer with `0` representing false and non-zero
> representing true. Example:
>
> <div class="informalexample">
>
>     int bool
>     confd_value_t myval;
>
>     CONFD_SET_BOOL(&myval, 1);
>     b = CONFD_GET_BOOL(&myval);
>
> </div>

`C_QNAME`  
> Used to represent XML Schema type `xs:QName` which consists of a pair
> of strings, `prefix` and a `name`. Data is allocated by the library as
> for C_BUF. Example:
>
> <div class="informalexample">
>
>     unsigned char* prefix, *name;
>     int prefix_len, name_len;
>     confd_value_t myval;
>
>     CONFD_SET_QNAME(&myval, "myprefix", 8, "myname", 6);
>     prefix = CONFD_GET_QNAME_PREFIX_PTR(&myval);
>     prefix_len = CONFD_GET_QNAME_PREFIX_SIZE(&myval);
>     name = CONFD_GET_QNAME_NAME_PTR(&myval);
>     name_len = CONFD_GET_QNAME_NAME_SIZE(&myval);
>
> </div>

`C_DATETIME`  
> Used to represent the YANG type `yang:date-and-time`. The C
> representation is a struct:
>
> <div class="informalexample">
>
> ``` c
> struct confd_datetime {
>     int16_t year;
>     uint8_t month;
>     uint8_t day;
>     uint8_t hour;
>     uint8_t min;
>     uint8_t sec;
>     uint32_t micro;
>     int8_t timezone;
>     int8_t timezone_minutes;
> };
> ```
>
> </div>
>
> ConfD does not try to convert the data values into timezone
> independent C structs. The timezone and timezone_minutes fields are
> integers where:
>
> `timezone == 0 && timezone_minutes == 0`  
> > represents UTC. This corresponds to a timezone specification in the
> > string form of "Z" or "+00:00".
>
> `-14 <= timezone && timezone <= 14`  
> > represents an offset in hours from UTC. In this case
> > `timezone_minutes` represents a fraction of an hour in minutes if
> > the offset from UTC isn't an integral number of hours, otherwise it
> > is 0. If `timezone != 0`, its sign gives the direction of the
> > offset, and `timezone_minutes` is always `>= 0` - otherwise the sign
> > of `timezone_minutes` gives the direction of the offset. E.g.
> > `timezone == 5 && timezone_minutes == 30` corresponds to a timezone
> > specification in the string form of "+05:30".
>
> `timezone == CONFD_TIMEZONE_UNDEF`  
> > means that the string form indicates lack of timezone information
> > with "-00:00".
>
> It is up to the application to transform these structs into more UNIX
> friendly structs such as `struct tm` from `<time.h>`. Example:
>
> <div class="informalexample">
>
>     #include <time.h>
>     confd_value_t myval;
>     struct confd_datetime dt;
>     struct tm *tm = localtime(time(NULL));
>
>     dt.year = tm->tm_year + 1900; dt.month = tm->tm_mon + 1;
>     dt.day = tm->tm_mday; dt->hour = tm->tm_hour;
>     dt.min = tm->tm_min; dt->sec = tm->tm_sec;
>     dt.micro = 0; dt.timezone = CONFD_TIMEZONE_UNDEF;
>     CONFD_SET_DATETIME(&myval, dt);
>     dt = CONFD_GET_DATETIME(&myval);
>
> </div>

`C_DATE`  
> Used to represent the XML Schema type `xs:date`. The C representation
> is a struct:
>
> <div class="informalexample">
>
> ``` c
> struct confd_date {
>     int16_t year;
>     uint8_t month;
>     uint8_t day;
>     int8_t timezone;
>     int8_t timezone_minutes;
> };
> ```
>
> </div>
>
> Example:
>
> <div class="informalexample">
>
>     confd_value_t myval;
>     struct confd_date dt;
>
>     dt.year = 1960, dt.month = 3,
>     dt.day = 31; dt.timezone = CONFD_TIMEZONE_UNDEF;
>     CONFD_SET_DATE(&myval, dt);
>     dt = CONFD_GET_DATE(&myval);
>
> </div>

`C_TIME`  
> Used to represent the XML Schema type `xs:time`. The C representation
> is a struct:
>
> <div class="informalexample">
>
> ``` c
> struct confd_time {
>     uint8_t hour;
>     uint8_t min;
>     uint8_t sec;
>     uint32_t micro;
>     int8_t timezone;
>     int8_t timezone_minutes;
> };
> ```
>
> </div>
>
> Example:
>
> <div class="informalexample">
>
>     confd_value_t myval;
>     struct confd_time dt;
>
>     dt.hour = 19, dt.min = 3,
>     dt.sec = 31; dt.timezone = CONFD_TIMEZONE_UNDEF;
>     CONFD_SET_TIME(&myval, dt);
>     dt = CONFD_GET_TIME(&myval);
>
> </div>

`C_DURATION`  
> Used to represent the XML Schema type `xs:duration`. The C
> representation is a struct:
>
> <div class="informalexample">
>
> ``` c
> struct confd_duration {
>     uint32_t years;
>     uint32_t months;
>     uint32_t days;
>     uint32_t hours;
>     uint32_t mins;
>     uint32_t secs;
>     uint32_t micros;
> };
> ```
>
> </div>
>
> Example of something that is supposed to last 3 seconds:
>
> <div class="informalexample">
>
>     confd_value_t myval;
>     struct confd_duration dt;
>
>     memset(&dt, 0, sizeof(struct confd_duration));
>     dt.secs = 3;
>     CONFD_SET_DURATION(&myval, dt);
>     dt = CONFD_GET_DURATION(&myval);
>
> </div>

`C_IPV4`  
> Used to represent the YANG type `inet:ipv4-address`. The C
> representation is a `struct in_addr` Example:
>
> <div class="informalexample">
>
>     struct in_addr ip;
>     confd_value_t myval;
>
>     ip.s_addr = inet_addr("192.168.1.2");
>     CONFD_SET_IPV4(&myval, ip);
>     ip = CONFD_GET_IPV4(&myval);
>
> </div>

`C_IPV6`  
> Used to represent the YANG type `inet:ipv6-address`. The C
> representation is as `struct in6_addr` Example:
>
> <div class="informalexample">
>
>     struct in6_addr ip6;
>     confd_value_t myval;
>
>     inet_pton(AF_INET6, "FFFF::192.168.42.2", &ip6);
>     CONFD_SET_IPV6(&myval, ip6);
>     ip6 = CONFD_GET_IPV6(&myval);
>
> </div>

`C_ENUM_VALUE`  
> Used to represent the YANG built-in type `enumeration` - like the
> Fruit enumeration from the beginning of this man page.
>
> <div class="informalexample">
>
>     enum fruit {
>        ORANGE = blaster_orange,
>        APPLE = blaster_apple,
>        PEAR = blaster_pear
>     };
>
>     enum fruit f;
>     confd_value_t myval;
>     CONFD_SET_ENUM_VALUE(&myval, APPLE);
>     f = CONFD_GET_ENUM_VALUE(&myval);
>
> </div>
>
> Thus leafs that have type `enumeration` in the YANG module do not have
> values that are strings in the C code, but integer values according to
> the YANG standard. The file generated by `confdc --emit-h` includes
> `#define` symbols for these integer values.

`C_BIT32`; `C_BIT64`  
> Used to represent the YANG built-in type `bits` when the highest bit
> position assigned is below 64. In C the value representation for a
> bitmask is either a 32 bit or a 64 bit unsigned integer, depending on
> the highest bit position assigned. The file generated by
> `confdc --emit-h` includes `#define` symbols giving bitmask values for
> the defined bit names.
>
> <div class="informalexample">
>
>     uint32_t mask = 77;
>     confd_value_t myval;
>     CONFD_SET_BIT32(&myval, mask);
>     mask = CONFD_GET_BIT32(&myval);
>
> </div>

`C_BITBIG`  
> Used to represent the YANG built-in type `bits` when the highest bit
> position assigned is above 63. In C the value representation for a
> bitmask in this case is a "little-endian" byte array (confd_buf_t),
> i.e. byte 0 holds bits 0-7, byte 1 holds bit 8-15, and so on. The file
> generated by `confdc --emit-h` includes `#define` symbols giving
> position values for the defined bit names, as well as the size needed
> for a byte array that can hold the values for all the defined bits.
>
> <div class="informalexample">
>
>     unsigned char mask[myns__size_mytype];
>     unsigned char *mask2;
>     confd_value_t myval;
>     memset(mask, 0, sizeof(mask));
>     CONFD_BITBIG_SET_BIT(mask, myns__pos_mytype_somebit);
>     CONFD_SET_BITBIG(&myval, mask, sizeof(mask));
>     mask2 = CONFD_GET_BITBIG_PTR(&myval);
>
> </div>

`C_EMPTY`  
> Used to represent the YANG built-in type `empty`, when placed in a
> `union` or a list key. It is not used for regular type `empty` leafs
> to preserve backward compatibility. Regular leafs are represented by
> C_XMLTAG.
>
> Leafs with type `C_EMPTY` will be set using `set_elem()` and read
> using `get_elem()`. Like before, regular type `empty` leafs outside of
> `union` are set using `create()` and "read" using `exists()`.
>
> <div class="informalexample">
>
>     confd_value_t myval;
>     CONFD_SET_EMPTY(&myval);
>
> </div>

`C_LIST`  
> Used to represent a YANG `leaf-list`. In C the value representation
> for is:
>
> <div class="informalexample">
>
> ``` c
> struct confd_list {
>     unsigned int size;
>     struct confd_value *ptr;
> };
> ```
>
> </div>
>
> Similar to the C_BUF type, the confd library will allocate data when
> an element of type `C_LIST` is retrieved via `maapi_get_elem()` or
> `cdb_get()`. Using `confd_free_value()` (see
> [confd_lib_lib(3)](confd_lib_lib.3.md)) to free allocated data is
> especially convenient for C_LIST, as the individual list elements may
> also have allocated data (e.g. a YANG `leaf-list` of type `string`).
>
> To set a value of type C_LIST we have to populate the list array
> separately, for example:
>
> <div class="informalexample">
>
>     confd_value_t arr[5];
>     confd_value_t v;
>     confd_value_t *vp;
>     int i, size;
>
>     for (i=0; i<5; i++)
>          CONFD_SET_INT32(&arr[i], i);
>     CONFD_SET_LIST(&v, &arr[0], 5);
>
>     vp = CONFD_GET_LIST(&v);
>     size = CONFD_GET_LISTSIZE(&v);
>
> </div>

`C_XMLBEGIN`; `C_XMLEND`  
> These are only used in the "Tagged Value Array" and "Tagged Value
> Attribute Array" formats for representing XML structures, see below.
> The representation is the same as for C_XMLTAG.

`C_OBJECTREF`  
> This is used to represent the YANG built-in type
> `instance-identifier`. Values are represented as `confd_hkeypath_t`
> pointers. Data is allocated by the library as for C_BUF. When we read
> an `instance-identifier` via e.g. `cdb_get()` we can retrieve the
> pointer to the keypath as:
>
> <div class="informalexample">
>
>     confd_value_t v;
>     confd_hkeypath_t *hkp;
>
>     cdb_get(sock, &v, mypath);
>     hkp = CONFD_GET_OBJECTREF(&v);
>
> </div>
>
> To retrieve the value which is identified by the `instance-identifier`
> we can e.g. use the "%h" modifier in the format string used with the
> CDB and MAAPI API functions.

`C_OID`  
> This is used to represent the YANG `yang:object-identifier` and
> `yang:object-identifier-128` types, i.e. SNMP Object Identifiers. The
> value is a pointer to a struct:
>
> <div class="informalexample">
>
> ``` c
> struct confd_snmp_oid {
>     uint32_t oid[128];
>     int len;
> };
> ```
>
> </div>
>
> Data is allocated by the library as for C_BUF. When using values of
> this type, we set or get the `len` element, and the individual OID
> elements in the `oid` array. This example will store the string
> "0.1.2" in `buf`:
>
> <div class="informalexample">
>
>     struct confd_snmp_oid myoid;
>     confd_value_t myval;
>     char buf[BUFSIZ];
>     int i;
>
>     for (i = 0; i < 3; i++)
>         myoid.oid[i] = i;
>     myoid.len = 3;
>     CONFD_SET_OID(&myval, &myoid);
>
>     confd_pp_value(buf, sizeof(buf), &myval);
>
> </div>

`C_BINARY`  
> This type is used to represent arbitrary binary data. The YANG
> built-in type `binary`, the ConfD built-in types `tailf:hex-list` and
> `tailf:octet-list`, and the XML Schema primitive type `xs:hexBinary`
> all use this type. The value representation is the same as for C_BUF.
> Binary (C_BINARY) data received by the application from ConfD is
> always NUL terminated, but since the data may also contain NUL bytes,
> it is generally necessary to use the size given by the representation.
>
> <div class="informalexample">
>
> ``` c
> typedef struct confd_buf {
>     unsigned int size;
>     unsigned char *ptr;
> } confd_buf_t;
> ```
>
> </div>
>
> Data is also allocated by the library as for C_BUF. Example:
>
> <div class="informalexample">
>
>     confd_value_t myval, myval2;
>     unsigned char *bin;
>     int len;
>
>     bin = CONFD_GET_BINARY_PTR(&myval);
>     len = CONFD_GET_BINARY_SIZE(&myval);
>     CONFD_SET_BINARY(&myval2, bin, len);
>
> </div>

`C_IPV4PREFIX`  
> Used to represent the YANG data type `inet:ipv4-prefix`. The C
> representation is a struct as follows:
>
> <div class="informalexample">
>
> ``` c
> struct confd_ipv4_prefix {
>     struct in_addr ip;
>     uint8_t len;
> };
> ```
>
> </div>
>
> Example:
>
> <div class="informalexample">
>
>     struct confd_ipv4_prefix prefix;
>     confd_value_t myval;
>
>     prefix.ip.s_addr = inet_addr("10.0.0.0");
>     prefix.len = 8;
>     CONFD_SET_IPV4PREFIX(&myval, prefix);
>     prefix = CONFD_GET_IPV4PREFIX(&myval);
>
> </div>

`C_IPV6PREFIX`  
> Used to represent the YANG data type `inet:ipv6-prefix`. The C
> representation is a struct as follows:
>
> <div class="informalexample">
>
> ``` c
> struct confd_ipv6_prefix {
>     struct in6_addr ip6;
>     uint8_t len;
> };
> ```
>
> </div>
>
> Example:
>
> <div class="informalexample">
>
>     struct confd_ipv6_prefix prefix;
>     confd_value_t myval;
>
>     inet_pton(AF_INET6, "2001:DB8::1428:57A8", &prefix.ip6);
>     prefix.len = 125;
>     CONFD_SET_IPV6PREFIX(&myval, prefix);
>     prefix = CONFD_GET_IPV6PREFIX(&myval);
>
> </div>

`C_DECIMAL64`  
> Used to represent the YANG built-in type `decimal64`, which is a
> decimal number with 64 bits of precision. The C representation is a
> struct as follows:
>
> <div class="informalexample">
>
> ``` c
> struct confd_decimal64 {
>     int64_t value;
>     uint8_t fraction_digits;
> };
> ```
>
> </div>
>
> The `value` element is scaled with the value of the `fraction_digits`
> element, to be able to represent it as a 64-bit integer. Note that
> `fraction_digits` is a constant for any given instance of a decimal64
> type. It is provided whenever we receive a C_DECIMAL64 from ConfD.
> When we provide a C_DECIMAL64 to ConfD, we can set `fraction_digits`
> either to the correct value or to 0 - however the `value` element must
> always be correctly scaled. See also
> `confd_get_decimal64_fraction_digits()` in the
> [confd_lib_lib(3)](confd_lib_lib.3.md) man page.
>
> Example:
>
> <div class="informalexample">
>
>     struct confd_decimal64 d64;
>     confd_value_t myval;
>
>     d64.value = 314159;
>     d64.fraction_digits = 5;
>     CONFD_SET_DECIMAL64(&myval, d64);
>     d64 = CONFD_GET_DECIMAL64(&myval);
>
> </div>

`C_IDENTITYREF`  
> Used to represent the YANG built-in type `identityref`, which
> references an existing `identity`. The C representation is a struct as
> follows:
>
> <div class="informalexample">
>
> ``` c
> struct confd_identityref {
>     uint32_t ns;
>     uint32_t id;
> };
> ```
>
> </div>
>
> The `ns` and `id` elements are hash values that represent the
> namespace of the module that defines the identity, and the identity
> within that module.
>
> Example:
>
> <div class="informalexample">
>
>     struct confd_identityref idref;
>     confd_value_t myval;
>
>     idref.ns = des__ns;
>     idref.id = des_des3
>     CONFD_SET_IDENTITYREF(&myval, idref);
>     idref = CONFD_GET_IDENTITYREF(&myval);
>
> </div>

`C_DQUAD`  
> Used to represent the YANG data type `yang:dotted-quad`. The C
> representation is a struct as follows:
>
> <div class="informalexample">
>
> ``` c
> struct confd_dotted_quad {
>     unsigned char quad[4];
> };
> ```
>
> </div>
>
> Example:
>
> <div class="informalexample">
>
>     struct confd_dotted_quad dquad;
>     confd_value_t myval;
>
>     dquad.quad[0] = 1;
>     dquad.quad[1] = 2;
>     dquad.quad[2] = 3;
>     dquad.quad[3] = 4;
>     CONFD_SET_DQUAD(&myval, dquad);
>     dquad = CONFD_GET_DQUAD(&myval);
>
> </div>

`C_HEXSTR`  
> Used to represent the YANG data type `yang:hex-string`. The value
> representation is the same as for C_BUF and C_BINARY. C_HEXSTR data
> received by the application from ConfD is always NUL terminated, but
> since the data may also contain NUL bytes, it is generally necessary
> to use the size given by the representation.
>
> <div class="informalexample">
>
> ``` c
> typedef struct confd_buf {
>     unsigned int size;
>     unsigned char *ptr;
> } confd_buf_t;
> ```
>
> </div>
>
> Data is also allocated by the library as for C_BUF/C_BINARY. Example:
>
> <div class="informalexample">
>
>     confd_value_t myval, myval2;
>     unsigned char *hex;
>     int len;
>
>     hex = CONFD_GET_HEXSTR_PTR(&myval);
>     len = CONFD_GET_HEXSTR_SIZE(&myval);
>     CONFD_SET_HEXSTR(&myval2, bin, len);
>
> </div>

`C_IPV4_AND_PLEN`  
> Used to represent the ConfD built-in data type
> `tailf:ipv4-address-and-prefix-length`. The C representation is the
> same struct that is used for C_IPV4PREFIX, as follows:
>
> <div class="informalexample">
>
> ``` c
> struct confd_ipv4_prefix {
>     struct in_addr ip;
>     uint8_t len;
> };
> ```
>
> </div>
>
> Example:
>
> <div class="informalexample">
>
>     struct confd_ipv4_prefix ip_and_len;
>     confd_value_t myval;
>
>     ip_and_len.ip.s_addr = inet_addr("172.16.1.2");
>     ip_and_len.len = 16;
>     CONFD_SET_IPV4_AND_PLEN(&myval, ip_and_len);
>     ip_and_len = CONFD_GET_IPV4_AND_PLEN(&myval);
>
> </div>

`C_IPV6_AND_PLEN`  
> Used to represent the ConfD built-in data type
> `tailf:ipv6-address-and-prefix-length`. The C representation is the
> same struct that is used for C_IPV6PREFIX, as follows:
>
> <div class="informalexample">
>
> ``` c
> struct confd_ipv6_prefix {
>     struct in6_addr ip6;
>     uint8_t len;
> };
> ```
>
> </div>
>
> Example:
>
> <div class="informalexample">
>
>     struct confd_ipv6_prefix ip_and_len;
>     confd_value_t myval;
>
>     inet_pton(AF_INET6, "2001:DB8::1428:57A8", &ip_and_len.ip6);
>     ip_and_len.len = 64;
>     CONFD_SET_IPV6_AND_PLEN(&myval, ip_and_len);
>     ip_and_len = CONFD_GET_IPV6_AND_PLEN(&myval);
>
> </div>

## Xml Paths

Almost all of the callback functions the user is supposed write for the
[confd_lib_dp(3)](confd_lib_dp.3.md) library takes a parameter of type
`confd_hkeypath_t`. This type includes an array of the type
`confd_value_t` described above. The `confd_hkeypath_t` is defined as a
C struct:

<div class="informalexample">

``` c
typedef struct confd_hkeypath {
    int len;
    confd_value_t v[MAXDEPTH][MAXKEYLEN];
} confd_hkeypath_t;
```

</div>

Where:

<div class="informalexample">

    #define MAXDEPTH 20   /* max depth of data model tree
                             (max KP length + 1) */
    #define MAXKEYLEN 9   /* max number of key elems
                             (max keys + 1) */

</div>

For example, assume we have a YANG module with:

<div class="informalexample">

    container servers {
      tailf:callpoint mycp;
      list server {
        key name;
        max-elements 64;
        leaf name {
          type string;
        }
        leaf ip {
          type inet:ip-address;
        }
        leaf port {
          type inet:port-number;
        }
      }
    }

</div>

Assuming a server entry with the name "www" exists, then the path
/servers/server{www}/ip is valid and identifies the ip leaf in the
server entry whose key is "www".

The `confd_hkeypath_t` which corresponds to /servers/server{www}/ip is
received in reverse order so the following holds assuming the variable
holding a pointer to the keypath is called `hkp`.

`hkp->v[0][0]` is the last element, the "ip" element. It is a data model
node, and `CONFD_GET_XMLTAG(&hkp->v[0][0])` will evaluate to a hashed
integer (which can be found in the confdc generated .h file as a
\#define)

`hkp->v[1][0]` is the next element in the path. The key element is
called "name". This is a `string` value - thus
`strcmp("www", CONFD_GET_BUFPTR(&hkp->v[1][0])) == 0` holds.

If we had chosen to use multiple keys in our data model - for example if
we had chosen to use both the "name" and the "ip" leafs as keys:

<div class="informalexample">

    key "name ip";

</div>

The hkeypaths would be different since two keys are required. A valid
path identifying a port leaf would be /servers/server{www
10.2.3.4}/port. In this case we can get to the ip part of the key with:

<div class="informalexample">

    struct in_addr ip;
    ip = CONFD_GET_IPV4(&hkp->v[1][1])

</div>

## User-Defined Types

We can define new types in addition to those listed in the TYPEDEFS
section above. This can be useful if none of the predefined types, nor a
derivation of one of those types via standard YANG restrictions, is
suitable. Of course it is always possible to define a type as a
derivation of `string` and have the application parse the string
whenever a value needs to be processed, but with a user-defined type
ConfD will do the string \<-\> value translation just as for the
predefined types.

A user-defined type will always have a value representation that uses a
confd_value_t with one of the `enum confd_vtype` values listed above,
but the textual representation and the range(s) of allowed values are
defined by the user. The `misc/user_type` example in the collection
delivered with the ConfD release shows implementation of several
user-defined types - it will be useful to refer to it for the
description below.

The choice of `confd_vtype` to use for the value representation can be
whatever suits the actual data values best, with one exception:

<div class="note">

The C_LIST `confd_vtype` value can *not* be used for a leaf that is a
key in a YANG list. The "normal" C_LIST usage is only for representation
of leaf-lists, and a leaf-list can of course not be a key. Thus the
ConfD code is not prepared to handle this kind of "value" for a key. It
is a strong recommendation to *never* use C_LIST for a user-defined
type, since even if the type is not initially used for key leafs,
subsequent development may see a need for this, at which point it may be
cumbersome to change to a different representation.

</div>

The example uses C_INT32, C_IPV4PREFIX, and C_IPV6PREFIX for the value
representation of the respective types, but in many cases the opaque
byte array provided by C_BINARY will be most suitable - this can e.g. be
mapped to/from an arbitrary C struct.

When we want to implement a user-defined type, we need to specify the
type as `string`, and add a `tailf:typepoint` statement - see
[tailf_yang_extensions(5)](tailf_yang_extensions.5.md). We can use
`tailf:typepoint` wherever a built-in or derived type can be specified,
i.e. as sub-statement to `typedef`, `leaf`, or `leaf-list`:

<div class="informalexample">

    typedef myType {
      type string;
      tailf:typepoint my_type;
    }

    container c {
      leaf one {
        type myType;
      }
      leaf two {
        type string;
        tailf:typepoint two_type;
      }
    }

</div>

The argument to the `tailf:typepoint` statement is used to locate the
type implementation, similar to how "callpoints" are used to locate data
providers, but the actual mechanism is different, as described below.

To actually implement the type definition, we need to write three
callback functions that are defined in the `struct confd_type`:

<div class="informalexample">

``` c
struct confd_type {
    /* primitive type */
    enum confd_type_id id;

    /* namespace of the type*/
    uint32_t ns;
    /* name of the type */
    char *name;

    /* If a derived type point at the parent */
    struct confd_type *parent;

    /* not used in confspecs, but used in YANG */
    struct confd_type *defval;

    /* parse value located in str, and validate.
     * returns CONFD_TRUE if value is syntactically correct
     * and CONFD_FALSE otherwise.
     */
    int (*str_to_val)(struct confd_type *self,
                      struct confd_type_ctx *ctx,
                      const char *str, unsigned int len,
                      confd_value_t *v);

    /* print the value to str.
     * does not print more than len bytes, including trailing NUL.
     * return value as snprintf - i.e. if the value is correct for
     * the type, it returns the length of the string form regardless
     * of the len limit - otherwise it returns a negative number.
     * thus, the NUL terminated output has been completely written
     * if and only if the returned value is nonnegative and less
     * than len.
     * If strp is non-NULL and the string form is constant (i.e.
     * C_ENUM_VALUE), a pointer to the string is stored in *strp.
     */
    int (*val_to_str)(struct confd_type *self,
                      struct confd_type_ctx *ctx,
                      const confd_value_t *v,
                      char *str, unsigned int len,
                      const char **strp);

    /* returns CONFD_TRUE if value is correct, otherwise CONFD_FALSE
     */
    int (*validate)(struct confd_type *self,
                    struct confd_type_ctx *ctx,
                    const confd_value_t *v);

    /* data optionally used by the callbacks */
    void *opaque;
};
```

</div>

I.e. `str_to_val()` and `val_to_str()` are responsible for the string to
value and value to string translations, respectively, and `validate()`
may be called to verify that a given value adheres to any restrictions
on the values allowed for the type. The `errstr` element in the
`struct confd_type_ctx *ctx` passed to these functions can be used to
return an error message when the function fails - in this case `errstr`
must be set to the address of a dynamically allocated string. The other
elements in `ctx` are currently unused.

Including user-defined types in a YANG `union` may need some special
consideration. Per the YANG specification, the string form of a value is
matched against the union member types in the order they are specified
until a match is found, and this procedure determines the type of the
value. A corresponding procedure is used by ConfD when the value needs
to be converted to a string, but this conversion does not include any
evaluation of restrictions etc - the values are assumed to be correct
for their type. Thus the `val_to_str()` function for the member types
are tried in order until one succeeds, and the resulting string is used.
This means that a) `val_to_str()` must verify that the value is of the
correct type, i.e. that it has the expected `confd_vtype`, and b) if the
value representation is the same for multiple member types, there is no
guarantee that the same member type as for the string to value
conversion is chosen.

The `opaque` element in the `struct confd_type` can be used for any
auxiliary (static) data needed by the functions (on invocation they can
reference it as self-\>opaque). The `parent` and `defval` elements are
not used in this context, and should be NULL.

<div class="note">

The `str_to_val()` function *must* allocate space (using e.g. malloc(3))
for the actual data value for those confd_value_t types that are listed
as having allocated data above, i.e. C_BUF, C_QNAME, C_LIST,
C_OBJECTREF, C_OID, C_BINARY, and C_HEXSTR.

</div>

We make the implementation available to ConfD by creating one or more
shared objects (.so files) containing the above callback functions. Each
shared object may implement one or more types, and at startup the ConfD
daemon will search the directories specified for /confdConfig/loadPath
in `confd.conf` for files with a name that match the pattern
"confd_type\*.so" and load them.

Each shared object must also implement an "init" callback:

    int confd_type_cb_init(
    struct confd_type_cbs **cbs);

When the object has been loaded, ConfD will call this function. It must
return a pointer to an array of type callback structures via the `cbs`
argument, and the number of elements in the array as return value. The
`struct confd_type_cbs` is defined as:

<div class="informalexample">

``` c
struct confd_type_cbs {
    char *typepoint;
    struct confd_type *type;
};
```

</div>

These structures are then used by ConfD to locate the implementation of
a given type, by searching for a `typepoint` string that matches the
`tailf:typepoint` argument in the YANG data model.

<div class="note">

Since our callbacks are executed directly by the ConfD daemon, it is
critically important that they do not have a negative impact on the
daemon. No other processing can be done by ConfD while the callbacks are
executed, and e.g. a NULL pointer dereference in one of the callbacks
will cause ConfD to crash. Thus they should be simple, purely
algorithmic functions, never referencing any external resources.

</div>

<div class="note">

When user-defined types are present, the ConfD daemon also needs to load
the libconfd.so shared library, otherwise used only by applications.
This means that either this library must be in one of the system
directories that are searched by the OS runtime loader (typically /lib
and /usr/lib), or its location must be given by setting the
LD_LIBRARY_PATH environment variable before starting ConfD, or the
default location \$CONFD_DIR/lib is used, where \$CONFD_DIR is the
installation directory of ConfD.

</div>

The above is enough for ConfD to use the types that we have defined, but
the libconfd library can also do local string\<-\>value translation if
we have loaded the schema information, as described in the [USING SCHEMA
INFORMATION](confd_types.3.md#using_schema_information) section below.
For this to work for user-defined types, we must register the type
definitions with the library, using one of these functions:

    int confd_register_ns_type(
    uint32_t nshash, const char *name, struct confd_type *type);

Here we must pass the hash value for the namespace where the type is
defined as `nshash`, and the name of the type from a `typedef` statement
(i.e. *not* the typepoint name if they are different) as `name`. Thus we
can not use this function to register a user-defined type that is
specified "inline" in a `leaf` or `leaf-list` statement, since we don't
have a name for the type.

    int confd_register_node_type(
    struct confd_cs_node *node, struct confd_type *type);

This function takes a pointer to a schema node (see the section [USING
SCHEMA INFORMATION](confd_types.3.md#using_schema_information)) that
uses the type instead of namespace and type name. It is necessary to use
this for registration of user-defined types that are specified "inline",
but it can also be used for user-defined types specified via `typedef`.
In the latter case it will be equivalent to calling
`confd_register_ns_type()` for the typedef, i.e. a single registration
will apply to all nodes using the typedef.

The functions can only be called *after* `confd_load_schemas()` or
`maapi_load_schemas()` (see below) has been called, and if
`confd_load_schemas()`/ `maapi_load_schemas()` is called again, the
registration must be re-done. The `misc/user_type` example shows a way
to use the exact same code for the shared object and for this
registration.

Schema upgrades when the data is stored in CDB requires special
consideration for user-defined types. Normally CDB can handle any type
changes automatically, and this is true also when changing
to/from/between user-defined types, provided that the following
requirements are fulfilled:

1.  A given typepoint name always refers to the exact same
    implementation - i.e. same value representation, same range
    restrictions, etc.

2.  Shared objects providing implementations for all the typepoint ids
    used in the new *and* the old schema are made available to ConfD.

I.e. if we change the implementation of a type, we also change the
typepoint name, and keep the old implementation around. If requirement 1
isn't fulfilled, we can end up with the case of e.g. a changed value
representation between schema versions even though the types are
indistinguishable for CDB. This can still be handled by using MAAPI to
modify CDB during the upgrade as described in the User Guide, but if
that is not done, CDB will just carry the old values over, which in
effect results in a corrupt database.

## Using Schema Information

Schema information from the data model can be loaded from the ConfD
daemon at runtime using the `maapi_load_schemas()` function, see the
[confd_lib_maapi(3)](confd_lib_maapi.3.md) manual page. Information
for all namespaces loaded into ConfD is then made available. In many
cases it may be more convenient to use the `confd_load_schemas()`
utility function. For details about this function and those discussed
below, see [confd_lib_lib(3)](confd_lib_lib.3.md). After loading the
data, we can call `confd_get_nslist()` to find which namespaces are
known to the library as a result.

Note that all pointers returned (directly or indirectly) by the
functions discussed here reference dynamically allocated memory
maintained by the library - they will become invalid if
`confd_load_schemas()` or `maapi_load_schemas()` is subsequently called
again.

The [confdc(1)](ncsc.1.md) compiler can also optionally generate a C
header file that has \#define symbols for the integer values
corresponding to data model nodes and enumerations.

When the schema information has been made available to the library, we
can format an arbitrary instance of a `confd_value_t` value using
`confd_pp_value()` or `confd_ns_pp_value()`, or an arbitrary hkeypath
using `confd_pp_kpath()` or `confd_xpath_pp_kpath()`. We can also get a
pointer to the string representing a data model node using
`confd_hash2str()`.

Furthermore a tree representation of the data model is available, which
contains a `struct confd_cs_node` for every node in the data model.
There is one tree for each namespace that has toplevel elements.

<div class="informalexample">

    /* flag bits in confd_cs_node_info */
    #define CS_NODE_IS_LIST             (1 << 0)
    #define CS_NODE_IS_WRITE            (1 << 1)
    #define CS_NODE_IS_CDB              (1 << 2)
    #define CS_NODE_IS_ACTION           (1 << 3)
    #define CS_NODE_IS_PARAM            (1 << 4)
    #define CS_NODE_IS_RESULT           (1 << 5)
    #define CS_NODE_IS_NOTIF            (1 << 6)
    #define CS_NODE_IS_CASE             (1 << 7)
    #define CS_NODE_IS_CONTAINER        (1 << 8)
    #define CS_NODE_HAS_WHEN            (1 << 9)
    #define CS_NODE_HAS_DISPLAY_WHEN    (1 << 10)
    #define CS_NODE_HAS_META_DATA       (1 << 11)
    #define CS_NODE_IS_WRITE_ALL        (1 << 12)
    #define CS_NODE_IS_LEAF_LIST        (1 << 13)
    #define CS_NODE_IS_LEAFREF          (1 << 14)
    #define CS_NODE_HAS_MOUNT_POINT     (1 << 15)
    #define CS_NODE_IS_STRING_AS_BINARY (1 << 16)
    #define CS_NODE_IS_DYN CS_NODE_IS_LIST /* backwards compat */

    /* cmp values in confd_cs_node_info */
    #define CS_NODE_CMP_NORMAL        0
    #define CS_NODE_CMP_SNMP          1
    #define CS_NODE_CMP_SNMP_IMPLIED  2
    #define CS_NODE_CMP_USER          3
    #define CS_NODE_CMP_UNSORTED      4

    typedef struct xml_tag mount_id_t;

    struct confd_cs_node_info {
        uint32_t *keys;
        int minOccurs;
        int maxOccurs;   /* -1 if unbounded */
        enum confd_vtype shallow_type;
        struct confd_type *type;
        confd_value_t *defval;
        struct confd_cs_choice *choices;
        int flags;
        uint8_t cmp;
        struct confd_cs_meta_data *meta_data;
        /* not hiding under CONFD_C_PRODUCT_CONFD/CONFD_C_PRODUCT_NSO to avoid
           issues in mixed compilation enviroments where libconfd.a is used for
           both ConfD and NSO */
        mount_id_t mount_id;
    };

    struct confd_cs_meta_data {
        char* key;
        char* value;
    };

    struct confd_cs_node {
        uint32_t tag;
        uint32_t ns;
        struct confd_cs_node_info info;
        struct confd_cs_node *parent;
        struct confd_cs_node *children;
        struct confd_cs_node *next;
        void *opaque;   /* private user data */
    };

    struct confd_cs_choice {
        uint32_t tag;
        uint32_t ns;
        int minOccurs;
        struct confd_cs_case *default_case;
        struct confd_cs_node *parent;         /* NULL if parent is case */
        struct confd_cs_case *cases;
        struct confd_cs_choice *next;
        struct confd_cs_case *case_parent;    /* NULL if parent is node */
    };

    struct confd_cs_case {
        uint32_t tag;
        uint32_t ns;
        struct confd_cs_node *first;
        struct confd_cs_node *last;
        struct confd_cs_choice *parent;
        struct confd_cs_case *next;
        struct confd_cs_choice *choices;
    };

</div>

Each `confd_cs_node` is linked to its related nodes: `parent` is a
pointer to the parent node, `next` is a pointer to the next sibling
node, and `children` is a pointer to the first child node - for each of
these, a NULL pointer has the obvious meaning.

Each `confd_cs_node` also contains an information structure: For a list
node, the `keys` field is a zero-terminated array of integers - these
are the `tag` values for the children nodes that are key elements. This
makes it possible to find the name of a key element in a keypath. If the
`confd_cs_node` is not a list node, the `keys` field is NULL. The
`shallow_type` field gives the "primitive" type for the element, i.e.
the `enum confd_vtype` value that is used in the `confd_value_t`
representation.

Typed leaf nodes also carry a complete type definition via the `type`
pointer, which can be used with the `conf_str2val()` and
`confd_val2str()` functions, as well as the leaf's default value (if
any) via the `defval` pointer.

If the YANG `choice` statement is used in the data model, additional
structures are created by the schema loading. For list and container
nodes that have `choice` statements, the `choices` element in
`confd_cs_node_info` is a pointer to a linked list of `confd_cs_choice`
structures representing the choices. Each `confd_cs_choice` has a
pointer to the parent node and a `cases` pointer to a linked list of
`confd_cs_case` structures representing the cases for that choice.
Finally, each `confd_cs_case` structure has pointers to the parent
`confd_cs_choice` structure, and to the `confd_cs_node` structures
representing the first and last element in the case. Those
`confd_cs_node` structures, i.e. the "toplevel" elements of a case, have
the CS_NODE_IS_CASE flag set. Note that it is possible for a case to be
"empty", i.e. there are no elements in the case - then the `first` and
`last` pointers in the `confd_cs_case` structure are NULL.

For a list node, the sort order is indicated by the `cmp` element in
`confd_cs_node_info`. The value CS_NODE_CMP_NORMAL means an ordinary,
system ordered, list. CS_NODE_CMP_SNMP is system ordered, but ordered
according to SNMP lexicographical order, and CS_NODE_CMP_SNMP_IMPLIED is
an SNMP lexicographical order where the last key has an IMPLIED keyword.
CS_NODE_CMP_UNSORTED is system ordered, but is not sorted. The value
CS_NODE_CMP_USER denotes an "ordered-by user" list.

If the `tailf:meta-data` extension is used for a node, the `meta_data`
element points to an array of `struct confd_cs_meta_data`, otherwise it
is NULL. In the array, the `key` element is the argument of
`tailf:meta-data`, and the `value` element is the argument of the
`tailf:meta-value` substatement, if any - otherwise it is NULL. The end
of the array is indicated by a struct where the `key` element is NULL.

Action and notification specifications are included in the tree in the
same way as the config/data elements - they are indicated by the
CS_NODE_IS_ACTION flag being set on the action node, and the
CS_NODE_IS_NOTIF flag being set on the notification node, respectively.
Furthermore the nodes corresponding to the sub-statements of the
action's `input` statement have the CS_NODE_IS_PARAM flag set, and those
corresponding to the sub-statements of the action's `output` statement
have the CS_NODE_IS_RESULT flag set. Note that the `input` and `output`
statements do not have corresponding nodes in the tree.

The `confd_find_cs_root()` function returns the root of the tree for a
given namespace, and the `confd_find_cs_node()`,
`confd_find_cs_node_child()`, and `confd_cs_node_cd()` functions are
useful for navigating the tree. Assume that we have the following data
model:

<div class="informalexample">

    container servers {
      list server {
        key name;
        max-elements 64;
        leaf name {
          type string;
        }
        leaf ip {
          type inet:ip-address;
        }
        leaf port {
          type inet:port-number;
        }
      }
    }

</div>

Then, given the keypath /servers/server{www} in `confd_hkeypath_t` form,
a call to `confd_find_cs_node()` would return a `struct confd_cs_node`,
i.e. a pointer into the tree, as in:

<div class="informalexample">

    struct confd_cs_node *csp;
    char *name;
    csp = confd_find_cs_node(mykeypath, mykeypath->len);
    name = confd_hash2str(csp->info.keys[0])

</div>

and the C variable `name` will have the value `"name"`. These functions
make it possible to format keypaths in various ways.

If we have a keypath which identifies a node below the one we are
interested in, such as /servers/server{www}/ip, we can use the `len`
parameter as in `confd_find_cs_node(kp, 3)` where `3` is the length of
the keypath we wish to consider.

The equivalent of the above `confd_find_cs_node()` example, but using a
string keypath, could be written as:

<div class="informalexample">

    csp = confd_cs_node_cd(confd_find_cs_root(mynamespace),
                           "/servers/server{www}");

</div>

The `type` field in the `struct confd_cs_node_info` can be used for data
model aware string \<-\> value translations. E.g. assuming that we have
a `confd_hkeypath_t *kp` representing the element
/servers/server{www}/ip, we can do the following:

<div class="informalexample">

    confd_value_t v;
    csp = confd_find_cs_node(kp, kp->len);
    confd_str2val(csp->info.type, "10.0.0.1", &v);

</div>

The `confd_value_t v` will then be filled in with the corresponding
C_IPV4 value. This technique is generally necessary for translating
C_ENUM_VALUE values to the corresponding strings (or vice versa), since
there isn't a type-independent mapping. But `confd_val2str()` (or
`confd_str2val()`) can always do the translation, since it is given the
full type information. E.g. this will store the string "nonVolatile" in
`buf`:

<div class="informalexample">

    confd_value_t v;
    char buf[64];

    CONFD_SET_ENUM_VALUE(&v, 3);
    root = confd_find_cs_root(SNMP_COMMUNITY_MIB__ns);
    csp = confd_cs_node_cd(root, "/SNMP-COMMUNITY-MIB/snmpCommunityTable/"
                           "snmpCommunityEntry/snmpCommunityStorageType");
    confd_val2str(csp->info.type, &v, buf, sizeof(buf));

</div>

The type information can also be found by using the
`confd_find_ns_type()` function to look up the type name as a string in
the namespace where it is defined - i.e. we could alternatively have
achieved the same result with:

<div class="informalexample">

    CONFD_SET_ENUM_VALUE(&v, 3);
    type = confd_find_ns_type(SNMPv2_TC__ns, "StorageType");
    confd_val2str(type, &v, buf, sizeof(buf));

</div>

If we give `0` for the `nshash` argument to `confd_find_ns_type()`, the
type name will be looked up among the ConfD built-in types (i.e. the
YANG built-in types, the types defined in the YANG "tailf-common"
module, and the types defined in the pre-defined "confd" and/or "xs"
namespaces) - e.g. the type information for /servers/server{www}/name
could be found with `confd_find_ns_type(0, "string")`.

## Xml Structures

Three different methods are used to represent a subtree of data nodes.
["Value Array"](confd_types.3.md#xml_structures.array) describes a
format that is simpler but has some limitations, while ["Tagged Value
Array"](confd_types.3.md#xml_structures.tagged_array) and ["Tagged
Value Attribute
Array"](confd_types.3.md#xml_structures.tagged_attr_array) describe
formats that are more complex but can represent an arbitrary subtree.

### Value Array

The simpler format is an array of `confd_value_t` elements corresponding
to the complete contents of a list entry or container. The content of
sub-list entries cannot be represented. The array is populated through a
"depth first" traversal of the data tree as follows:

1.  Optional leafs or `presence` containers that do not exist use a
    single array element, with type C_NOEXISTS (value ignored).

2.  List nodes use a single array element, with type C_NOEXISTS (value
    ignored), regardless of the actual number of entries or their
    contents.

3.  Leaf-list nodes use a single array element, with type C_LIST and the
    leaf-list elements as values.

4.  Leafs with a type other than `empty` use an array element with their
    type and value as usual. If type `empty` is placed in a `union`,
    then an array element is still used.

5.  Leafs of type `empty` use an array element with type C_XMLTAG, and
    `tag` and `ns` set according to the leaf name. Unless type `empty`
    is placed in a `union` as per above.

6.  Containers use one array element with type C_XMLTAG, and `tag` and
    `ns` set according to the element name, followed by array elements
    for the sub-nodes according to this list.

Note that the list or container node corresponding to the complete array
is not included in the array, and that there is no array element for the
"end" of a container.

As an example, the array corresponding to the /servers/server{www} list
entry above could be populated as:

<div class="informalexample">

    confd_value_t v[3];
    struct in_addr ip;

    CONFD_SET_STR(&v[0], "www");
    ip.s_addr = inet_addr("192.168.1.2");
    CONFD_SET_IPV4(&v[1], ip);
    CONFD_SET_UINT16(&v[2], 80);

</div>

### Tagged Value Array

This format uses an array of `confd_tag_value_t` elements. This is a
structure defined as:

<div class="informalexample">

``` c
typedef struct confd_tag_value {
    struct xml_tag tag;
    confd_value_t v;
} confd_tag_value_t;
```

</div>

I.e. each value element is associated with the `struct xml_tag` that
identifies the node in the data model. The `ns` element of the
`struct xml_tag` can normally be set to 0, with the meaning "current
namespace". The array is populated, normally through a "depth first"
traversal of the data tree, as follows:

1.  Optional leafs or `presence` containers that do not exist are
    omitted entirely from the array.

2.  List and container nodes use one array element where the value has
    type C_XMLBEGIN, and `tag` and `ns` set according to the node name,
    followed by array elements for the sub-nodes according to this list,
    followed by one array element where the value has type C_XMLEND, and
    `tag` and `ns` set according to the node name.

3.  Leaf-list nodes use a single array element, with type C_LIST and the
    leaf-list elements as values.

4.  Leafs with a type other than `empty` use an array element with their
    type and value as usual. If type `empty` is placed in a `union`,
    then an array element is still used.

5.  Leafs of type `empty` use an array element with type C_XMLTAG, and
    `tag` and `ns` set according to the leaf name. Unless type `empty`
    is placed in a `union` as per above.

Note that the list or container node corresponding to the complete array
is not included in the array. In some usages, non-optional nodes may
also be omitted from the array - refer to the relevant API documentation
to see whether this is allowed and the semantics of doing so.

A set of CONFD_SET_TAG_XXX() macros corresponding to the CONFD_SET_XXX()
macros described above are provided - these set the `ns` element to 0
and the `tag` element to their second argument. The array corresponding
to the /servers/server{www} list entry above could be populated as:

<div class="informalexample">

    confd_tag_value_t tv[3];
    struct in_addr ip;

    CONFD_SET_TAG_STR(&tv[0], servers_name, "www");
    ip.s_addr = inet_addr("192.168.1.2");
    CONFD_SET_TAG_IPV4(&tv[1], servers_ip, ip);
    CONFD_SET_TAG_UINT16(&tv[2], servers_port, 80);

</div>

There are also macros to access the components of the
`confd_tag_value_t` elements:

<div class="informalexample">

    confd_tag_value_t tv;
    uint16_t port;

    if (CONFD_GET_TAG_TAG(&tv) == servers_port)
        port = CONFD_GET_UINT16(CONFD_GET_TAG_VALUE(&tv));

</div>

### Tagged Value Attribute Array

This format uses an array of `confd_tag_value_attr_t` elements. This is
a structure defined as:

<div class="informalexample">

``` c
typedef struct confd_tag_value_attr {
    struct xml_tag tag;
    confd_value_t v;
    confd_attr_value_t *attrs;
    int num_attrs;
} confd_tag_value_attr_t;
```

</div>

I.e. the difference from Tagged Value Array is that not only the value
element is associated with the `struct xml_tag` but also the attribute
element. The `attrs` element should point to an array with `num_attrs`
elements of `confd_attr_value_t` - for a node without attributes, these
should be given as NULL and 0, respectively.

Attributes for a container are given for the C_XMLBEGIN array element
that indicates the start of the container, and attributes for a list
entry are given for the array element that represents the first key leaf
for the list (key leafs do not have attributes).

A set of CONFD_SET_TAG_ATTR_XXX() macros corresponding to the
CONFD_SET_TAG_XXX() macros described above are provided - these set the
`attrs` element to their forth argument and the `num_attrs` element to
their fifth argument. The array corresponding to the
/servers/server{www} list entry above could be populated as:

<div class="informalexample">

    confd_tag_value_attr_t tva[3];
    struct in_addr ip;
    confd_attr_value_t origin;

    origin.attr = CONFD_ATTR_ORIGIN;
    struct confd_identityref idref = {.ns = or__ns, .id = or_system};
    CONFD_SET_IDENTITYREF(&origin.v, idref);

    CONFD_SET_TAG_ATTR_STR(&tva[0], servers_name, "www", NULL, 0);
    ip.s_addr = inet_addr("192.168.1.2");
    CONFD_SET_TAG_ATTR_IPV4(&tva[1], servers_ip, ip, &origin, 1);
    CONFD_SET_TAG_ATTR_UINT16(&tva[2], servers_port, 80, &origin, 1);
            

</div>

## Data Model Types

This section describes the types that can be used in YANG data modeling,
and their C representation. Also listed is the corresponding SMIv2 type,
which is used when a data model is translated into a MIB. In several
cases, the data model type cannot easily be translated into a native
SMIv2 type. In those cases, the type `OCTET STRING` is used in the
translation. The SNMP agent in ConfD will in those cases send the string
representation of the value over SNMP. For example, the `xs:float` value
`3.14` is sent as the string "3.14".

These subsections describe the following sets of types, which can be
used with YANG data modeling:

- [YANG built-in
  types](confd_types.3.md#data_model.yang_builtin_types)

- [The ietf-yang-types YANG
  module](confd_types.3.md#data_model.ietf_yang_types)

- [The ietf-inet-types YANG
  module](confd_types.3.md#data_model.ietf_inet_types)

- [The tailf-common YANG
  module](confd_types.3.md#data_model.tailf_common)

- [The tailf-xsd-types YANG
  module](confd_types.3.md#data_model.tailf_xsd_types)

### YANG built-in types

These types are built-in to the YANG language, and also built-in to
ConfD.

`int8`  
> A signed 8-bit integer.
>
> - `value.type` = C_INT8
>
> - union element = `i8`
>
> - C type = `int8_t`
>
> - SMIv2 type = `Integer32 (-128 .. 127)`

`int16`  
> A signed 16-bit integer.
>
> - `value.type` = C_INT16
>
> - union element = `i16`
>
> - C type = `int16_t`
>
> - SMIv2 type = `Integer32 (-32768 .. 32767)`

`int32`  
> A signed 32-bit integer.
>
> - `value.type` = C_INT32
>
> - union element = `i32`
>
> - C type = `int32_t`
>
> - SMIv2 type = `Integer32`

`int64`  
> A signed 64-bit integer.
>
> - `value.type` = C_INT64
>
> - union element = `i64`
>
> - C type = `int64_t`
>
> - SMIv2 type = `OCTET STRING`

`uint8`  
> An unsigned 8-bit integer.
>
> - `value.type` = C_UINT8
>
> - union element = `u8`
>
> - C type = `uint8_t`
>
> - SMIv2 type = `Unsigned32 (0 .. 255)`

`uint16`  
> An unsigned 16-bit integer.
>
> - `value.type` = C_UINT16
>
> - union element = `u16`
>
> - C type = `uint16_t`
>
> - SMIv2 type = `Unsigned32 (0 .. 65535)`

`uint32`  
> An unsigned 32-bit integer.
>
> - `value.type` = C_UINT32
>
> - union element = `u32`
>
> - C type = `uint32_t`
>
> - SMIv2 type = `Unsigned32`

`uint64`  
> An unsigned 64-bit integer.
>
> - `value.type` = C_UINT64
>
> - union element = `u64`
>
> - C type = `uint64_t`
>
> - SMIv2 type = `OCTET STRING`

`decimal64`  
> A decimal number with 64 bits of precision. The C representation uses
> a struct with a 64-bit signed integer for the scaled value, and an
> unsigned 8-bit integer in the range 1..18 for the number of fraction
> digits specified by the `fraction-digits` sub-statement.
>
> - `value.type` = C_DECIMAL64
>
> - union element = `d64`
>
> - C type = `struct confd_decimal64`
>
> - SMIv2 type = `OCTET STRING`

`string`  
> The `string` type is represented as a struct `confd_buf_t` when
> *received* from ConfD in the C code. I.e. it is NUL-terminated and
> also has a size given.
>
> However, when the C code wants to produce a value of the `string` type
> it is possible to use a `confd_value_t` with the value type C_BUF or
> C_STR (which requires a NUL-terminated string)
>
> - `value.type` = C_BUF
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

`boolean`  
> The boolean values "true" and "false".
>
> - `value.type` = C_BOOL
>
> - union element = `boolean`
>
> - C type = `int`
>
> - SMIv2 type = `TruthValue`

`enumeration`  
> Enumerated strings with associated numeric values. The C
> representation uses the numeric values.
>
> - `value.type` = C_ENUM_VALUE
>
> - union element = `enumvalue`
>
> - C type = `int32_t`
>
> - SMIv2 type = `INTEGER`

`bits`  
> A set of bits or flags. Depending on the highest argument given to a
> `position` sub-statement, the C representation uses either C_BIT32,
> C_BIT64, or C_BITBIG.
>
> - `value.type` = C_BIT32, C_BIT64, or C_BITBIG
>
> - union element = `b32`, `b64`, or `buf`
>
> - C type = `uint32_t`, `uint64_t`, or `confd_buf_t`
>
> - SMIv2 type = `Unsigned32` or `OCTET STRING`

`binary`  
> Any binary data.
>
> - `value.type` = C_BINARY
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

`identityref`  
> A reference to an abstract identity.
>
> - `value.type` = C_IDENTITYREF
>
> - union element = `idref`
>
> - C type = `struct confd_identityref`
>
> - SMIv2 type = `OCTET STRING`

`union`  
> The `union` type has no special `confd_value_t` representation -
> elements are represented as one of the member types according to the
> current value instantiation. This means that for unions that comprise
> different "primitive" types, applications must check the `type`
> element to determine the type, and the type safe alternatives to the
> `cdb_get()` and `maapi_get_elem()` functions can not be used.
>
> Note that the YANG specification stipulates that when a value of type
> `union` is validated, the *first* matching member type should be
> chosen. Consider this YANG fragment:
>
> <div class="informalexample">
>
>     leaf uni {
>       type union {
>         type int32;
>         type int64;
>       }
>     }
>
> </div>
>
> If we set the leaf to the value `2`, it should thus be of type
> `int32`, not type `int64`. This is enforced when ConfD converts a
> string to an internal value, but not when setting values "directly"
> via e.g. `maapi_set_elem()` or `cdb_set_elem()`. It is thus possible
> to set the leaf to a `C_INT64` with the value `2`, but this is
> formally an invalid value.
>
> Applications setting values of type `union` must thus take care to
> choose the member type correctly, or alternatively provide the value
> as a string via one of the functions `maapi_set_elem2()`,
> `cdb_set_elem2()`, or `confd_str2val()`. These functions will always
> turn the string "2" into a `C_INT32` with the above definition.
>
> The SMIv2 type is an `OCTET STRING`.

`instance-identifier`  
> The instance-identifier built-in type is used to uniquely identify a
> particular instance node in the data tree. The syntax for an
> instance-identifier is a subset of the XPath abbreviated syntax.
>
> - `value.type` = C_OBJECTREF
>
> - union element = `hkp`
>
> - C type = `confd_hkeypath_t`
>
> - SMIv2 type = `OCTET STRING`

#### The `leaf-list` statement

The values of a YANG `leaf-list` node is represented as an element with
a list of values of the type given by the `type` sub-statement.

- `value.type` = C_LIST

- union element = `list`

- C type = `struct confd_list`

- SMIv2 type = `OCTET STRING`

### The ietf-yang-types YANG module

This module contains a collection of generally useful derived YANG data
types. They are defined in the
<urn:ietf:params:xml:ns:yang:ietf-yang-types> namespace.

`yang:counter32, yang:zero-based-counter32`  
> 32-bit counters, corresponding to the Counter32 type and the
> ZeroBasedCounter32 textual convention of the SMIv2.
>
> - `value.type` = C_UINT32
>
> - union element = `u32`
>
> - C type = `uint32_t`
>
> - SMIv2 type = `Counter32`

`yang:counter64, yang:zero-based-counter64`  
> 64-bit counters, corresponding to the Counter64 type and the
> ZeroBasedCounter64 textual convention of the SMIv2.
>
> - `value.type` = C_UINT64
>
> - union element = `u64`
>
> - C type = `uint64_t`
>
> - SMIv2 type = `Counter64`

`yang:gauge32`  
> 32-bit gauge value, corresponding to the Gauge32 type of the SMIv2.
>
> - `value.type` = C_UINT32
>
> - union element = `u32`
>
> - C type = `uint32_t`
>
> - SMIv2 type = `Counter32`

`yang:gauge64`  
> 64-bit gauge value, corresponding to the CounterBasedGauge64 SMIv2
> textual convention.
>
> - `value.type` = C_UINT64
>
> - union element = `u64`
>
> - C type = `uint64_t`
>
> - SMIv2 type = `Counter64`

`yang:object-identifier, yang:object-identifier-128`  
> An SNMP OBJECT IDENTIFIER (OID). This is a sequence of integers which
> identifies an object instance for example "1.3.6.1.4.1.24961.1".
>
> <div class="note">
>
> The `tailf:value-length` restriction is measured in integer elements
> for `object-identifier` and `object-identifier-128`.
>
> </div>
>
> - `value.type` = C_OID
>
> - union element = `oidp`
>
> - C type = `confd_snmp_oid`
>
> - SMIv2 type = `OBJECT IDENTIFIER`

`yang:yang-identifier`  
> A YANG identifier string as defined by the 'identifier' rule in
> Section 12 of RFC 6020.
>
> - `value.type` = C_BUF
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

`yang:date-and-time`  
> The date-and-time type is a profile of the ISO 8601 standard for
> representation of dates and times using the Gregorian calendar.
>
> - `value.type` = C_DATETIME
>
> - union element = `datetime`
>
> - C type = `struct confd_datetime`
>
> - SMIv2 type = `DateAndTime`

`yang:timeticks, yang:timestamp`  
> Time ticks and time stamps, measured in hundredths of seconds.
> Corresponding to the TimeTicks type and the TimeStamp textual
> convention of the SMIv2.
>
> - `value.type` = C_UINT32
>
> - union element = `u32`
>
> - C type = `uint32_t`
>
> - SMIv2 type = `Counter32`

`yang:phys-address`  
> Represents media- or physical-level addresses represented as a
> sequence octets, each octet represented by two hexadecimal digits.
> Octets are separated by colons.
>
> <div class="note">
>
> The `tailf:value-length` restriction is measured in number of octets
> for `phys-address`.
>
> </div>
>
> - `value.type` = C_BINARY
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

`yang:mac-address`  
> The mac-address type represents an IEEE 802 MAC address.
>
> The length of the ConfD C_BINARY representation is always 6.
>
> - `value.type` = C_BINARY
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

`yang:xpath1.0`  
> This type represents an XPATH 1.0 expression.
>
> - `value.type` = C_BUF
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

`yang:hex-string`  
> A hexadecimal string with octets represented as hex digits separated
> by colons.
>
> <div class="note">
>
> The `tailf:value-length` restriction is measured in number of octets
> for `hex-string`.
>
> </div>
>
> - `value.type` = C_HEXSTR
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

`yang:uuid`  
> A Universally Unique Identifier in the string representation defined
> in RFC 4122.
>
> - `value.type` = C_BUF
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

`yang:dotted-quad`  
> An unsigned 32-bit number expressed in the dotted-quad notation.
>
> - `value.type` = C_DQUAD
>
> - union element = `dquad`
>
> - C type = `struct confd_dotted_quad`
>
> - SMIv2 type = `OCTET STRING`

### The ietf-inet-types YANG module

This module contains a collection of generally useful derived YANG data
types for Internet addresses and related things. They are defined in the
<urn:ietf:params:xml:ns:yang:inet-types> namespace.

`inet:ip-version`  
> This value represents the version of the IP protocol.
>
> - `value.type` = C_ENUM_VALUE
>
> - union element = `enumvalue`
>
> - C type = `int32_t`
>
> - SMIv2 type = `INTEGER`

`inet:dscp`  
> The dscp type represents a Differentiated Services Code-Point.
>
> - `value.type` = C_UINT8
>
> - union element = `u8`
>
> - C type = `uint8_t`
>
> - SMIv2 type = `Unsigned32 (0 .. 255)`

`inet:ipv6-flow-label`  
> The flow-label type represents flow identifier or Flow Label in an
> IPv6 packet header.
>
> - `value.type` = C_UINT32
>
> - union element = `u32`
>
> - C type = `uint32_t`
>
> - SMIv2 type = `Unsigned32`

`inet:port-number`  
> The port-number type represents a 16-bit port number of an Internet
> transport layer protocol such as UDP, TCP, DCCP or SCTP.
>
> The value space and representation is identical to the built-in
> `uint16` type.

`inet:as-number`  
> The as-number type represents autonomous system numbers which identify
> an Autonomous System (AS).
>
> The value space and representation is identical to the built-in
> `uint32` type.

`inet:ip-address`  
> The ip-address type represents an IP address and is IP version
> neutral. The format of the textual representations implies the IP
> version.
>
> This is a `union` of the `inet:ipv4-address` and `inet:ipv6-address`
> types defined below. The representation is thus identical to the
> representation for one of these types.
>
> The SMIv2 type is an `OCTET STRING (SIZE (4|16))`.

`inet:ipv4-address`  
> The ipv4-address type represents an IPv4 address in dotted-quad
> notation.
>
> The use of a zone index is not supported by ConfD.
>
> - `value.type` = C_IPV4
>
> - union element = `ip`
>
> - C type = `struct in_addr`
>
> - SMIv2 type = `IpAddress`

`inet:ipv6-address`  
> The ipv6-address type represents an IPv6 address in full, mixed,
> shortened and shortened mixed notation.
>
> The use of a zone index is not supported by ConfD.
>
> - `value.type` = C_IPV6
>
> - union element = `ip6`
>
> - C type = `struct in6_addr`
>
> - SMIv2 type = `IPV6-MIB:Ipv6Address`

`inet:ip-prefix`  
> The ip-prefix type represents an IP prefix and is IP version neutral.
> The format of the textual representations implies the IP version.
>
> This is a `union` of the `inet:ipv4-prefix` and `inet:ipv6-prefix`
> types defined below. The representation is thus identical to the
> representation for one of these types.
>
> The SMIv2 type is an `OCTET STRING (SIZE (5|17))`.

`inet:ipv4-prefix`  
> The ipv4-prefix type represents an IPv4 address prefix. The prefix
> length is given by the number following the slash character and must
> be less than or equal to 32.
>
> A prefix length value of n corresponds to an IP address mask which has
> n contiguous 1-bits from the most significant bit (MSB) and all other
> bits set to 0.
>
> The IPv4 address represented in dotted quad notation must have all
> bits that do not belong to the prefix set to zero.
>
> An example: 10.0.0.0/8
>
> - `value.type` = C_IPV4PREFIX
>
> - union element = `ipv4prefix`
>
> - C type = `struct confd_ipv4_prefix`
>
> - SMIv2 type = `OCTET STRING (SIZE (5))`

`inet:ipv6-prefix`  
> The ipv6-prefix type represents an IPv6 address prefix. The prefix
> length is given by the number following the slash character and must
> be less than or equal 128.
>
> A prefix length value of n corresponds to an IP address mask which has
> n contiguous 1-bits from the most significant bit (MSB) and all other
> bits set to 0.
>
> The IPv6 address must have all bits that do not belong to the prefix
> set to zero.
>
> An example: 2001:DB8::1428:57AB/125
>
> - `value.type` = C_IPV6PREFIX
>
> - union element = `ipv6prefix`
>
> - C type = `struct confd_ipv6_prefix`
>
> - SMIv2 type = `OCTET STRING (SIZE (17))`

`inet:domain-name`  
> The domain-name type represents a DNS domain name. The name SHOULD be
> fully qualified whenever possible.
>
> - `value.type` = C_BUF
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

`inet:host`  
> The host type represents either an IP address or a DNS domain name.
>
> This is a `union` of the `inet:ip-address` and `inet:domain-name`
> types defined above. The representation is thus identical to the
> representation for one of these types.
>
> The SMIv2 type is an `OCTET STRING`, which contains the textual
> representation of the domain name or address.

`inet:uri`  
> The uri type represents a Uniform Resource Identifier (URI) as defined
> by STD 66.
>
> - `value.type` = C_BUF
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

### The iana-crypt-hash YANG module

This module defines a type for storing passwords using a hash function,
and features to indicate which hash functions are supported by an
implementation. The type is defined in the
<urn:ietf:params:xml:ns:yang:iana-crypt-hash> namespace.

`ianach:crypt-hash`  
> The crypt-hash type is used to store passwords using a hash function.
> The algorithms for applying the hash function and encoding the result
> are implemented in various UNIX systems as the function crypt(3). A
> value of this type matches one of the forms:
>
> <div class="informalexample">
>
>     $0$<clear text password>
>     $<id>$<salt>$<password hash>
>     $<id>$<parameter>$<salt>$<password hash>
>
> </div>
>
> The "\$0\$" prefix indicates that the value is clear text. When such a
> value is received by the server, a hash value is calculated, and the
> string "\$\<id\>\$\<salt\>\$" or \$\<id\>\$\<parameter\>\$\<salt\>\$
> is prepended to the result. This value is stored in the configuration
> data store.
>
> If a value starting with "\$\<id\>\$", where \<id\> is not "0", is
> received, the server knows that the value already represents a hashed
> value, and stores it "as is" in the data store. Note that the "as is"
> behavior may cause confusion if a value that does not conform to the
> regular expression pattern is entered for the SHA-256 or SHA-512
> types. The expectation may be that value would be rejected as it would
> for values of other types, but special processing in the Tail-f
> implementation will accept the values as entered (i.e. "as-is") in
> order to conform to the RFC.
>
> In the Tail-f implementation, this type is logically a union of the
> types tailf:md5-digest-string, tailf:sha-256-digest-string, and
> tailf:sha-512-digest-string - see the section [The tailf-common YANG
> module](confd_types.3.md#data_model.tailf_common) below. All the
> hashed values of these types are accepted, and the choice of algorithm
> to use for hashing clear text is specified via the
> /confdConfig/cryptHash/algorithm parameter in `confd.conf` (see
> [confd.conf(5)](ncs.conf.5.md)). If the algorithm is set to
> "sha-256" or "sha-512", it can be tuned via the
> /confdConfig/cryptHash/rounds parameter in `confd.conf`.
>
> - `value.type` = C_BUF
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

### The tailf-common YANG module

This module defines Tail-f common YANG types, that are built-in to
ConfD.

`tailf:size`  
> A value that represents a number of bytes. An example could be
> S1G8M7K956B; meaning 1GB+8MB+7KB+956B = 1082138556 bytes. The value
> must start with an S. Any byte magnifier can be left out, i.e. S1K1B
> equals 1025 bytes. The order is significant though, i.e. S1B56G is not
> a valid byte size.
>
> The value space and representation is identical to the built-in
> `uint64` type.

`tailf:octet-list`  
> A list of dot-separated octets for example "192.168.255.1.0".
>
> <div class="note">
>
> The `tailf:value-length` restriction is measured in number of octets
> for `octet-list`.
>
> </div>
>
> - `value.type` = C_BINARY
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

`tailf:hex-list`  
> A list of colon-separated hexa-decimal octets for example
> "4F:4C:41:71".
>
> <div class="note">
>
> The `tailf:value-length` restriction is measured in octets of binary
> data for `hex-list`.
>
> </div>
>
> - `value.type` = C_BINARY
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

`tailf:md5-digest-string`  
> The md5-digest-string type automatically computes a MD5 digest for a
> value adhering to this type.
>
> This is best explained using an example. Suppose we have a leaf:
>
> <div class="informalexample">
>
>     leaf key {
>       type tailf:md5-digest-string;
>     }
>
> </div>
>
> A valid configuration is:
>
> <div class="informalexample">
>
>     <key>$0$My plain text.</key>
>
> </div>
>
> The "\$0\$" prefix indicates that this is plain text and that this
> value should be represented as a MD5 digest from now. ConfD computes a
> MD5 digest for the value and prepends "\$1\$\<salt\>\$", where
> \<salt\> is a random eight character salt used to generate the digest.
> When this value later on is fetched from ConfD the following is
> returned:
>
> <div class="informalexample">
>
>     <key>$1$fB$ndk2z/PIS0S1SvzWLqTJb.</key>
>
> </div>
>
> A value adhering to md5-digest-string must have "\$0\$" or a
> "\$1\$\<salt\>\$" prefix.
>
> The digest algorithm is the same as the md5 crypt function used for
> encrypting passwords for various UNIX systems, e.g.
> <http://www.freebsd.org/cgi/cvsweb.cgi/~checkout~/src/lib/libcrypt/crypt.c?rev=1.5&content-type=text/plain>
>
> <div class="note">
>
> The `pattern` restriction can not be used with this type.
>
> </div>
>
> - `value.type` = C_BUF
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

`tailf:sha-256-digest-string`  
> The sha-256-digest-string type automatically computes a SHA-256 digest
> for a value adhering to this type. A value of this type matches one of
> the forms:
>
> <div class="informalexample">
>
>     $0$<clear text password>
>     $5$<salt>$<password hash>
>     $5$rounds=<number>$<salt>$<password hash>
>
> </div>
>
> The "\$0\$" prefix indicates that this is plain text. When a plain
> text value is received by the server, a SHA-256 digest is calculated,
> and the string "\$5\$\<salt\>\$" is prepended to the result, where
> \<salt\> is a random 16 character salt used to generate the digest.
> This value is stored in the configuration data store. The algorithm
> can be tuned via the /confdConfig/cryptHash/rounds parameter in
> `confd.conf` (see [confd.conf(5)](ncs.conf.5.md)), which if set to a
> number other than the default will cause
> "\$5\$rounds=\<number\>\$\<salt\>\$" to be prepended instead of only
> "\$5\$\<salt\>\$".
>
> If a value starting with "\$5\$" is received, the server knows that
> the value already represents a SHA-256 digest, and stores it as is in
> the data store.
>
> The digest algorithm used is the same as the SHA-256 crypt function
> used for encrypting passwords for various UNIX systems, see e.g.
> <http://www.akkadia.org/drepper/SHA-crypt.txt>
>
> - `value.type` = C_BUF
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

`tailf:sha-512-digest-string`  
> The sha-512-digest-string type automatically computes a SHA-512 digest
> for a value adhering to this type. A value of this type matches one of
> the forms:
>
> <div class="informalexample">
>
>     $0$<clear text password>
>     $6$<salt>$<password hash>
>     $6$rounds=<number>$<salt>$<password hash>
>
> </div>
>
> The "\$0\$" prefix indicates that this is plain text. When a plain
> text value is received by the server, a SHA-512 digest is calculated,
> and the string "\$6\$\<salt\>\$" is prepended to the result, where
> \<salt\> is a random 16 character salt used to generate the digest.
> This value is stored in the configuration data store. The algorithm
> can be tuned via the /confdConfig/cryptHash/rounds parameter in
> `confd.conf` (see [confd.conf(5)](ncs.conf.5.md)), which if set to a
> number other than the default will cause
> "\$6\$rounds=\<number\>\$\<salt\>\$" to be prepended instead of only
> "\$6\$\<salt\>\$".
>
> If a value starting with "\$6\$" is received, the server knows that
> the value already represents a SHA-512 digest, and stores it as is in
> the data store.
>
> The digest algorithm used is the same as the SHA-512 crypt function
> used for encrypting passwords for various UNIX systems, see e.g.
> <http://www.akkadia.org/drepper/SHA-crypt.txt>
>
> - `value.type` = C_BUF
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

`tailf:aes-cfb-128-encrypted-string`  
> The aes-cfb-128-encrypted-string type automatically encrypts a value
> adhering to this type using AES in CFB mode followed by a base64
> conversion. If the value isn't encrypted already, that is.
>
> This is best explained using an example. Suppose we have a leaf:
>
> <div class="informalexample">
>
>     leaf enc {
>       type tailf:aes-cfb-128-encrypted-string;
>     }
>
> </div>
>
> A valid configuration is:
>
> <div class="informalexample">
>
>     <enc>$0$My plain text.</enc>
>
> </div>
>
> The "\$0\$" prefix indicates that this is plain text. When a plain
> text value is received by the server, the value is AES/Base64
> encrypted, and the string "\$8\$" is prepended. The resulting string
> is stored in the configuration data store.
>
> When a value of this type is read, the encrypted value is always
> returned. In the example above, the following value could be returned:
>
> <div class="informalexample">
>
>     <enc>$8$Qxxsn8BVzxphCdflqRwZm6noKKmt0QoSWnRnhcXqocg=</enc>
>
> </div>
>
> If a value starting with "\$8\$" is received, the server knows that
> the value is already encrypted, and stores it as is in the data store.
>
> A value adhering to this type must have a "\$0\$" or a "\$8\$" prefix.
>
> ConfD uses a configurable set of encryption keys to encrypt the
> string. For details, see the description of the encryptedStrings
> configurable in the [confd.conf(5)](ncs.conf.5.md) manual page.
>
> <div class="note">
>
> The `pattern` restriction can not be used with this type.
>
> </div>
>
> - `value.type` = C_BUF
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

`tailf:aes-256-cfb-128-encrypted-string`  
> The aes-256-cfb-128-encrypted-string works exactly like
> tailf:aes-cfb-128-encrypted-string but AES/256bits in CFB mode is used
> to encrypt the string. The prefix for encrypted values is "\$9\$".
>
> - `value.type` = C_BUF
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

`tailf:ip-address-and-prefix-length`  
> The ip-address-and-prefix-length type represents a combination of an
> IP address and a prefix length and is IP version neutral. The format
> of the textual representations implies the IP version.
>
> This is a `union` of the `tailf:ipv4-address-and-prefix-length` and
> `tailf:ipv6-address-and-prefix-length` types defined below. The
> representation is thus identical to the representation for one of
> these types.
>
> The SMIv2 type is an `OCTET STRING (SIZE (5|17))`.

`tailf:ipv4-address-and-prefix-length`  
> The ipv4-address-and-prefix-length type represents a combination of an
> IPv4 address and a prefix length. The prefix length is given by the
> number following the slash character and must be less than or equal to
> 32.
>
> An example: 172.16.1.2/16
>
> - `value.type` = C_IPV4_AND_PLEN
>
> - union element = `ipv4prefix`
>
> - C type = `struct confd_ipv4_prefix`
>
> - SMIv2 type = `OCTET STRING (SIZE (5))`

`tailf:ipv6-address-and-prefix-length`  
> The ipv6-address-and-prefix-length type represents a combination of an
> IPv6 address and a prefix length. The prefix length is given by the
> number following the slash character and must be less than or equal to
> 128.
>
> An example: 2001:DB8::1428:57AB/64
>
> - `value.type` = C_IPV6_AND_PLEN
>
> - union element = `ipv6prefix`
>
> - C type = `struct confd_ipv6_prefix`
>
> - SMIv2 type = `OCTET STRING (SIZE (17))`

`tailf:node-instance-identifier`  
> This is the same type as the node-instance-identifier defined in the
> ietf-netconf-acm module, replicated here to make it possible for
> Tail-f YANG modules to avoid a dependency on ietf-netconf-acm.
>
> - `value.type` = C_BUF
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

### The tailf-xsd-types YANG module

"This module contains useful XML Schema Datatypes that are not covered
by YANG types directly.

`xs:duration`  
> - `value.type` = C_DURATION
>
> - union element = `duration`
>
> - C type = `struct confd_duration`
>
> - SMIv2 type = `OCTET STRING`

`xs:date`  
> - `value.type` = C_DATE
>
> - union element = `date`
>
> - C type = `struct confd_date`
>
> - SMIv2 type = `OCTET STRING`

`xs:time`  
> - `value.type` = C_TIME
>
> - union element = `time`
>
> - C type = `struct confd_time`
>
> - SMIv2 type = `OCTET STRING`

`xs:token`  
> - `value.type` = C_BUF
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

`xs:hexBinary`  
> - `value.type` = C_BINARY
>
> - union element = `buf`
>
> - C type = `confd_buf_t`
>
> - SMIv2 type = `OCTET STRING`

`xs:QName`  
> - `value.type` = C_QNAME
>
> - union element =`qname`
>
> - C type = `struct confd_qname`
>
> - SMIv2 type = \<not applicable\>

`xs:decimal, xs:float, xs:double`  
> - `value.type` = C_DOUBLE
>
> - union element = `d`
>
> - C type = `double`
>
> - SMIv2 type = `OCTET STRING`

## See Also

The NSO User Guide

`confd_lib(3)` - confd C library.

`confd.conf(5)` - confd daemon configuration file format
