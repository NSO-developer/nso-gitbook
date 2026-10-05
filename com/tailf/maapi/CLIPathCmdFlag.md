<a id="s-CLIPathCmdFlag"></a>
# CLIPathCmdFlag

```java
public enum com.tailf.maapi.CLIPathCmdFlag
```

Types: [CLIPathCmdFlag](CLIPathCmdFlag.md#s-CLIPathCmdFlag)

Flags used in [`Maapi`](Maapi.md#s-Maapi)

**Related classes**

- [CLIPathCmdFlag](CLIPathCmdFlag.md#s-CLIPathCmdFlag)

## Members

**Enum Constants**:

- [DELETE](#s-DELETE)
- [EMIT_PARENTS](#s-EMIT_PARENTS)
- [NON_RECURSIVE](#s-NON_RECURSIVE)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-DELETE"></a>
### DELETE

```java
public static final com.tailf.maapi.CLIPathCmdFlag DELETE;
```

Emit the command to delete the given path.

<a id="s-EMIT_PARENTS"></a>
### EMIT_PARENTS

```java
public static final com.tailf.maapi.CLIPathCmdFlag EMIT_PARENTS;
```

Enable the commands to reach the submode for the path to be emitted.

<a id="s-NON_RECURSIVE"></a>
### NON_RECURSIVE

```java
public static final com.tailf.maapi.CLIPathCmdFlag NON_RECURSIVE;
```

Prevent that all children to a container or list item are displayed.


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.maapi.CLIPathCmdFlag valueOf(String name)
```

Types: [CLIPathCmdFlag](CLIPathCmdFlag.md#s-CLIPathCmdFlag)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.maapi.CLIPathCmdFlag[] values()
```

Types: [CLIPathCmdFlag](CLIPathCmdFlag.md#s-CLIPathCmdFlag)
