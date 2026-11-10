# ActionCBType <a href="#actioncbtype-10d0222e8e66" id="actioncbtype-10d0222e8e66"></a>

```java
public enum com.tailf.dp.proto.ActionCBType
```

Enumeration of Action callback methods

**Since:** 3.2.0

## Members

**Enum Constants**:

- [ABORT](#abort-7ca9e5aa43c8)
- [ACTION](#action-c6b3ffa6be67)
- [COMMAND](#command-b0176ed668be)
- [COMPLETION](#completion-5e04d27371ea)
- [INIT](#init-5407b9c86a37)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### ABORT <a href="#abort-7ca9e5aa43c8" id="abort-7ca9e5aa43c8"></a>

```java
ABORT(DpProto.MASK_ACT_ABORT);
```

Abort callback type for user-initiated action termination.

### ACTION <a href="#action-c6b3ffa6be67" id="action-c6b3ffa6be67"></a>

```java
ACTION(DpProto.MASK_ACT_ACTION);
```

Main action callback type for YANG action execution.

### COMMAND <a href="#command-b0176ed668be" id="command-b0176ed668be"></a>

```java
COMMAND(DpProto.MASK_ACT_COMMAND);
```

Command callback type for CLI command execution.

### COMPLETION <a href="#completion-5e04d27371ea" id="completion-5e04d27371ea"></a>

```java
COMPLETION(DpProto.MASK_ACT_COMPLETION);
```

Completion callback type for CLI auto-completion and help.

### INIT <a href="#init-5407b9c86a37" id="init-5407b9c86a37"></a>

```java
INIT(DpProto.MASK_ACT_INIT);
```

Initialization callback type for action callbacks.


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.dp.proto.ActionCBType valueOf(String name)
```

Types: [ActionCBType](ActionCBType.md#actioncbtype-10d0222e8e66)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.dp.proto.ActionCBType[] values()
```

Types: [ActionCBType](ActionCBType.md#actioncbtype-10d0222e8e66)
