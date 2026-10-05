<a id="cls-CLIPathCmdFlag"></a>
# CLIPathCmdFlag

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

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-DELETE"></a>
### DELETE

```java
public static final com.tailf.maapi.CLIPathCmdFlag DELETE;
```

Emit the command to delete the given path.

<a id="m-EMIT_PARENTS"></a>
### EMIT_PARENTS

```java
public static final com.tailf.maapi.CLIPathCmdFlag EMIT_PARENTS;
```

Enable the commands to reach the submode for the path to be emitted.

<a id="m-NON_RECURSIVE"></a>
### NON_RECURSIVE

```java
public static final com.tailf.maapi.CLIPathCmdFlag NON_RECURSIVE;
```

Prevent that all children to a container or list item are displayed.


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.maapi.CLIPathCmdFlag valueOf(String name)
```

Types: [CLIPathCmdFlag](CLIPathCmdFlag.md#cls-CLIPathCmdFlag)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.maapi.CLIPathCmdFlag[] values()
```

Types: [CLIPathCmdFlag](CLIPathCmdFlag.md#cls-CLIPathCmdFlag)
