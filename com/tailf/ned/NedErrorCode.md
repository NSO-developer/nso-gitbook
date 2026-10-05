<a id="cls-NedErrorCode"></a>
# NedErrorCode

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

- [getValue()](#m-getvalue-d93864668c40)
- [toAtomString()](#m-toatomstring-a89f0452ee0b)
- [valueOf(int)](#m-valueof-c0d46d25fc67)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-CONNECT_BADAUTH"></a>
### CONNECT_BADAUTH

```java
public static final com.tailf.ned.NedErrorCode CONNECT_BADAUTH;
```

<a id="m-CONNECT_BADKEY"></a>
### CONNECT_BADKEY

```java
public static final com.tailf.ned.NedErrorCode CONNECT_BADKEY;
```

<a id="m-CONNECT_CONNECTION_REFUSED"></a>
### CONNECT_CONNECTION_REFUSED

```java
public static final com.tailf.ned.NedErrorCode CONNECT_CONNECTION_REFUSED;
```

<a id="m-CONNECT_HOST_KEY_REJECTED"></a>
### CONNECT_HOST_KEY_REJECTED

```java
public static final com.tailf.ned.NedErrorCode CONNECT_HOST_KEY_REJECTED;
```

<a id="m-CONNECT_HOSTUNREACH"></a>
### CONNECT_HOSTUNREACH

```java
public static final com.tailf.ned.NedErrorCode CONNECT_HOSTUNREACH;
```

<a id="m-CONNECT_KEX_FAILED"></a>
### CONNECT_KEX_FAILED

```java
public static final com.tailf.ned.NedErrorCode CONNECT_KEX_FAILED;
```

<a id="m-CONNECT_TIMEOUT"></a>
### CONNECT_TIMEOUT

```java
public static final com.tailf.ned.NedErrorCode CONNECT_TIMEOUT;
```

<a id="m-CONNECTION_GONE"></a>
### CONNECTION_GONE

```java
public static final com.tailf.ned.NedErrorCode CONNECTION_GONE;
```

<a id="m-IN_USE"></a>
### IN_USE

```java
public static final com.tailf.ned.NedErrorCode IN_USE;
```

<a id="m-NED_EXTERNAL_ERROR"></a>
### NED_EXTERNAL_ERROR

```java
public static final com.tailf.ned.NedErrorCode NED_EXTERNAL_ERROR;
```

<a id="m-NED_INTERNAL_ERROR"></a>
### NED_INTERNAL_ERROR

```java
public static final com.tailf.ned.NedErrorCode NED_INTERNAL_ERROR;
```


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

Get the integer representation of the enum.

**Returns:** the integer representation of the error code

<a id="m-toatomstring-a89f0452ee0b"></a>
### toAtomString()

```java
public String toAtomString()
```

Get the string representation of the enum.

**Returns:** the string representation of the error code

<a id="m-valueof-c0d46d25fc67"></a>
### valueOf(int)

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

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.ned.NedErrorCode valueOf(String name)
```

Types: [NedErrorCode](NedErrorCode.md#cls-NedErrorCode)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.ned.NedErrorCode[] values()
```

Types: [NedErrorCode](NedErrorCode.md#cls-NedErrorCode)
