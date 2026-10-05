<a id="s-CLIInteractionFlag"></a>
# CLIInteractionFlag

```java
public enum com.tailf.maapi.CLIInteractionFlag
```

Types: [CLIInteractionFlag](CLIInteractionFlag.md#s-CLIInteractionFlag)

flags for controlling cmd to CLI via CLIInteraction class

**Related classes**

- [CLIInteractionFlag](CLIInteractionFlag.md#s-CLIInteractionFlag)

## Members

**Enum Constants**:

- [NO_FULLPATH](#s-NO_FULLPATH)
- [NO_HIDDEN](#s-NO_HIDDEN)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(int)](#s-valueOf)
- [valueOf(String)](#s-valueOf-1)
- [values()](#s-values)

## Enum Constants

<a id="s-NO_FULLPATH"></a>
### NO_FULLPATH

```java
public static final com.tailf.maapi.CLIInteractionFlag NO_FULLPATH;
```

Do not perform the full path check on show commands.

<a id="s-NO_HIDDEN"></a>
### NO_HIDDEN

```java
public static final com.tailf.maapi.CLIInteractionFlag NO_HIDDEN;
```

Allows execution of hidden CLI commands.


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-valueOf"></a>
### valueOf(int)

```java
public static com.tailf.maapi.CLIInteractionFlag valueOf(int i)
```

Types: [CLIInteractionFlag](CLIInteractionFlag.md#s-CLIInteractionFlag)

**Parameters**

- `int i`

<a id="s-valueOf-1"></a>
### valueOf(String)

```java
public static com.tailf.maapi.CLIInteractionFlag valueOf(String name)
```

Types: [CLIInteractionFlag](CLIInteractionFlag.md#s-CLIInteractionFlag)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.maapi.CLIInteractionFlag[] values()
```

Types: [CLIInteractionFlag](CLIInteractionFlag.md#s-CLIInteractionFlag)
