# UnSetCaseInChoice <a href="#unsetcaseinchoice-f6b21f3bb1fe" id="unsetcaseinchoice-f6b21f3bb1fe"></a>

```java
public static enum com.tailf.navu.NavuContextBase.UnSetCaseInChoice
```

Types: [UnSetCaseInChoice](UnSetCaseInChoice.md#unsetcaseinchoice-f6b21f3bb1fe)

The enumeration specifies the behavior
  when a case in a choice is not selected
  explicitly or implicitly.

## Members

**Enum Constants**:

- [ERROR_EXCEPTION](#error_exception-c1763e4fca52)
- [MUTE](#mute-8ea7a733cf2b)
- [WARN_LOG](#warn_log-aa99735ca482)
- [WARN_LOG_EXCEPTION](#warn_log_exception-76f5f52f87a1)

**Methods**:

- [valueOf(String)](#valueof-ac61b3547613)
- [values()](#values-406dfe3ca270)

## Enum Constants

### ERROR_EXCEPTION <a href="#error_exception-c1763e4fca52" id="error_exception-c1763e4fca52"></a>

```java
public static final com.tailf.navu.NavuContextBase.UnSetCaseInChoice ERROR_EXCEPTION;
```

Threat a unset case as a error
  throws exception NavuException.

### MUTE <a href="#mute-8ea7a733cf2b" id="mute-8ea7a733cf2b"></a>

```java
public static final com.tailf.navu.NavuContextBase.UnSetCaseInChoice MUTE;
```

Mute all warning messages in the log and
  no exception will be thrown.

### WARN_LOG <a href="#warn_log-aa99735ca482" id="warn_log-aa99735ca482"></a>

```java
public static final com.tailf.navu.NavuContextBase.UnSetCaseInChoice WARN_LOG;
```

Print warn message in the log
  no exception will be thrown.

### WARN_LOG_EXCEPTION <a href="#warn_log_exception-76f5f52f87a1" id="warn_log_exception-76f5f52f87a1"></a>

```java
public static final com.tailf.navu.NavuContextBase.UnSetCaseInChoice WARN_LOG_EXCEPTION;
```

Print warn message in the log
  and print the stacktrace as WARN
  in the the logger.


## Methods

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.navu.NavuContextBase.UnSetCaseInChoice valueOf(String name)
```

Types: [UnSetCaseInChoice](UnSetCaseInChoice.md#unsetcaseinchoice-f6b21f3bb1fe)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.navu.NavuContextBase.UnSetCaseInChoice[] values()
```

Types: [UnSetCaseInChoice](UnSetCaseInChoice.md#unsetcaseinchoice-f6b21f3bb1fe)
