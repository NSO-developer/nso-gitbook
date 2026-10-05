# SnmpVarbind <a href="#cls-SnmpVarbind" id="cls-SnmpVarbind"></a>

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

- [SnmpVarbind(long[], ConfValue)](#m-SnmpVarbind-622bbf39c7f7)
- [SnmpVarbind(String, ConfValue)](#m-SnmpVarbind-2cb6509a0e9e)
- [SnmpVarbind(String, int[], ConfValue)](#m-SnmpVarbind-14ee5cde09f9)

**Fields**:

- [COLUMN_ROW](#m-COLUMN_ROW)
- [OID](#m-OID)
- [VARIABLE](#m-VARIABLE)

**Methods**:

- [encode()](#m-encode-fbae522bba37)
- [encodeOid(int[])](#m-encodeOid-1492ca23fa41)
- [encodeOid(long[])](#m-encodeOid-0c7047df30be)
- [getColumn()](#m-getColumn-d5f8434d3d26)
- [getOIDLong()](#m-getOIDLong-60af351acc27)
- [getRowIndex()](#m-getRowIndex-7a54ed7b2c63)
- [getType()](#m-getType-5a52f6f0d4c1)
- [getValue()](#m-getValue-d93864668c40)
- [getVariable()](#m-getVariable-e541c832a812)
- [oidToString(int[])](#m-oidToString-182e9901b522)
- [oidToString(long[])](#m-oidToString-75bded30fd10)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### SnmpVarbind(long[], ConfValue) <a href="#m-SnmpVarbind-622bbf39c7f7" id="m-SnmpVarbind-622bbf39c7f7"></a>

```java
public SnmpVarbind(long[] oid, com.tailf.conf.ConfValue value)
```

Types: [ConfValue](ConfValue.md#cls-ConfValue)

Constructor for Snmp variable binding (of type OID)

**Parameters**

- `long[] oid`
- `com.tailf.conf.ConfValue value`

### SnmpVarbind(String, ConfValue) <a href="#m-SnmpVarbind-2cb6509a0e9e" id="m-SnmpVarbind-2cb6509a0e9e"></a>

```java
public SnmpVarbind(String variable, com.tailf.conf.ConfValue value)
```

Types: [ConfValue](ConfValue.md#cls-ConfValue)

Constructor for Snmp variable binding (of type VARIABLE)

**Parameters**

- `String variable`
- `com.tailf.conf.ConfValue value`

### SnmpVarbind(String, int[], ConfValue) <a href="#m-SnmpVarbind-14ee5cde09f9" id="m-SnmpVarbind-14ee5cde09f9"></a>

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

### COLUMN_ROW <a href="#m-COLUMN_ROW" id="m-COLUMN_ROW"></a>

```java
public static final int COLUMN_ROW = 3;
```

### OID <a href="#m-OID" id="m-OID"></a>

```java
public static final int OID = 2;
```

### VARIABLE <a href="#m-VARIABLE" id="m-VARIABLE"></a>

```java
public static final int VARIABLE = 1;
```


## Methods

### encode() <a href="#m-encode-fbae522bba37" id="m-encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

Return encoded term.

### encodeOid(int[]) <a href="#m-encodeOid-1492ca23fa41" id="m-encodeOid-1492ca23fa41"></a>

```java
public com.tailf.proto.ConfEObject encodeOid(int[] oid)
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

Should only be used for rowindex now

**Parameters**

- `int[] oid`

### encodeOid(long[]) <a href="#m-encodeOid-0c7047df30be" id="m-encodeOid-0c7047df30be"></a>

```java
public com.tailf.proto.ConfEObject encodeOid(long[] oid)
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

**Parameters**

- `long[] oid`

### getColumn() <a href="#m-getColumn-d5f8434d3d26" id="m-getColumn-d5f8434d3d26"></a>

```java
public String getColumn()
```

### getOIDLong() <a href="#m-getOIDLong-60af351acc27" id="m-getOIDLong-60af351acc27"></a>

```java
public long[] getOIDLong()
```

### getRowIndex() <a href="#m-getRowIndex-7a54ed7b2c63" id="m-getRowIndex-7a54ed7b2c63"></a>

```java
public int[] getRowIndex()
```

### getType() <a href="#m-getType-5a52f6f0d4c1" id="m-getType-5a52f6f0d4c1"></a>

```java
public int getType()
```

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public com.tailf.conf.ConfValue getValue()
```

Types: [ConfValue](ConfValue.md#cls-ConfValue)

### getVariable() <a href="#m-getVariable-e541c832a812" id="m-getVariable-e541c832a812"></a>

```java
public String getVariable()
```

### oidToString(int[]) <a href="#m-oidToString-182e9901b522" id="m-oidToString-182e9901b522"></a>

```java
public String oidToString(int[] oid)
```

Return oid as string on format 1.2.3.4 etc
 Should only be used for rowindex now

**Parameters**

- `int[] oid`

### oidToString(long[]) <a href="#m-oidToString-75bded30fd10" id="m-oidToString-75bded30fd10"></a>

```java
public String oidToString(long[] oid)
```

Return oid as string on format 1.2.3.4 etc

**Parameters**

- `long[] oid`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
