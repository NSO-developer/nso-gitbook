<a id="cls-Verbosity"></a>
# Verbosity

```java
public static enum com.tailf.maapi.Maapi.Verbosity
```

Types: [Verbosity](Verbosity.md#cls-Verbosity)

To be used in:
 `#reportProgress(int,Verbosity,String)`
 `ConfPath#reportServiceProgress(int,Verbosity,String,ConfPath)`

## Members

**Enum Constants**:

- [DEBUG](#m-DEBUG)
- [NORMAL](#m-NORMAL)
- [VERBOSE](#m-VERBOSE)
- [VERY_VERBOSE](#m-VERY_VERBOSE)

**Methods**:

- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-DEBUG"></a>
### DEBUG

```java
public static final com.tailf.maapi.Maapi.Verbosity DEBUG;
```

The highest verbosity level. Designates fine-grained informational
 messages usable for debugging the application and its internal
 operations.

<a id="m-NORMAL"></a>
### NORMAL

```java
public static final com.tailf.maapi.Maapi.Verbosity NORMAL;
```

Designates informational messages that highlight the progress
 of the application at coarse-granined level. Used mainly to
 give a high level overview. This is the default and the lowest
 verbosity level.

<a id="m-VERBOSE"></a>
### VERBOSE

```java
public static final com.tailf.maapi.Maapi.Verbosity VERBOSE;
```

Designates detailed informational messages from the application.

<a id="m-VERY_VERBOSE"></a>
### VERY_VERBOSE

```java
public static final com.tailf.maapi.Maapi.Verbosity VERY_VERBOSE;
```

Designates very detailed informational messages from the application
 and its internal operations.


## Methods

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.maapi.Maapi.Verbosity valueOf(String name)
```

Types: [Verbosity](Verbosity.md#cls-Verbosity)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.maapi.Maapi.Verbosity[] values()
```

Types: [Verbosity](Verbosity.md#cls-Verbosity)
