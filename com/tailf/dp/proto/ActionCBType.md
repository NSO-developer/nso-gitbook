<a id="cls-ActionCBType"></a>
# ActionCBType

```java
public enum com.tailf.dp.proto.ActionCBType
```

Types: [ActionCBType](ActionCBType.md#cls-ActionCBType)

Enumeration of Action callback methods

**Since:** 3.2.0

## Members

**Enum Constants**:

- [ABORT](#m-ABORT)
- [ACTION](#m-ACTION)
- [COMMAND](#m-COMMAND)
- [COMPLETION](#m-COMPLETION)
- [INIT](#m-INIT)

**Methods**:

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-ABORT"></a>
### ABORT

```java
public static final com.tailf.dp.proto.ActionCBType ABORT;
```

Abort callback type for user-initiated action termination.

<a id="m-ACTION"></a>
### ACTION

```java
public static final com.tailf.dp.proto.ActionCBType ACTION;
```

Main action callback type for YANG action execution.

<a id="m-COMMAND"></a>
### COMMAND

```java
public static final com.tailf.dp.proto.ActionCBType COMMAND;
```

Command callback type for CLI command execution.

<a id="m-COMPLETION"></a>
### COMPLETION

```java
public static final com.tailf.dp.proto.ActionCBType COMPLETION;
```

Completion callback type for CLI auto-completion and help.

<a id="m-INIT"></a>
### INIT

```java
public static final com.tailf.dp.proto.ActionCBType INIT;
```

Initialization callback type for action callbacks.


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
public static com.tailf.dp.proto.ActionCBType valueOf(String name)
```

Types: [ActionCBType](ActionCBType.md#cls-ActionCBType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.dp.proto.ActionCBType[] values()
```

Types: [ActionCBType](ActionCBType.md#cls-ActionCBType)
