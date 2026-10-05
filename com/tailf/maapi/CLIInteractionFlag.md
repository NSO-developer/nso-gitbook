# CLIInteractionFlag <a href="#cls-CLIInteractionFlag" id="cls-CLIInteractionFlag"></a>

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

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(int)](#m-valueOf-c0d46d25fc67)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### NO_FULLPATH <a href="#m-NO_FULLPATH" id="m-NO_FULLPATH"></a>

```java
public static final com.tailf.maapi.CLIInteractionFlag NO_FULLPATH;
```

Do not perform the full path check on show commands.

### NO_HIDDEN <a href="#m-NO_HIDDEN" id="m-NO_HIDDEN"></a>

```java
public static final com.tailf.maapi.CLIInteractionFlag NO_HIDDEN;
```

Allows execution of hidden CLI commands.


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#m-valueOf-c0d46d25fc67" id="m-valueOf-c0d46d25fc67"></a>

```java
public static com.tailf.maapi.CLIInteractionFlag valueOf(int i)
```

Types: [CLIInteractionFlag](CLIInteractionFlag.md#cls-CLIInteractionFlag)

**Parameters**

- `int i`

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.maapi.CLIInteractionFlag valueOf(String name)
```

Types: [CLIInteractionFlag](CLIInteractionFlag.md#cls-CLIInteractionFlag)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.CLIInteractionFlag[] values()
```

Types: [CLIInteractionFlag](CLIInteractionFlag.md#cls-CLIInteractionFlag)
