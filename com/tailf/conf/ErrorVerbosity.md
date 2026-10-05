# ErrorVerbosity <a href="#errorverbosity-7dabb9fc7bcd" id="errorverbosity-7dabb9fc7bcd"></a>

```java
public enum com.tailf.conf.ErrorVerbosity
```

Types: [ErrorVerbosity](ErrorVerbosity.md#errorverbosity-7dabb9fc7bcd)

verbosity levels for reported errors

## Members

**Enum Constants**:

- [STANDARD](#standard-4bb7f6f1f62c)
- [TRACE](#trace-30aa7fcb1d67)
- [VERBOSE](#verbose-cb0b793dd2e1)

**Methods**:

- [valueOf(int)](#valueof-c0d46d25fc67)
- [valueOf(String)](#valueof-ac61b3547613)
- [values()](#values-406dfe3ca270)

## Enum Constants

### STANDARD <a href="#standard-4bb7f6f1f62c" id="standard-4bb7f6f1f62c"></a>

```java
public static final com.tailf.conf.ErrorVerbosity STANDARD;
```

Message from top level Exception is reported

### TRACE <a href="#trace-30aa7fcb1d67" id="trace-30aa7fcb1d67"></a>

```java
public static final com.tailf.conf.ErrorVerbosity TRACE;
```

As VERBOSE plus complete bottom Exception stack trace is reported

### VERBOSE <a href="#verbose-cb0b793dd2e1" id="verbose-cb0b793dd2e1"></a>

```java
public static final com.tailf.conf.ErrorVerbosity VERBOSE;
```

As STANDARD plus message from bottom level Exception is reported


## Methods

### valueOf(int) <a href="#valueof-c0d46d25fc67" id="valueof-c0d46d25fc67"></a>

```java
public static com.tailf.conf.ErrorVerbosity valueOf(int ordinal)
```

Types: [ErrorVerbosity](ErrorVerbosity.md#errorverbosity-7dabb9fc7bcd)

**Parameters**

- `int ordinal`

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.conf.ErrorVerbosity valueOf(String name)
```

Types: [ErrorVerbosity](ErrorVerbosity.md#errorverbosity-7dabb9fc7bcd)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.conf.ErrorVerbosity[] values()
```

Types: [ErrorVerbosity](ErrorVerbosity.md#errorverbosity-7dabb9fc7bcd)
