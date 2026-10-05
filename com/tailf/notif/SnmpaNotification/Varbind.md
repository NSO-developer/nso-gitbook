# Varbind <a href="#cls-Varbind" id="cls-Varbind"></a>

```java
public static class com.tailf.notif.SnmpaNotification.Varbind
```

Class representing a varbind for a trap

## Members

**Constructors**:

- [Varbind(int, SnmpVar, ConfObject, int)](#m-Varbind-3bad12702bce)

**Fields**:

- [TYPE_SNMP_COL_ROW](#m-TYPE_SNMP_COL_ROW)
- [TYPE_SNMP_OID](#m-TYPE_SNMP_OID)
- [TYPE_SNMP_VARIABLE](#m-TYPE_SNMP_VARIABLE)
- [VARTYPE_SNMP_Counter32](#m-VARTYPE_SNMP_Counter32)
- [VARTYPE_SNMP_Counter64](#m-VARTYPE_SNMP_Counter64)
- [VARTYPE_SNMP_INTEGER](#m-VARTYPE_SNMP_INTEGER)
- [VARTYPE_SNMP_Interger32](#m-VARTYPE_SNMP_Interger32)
- [VARTYPE_SNMP_IpAddress](#m-VARTYPE_SNMP_IpAddress)
- [VARTYPE_SNMP_NULL](#m-VARTYPE_SNMP_NULL)
- [VARTYPE_SNMP_OBJECT_IDENTIFIER](#m-VARTYPE_SNMP_OBJECT_IDENTIFIER)
- [VARTYPE_SNMP_OCTET_STRING](#m-VARTYPE_SNMP_OCTET_STRING)
- [VARTYPE_SNMP_Opaque](#m-VARTYPE_SNMP_Opaque)
- [VARTYPE_SNMP_TimeTicks](#m-VARTYPE_SNMP_TimeTicks)
- [VARTYPE_SNMP_Unsigned32](#m-VARTYPE_SNMP_Unsigned32)

**Methods**:

- [getSnmpVar()](#m-getSnmpVar-4f692734b654)
- [getType()](#m-getType-5a52f6f0d4c1)
- [getValue()](#m-getValue-d93864668c40)
- [getVarType()](#m-getVarType-310b177095e2)

## Constructors

### Varbind(int, SnmpVar, ConfObject, int) <a href="#m-Varbind-3bad12702bce" id="m-Varbind-3bad12702bce"></a>

```java
public Varbind(
    int type,
    com.tailf.notif.SnmpaNotification.SnmpVar var,
    com.tailf.conf.ConfObject val,
    int vartype
)
```

Types: [SnmpVar](SnmpVar.md#cls-SnmpVar), [ConfObject](../../conf/ConfObject.md#cls-ConfObject)

**Parameters**

- `int type`
- `com.tailf.notif.SnmpaNotification.SnmpVar var`
- `com.tailf.conf.ConfObject val`
- `int vartype`


## Fields

### TYPE_SNMP_COL_ROW <a href="#m-TYPE_SNMP_COL_ROW" id="m-TYPE_SNMP_COL_ROW"></a>

```java
public static final int TYPE_SNMP_COL_ROW = 3;
```

### TYPE_SNMP_OID <a href="#m-TYPE_SNMP_OID" id="m-TYPE_SNMP_OID"></a>

```java
public static final int TYPE_SNMP_OID = 2;
```

### TYPE_SNMP_VARIABLE <a href="#m-TYPE_SNMP_VARIABLE" id="m-TYPE_SNMP_VARIABLE"></a>

```java
public static final int TYPE_SNMP_VARIABLE = 1;
```

### VARTYPE_SNMP_Counter32 <a href="#m-VARTYPE_SNMP_Counter32" id="m-VARTYPE_SNMP_Counter32"></a>

```java
public static final int VARTYPE_SNMP_Counter32 = 6;
```

### VARTYPE_SNMP_Counter64 <a href="#m-VARTYPE_SNMP_Counter64" id="m-VARTYPE_SNMP_Counter64"></a>

```java
public static final int VARTYPE_SNMP_Counter64 = 9;
```

### VARTYPE_SNMP_INTEGER <a href="#m-VARTYPE_SNMP_INTEGER" id="m-VARTYPE_SNMP_INTEGER"></a>

```java
public static final int VARTYPE_SNMP_INTEGER = 1;
```

### VARTYPE_SNMP_Interger32 <a href="#m-VARTYPE_SNMP_Interger32" id="m-VARTYPE_SNMP_Interger32"></a>

```java
public static final int VARTYPE_SNMP_Interger32 = 2;
```

### VARTYPE_SNMP_IpAddress <a href="#m-VARTYPE_SNMP_IpAddress" id="m-VARTYPE_SNMP_IpAddress"></a>

```java
public static final int VARTYPE_SNMP_IpAddress = 5;
```

### VARTYPE_SNMP_NULL <a href="#m-VARTYPE_SNMP_NULL" id="m-VARTYPE_SNMP_NULL"></a>

```java
public static final int VARTYPE_SNMP_NULL = 0;
```

### VARTYPE_SNMP_OBJECT_IDENTIFIER <a href="#m-VARTYPE_SNMP_OBJECT_IDENTIFIER" id="m-VARTYPE_SNMP_OBJECT_IDENTIFIER"></a>

```java
public static final int VARTYPE_SNMP_OBJECT_IDENTIFIER = 4;
```

### VARTYPE_SNMP_OCTET_STRING <a href="#m-VARTYPE_SNMP_OCTET_STRING" id="m-VARTYPE_SNMP_OCTET_STRING"></a>

```java
public static final int VARTYPE_SNMP_OCTET_STRING = 3;
```

### VARTYPE_SNMP_Opaque <a href="#m-VARTYPE_SNMP_Opaque" id="m-VARTYPE_SNMP_Opaque"></a>

```java
public static final int VARTYPE_SNMP_Opaque = 8;
```

### VARTYPE_SNMP_TimeTicks <a href="#m-VARTYPE_SNMP_TimeTicks" id="m-VARTYPE_SNMP_TimeTicks"></a>

```java
public static final int VARTYPE_SNMP_TimeTicks = 7;
```

### VARTYPE_SNMP_Unsigned32 <a href="#m-VARTYPE_SNMP_Unsigned32" id="m-VARTYPE_SNMP_Unsigned32"></a>

```java
public static final int VARTYPE_SNMP_Unsigned32 = 10;
```


## Methods

### getSnmpVar() <a href="#m-getSnmpVar-4f692734b654" id="m-getSnmpVar-4f692734b654"></a>

```java
public com.tailf.notif.SnmpaNotification.SnmpVar getSnmpVar()
```

Types: [SnmpVar](SnmpVar.md#cls-SnmpVar)

### getType() <a href="#m-getType-5a52f6f0d4c1" id="m-getType-5a52f6f0d4c1"></a>

```java
public int getType()
```

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public com.tailf.conf.ConfObject getValue()
```

Types: [ConfObject](../../conf/ConfObject.md#cls-ConfObject)

### getVarType() <a href="#m-getVarType-310b177095e2" id="m-getVarType-310b177095e2"></a>

```java
public int getVarType()
```
