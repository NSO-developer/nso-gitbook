<a id="s-ErrorVerbosity"></a>
# ErrorVerbosity

```java
public enum com.tailf.conf.ErrorVerbosity
```

Types: [ErrorVerbosity](ErrorVerbosity.md#s-ErrorVerbosity)

verbosity levels for reported errors

**Related classes**

- [ErrorVerbosity](ErrorVerbosity.md#s-ErrorVerbosity)

## Members

**Enum Constants**:

- [STANDARD](#s-STANDARD)
- [TRACE](#s-TRACE)
- [VERBOSE](#s-VERBOSE)

**Methods**:

- [valueOf(int)](#s-valueOf)
- [valueOf(String)](#s-valueOf-1)
- [values()](#s-values)

## Enum Constants

<a id="s-STANDARD"></a>
### STANDARD

```java
public static final com.tailf.conf.ErrorVerbosity STANDARD;
```

Message from top level Exception is reported

<a id="s-TRACE"></a>
### TRACE

```java
public static final com.tailf.conf.ErrorVerbosity TRACE;
```

As VERBOSE plus complete bottom Exception stack trace is reported

<a id="s-VERBOSE"></a>
### VERBOSE

```java
public static final com.tailf.conf.ErrorVerbosity VERBOSE;
```

As STANDARD plus message from bottom level Exception is reported


## Methods

<a id="s-valueOf"></a>
### valueOf(int)

```java
public static com.tailf.conf.ErrorVerbosity valueOf(int ordinal)
```

Types: [ErrorVerbosity](ErrorVerbosity.md#s-ErrorVerbosity)

**Parameters**

- `int ordinal`

<a id="s-valueOf-1"></a>
### valueOf(String)

```java
public static com.tailf.conf.ErrorVerbosity valueOf(String name)
```

Types: [ErrorVerbosity](ErrorVerbosity.md#s-ErrorVerbosity)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.conf.ErrorVerbosity[] values()
```

Types: [ErrorVerbosity](ErrorVerbosity.md#s-ErrorVerbosity)
