<a id="s-ActionCBType"></a>
# ActionCBType

```java
public enum com.tailf.dp.proto.ActionCBType
```

Types: [ActionCBType](ActionCBType.md#s-ActionCBType)

Enumeration of Action callback methods

**Related classes**

- [ActionCBType](ActionCBType.md#s-ActionCBType)

**Since:** 3.2.0

## Members

**Enum Constants**:

- [ABORT](#s-ABORT)
- [ACTION](#s-ACTION)
- [COMMAND](#s-COMMAND)
- [COMPLETION](#s-COMPLETION)
- [INIT](#s-INIT)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-ABORT"></a>
### ABORT

```java
public static final com.tailf.dp.proto.ActionCBType ABORT;
```

Abort callback type for user-initiated action termination.

<a id="s-ACTION"></a>
### ACTION

```java
public static final com.tailf.dp.proto.ActionCBType ACTION;
```

Main action callback type for YANG action execution.

<a id="s-COMMAND"></a>
### COMMAND

```java
public static final com.tailf.dp.proto.ActionCBType COMMAND;
```

Command callback type for CLI command execution.

<a id="s-COMPLETION"></a>
### COMPLETION

```java
public static final com.tailf.dp.proto.ActionCBType COMPLETION;
```

Completion callback type for CLI auto-completion and help.

<a id="s-INIT"></a>
### INIT

```java
public static final com.tailf.dp.proto.ActionCBType INIT;
```

Initialization callback type for action callbacks.


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
public static com.tailf.dp.proto.ActionCBType valueOf(String name)
```

Types: [ActionCBType](ActionCBType.md#s-ActionCBType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.dp.proto.ActionCBType[] values()
```

Types: [ActionCBType](ActionCBType.md#s-ActionCBType)
