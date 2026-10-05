<a id="cls-SnmpVarbind"></a>
# SnmpVarbind

```java
public class com.tailf.conf.SnmpVarbind
```

The SnmpVarbind is a data structure for holding an SNMP variable binding
 which is on either of the forms:


- Variable - Value
   - OID - Value
     - Column - RowIndex - Value

## Members

**Constructors**:

- [SnmpVarbind(long[], ConfValue)](#m-snmpvarbind-622bbf39c7f7)
- [SnmpVarbind(String, ConfValue)](#m-snmpvarbind-2cb6509a0e9e)
- [SnmpVarbind(String, int[], ConfValue)](#m-snmpvarbind-14ee5cde09f9)

**Fields**:

- [COLUMN_ROW](#m-COLUMN_ROW)
- [OID](#m-OID)
- [VARIABLE](#m-VARIABLE)

**Methods**:

- [encode()](#m-encode-fbae522bba37)
- [encodeOid(int[])](#m-encodeoid-1492ca23fa41)
- [encodeOid(long[])](#m-encodeoid-0c7047df30be)
- [getColumn()](#m-getcolumn-d5f8434d3d26)
- [getOIDLong()](#m-getoidlong-60af351acc27)
- [getRowIndex()](#m-getrowindex-7a54ed7b2c63)
- [getType()](#m-gettype-5a52f6f0d4c1)
- [getValue()](#m-getvalue-d93864668c40)
- [getVariable()](#m-getvariable-e541c832a812)
- [oidToString(int[])](#m-oidtostring-182e9901b522)
- [oidToString(long[])](#m-oidtostring-75bded30fd10)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-snmpvarbind-622bbf39c7f7"></a>
### SnmpVarbind(long[], ConfValue)

```java
public SnmpVarbind(long[] oid, com.tailf.conf.ConfValue value)
```

Types: [ConfValue](ConfValue.md#cls-ConfValue)

Constructor for Snmp variable binding (of type OID)

**Parameters**

- `long[] oid`
- `com.tailf.conf.ConfValue value`

<a id="m-snmpvarbind-2cb6509a0e9e"></a>
### SnmpVarbind(String, ConfValue)

```java
public SnmpVarbind(String variable, com.tailf.conf.ConfValue value)
```

Types: [ConfValue](ConfValue.md#cls-ConfValue)

Constructor for Snmp variable binding (of type VARIABLE)

**Parameters**

- `String variable`
- `com.tailf.conf.ConfValue value`

<a id="m-snmpvarbind-14ee5cde09f9"></a>
### SnmpVarbind(String, int[], ConfValue)

```java
public SnmpVarbind(String column, int[] rowindex, com.tailf.conf.ConfValue value)
```

Types: [ConfValue](ConfValue.md#cls-ConfValue)

Constructor for Snmp variable binding (of type COLUMN_ROW)

**Parameters**

- `String column`
- `int[] rowindex`
- `com.tailf.conf.ConfValue value`


## Fields

<a id="m-COLUMN_ROW"></a>
### COLUMN_ROW

```java
public static final int COLUMN_ROW = 3;
```

<a id="m-OID"></a>
### OID

```java
public static final int OID = 2;
```

<a id="m-VARIABLE"></a>
### VARIABLE

```java
public static final int VARIABLE = 1;
```


## Methods

<a id="m-encode-fbae522bba37"></a>
### encode()

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

Return encoded term.

<a id="m-encodeoid-1492ca23fa41"></a>
### encodeOid(int[])

```java
public com.tailf.proto.ConfEObject encodeOid(int[] oid)
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

Should only be used for rowindex now

**Parameters**

- `int[] oid`

<a id="m-encodeoid-0c7047df30be"></a>
### encodeOid(long[])

```java
public com.tailf.proto.ConfEObject encodeOid(long[] oid)
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

**Parameters**

- `long[] oid`

<a id="m-getcolumn-d5f8434d3d26"></a>
### getColumn()

```java
public String getColumn()
```

<a id="m-getoidlong-60af351acc27"></a>
### getOIDLong()

```java
public long[] getOIDLong()
```

<a id="m-getrowindex-7a54ed7b2c63"></a>
### getRowIndex()

```java
public int[] getRowIndex()
```

<a id="m-gettype-5a52f6f0d4c1"></a>
### getType()

```java
public int getType()
```

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public com.tailf.conf.ConfValue getValue()
```

Types: [ConfValue](ConfValue.md#cls-ConfValue)

<a id="m-getvariable-e541c832a812"></a>
### getVariable()

```java
public String getVariable()
```

<a id="m-oidtostring-182e9901b522"></a>
### oidToString(int[])

```java
public String oidToString(int[] oid)
```

Return oid as string on format 1.2.3.4 etc
 Should only be used for rowindex now

**Parameters**

- `int[] oid`

<a id="m-oidtostring-75bded30fd10"></a>
### oidToString(long[])

```java
public String oidToString(long[] oid)
```

Return oid as string on format 1.2.3.4 etc

**Parameters**

- `long[] oid`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
