# UnSetCaseInChoice <a href="#cls-UnSetCaseInChoice" id="cls-UnSetCaseInChoice"></a>

```java
public static enum com.tailf.navu.NavuContextBase.UnSetCaseInChoice
```

Types: [UnSetCaseInChoice](UnSetCaseInChoice.md#cls-UnSetCaseInChoice)

The enumeration specifies the behavior
  when a case in a choice is not selected
  explicitly or implicitly.

## Members

**Enum Constants**:

- [ERROR_EXCEPTION](#m-ERROR_EXCEPTION)
- [MUTE](#m-MUTE)
- [WARN_LOG](#m-WARN_LOG)
- [WARN_LOG_EXCEPTION](#m-WARN_LOG_EXCEPTION)

**Methods**:

- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### ERROR_EXCEPTION <a href="#m-ERROR_EXCEPTION" id="m-ERROR_EXCEPTION"></a>

```java
public static final com.tailf.navu.NavuContextBase.UnSetCaseInChoice ERROR_EXCEPTION;
```

Threat a unset case as a error
  throws exception NavuException.

### MUTE <a href="#m-MUTE" id="m-MUTE"></a>

```java
public static final com.tailf.navu.NavuContextBase.UnSetCaseInChoice MUTE;
```

Mute all warning messages in the log and
  no exception will be thrown.

### WARN_LOG <a href="#m-WARN_LOG" id="m-WARN_LOG"></a>

```java
public static final com.tailf.navu.NavuContextBase.UnSetCaseInChoice WARN_LOG;
```

Print warn message in the log
  no exception will be thrown.

### WARN_LOG_EXCEPTION <a href="#m-WARN_LOG_EXCEPTION" id="m-WARN_LOG_EXCEPTION"></a>

```java
public static final com.tailf.navu.NavuContextBase.UnSetCaseInChoice WARN_LOG_EXCEPTION;
```

Print warn message in the log
  and print the stacktrace as WARN
  in the the logger.


## Methods

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.navu.NavuContextBase.UnSetCaseInChoice valueOf(String name)
```

Types: [UnSetCaseInChoice](UnSetCaseInChoice.md#cls-UnSetCaseInChoice)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.navu.NavuContextBase.UnSetCaseInChoice[] values()
```

Types: [UnSetCaseInChoice](UnSetCaseInChoice.md#cls-UnSetCaseInChoice)
