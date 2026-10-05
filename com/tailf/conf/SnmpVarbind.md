# SnmpVarbind <a href="#snmpvarbind-ef9f9c3d4932" id="snmpvarbind-ef9f9c3d4932"></a>

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

- [SnmpVarbind\(long\[\], ConfValue\)](#snmpvarbind-622bbf39c7f7)
- [SnmpVarbind\(String, ConfValue\)](#snmpvarbind-2cb6509a0e9e)
- [SnmpVarbind\(String, int\[\], ConfValue\)](#snmpvarbind-14ee5cde09f9)

**Fields**:

- [COLUMN\_ROW](#column_row-de37eda67f2e)
- [OID](#oid-7016dcf53778)
- [VARIABLE](#variable-d89e4de9003e)

**Methods**:

- [encode\(\)](#encode-fbae522bba37)
- [encodeOid\(int\[\]\)](#encodeoid-1492ca23fa41)
- [encodeOid\(long\[\]\)](#encodeoid-0c7047df30be)
- [getColumn\(\)](#getcolumn-d5f8434d3d26)
- [getOIDLong\(\)](#getoidlong-60af351acc27)
- [getRowIndex\(\)](#getrowindex-7a54ed7b2c63)
- [getType\(\)](#gettype-5a52f6f0d4c1)
- [getValue\(\)](#getvalue-d93864668c40)
- [getVariable\(\)](#getvariable-e541c832a812)
- [oidToString\(int\[\]\)](#oidtostring-182e9901b522)
- [oidToString\(long\[\]\)](#oidtostring-75bded30fd10)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### SnmpVarbind(long[], ConfValue) <a href="#snmpvarbind-622bbf39c7f7" id="snmpvarbind-622bbf39c7f7"></a>

```java
public SnmpVarbind(long[] oid, com.tailf.conf.ConfValue value)
```

Types: [ConfValue](ConfValue.md#confvalue-769292781c7d)

Constructor for Snmp variable binding (of type OID)

**Parameters**

- `long[] oid`
- `com.tailf.conf.ConfValue value`

### SnmpVarbind(String, ConfValue) <a href="#snmpvarbind-2cb6509a0e9e" id="snmpvarbind-2cb6509a0e9e"></a>

```java
public SnmpVarbind(String variable, com.tailf.conf.ConfValue value)
```

Types: [ConfValue](ConfValue.md#confvalue-769292781c7d)

Constructor for Snmp variable binding (of type VARIABLE)

**Parameters**

- `String variable`
- `com.tailf.conf.ConfValue value`

### SnmpVarbind(String, int[], ConfValue) <a href="#snmpvarbind-14ee5cde09f9" id="snmpvarbind-14ee5cde09f9"></a>

```java
public SnmpVarbind(String column, int[] rowindex, com.tailf.conf.ConfValue value)
```

Types: [ConfValue](ConfValue.md#confvalue-769292781c7d)

Constructor for Snmp variable binding (of type COLUMN_ROW)

**Parameters**

- `String column`
- `int[] rowindex`
- `com.tailf.conf.ConfValue value`


## Fields

### COLUMN_ROW <a href="#column_row-de37eda67f2e" id="column_row-de37eda67f2e"></a>

```java
public static final int COLUMN_ROW = 3;
```

### OID <a href="#oid-7016dcf53778" id="oid-7016dcf53778"></a>

```java
public static final int OID = 2;
```

### VARIABLE <a href="#variable-d89e4de9003e" id="variable-d89e4de9003e"></a>

```java
public static final int VARIABLE = 1;
```


## Methods

### encode() <a href="#encode-fbae522bba37" id="encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

Return encoded term.

### encodeOid(int[]) <a href="#encodeoid-1492ca23fa41" id="encodeoid-1492ca23fa41"></a>

```java
public com.tailf.proto.ConfEObject encodeOid(int[] oid)
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

Should only be used for rowindex now

**Parameters**

- `int[] oid`

### encodeOid(long[]) <a href="#encodeoid-0c7047df30be" id="encodeoid-0c7047df30be"></a>

```java
public com.tailf.proto.ConfEObject encodeOid(long[] oid)
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

**Parameters**

- `long[] oid`

### getColumn() <a href="#getcolumn-d5f8434d3d26" id="getcolumn-d5f8434d3d26"></a>

```java
public String getColumn()
```

### getOIDLong() <a href="#getoidlong-60af351acc27" id="getoidlong-60af351acc27"></a>

```java
public long[] getOIDLong()
```

### getRowIndex() <a href="#getrowindex-7a54ed7b2c63" id="getrowindex-7a54ed7b2c63"></a>

```java
public int[] getRowIndex()
```

### getType() <a href="#gettype-5a52f6f0d4c1" id="gettype-5a52f6f0d4c1"></a>

```java
public int getType()
```

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public com.tailf.conf.ConfValue getValue()
```

Types: [ConfValue](ConfValue.md#confvalue-769292781c7d)

### getVariable() <a href="#getvariable-e541c832a812" id="getvariable-e541c832a812"></a>

```java
public String getVariable()
```

### oidToString(int[]) <a href="#oidtostring-182e9901b522" id="oidtostring-182e9901b522"></a>

```java
public String oidToString(int[] oid)
```

Return oid as string on format 1.2.3.4 etc
 Should only be used for rowindex now

**Parameters**

- `int[] oid`

### oidToString(long[]) <a href="#oidtostring-75bded30fd10" id="oidtostring-75bded30fd10"></a>

```java
public String oidToString(long[] oid)
```

Return oid as string on format 1.2.3.4 etc

**Parameters**

- `long[] oid`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
