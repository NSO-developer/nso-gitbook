<a id="s-SnmpVarbind"></a>
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

- [SnmpVarbind(long[], ConfValue)](#s-SnmpVarbind-1)
- [SnmpVarbind(String, ConfValue)](#s-SnmpVarbind-2)
- [SnmpVarbind(String, int[], ConfValue)](#s-SnmpVarbind-3)

**Fields**:

- [COLUMN_ROW](#s-COLUMN_ROW)
- [OID](#s-OID)
- [VARIABLE](#s-VARIABLE)

**Methods**:

- [encode()](#s-encode)
- [encodeOid(int[])](#s-encodeOid)
- [encodeOid(long[])](#s-encodeOid-1)
- [getColumn()](#s-getColumn)
- [getOIDLong()](#s-getOIDLong)
- [getRowIndex()](#s-getRowIndex)
- [getType()](#s-getType)
- [getValue()](#s-getValue)
- [getVariable()](#s-getVariable)
- [oidToString(int[])](#s-oidToString)
- [oidToString(long[])](#s-oidToString-1)
- [toString()](#s-toString)

## Constructors

<a id="s-SnmpVarbind-1"></a>
### SnmpVarbind(long[], ConfValue)

```java
public SnmpVarbind(long[] oid, com.tailf.conf.ConfValue value)
```

Types: [ConfValue](ConfValue.md#s-ConfValue)

Constructor for Snmp variable binding (of type OID)

**Parameters**

- `long[] oid`
- `com.tailf.conf.ConfValue value`

<a id="s-SnmpVarbind-2"></a>
### SnmpVarbind(String, ConfValue)

```java
public SnmpVarbind(String variable, com.tailf.conf.ConfValue value)
```

Types: [ConfValue](ConfValue.md#s-ConfValue)

Constructor for Snmp variable binding (of type VARIABLE)

**Parameters**

- `String variable`
- `com.tailf.conf.ConfValue value`

<a id="s-SnmpVarbind-3"></a>
### SnmpVarbind(String, int[], ConfValue)

```java
public SnmpVarbind(String column, int[] rowindex, com.tailf.conf.ConfValue value)
```

Types: [ConfValue](ConfValue.md#s-ConfValue)

Constructor for Snmp variable binding (of type COLUMN_ROW)

**Parameters**

- `String column`
- `int[] rowindex`
- `com.tailf.conf.ConfValue value`


## Fields

<a id="s-COLUMN_ROW"></a>
### COLUMN_ROW

```java
public static final int COLUMN_ROW = 3;
```

<a id="s-OID"></a>
### OID

```java
public static final int OID = 2;
```

<a id="s-VARIABLE"></a>
### VARIABLE

```java
public static final int VARIABLE = 1;
```


## Methods

<a id="s-encode"></a>
### encode()

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

Return encoded term.

<a id="s-encodeOid"></a>
### encodeOid(int[])

```java
public com.tailf.proto.ConfEObject encodeOid(int[] oid)
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

Should only be used for rowindex now

**Parameters**

- `int[] oid`

<a id="s-encodeOid-1"></a>
### encodeOid(long[])

```java
public com.tailf.proto.ConfEObject encodeOid(long[] oid)
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

**Parameters**

- `long[] oid`

<a id="s-getColumn"></a>
### getColumn()

```java
public String getColumn()
```

<a id="s-getOIDLong"></a>
### getOIDLong()

```java
public long[] getOIDLong()
```

<a id="s-getRowIndex"></a>
### getRowIndex()

```java
public int[] getRowIndex()
```

<a id="s-getType"></a>
### getType()

```java
public int getType()
```

<a id="s-getValue"></a>
### getValue()

```java
public com.tailf.conf.ConfValue getValue()
```

Types: [ConfValue](ConfValue.md#s-ConfValue)

<a id="s-getVariable"></a>
### getVariable()

```java
public String getVariable()
```

<a id="s-oidToString"></a>
### oidToString(int[])

```java
public String oidToString(int[] oid)
```

Return oid as string on format 1.2.3.4 etc
 Should only be used for rowindex now

**Parameters**

- `int[] oid`

<a id="s-oidToString-1"></a>
### oidToString(long[])

```java
public String oidToString(long[] oid)
```

Return oid as string on format 1.2.3.4 etc

**Parameters**

- `long[] oid`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
