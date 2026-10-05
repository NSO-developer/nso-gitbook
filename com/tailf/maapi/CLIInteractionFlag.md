<a id="cls-CLIInteractionFlag"></a>
# CLIInteractionFlag

```java
public enum com.tailf.maapi.CLIInteractionFlag
```

Types: [CLIInteractionFlag](CLIInteractionFlag.md#cls-CLIInteractionFlag)

flags for controlling cmd to CLI via CLIInteraction class

## Members

**Enum Constants**:

- [NO_FULLPATH](#m-NO_FULLPATH)
- [NO_HIDDEN](#m-NO_HIDDEN)

**Methods**:

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(int)](#m-valueof-c0d46d25fc67)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-NO_FULLPATH"></a>
### NO_FULLPATH

```java
public static final com.tailf.maapi.CLIInteractionFlag NO_FULLPATH;
```

Do not perform the full path check on show commands.

<a id="m-NO_HIDDEN"></a>
### NO_HIDDEN

```java
public static final com.tailf.maapi.CLIInteractionFlag NO_HIDDEN;
```

Allows execution of hidden CLI commands.


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

<a id="m-valueof-c0d46d25fc67"></a>
### valueOf(int)

```java
public static com.tailf.maapi.CLIInteractionFlag valueOf(int i)
```

Types: [CLIInteractionFlag](CLIInteractionFlag.md#cls-CLIInteractionFlag)

**Parameters**

- `int i`

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.maapi.CLIInteractionFlag valueOf(String name)
```

Types: [CLIInteractionFlag](CLIInteractionFlag.md#cls-CLIInteractionFlag)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.maapi.CLIInteractionFlag[] values()
```

Types: [CLIInteractionFlag](CLIInteractionFlag.md#cls-CLIInteractionFlag)
