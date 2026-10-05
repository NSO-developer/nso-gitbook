<a id="cls-UnSetCaseInChoice"></a>
# UnSetCaseInChoice

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

- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-ERROR_EXCEPTION"></a>
### ERROR_EXCEPTION

```java
public static final com.tailf.navu.NavuContextBase.UnSetCaseInChoice ERROR_EXCEPTION;
```

Threat a unset case as a error
  throws exception NavuException.

<a id="m-MUTE"></a>
### MUTE

```java
public static final com.tailf.navu.NavuContextBase.UnSetCaseInChoice MUTE;
```

Mute all warning messages in the log and
  no exception will be thrown.

<a id="m-WARN_LOG"></a>
### WARN_LOG

```java
public static final com.tailf.navu.NavuContextBase.UnSetCaseInChoice WARN_LOG;
```

Print warn message in the log
  no exception will be thrown.

<a id="m-WARN_LOG_EXCEPTION"></a>
### WARN_LOG_EXCEPTION

```java
public static final com.tailf.navu.NavuContextBase.UnSetCaseInChoice WARN_LOG_EXCEPTION;
```

Print warn message in the log
  and print the stacktrace as WARN
  in the the logger.


## Methods

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.navu.NavuContextBase.UnSetCaseInChoice valueOf(String name)
```

Types: [UnSetCaseInChoice](UnSetCaseInChoice.md#cls-UnSetCaseInChoice)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.navu.NavuContextBase.UnSetCaseInChoice[] values()
```

Types: [UnSetCaseInChoice](UnSetCaseInChoice.md#cls-UnSetCaseInChoice)
