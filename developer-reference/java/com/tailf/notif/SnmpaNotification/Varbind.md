# Varbind <a href="#varbind-54c1201bffe5" id="varbind-54c1201bffe5"></a>

```java
public static class com.tailf.notif.SnmpaNotification.Varbind
```

Class representing a varbind for a trap

## Members

**Constructors**:

- [Varbind\(int, SnmpVar, ConfObject, int\)](#varbind-3bad12702bce)

**Fields**:

- [TYPE\_SNMP\_COL\_ROW](#type_snmp_col_row-292697ccb605)
- [TYPE\_SNMP\_OID](#type_snmp_oid-39794fc37eb6)
- [TYPE\_SNMP\_VARIABLE](#type_snmp_variable-ac9da1e9df0a)
- [VARTYPE\_SNMP\_Counter32](#vartype_snmp_counter32-4371b23fffb0)
- [VARTYPE\_SNMP\_Counter64](#vartype_snmp_counter64-c8e9eda6225e)
- [VARTYPE\_SNMP\_INTEGER](#vartype_snmp_integer-c852add84dbb)
- [VARTYPE\_SNMP\_Interger32](#vartype_snmp_interger32-43b506b3da0a)
- [VARTYPE\_SNMP\_IpAddress](#vartype_snmp_ipaddress-ca0706e0f0c7)
- [VARTYPE\_SNMP\_NULL](#vartype_snmp_null-0d765a90b37a)
- [VARTYPE\_SNMP\_OBJECT\_IDENTIFIER](#vartype_snmp_object_identifier-197ca9d8094f)
- [VARTYPE\_SNMP\_OCTET\_STRING](#vartype_snmp_octet_string-7f2102daf452)
- [VARTYPE\_SNMP\_Opaque](#vartype_snmp_opaque-8982c272303c)
- [VARTYPE\_SNMP\_TimeTicks](#vartype_snmp_timeticks-4f2d52e27935)
- [VARTYPE\_SNMP\_Unsigned32](#vartype_snmp_unsigned32-86e3ef62f34b)

**Methods**:

- [getSnmpVar\(\)](#getsnmpvar-4f692734b654)
- [getType\(\)](#gettype-5a52f6f0d4c1)
- [getValue\(\)](#getvalue-d93864668c40)
- [getVarType\(\)](#getvartype-310b177095e2)

## Constructors

### Varbind(int, SnmpVar, ConfObject, int) <a href="#varbind-3bad12702bce" id="varbind-3bad12702bce"></a>

```java
public Varbind(
    int type,
    com.tailf.notif.SnmpaNotification.SnmpVar var,
    com.tailf.conf.ConfObject val,
    int vartype
)
```

Types: [SnmpVar](SnmpVar.md#snmpvar-63e4e33a3a0a), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2)

**Parameters**

- `int type`
- `com.tailf.notif.SnmpaNotification.SnmpVar var`
- `com.tailf.conf.ConfObject val`
- `int vartype`


## Fields

### TYPE_SNMP_COL_ROW <a href="#type_snmp_col_row-292697ccb605" id="type_snmp_col_row-292697ccb605"></a>

```java
public static final int TYPE_SNMP_COL_ROW = 3;
```

### TYPE_SNMP_OID <a href="#type_snmp_oid-39794fc37eb6" id="type_snmp_oid-39794fc37eb6"></a>

```java
public static final int TYPE_SNMP_OID = 2;
```

### TYPE_SNMP_VARIABLE <a href="#type_snmp_variable-ac9da1e9df0a" id="type_snmp_variable-ac9da1e9df0a"></a>

```java
public static final int TYPE_SNMP_VARIABLE = 1;
```

### VARTYPE_SNMP_Counter32 <a href="#vartype_snmp_counter32-4371b23fffb0" id="vartype_snmp_counter32-4371b23fffb0"></a>

```java
public static final int VARTYPE_SNMP_Counter32 = 6;
```

### VARTYPE_SNMP_Counter64 <a href="#vartype_snmp_counter64-c8e9eda6225e" id="vartype_snmp_counter64-c8e9eda6225e"></a>

```java
public static final int VARTYPE_SNMP_Counter64 = 9;
```

### VARTYPE_SNMP_INTEGER <a href="#vartype_snmp_integer-c852add84dbb" id="vartype_snmp_integer-c852add84dbb"></a>

```java
public static final int VARTYPE_SNMP_INTEGER = 1;
```

### VARTYPE_SNMP_Interger32 <a href="#vartype_snmp_interger32-43b506b3da0a" id="vartype_snmp_interger32-43b506b3da0a"></a>

```java
public static final int VARTYPE_SNMP_Interger32 = 2;
```

### VARTYPE_SNMP_IpAddress <a href="#vartype_snmp_ipaddress-ca0706e0f0c7" id="vartype_snmp_ipaddress-ca0706e0f0c7"></a>

```java
public static final int VARTYPE_SNMP_IpAddress = 5;
```

### VARTYPE_SNMP_NULL <a href="#vartype_snmp_null-0d765a90b37a" id="vartype_snmp_null-0d765a90b37a"></a>

```java
public static final int VARTYPE_SNMP_NULL = 0;
```

### VARTYPE_SNMP_OBJECT_IDENTIFIER <a href="#vartype_snmp_object_identifier-197ca9d8094f" id="vartype_snmp_object_identifier-197ca9d8094f"></a>

```java
public static final int VARTYPE_SNMP_OBJECT_IDENTIFIER = 4;
```

### VARTYPE_SNMP_OCTET_STRING <a href="#vartype_snmp_octet_string-7f2102daf452" id="vartype_snmp_octet_string-7f2102daf452"></a>

```java
public static final int VARTYPE_SNMP_OCTET_STRING = 3;
```

### VARTYPE_SNMP_Opaque <a href="#vartype_snmp_opaque-8982c272303c" id="vartype_snmp_opaque-8982c272303c"></a>

```java
public static final int VARTYPE_SNMP_Opaque = 8;
```

### VARTYPE_SNMP_TimeTicks <a href="#vartype_snmp_timeticks-4f2d52e27935" id="vartype_snmp_timeticks-4f2d52e27935"></a>

```java
public static final int VARTYPE_SNMP_TimeTicks = 7;
```

### VARTYPE_SNMP_Unsigned32 <a href="#vartype_snmp_unsigned32-86e3ef62f34b" id="vartype_snmp_unsigned32-86e3ef62f34b"></a>

```java
public static final int VARTYPE_SNMP_Unsigned32 = 10;
```


## Methods

### getSnmpVar() <a href="#getsnmpvar-4f692734b654" id="getsnmpvar-4f692734b654"></a>

```java
public com.tailf.notif.SnmpaNotification.SnmpVar getSnmpVar()
```

Types: [SnmpVar](SnmpVar.md#snmpvar-63e4e33a3a0a)

### getType() <a href="#gettype-5a52f6f0d4c1" id="gettype-5a52f6f0d4c1"></a>

```java
public int getType()
```

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public com.tailf.conf.ConfObject getValue()
```

Types: [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2)

### getVarType() <a href="#getvartype-310b177095e2" id="getvartype-310b177095e2"></a>

```java
public int getVarType()
```
