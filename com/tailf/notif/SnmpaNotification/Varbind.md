<a id="s-Varbind"></a>
# Varbind

```java
public static class com.tailf.notif.SnmpaNotification.Varbind
```

Class representing a varbind for a trap

## Members

**Constructors**:

- [Varbind(int, SnmpVar, ConfObject, int)](#s-Varbind-1)

**Fields**:

- [TYPE_SNMP_COL_ROW](#s-TYPE_SNMP_COL_ROW)
- [TYPE_SNMP_OID](#s-TYPE_SNMP_OID)
- [TYPE_SNMP_VARIABLE](#s-TYPE_SNMP_VARIABLE)
- [VARTYPE_SNMP_Counter32](#s-VARTYPE_SNMP_Counter32)
- [VARTYPE_SNMP_Counter64](#s-VARTYPE_SNMP_Counter64)
- [VARTYPE_SNMP_INTEGER](#s-VARTYPE_SNMP_INTEGER)
- [VARTYPE_SNMP_Interger32](#s-VARTYPE_SNMP_Interger32)
- [VARTYPE_SNMP_IpAddress](#s-VARTYPE_SNMP_IpAddress)
- [VARTYPE_SNMP_NULL](#s-VARTYPE_SNMP_NULL)
- [VARTYPE_SNMP_OBJECT_IDENTIFIER](#s-VARTYPE_SNMP_OBJECT_IDENTIFIER)
- [VARTYPE_SNMP_OCTET_STRING](#s-VARTYPE_SNMP_OCTET_STRING)
- [VARTYPE_SNMP_Opaque](#s-VARTYPE_SNMP_Opaque)
- [VARTYPE_SNMP_TimeTicks](#s-VARTYPE_SNMP_TimeTicks)
- [VARTYPE_SNMP_Unsigned32](#s-VARTYPE_SNMP_Unsigned32)

**Methods**:

- [getSnmpVar()](#s-getSnmpVar)
- [getType()](#s-getType)
- [getValue()](#s-getValue)
- [getVarType()](#s-getVarType)

## Constructors

<a id="s-Varbind-1"></a>
### Varbind(int, SnmpVar, ConfObject, int)

```java
public Varbind(
    int type,
    com.tailf.notif.SnmpaNotification.SnmpVar var,
    com.tailf.conf.ConfObject val,
    int vartype
)
```

Types: [SnmpVar](SnmpVar.md#s-SnmpVar), [ConfObject](../../conf/ConfObject.md#s-ConfObject)

**Parameters**

- `int type`
- `com.tailf.notif.SnmpaNotification.SnmpVar var`
- `com.tailf.conf.ConfObject val`
- `int vartype`


## Fields

<a id="s-TYPE_SNMP_COL_ROW"></a>
### TYPE_SNMP_COL_ROW

```java
public static final int TYPE_SNMP_COL_ROW = 3;
```

<a id="s-TYPE_SNMP_OID"></a>
### TYPE_SNMP_OID

```java
public static final int TYPE_SNMP_OID = 2;
```

<a id="s-TYPE_SNMP_VARIABLE"></a>
### TYPE_SNMP_VARIABLE

```java
public static final int TYPE_SNMP_VARIABLE = 1;
```

<a id="s-VARTYPE_SNMP_Counter32"></a>
### VARTYPE_SNMP_Counter32

```java
public static final int VARTYPE_SNMP_Counter32 = 6;
```

<a id="s-VARTYPE_SNMP_Counter64"></a>
### VARTYPE_SNMP_Counter64

```java
public static final int VARTYPE_SNMP_Counter64 = 9;
```

<a id="s-VARTYPE_SNMP_INTEGER"></a>
### VARTYPE_SNMP_INTEGER

```java
public static final int VARTYPE_SNMP_INTEGER = 1;
```

<a id="s-VARTYPE_SNMP_Interger32"></a>
### VARTYPE_SNMP_Interger32

```java
public static final int VARTYPE_SNMP_Interger32 = 2;
```

<a id="s-VARTYPE_SNMP_IpAddress"></a>
### VARTYPE_SNMP_IpAddress

```java
public static final int VARTYPE_SNMP_IpAddress = 5;
```

<a id="s-VARTYPE_SNMP_NULL"></a>
### VARTYPE_SNMP_NULL

```java
public static final int VARTYPE_SNMP_NULL = 0;
```

<a id="s-VARTYPE_SNMP_OBJECT_IDENTIFIER"></a>
### VARTYPE_SNMP_OBJECT_IDENTIFIER

```java
public static final int VARTYPE_SNMP_OBJECT_IDENTIFIER = 4;
```

<a id="s-VARTYPE_SNMP_OCTET_STRING"></a>
### VARTYPE_SNMP_OCTET_STRING

```java
public static final int VARTYPE_SNMP_OCTET_STRING = 3;
```

<a id="s-VARTYPE_SNMP_Opaque"></a>
### VARTYPE_SNMP_Opaque

```java
public static final int VARTYPE_SNMP_Opaque = 8;
```

<a id="s-VARTYPE_SNMP_TimeTicks"></a>
### VARTYPE_SNMP_TimeTicks

```java
public static final int VARTYPE_SNMP_TimeTicks = 7;
```

<a id="s-VARTYPE_SNMP_Unsigned32"></a>
### VARTYPE_SNMP_Unsigned32

```java
public static final int VARTYPE_SNMP_Unsigned32 = 10;
```


## Methods

<a id="s-getSnmpVar"></a>
### getSnmpVar()

```java
public com.tailf.notif.SnmpaNotification.SnmpVar getSnmpVar()
```

Types: [SnmpVar](SnmpVar.md#s-SnmpVar)

<a id="s-getType"></a>
### getType()

```java
public int getType()
```

<a id="s-getValue"></a>
### getValue()

```java
public com.tailf.conf.ConfObject getValue()
```

Types: [ConfObject](../../conf/ConfObject.md#s-ConfObject)

<a id="s-getVarType"></a>
### getVarType()

```java
public int getVarType()
```
