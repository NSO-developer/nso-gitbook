# Verbosity <a href="#cls-Verbosity" id="cls-Verbosity"></a>

```java
public static enum com.tailf.maapi.Maapi.Verbosity
```

Types: [Verbosity](Verbosity.md#cls-Verbosity)

To be used in:
 `reportProgress(int,Verbosity,String)`
 `reportServiceProgress(int,Verbosity,String,ConfPath)`

## Members

**Enum Constants**:

- [DEBUG](#m-DEBUG)
- [NORMAL](#m-NORMAL)
- [VERBOSE](#m-VERBOSE)
- [VERY_VERBOSE](#m-VERY_VERBOSE)

**Methods**:

- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### DEBUG <a href="#m-DEBUG" id="m-DEBUG"></a>

```java
public static final com.tailf.maapi.Maapi.Verbosity DEBUG;
```

The highest verbosity level. Designates fine-grained informational
 messages usable for debugging the application and its internal
 operations.

### NORMAL <a href="#m-NORMAL" id="m-NORMAL"></a>

```java
public static final com.tailf.maapi.Maapi.Verbosity NORMAL;
```

Designates informational messages that highlight the progress
 of the application at coarse-granined level. Used mainly to
 give a high level overview. This is the default and the lowest
 verbosity level.

### VERBOSE <a href="#m-VERBOSE" id="m-VERBOSE"></a>

```java
public static final com.tailf.maapi.Maapi.Verbosity VERBOSE;
```

Designates detailed informational messages from the application.

### VERY_VERBOSE <a href="#m-VERY_VERBOSE" id="m-VERY_VERBOSE"></a>

```java
public static final com.tailf.maapi.Maapi.Verbosity VERY_VERBOSE;
```

Designates very detailed informational messages from the application
 and its internal operations.


## Methods

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.maapi.Maapi.Verbosity valueOf(String name)
```

Types: [Verbosity](Verbosity.md#cls-Verbosity)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.Maapi.Verbosity[] values()
```

Types: [Verbosity](Verbosity.md#cls-Verbosity)
