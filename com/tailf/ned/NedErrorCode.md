# NedErrorCode <a href="#cls-NedErrorCode" id="cls-NedErrorCode"></a>

```java
public enum com.tailf.ned.NedErrorCode
```

Types: [NedErrorCode](NedErrorCode.md#cls-NedErrorCode)

## Members

**Enum Constants**:

- [CONNECT_BADAUTH](#m-CONNECT_BADAUTH)
- [CONNECT_BADKEY](#m-CONNECT_BADKEY)
- [CONNECT_CONNECTION_REFUSED](#m-CONNECT_CONNECTION_REFUSED)
- [CONNECT_HOST_KEY_REJECTED](#m-CONNECT_HOST_KEY_REJECTED)
- [CONNECT_HOSTUNREACH](#m-CONNECT_HOSTUNREACH)
- [CONNECT_KEX_FAILED](#m-CONNECT_KEX_FAILED)
- [CONNECT_TIMEOUT](#m-CONNECT_TIMEOUT)
- [CONNECTION_GONE](#m-CONNECTION_GONE)
- [IN_USE](#m-IN_USE)
- [NED_EXTERNAL_ERROR](#m-NED_EXTERNAL_ERROR)
- [NED_INTERNAL_ERROR](#m-NED_INTERNAL_ERROR)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [toAtomString()](#m-toAtomString-a89f0452ee0b)
- [valueOf(int)](#m-valueOf-c0d46d25fc67)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### CONNECT_BADAUTH <a href="#m-CONNECT_BADAUTH" id="m-CONNECT_BADAUTH"></a>

```java
public static final com.tailf.ned.NedErrorCode CONNECT_BADAUTH;
```

### CONNECT_BADKEY <a href="#m-CONNECT_BADKEY" id="m-CONNECT_BADKEY"></a>

```java
public static final com.tailf.ned.NedErrorCode CONNECT_BADKEY;
```

### CONNECT_CONNECTION_REFUSED <a href="#m-CONNECT_CONNECTION_REFUSED" id="m-CONNECT_CONNECTION_REFUSED"></a>

```java
public static final com.tailf.ned.NedErrorCode CONNECT_CONNECTION_REFUSED;
```

### CONNECT_HOST_KEY_REJECTED <a href="#m-CONNECT_HOST_KEY_REJECTED" id="m-CONNECT_HOST_KEY_REJECTED"></a>

```java
public static final com.tailf.ned.NedErrorCode CONNECT_HOST_KEY_REJECTED;
```

### CONNECT_HOSTUNREACH <a href="#m-CONNECT_HOSTUNREACH" id="m-CONNECT_HOSTUNREACH"></a>

```java
public static final com.tailf.ned.NedErrorCode CONNECT_HOSTUNREACH;
```

### CONNECT_KEX_FAILED <a href="#m-CONNECT_KEX_FAILED" id="m-CONNECT_KEX_FAILED"></a>

```java
public static final com.tailf.ned.NedErrorCode CONNECT_KEX_FAILED;
```

### CONNECT_TIMEOUT <a href="#m-CONNECT_TIMEOUT" id="m-CONNECT_TIMEOUT"></a>

```java
public static final com.tailf.ned.NedErrorCode CONNECT_TIMEOUT;
```

### CONNECTION_GONE <a href="#m-CONNECTION_GONE" id="m-CONNECTION_GONE"></a>

```java
public static final com.tailf.ned.NedErrorCode CONNECTION_GONE;
```

### IN_USE <a href="#m-IN_USE" id="m-IN_USE"></a>

```java
public static final com.tailf.ned.NedErrorCode IN_USE;
```

### NED_EXTERNAL_ERROR <a href="#m-NED_EXTERNAL_ERROR" id="m-NED_EXTERNAL_ERROR"></a>

```java
public static final com.tailf.ned.NedErrorCode NED_EXTERNAL_ERROR;
```

### NED_INTERNAL_ERROR <a href="#m-NED_INTERNAL_ERROR" id="m-NED_INTERNAL_ERROR"></a>

```java
public static final com.tailf.ned.NedErrorCode NED_INTERNAL_ERROR;
```


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

Get the integer representation of the enum.

**Returns:** the integer representation of the error code

### toAtomString() <a href="#m-toAtomString-a89f0452ee0b" id="m-toAtomString-a89f0452ee0b"></a>

```java
public String toAtomString()
```

Get the string representation of the enum.

**Returns:** the string representation of the error code

### valueOf(int) <a href="#m-valueOf-c0d46d25fc67" id="m-valueOf-c0d46d25fc67"></a>

```java
public static com.tailf.ned.NedErrorCode valueOf(int i)
```

Types: [NedErrorCode](NedErrorCode.md#cls-NedErrorCode)

Get the NED error code from the given integer.

**Parameters**

- `int i`

**Returns:** the NED error code corresponding to the given integer

**Throws**

- `IllegalArgumentException` - if there is no corresponding
         NED error code

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.ned.NedErrorCode valueOf(String name)
```

Types: [NedErrorCode](NedErrorCode.md#cls-NedErrorCode)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.ned.NedErrorCode[] values()
```

Types: [NedErrorCode](NedErrorCode.md#cls-NedErrorCode)
