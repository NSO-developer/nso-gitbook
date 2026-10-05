# CLIPathCmdFlag <a href="#cls-CLIPathCmdFlag" id="cls-CLIPathCmdFlag"></a>

```java
public enum com.tailf.maapi.CLIPathCmdFlag
```

Types: [CLIPathCmdFlag](CLIPathCmdFlag.md#cls-CLIPathCmdFlag)

Flags used in `Maapi#CLIPathCmd(int,EnumSet,String,Object... )`

## Members

**Enum Constants**:

- [DELETE](#m-DELETE)
- [EMIT_PARENTS](#m-EMIT_PARENTS)
- [NON_RECURSIVE](#m-NON_RECURSIVE)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### DELETE <a href="#m-DELETE" id="m-DELETE"></a>

```java
public static final com.tailf.maapi.CLIPathCmdFlag DELETE;
```

Emit the command to delete the given path.

### EMIT_PARENTS <a href="#m-EMIT_PARENTS" id="m-EMIT_PARENTS"></a>

```java
public static final com.tailf.maapi.CLIPathCmdFlag EMIT_PARENTS;
```

Enable the commands to reach the submode for the path to be emitted.

### NON_RECURSIVE <a href="#m-NON_RECURSIVE" id="m-NON_RECURSIVE"></a>

```java
public static final com.tailf.maapi.CLIPathCmdFlag NON_RECURSIVE;
```

Prevent that all children to a container or list item are displayed.


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.maapi.CLIPathCmdFlag valueOf(String name)
```

Types: [CLIPathCmdFlag](CLIPathCmdFlag.md#cls-CLIPathCmdFlag)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.CLIPathCmdFlag[] values()
```

Types: [CLIPathCmdFlag](CLIPathCmdFlag.md#cls-CLIPathCmdFlag)
