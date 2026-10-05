<a id="cls-AuthorizationCBType"></a>
# AuthorizationCBType

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

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-CHECK_CMD_ACCESS"></a>
### CHECK_CMD_ACCESS

```java
public static final com.tailf.dp.proto.AuthorizationCBType CHECK_CMD_ACCESS;
```

Authorization callback type for checking command access permissions.
 Used to verify if a user has permission to execute specific commands.

<a id="m-CHECK_DATA_ACCESS"></a>
### CHECK_DATA_ACCESS

```java
public static final com.tailf.dp.proto.AuthorizationCBType CHECK_DATA_ACCESS;
```

Authorization callback type for checking data access permissions.
 Used to verify if a user has permission to access specific data elements.

<a id="m-CMD_FILTER"></a>
### CMD_FILTER

```java
public static final com.tailf.dp.proto.AuthorizationCBType CMD_FILTER;
```

Authorization callback type for command filtering.
 Java API construct used to filter available commands based on user
 permissions.

<a id="m-DATA_FILTER"></a>
### DATA_FILTER

```java
public static final com.tailf.dp.proto.AuthorizationCBType DATA_FILTER;
```

Authorization callback type for data filtering.
 Java API construct used to filter accessible data based on user
 permissions.


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.dp.proto.AuthorizationCBType valueOf(String name)
```

Types: [AuthorizationCBType](AuthorizationCBType.md#cls-AuthorizationCBType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.dp.proto.AuthorizationCBType[] values()
```

Types: [AuthorizationCBType](AuthorizationCBType.md#cls-AuthorizationCBType)
