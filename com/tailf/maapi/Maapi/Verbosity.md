<a id="s-Verbosity"></a>
# Verbosity

```java
public static enum com.tailf.maapi.Maapi.Verbosity
```

Types: [Verbosity](Verbosity.md#s-Verbosity)

To be used in:
 `#reportProgress(int,Verbosity,String)`
 [`ConfPath`](../../conf/ConfPath.md#s-ConfPath)

**Related classes**

- [Verbosity](Verbosity.md#s-Verbosity)

## Members

**Enum Constants**:

- [DEBUG](#s-DEBUG)
- [NORMAL](#s-NORMAL)
- [VERBOSE](#s-VERBOSE)
- [VERY_VERBOSE](#s-VERY_VERBOSE)

**Methods**:

- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-DEBUG"></a>
### DEBUG

```java
public static final com.tailf.maapi.Maapi.Verbosity DEBUG;
```

The highest verbosity level. Designates fine-grained informational
 messages usable for debugging the application and its internal
 operations.

<a id="s-NORMAL"></a>
### NORMAL

```java
public static final com.tailf.maapi.Maapi.Verbosity NORMAL;
```

Designates informational messages that highlight the progress
 of the application at coarse-granined level. Used mainly to
 give a high level overview. This is the default and the lowest
 verbosity level.

<a id="s-VERBOSE"></a>
### VERBOSE

```java
public static final com.tailf.maapi.Maapi.Verbosity VERBOSE;
```

Designates detailed informational messages from the application.

<a id="s-VERY_VERBOSE"></a>
### VERY_VERBOSE

```java
public static final com.tailf.maapi.Maapi.Verbosity VERY_VERBOSE;
```

Designates very detailed informational messages from the application
 and its internal operations.


## Methods

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.maapi.Maapi.Verbosity valueOf(String name)
```

Types: [Verbosity](Verbosity.md#s-Verbosity)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.maapi.Maapi.Verbosity[] values()
```

Types: [Verbosity](Verbosity.md#s-Verbosity)
