# AuthorizationCBType <a href="#cls-AuthorizationCBType" id="cls-AuthorizationCBType"></a>

```java
public enum com.tailf.dp.proto.AuthorizationCBType
```

Types: [AuthorizationCBType](AuthorizationCBType.md#cls-AuthorizationCBType)

Enumeration of Authorization callback methods

## Members

**Enum Constants**:

- [CHECK_CMD_ACCESS](#m-CHECK_CMD_ACCESS)
- [CHECK_DATA_ACCESS](#m-CHECK_DATA_ACCESS)
- [CMD_FILTER](#m-CMD_FILTER)
- [DATA_FILTER](#m-DATA_FILTER)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### CHECK_CMD_ACCESS <a href="#m-CHECK_CMD_ACCESS" id="m-CHECK_CMD_ACCESS"></a>

```java
public static final com.tailf.dp.proto.AuthorizationCBType CHECK_CMD_ACCESS;
```

Authorization callback type for checking command access permissions.
 Used to verify if a user has permission to execute specific commands.

### CHECK_DATA_ACCESS <a href="#m-CHECK_DATA_ACCESS" id="m-CHECK_DATA_ACCESS"></a>

```java
public static final com.tailf.dp.proto.AuthorizationCBType CHECK_DATA_ACCESS;
```

Authorization callback type for checking data access permissions.
 Used to verify if a user has permission to access specific data elements.

### CMD_FILTER <a href="#m-CMD_FILTER" id="m-CMD_FILTER"></a>

```java
public static final com.tailf.dp.proto.AuthorizationCBType CMD_FILTER;
```

Authorization callback type for command filtering.
 Java API construct used to filter available commands based on user
 permissions.

### DATA_FILTER <a href="#m-DATA_FILTER" id="m-DATA_FILTER"></a>

```java
public static final com.tailf.dp.proto.AuthorizationCBType DATA_FILTER;
```

Authorization callback type for data filtering.
 Java API construct used to filter accessible data based on user
 permissions.


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.dp.proto.AuthorizationCBType valueOf(String name)
```

Types: [AuthorizationCBType](AuthorizationCBType.md#cls-AuthorizationCBType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.dp.proto.AuthorizationCBType[] values()
```

Types: [AuthorizationCBType](AuthorizationCBType.md#cls-AuthorizationCBType)
