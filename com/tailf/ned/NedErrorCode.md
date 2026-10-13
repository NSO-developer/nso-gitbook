# NedErrorCode <a href="#nederrorcode-e5f6e08a55a2" id="nederrorcode-e5f6e08a55a2"></a>

```java
public enum com.tailf.ned.NedErrorCode
```

## Members

**Enum Constants**:

- [CONNECT\_BADAUTH](#connect_badauth-7335ef6f22db)
- [CONNECT\_BADKEY](#connect_badkey-e91f2ec9a06b)
- [CONNECT\_CONNECTION\_REFUSED](#connect_connection_refused-2749682d78b8)
- [CONNECT\_HOST\_KEY\_REJECTED](#connect_host_key_rejected-a0751ad2484d)
- [CONNECT\_HOSTUNREACH](#connect_hostunreach-2e8b49fe247c)
- [CONNECT\_KEX\_FAILED](#connect_kex_failed-277147eb318b)
- [CONNECT\_TIMEOUT](#connect_timeout-38526d2fcecb)
- [CONNECTION\_GONE](#connection_gone-fa4baf17f4de)
- [IN\_USE](#in_use-17f334a1bb80)
- [NED\_EXTERNAL\_ERROR](#ned_external_error-d7323c5395f7)
- [NED\_INTERNAL\_ERROR](#ned_internal_error-ae25a59e68ef)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [toAtomString\(\)](#toatomstring-a89f0452ee0b)
- [valueOf\(int\)](#valueof-c0d46d25fc67)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### CONNECT_BADAUTH <a href="#connect_badauth-7335ef6f22db" id="connect_badauth-7335ef6f22db"></a>

```java
CONNECT_BADAUTH(7);
```

### CONNECT_BADKEY <a href="#connect_badkey-e91f2ec9a06b" id="connect_badkey-e91f2ec9a06b"></a>

```java
CONNECT_BADKEY(4);
```

### CONNECT_CONNECTION_REFUSED <a href="#connect_connection_refused-2749682d78b8" id="connect_connection_refused-2749682d78b8"></a>

```java
CONNECT_CONNECTION_REFUSED(1);
```

### CONNECT_HOST_KEY_REJECTED <a href="#connect_host_key_rejected-a0751ad2484d" id="connect_host_key_rejected-a0751ad2484d"></a>

```java
CONNECT_HOST_KEY_REJECTED(6);
```

### CONNECT_HOSTUNREACH <a href="#connect_hostunreach-2e8b49fe247c" id="connect_hostunreach-2e8b49fe247c"></a>

```java
CONNECT_HOSTUNREACH(5);
```

### CONNECT_KEX_FAILED <a href="#connect_kex_failed-277147eb318b" id="connect_kex_failed-277147eb318b"></a>

```java
CONNECT_KEX_FAILED(12);
```

### CONNECT_TIMEOUT <a href="#connect_timeout-38526d2fcecb" id="connect_timeout-38526d2fcecb"></a>

```java
CONNECT_TIMEOUT(2);
```

### CONNECTION_GONE <a href="#connection_gone-fa4baf17f4de" id="connection_gone-fa4baf17f4de"></a>

```java
CONNECTION_GONE(10);
```

### IN_USE <a href="#in_use-17f334a1bb80" id="in_use-17f334a1bb80"></a>

```java
IN_USE(9);
```

### NED_EXTERNAL_ERROR <a href="#ned_external_error-d7323c5395f7" id="ned_external_error-d7323c5395f7"></a>

```java
NED_EXTERNAL_ERROR(8);
```

### NED_INTERNAL_ERROR <a href="#ned_internal_error-ae25a59e68ef" id="ned_internal_error-ae25a59e68ef"></a>

```java
NED_INTERNAL_ERROR(100);
```


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

Get the integer representation of the enum.

**Returns:** the integer representation of the error code

### toAtomString() <a href="#toatomstring-a89f0452ee0b" id="toatomstring-a89f0452ee0b"></a>

```java
public String toAtomString()
```

Get the string representation of the enum.

**Returns:** the string representation of the error code

### valueOf(int) <a href="#valueof-c0d46d25fc67" id="valueof-c0d46d25fc67"></a>

```java
public static com.tailf.ned.NedErrorCode valueOf(int i)
```

Types: [NedErrorCode](NedErrorCode.md#nederrorcode-e5f6e08a55a2)

Get the NED error code from the given integer.

**Parameters**

- `int i`

**Returns:** the NED error code corresponding to the given integer

**Throws**

- `IllegalArgumentException` - if there is no corresponding
         NED error code

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.ned.NedErrorCode valueOf(String name)
```

Types: [NedErrorCode](NedErrorCode.md#nederrorcode-e5f6e08a55a2)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.ned.NedErrorCode[] values()
```

Types: [NedErrorCode](NedErrorCode.md#nederrorcode-e5f6e08a55a2)
