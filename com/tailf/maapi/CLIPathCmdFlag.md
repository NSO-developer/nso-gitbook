# CLIPathCmdFlag <a href="#clipathcmdflag-23bdfd65bbce" id="clipathcmdflag-23bdfd65bbce"></a>

```java
public enum com.tailf.maapi.CLIPathCmdFlag
```

Flags used in `Maapi#CLIPathCmd(int,EnumSet,String,Object... )`

## Members

**Enum Constants**:

- [DELETE](#delete-17bb47048092)
- [EMIT\_PARENTS](#emit_parents-7672db479b6c)
- [NON\_RECURSIVE](#non_recursive-560671442c67)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### DELETE <a href="#delete-17bb47048092" id="delete-17bb47048092"></a>

```java
DELETE(1 << 1);
```

Emit the command to delete the given path.

### EMIT_PARENTS <a href="#emit_parents-7672db479b6c" id="emit_parents-7672db479b6c"></a>

```java
EMIT_PARENTS(1 << 0);
```

Enable the commands to reach the submode for the path to be emitted.

### NON_RECURSIVE <a href="#non_recursive-560671442c67" id="non_recursive-560671442c67"></a>

```java
NON_RECURSIVE(1 << 2);
```

Prevent that all children to a container or list item are displayed.


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.maapi.CLIPathCmdFlag valueOf(String name)
```

Types: [CLIPathCmdFlag](CLIPathCmdFlag.md#clipathcmdflag-23bdfd65bbce)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.CLIPathCmdFlag[] values()
```

Types: [CLIPathCmdFlag](CLIPathCmdFlag.md#clipathcmdflag-23bdfd65bbce)
