<a id="s-AuthorizationCBType"></a>
# AuthorizationCBType

```java
public enum com.tailf.dp.proto.AuthorizationCBType
```

Types: [AuthorizationCBType](AuthorizationCBType.md#s-AuthorizationCBType)

Enumeration of Authorization callback methods

**Related classes**

- [AuthorizationCBType](AuthorizationCBType.md#s-AuthorizationCBType)

## Members

**Enum Constants**:

- [CHECK_CMD_ACCESS](#s-CHECK_CMD_ACCESS)
- [CHECK_DATA_ACCESS](#s-CHECK_DATA_ACCESS)
- [CMD_FILTER](#s-CMD_FILTER)
- [DATA_FILTER](#s-DATA_FILTER)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-CHECK_CMD_ACCESS"></a>
### CHECK_CMD_ACCESS

```java
public static final com.tailf.dp.proto.AuthorizationCBType CHECK_CMD_ACCESS;
```

Authorization callback type for checking command access permissions.
 Used to verify if a user has permission to execute specific commands.

<a id="s-CHECK_DATA_ACCESS"></a>
### CHECK_DATA_ACCESS

```java
public static final com.tailf.dp.proto.AuthorizationCBType CHECK_DATA_ACCESS;
```

Authorization callback type for checking data access permissions.
 Used to verify if a user has permission to access specific data elements.

<a id="s-CMD_FILTER"></a>
### CMD_FILTER

```java
public static final com.tailf.dp.proto.AuthorizationCBType CMD_FILTER;
```

Authorization callback type for command filtering.
 Java API construct used to filter available commands based on user
 permissions.

<a id="s-DATA_FILTER"></a>
### DATA_FILTER

```java
public static final com.tailf.dp.proto.AuthorizationCBType DATA_FILTER;
```

Authorization callback type for data filtering.
 Java API construct used to filter accessible data based on user
 permissions.


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.dp.proto.AuthorizationCBType valueOf(String name)
```

Types: [AuthorizationCBType](AuthorizationCBType.md#s-AuthorizationCBType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.dp.proto.AuthorizationCBType[] values()
```

Types: [AuthorizationCBType](AuthorizationCBType.md#s-AuthorizationCBType)
