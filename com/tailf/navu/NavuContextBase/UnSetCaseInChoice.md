<a id="s-UnSetCaseInChoice"></a>
# UnSetCaseInChoice

```java
public static enum com.tailf.navu.NavuContextBase.UnSetCaseInChoice
```

Types: [UnSetCaseInChoice](UnSetCaseInChoice.md#s-UnSetCaseInChoice)

The enumeration specifies the behavior
  when a case in a choice is not selected
  explicitly or implicitly.

**Related classes**

- [UnSetCaseInChoice](UnSetCaseInChoice.md#s-UnSetCaseInChoice)

## Members

**Enum Constants**:

- [ERROR_EXCEPTION](#s-ERROR_EXCEPTION)
- [MUTE](#s-MUTE)
- [WARN_LOG](#s-WARN_LOG)
- [WARN_LOG_EXCEPTION](#s-WARN_LOG_EXCEPTION)

**Methods**:

- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-ERROR_EXCEPTION"></a>
### ERROR_EXCEPTION

```java
public static final com.tailf.navu.NavuContextBase.UnSetCaseInChoice ERROR_EXCEPTION;
```

Threat a unset case as a error
  throws exception NavuException.

<a id="s-MUTE"></a>
### MUTE

```java
public static final com.tailf.navu.NavuContextBase.UnSetCaseInChoice MUTE;
```

Mute all warning messages in the log and
  no exception will be thrown.

<a id="s-WARN_LOG"></a>
### WARN_LOG

```java
public static final com.tailf.navu.NavuContextBase.UnSetCaseInChoice WARN_LOG;
```

Print warn message in the log
  no exception will be thrown.

<a id="s-WARN_LOG_EXCEPTION"></a>
### WARN_LOG_EXCEPTION

```java
public static final com.tailf.navu.NavuContextBase.UnSetCaseInChoice WARN_LOG_EXCEPTION;
```

Print warn message in the log
  and print the stacktrace as WARN
  in the the logger.


## Methods

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.navu.NavuContextBase.UnSetCaseInChoice valueOf(String name)
```

Types: [UnSetCaseInChoice](UnSetCaseInChoice.md#s-UnSetCaseInChoice)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.navu.NavuContextBase.UnSetCaseInChoice[] values()
```

Types: [UnSetCaseInChoice](UnSetCaseInChoice.md#s-UnSetCaseInChoice)
