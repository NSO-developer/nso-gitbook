# Verbosity <a href="#verbosity-a9c618ec424f" id="verbosity-a9c618ec424f"></a>

```java
public static enum com.tailf.maapi.Maapi.Verbosity
```

Types: [Verbosity](Verbosity.md#verbosity-a9c618ec424f)

To be used in:
 `reportProgress(int,Verbosity,String)`
 `reportServiceProgress(int,Verbosity,String,ConfPath)`

## Members

**Enum Constants**:

- [DEBUG](#debug-51c942f8d798)
- [NORMAL](#normal-b34e6bc0c9ca)
- [VERBOSE](#verbose-cb0b793dd2e1)
- [VERY_VERBOSE](#very_verbose-cb7e3570f916)

**Methods**:

- [valueOf(String)](#valueof-ac61b3547613)
- [values()](#values-406dfe3ca270)

## Enum Constants

### DEBUG <a href="#debug-51c942f8d798" id="debug-51c942f8d798"></a>

```java
public static final com.tailf.maapi.Maapi.Verbosity DEBUG;
```

The highest verbosity level. Designates fine-grained informational
 messages usable for debugging the application and its internal
 operations.

### NORMAL <a href="#normal-b34e6bc0c9ca" id="normal-b34e6bc0c9ca"></a>

```java
public static final com.tailf.maapi.Maapi.Verbosity NORMAL;
```

Designates informational messages that highlight the progress
 of the application at coarse-granined level. Used mainly to
 give a high level overview. This is the default and the lowest
 verbosity level.

### VERBOSE <a href="#verbose-cb0b793dd2e1" id="verbose-cb0b793dd2e1"></a>

```java
public static final com.tailf.maapi.Maapi.Verbosity VERBOSE;
```

Designates detailed informational messages from the application.

### VERY_VERBOSE <a href="#very_verbose-cb7e3570f916" id="very_verbose-cb7e3570f916"></a>

```java
public static final com.tailf.maapi.Maapi.Verbosity VERY_VERBOSE;
```

Designates very detailed informational messages from the application
 and its internal operations.


## Methods

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.maapi.Maapi.Verbosity valueOf(String name)
```

Types: [Verbosity](Verbosity.md#verbosity-a9c618ec424f)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.Maapi.Verbosity[] values()
```

Types: [Verbosity](Verbosity.md#verbosity-a9c618ec424f)
