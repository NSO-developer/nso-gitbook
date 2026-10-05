<a id="cls-Varbind"></a>
# Varbind

```java
public static class com.tailf.notif.SnmpaNotification.Varbind
```

Class representing a varbind for a trap

## Members

**Constructors**:

- [Varbind(int, SnmpVar, ConfObject, int)](#m-varbind-3bad12702bce)

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

- [getSnmpVar()](#m-getsnmpvar-4f692734b654)
- [getType()](#m-gettype-5a52f6f0d4c1)
- [getValue()](#m-getvalue-d93864668c40)
- [getVarType()](#m-getvartype-310b177095e2)

## Constructors

<a id="m-varbind-3bad12702bce"></a>
### Varbind(int, SnmpVar, ConfObject, int)

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

<a id="m-TYPE_SNMP_COL_ROW"></a>
### TYPE_SNMP_COL_ROW

```java
public static final int TYPE_SNMP_COL_ROW = 3;
```

<a id="m-TYPE_SNMP_OID"></a>
### TYPE_SNMP_OID

```java
public static final int TYPE_SNMP_OID = 2;
```

<a id="m-TYPE_SNMP_VARIABLE"></a>
### TYPE_SNMP_VARIABLE

```java
public static final int TYPE_SNMP_VARIABLE = 1;
```

<a id="m-VARTYPE_SNMP_Counter32"></a>
### VARTYPE_SNMP_Counter32

```java
public static final int VARTYPE_SNMP_Counter32 = 6;
```

<a id="m-VARTYPE_SNMP_Counter64"></a>
### VARTYPE_SNMP_Counter64

```java
public static final int VARTYPE_SNMP_Counter64 = 9;
```

<a id="m-VARTYPE_SNMP_INTEGER"></a>
### VARTYPE_SNMP_INTEGER

```java
public static final int VARTYPE_SNMP_INTEGER = 1;
```

<a id="m-VARTYPE_SNMP_Interger32"></a>
### VARTYPE_SNMP_Interger32

```java
public static final int VARTYPE_SNMP_Interger32 = 2;
```

<a id="m-VARTYPE_SNMP_IpAddress"></a>
### VARTYPE_SNMP_IpAddress

```java
public static final int VARTYPE_SNMP_IpAddress = 5;
```

<a id="m-VARTYPE_SNMP_NULL"></a>
### VARTYPE_SNMP_NULL

```java
public static final int VARTYPE_SNMP_NULL = 0;
```

<a id="m-VARTYPE_SNMP_OBJECT_IDENTIFIER"></a>
### VARTYPE_SNMP_OBJECT_IDENTIFIER

```java
public static final int VARTYPE_SNMP_OBJECT_IDENTIFIER = 4;
```

<a id="m-VARTYPE_SNMP_OCTET_STRING"></a>
### VARTYPE_SNMP_OCTET_STRING

```java
public static final int VARTYPE_SNMP_OCTET_STRING = 3;
```

<a id="m-VARTYPE_SNMP_Opaque"></a>
### VARTYPE_SNMP_Opaque

```java
public static final int VARTYPE_SNMP_Opaque = 8;
```

<a id="m-VARTYPE_SNMP_TimeTicks"></a>
### VARTYPE_SNMP_TimeTicks

```java
public static final int VARTYPE_SNMP_TimeTicks = 7;
```

<a id="m-VARTYPE_SNMP_Unsigned32"></a>
### VARTYPE_SNMP_Unsigned32

```java
public static final int VARTYPE_SNMP_Unsigned32 = 10;
```


## Methods

<a id="m-getsnmpvar-4f692734b654"></a>
### getSnmpVar()

```java
public com.tailf.notif.SnmpaNotification.SnmpVar getSnmpVar()
```

Types: [SnmpVar](SnmpVar.md#cls-SnmpVar)

<a id="m-gettype-5a52f6f0d4c1"></a>
### getType()

```java
public int getType()
```

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public com.tailf.conf.ConfObject getValue()
```

Types: [ConfObject](../../conf/ConfObject.md#cls-ConfObject)

<a id="m-getvartype-310b177095e2"></a>
### getVarType()

```java
public int getVarType()
```
