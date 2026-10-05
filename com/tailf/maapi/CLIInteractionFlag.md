# CLIInteractionFlag <a href="#cliinteractionflag-e5edaaf18139" id="cliinteractionflag-e5edaaf18139"></a>

```java
public enum com.tailf.maapi.CLIInteractionFlag
```

Types: [CLIInteractionFlag](CLIInteractionFlag.md#cliinteractionflag-e5edaaf18139)

flags for controlling cmd to CLI via CLIInteraction class

## Members

**Enum Constants**:

- [NO\_FULLPATH](#no_fullpath-9780bdb87de8)
- [NO\_HIDDEN](#no_hidden-2e1d61add5d6)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(int\)](#valueof-c0d46d25fc67)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### NO_FULLPATH <a href="#no_fullpath-9780bdb87de8" id="no_fullpath-9780bdb87de8"></a>

```java
public static final com.tailf.maapi.CLIInteractionFlag NO_FULLPATH;
```

Do not perform the full path check on show commands.

### NO_HIDDEN <a href="#no_hidden-2e1d61add5d6" id="no_hidden-2e1d61add5d6"></a>

```java
public static final com.tailf.maapi.CLIInteractionFlag NO_HIDDEN;
```

Allows execution of hidden CLI commands.


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#valueof-c0d46d25fc67" id="valueof-c0d46d25fc67"></a>

```java
public static com.tailf.maapi.CLIInteractionFlag valueOf(int i)
```

Types: [CLIInteractionFlag](CLIInteractionFlag.md#cliinteractionflag-e5edaaf18139)

**Parameters**

- `int i`

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.maapi.CLIInteractionFlag valueOf(String name)
```

Types: [CLIInteractionFlag](CLIInteractionFlag.md#cliinteractionflag-e5edaaf18139)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.CLIInteractionFlag[] values()
```

Types: [CLIInteractionFlag](CLIInteractionFlag.md#cliinteractionflag-e5edaaf18139)
