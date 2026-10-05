<a id="s-NedErrorCode"></a>
# NedErrorCode

```java
public enum com.tailf.ned.NedErrorCode
```

Types: [NedErrorCode](NedErrorCode.md#s-NedErrorCode)

**Related classes**

- [NedErrorCode](NedErrorCode.md#s-NedErrorCode)

## Members

**Enum Constants**:

- [CONNECT_BADAUTH](#s-CONNECT_BADAUTH)
- [CONNECT_BADKEY](#s-CONNECT_BADKEY)
- [CONNECT_CONNECTION_REFUSED](#s-CONNECT_CONNECTION_REFUSED)
- [CONNECT_HOST_KEY_REJECTED](#s-CONNECT_HOST_KEY_REJECTED)
- [CONNECT_HOSTUNREACH](#s-CONNECT_HOSTUNREACH)
- [CONNECT_KEX_FAILED](#s-CONNECT_KEX_FAILED)
- [CONNECT_TIMEOUT](#s-CONNECT_TIMEOUT)
- [CONNECTION_GONE](#s-CONNECTION_GONE)
- [IN_USE](#s-IN_USE)
- [NED_EXTERNAL_ERROR](#s-NED_EXTERNAL_ERROR)
- [NED_INTERNAL_ERROR](#s-NED_INTERNAL_ERROR)

**Methods**:

- [getValue()](#s-getValue)
- [toAtomString()](#s-toAtomString)
- [valueOf(int)](#s-valueOf)
- [valueOf(String)](#s-valueOf-1)
- [values()](#s-values)

## Enum Constants

<a id="s-CONNECT_BADAUTH"></a>
### CONNECT_BADAUTH

```java
public static final com.tailf.ned.NedErrorCode CONNECT_BADAUTH;
```

<a id="s-CONNECT_BADKEY"></a>
### CONNECT_BADKEY

```java
public static final com.tailf.ned.NedErrorCode CONNECT_BADKEY;
```

<a id="s-CONNECT_CONNECTION_REFUSED"></a>
### CONNECT_CONNECTION_REFUSED

```java
public static final com.tailf.ned.NedErrorCode CONNECT_CONNECTION_REFUSED;
```

<a id="s-CONNECT_HOST_KEY_REJECTED"></a>
### CONNECT_HOST_KEY_REJECTED

```java
public static final com.tailf.ned.NedErrorCode CONNECT_HOST_KEY_REJECTED;
```

<a id="s-CONNECT_HOSTUNREACH"></a>
### CONNECT_HOSTUNREACH

```java
public static final com.tailf.ned.NedErrorCode CONNECT_HOSTUNREACH;
```

<a id="s-CONNECT_KEX_FAILED"></a>
### CONNECT_KEX_FAILED

```java
public static final com.tailf.ned.NedErrorCode CONNECT_KEX_FAILED;
```

<a id="s-CONNECT_TIMEOUT"></a>
### CONNECT_TIMEOUT

```java
public static final com.tailf.ned.NedErrorCode CONNECT_TIMEOUT;
```

<a id="s-CONNECTION_GONE"></a>
### CONNECTION_GONE

```java
public static final com.tailf.ned.NedErrorCode CONNECTION_GONE;
```

<a id="s-IN_USE"></a>
### IN_USE

```java
public static final com.tailf.ned.NedErrorCode IN_USE;
```

<a id="s-NED_EXTERNAL_ERROR"></a>
### NED_EXTERNAL_ERROR

```java
public static final com.tailf.ned.NedErrorCode NED_EXTERNAL_ERROR;
```

<a id="s-NED_INTERNAL_ERROR"></a>
### NED_INTERNAL_ERROR

```java
public static final com.tailf.ned.NedErrorCode NED_INTERNAL_ERROR;
```


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

Get the integer representation of the enum.

**Returns:** the integer representation of the error code

<a id="s-toAtomString"></a>
### toAtomString()

```java
public String toAtomString()
```

Get the string representation of the enum.

**Returns:** the string representation of the error code

<a id="s-valueOf"></a>
### valueOf(int)

```java
public static com.tailf.ned.NedErrorCode valueOf(int i)
```

Types: [NedErrorCode](NedErrorCode.md#s-NedErrorCode)

Get the NED error code from the given integer.

**Parameters**

- `int i`

**Returns:** the NED error code corresponding to the given integer

**Throws**

- `IllegalArgumentException` - if there is no corresponding
         NED error code

<a id="s-valueOf-1"></a>
### valueOf(String)

```java
public static com.tailf.ned.NedErrorCode valueOf(String name)
```

Types: [NedErrorCode](NedErrorCode.md#s-NedErrorCode)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.ned.NedErrorCode[] values()
```

Types: [NedErrorCode](NedErrorCode.md#s-NedErrorCode)
