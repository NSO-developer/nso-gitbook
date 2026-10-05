# ActionCBType <a href="#cls-ActionCBType" id="cls-ActionCBType"></a>

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

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### ABORT <a href="#m-ABORT" id="m-ABORT"></a>

```java
public static final com.tailf.dp.proto.ActionCBType ABORT;
```

Abort callback type for user-initiated action termination.

### ACTION <a href="#m-ACTION" id="m-ACTION"></a>

```java
public static final com.tailf.dp.proto.ActionCBType ACTION;
```

Main action callback type for YANG action execution.

### COMMAND <a href="#m-COMMAND" id="m-COMMAND"></a>

```java
public static final com.tailf.dp.proto.ActionCBType COMMAND;
```

Command callback type for CLI command execution.

### COMPLETION <a href="#m-COMPLETION" id="m-COMPLETION"></a>

```java
public static final com.tailf.dp.proto.ActionCBType COMPLETION;
```

Completion callback type for CLI auto-completion and help.

### INIT <a href="#m-INIT" id="m-INIT"></a>

```java
public static final com.tailf.dp.proto.ActionCBType INIT;
```

Initialization callback type for action callbacks.


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.dp.proto.ActionCBType valueOf(String name)
```

Types: [ActionCBType](ActionCBType.md#cls-ActionCBType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.dp.proto.ActionCBType[] values()
```

Types: [ActionCBType](ActionCBType.md#cls-ActionCBType)
