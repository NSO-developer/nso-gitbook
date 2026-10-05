<a id="cls-ErrorVerbosity"></a>
# ErrorVerbosity

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

- [valueOf(int)](#m-valueof-c0d46d25fc67)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-STANDARD"></a>
### STANDARD

```java
public static final com.tailf.conf.ErrorVerbosity STANDARD;
```

Message from top level Exception is reported

<a id="m-TRACE"></a>
### TRACE

```java
public static final com.tailf.conf.ErrorVerbosity TRACE;
```

As VERBOSE plus complete bottom Exception stack trace is reported

<a id="m-VERBOSE"></a>
### VERBOSE

```java
public static final com.tailf.conf.ErrorVerbosity VERBOSE;
```

As STANDARD plus message from bottom level Exception is reported


## Methods

<a id="m-valueof-c0d46d25fc67"></a>
### valueOf(int)

```java
public static com.tailf.conf.ErrorVerbosity valueOf(int ordinal)
```

Types: [ErrorVerbosity](ErrorVerbosity.md#cls-ErrorVerbosity)

**Parameters**

- `int ordinal`

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.conf.ErrorVerbosity valueOf(String name)
```

Types: [ErrorVerbosity](ErrorVerbosity.md#cls-ErrorVerbosity)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.conf.ErrorVerbosity[] values()
```

Types: [ErrorVerbosity](ErrorVerbosity.md#cls-ErrorVerbosity)
