# ErrorVerbosity <a href="#cls-ErrorVerbosity" id="cls-ErrorVerbosity"></a>

```java
public enum com.tailf.conf.ErrorVerbosity
```

Types: [ErrorVerbosity](ErrorVerbosity.md#cls-ErrorVerbosity)

verbosity levels for reported errors

## Members

**Enum Constants**:

- [STANDARD](#m-STANDARD)
- [TRACE](#m-TRACE)
- [VERBOSE](#m-VERBOSE)

**Methods**:

- [valueOf(int)](#m-valueOf-c0d46d25fc67)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### STANDARD <a href="#m-STANDARD" id="m-STANDARD"></a>

```java
public static final com.tailf.conf.ErrorVerbosity STANDARD;
```

Message from top level Exception is reported

### TRACE <a href="#m-TRACE" id="m-TRACE"></a>

```java
public static final com.tailf.conf.ErrorVerbosity TRACE;
```

As VERBOSE plus complete bottom Exception stack trace is reported

### VERBOSE <a href="#m-VERBOSE" id="m-VERBOSE"></a>

```java
public static final com.tailf.conf.ErrorVerbosity VERBOSE;
```

As STANDARD plus message from bottom level Exception is reported


## Methods

### valueOf(int) <a href="#m-valueOf-c0d46d25fc67" id="m-valueOf-c0d46d25fc67"></a>

```java
public static com.tailf.conf.ErrorVerbosity valueOf(int ordinal)
```

Types: [ErrorVerbosity](ErrorVerbosity.md#cls-ErrorVerbosity)

**Parameters**

- `int ordinal`

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.conf.ErrorVerbosity valueOf(String name)
```

Types: [ErrorVerbosity](ErrorVerbosity.md#cls-ErrorVerbosity)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.conf.ErrorVerbosity[] values()
```

Types: [ErrorVerbosity](ErrorVerbosity.md#cls-ErrorVerbosity)
