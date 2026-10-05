# AuthorizationCBType <a href="#authorizationcbtype-53c148cac4cd" id="authorizationcbtype-53c148cac4cd"></a>

```java
public enum com.tailf.dp.proto.AuthorizationCBType
```

Types: [AuthorizationCBType](AuthorizationCBType.md#authorizationcbtype-53c148cac4cd)

Enumeration of Authorization callback methods

## Members

**Enum Constants**:

- [CHECK\_CMD\_ACCESS](#check_cmd_access-8a77478fcfe0)
- [CHECK\_DATA\_ACCESS](#check_data_access-1aff0f5526c7)
- [CMD\_FILTER](#cmd_filter-202bdf5d983c)
- [DATA\_FILTER](#data_filter-fb72d718d64a)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### CHECK_CMD_ACCESS <a href="#check_cmd_access-8a77478fcfe0" id="check_cmd_access-8a77478fcfe0"></a>

```java
public static final com.tailf.dp.proto.AuthorizationCBType CHECK_CMD_ACCESS;
```

Authorization callback type for checking command access permissions.
 Used to verify if a user has permission to execute specific commands.

### CHECK_DATA_ACCESS <a href="#check_data_access-1aff0f5526c7" id="check_data_access-1aff0f5526c7"></a>

```java
public static final com.tailf.dp.proto.AuthorizationCBType CHECK_DATA_ACCESS;
```

Authorization callback type for checking data access permissions.
 Used to verify if a user has permission to access specific data elements.

### CMD_FILTER <a href="#cmd_filter-202bdf5d983c" id="cmd_filter-202bdf5d983c"></a>

```java
public static final com.tailf.dp.proto.AuthorizationCBType CMD_FILTER;
```

Authorization callback type for command filtering.
 Java API construct used to filter available commands based on user
 permissions.

### DATA_FILTER <a href="#data_filter-fb72d718d64a" id="data_filter-fb72d718d64a"></a>

```java
public static final com.tailf.dp.proto.AuthorizationCBType DATA_FILTER;
```

Authorization callback type for data filtering.
 Java API construct used to filter accessible data based on user
 permissions.


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.dp.proto.AuthorizationCBType valueOf(String name)
```

Types: [AuthorizationCBType](AuthorizationCBType.md#authorizationcbtype-53c148cac4cd)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.dp.proto.AuthorizationCBType[] values()
```

Types: [AuthorizationCBType](AuthorizationCBType.md#authorizationcbtype-53c148cac4cd)
