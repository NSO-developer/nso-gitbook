# ErrorMessageFormatter <a href="#cls-ErrorMessageFormatter" id="cls-ErrorMessageFormatter"></a>

```java
public class com.tailf.conf.ErrorMessageFormatter
```

## Members

**Constructors**:

- [ErrorMessageFormatter()](#m-ErrorMessageFormatter-e461b8487ab4)

**Methods**:

- [getDefaultErrorVerbosity()](#m-getDefaultErrorVerbosity-e44604dc5cd5)
- [getErrorVerbosity()](#m-getErrorVerbosity-defe49ca237d)
- [initCauseMessage(Throwable)](#m-initCauseMessage-334589d04193)
- [setDefaultErrorVerbosity(ErrorVerbosity)](#m-setDefaultErrorVerbosity-b04ecfc4dd74)
- [setErrorVerbosity(ErrorVerbosity)](#m-setErrorVerbosity-bab7950e55c8)

## Constructors

### ErrorMessageFormatter() <a href="#m-ErrorMessageFormatter-e461b8487ab4" id="m-ErrorMessageFormatter-e461b8487ab4"></a>

```java
public ErrorMessageFormatter()
```


## Methods

### getDefaultErrorVerbosity() <a href="#m-getDefaultErrorVerbosity-e44604dc5cd5" id="m-getDefaultErrorVerbosity-e44604dc5cd5"></a>

```java
public static synchronized com.tailf.conf.ErrorVerbosity getDefaultErrorVerbosity()
```

Types: [ErrorVerbosity](ErrorVerbosity.md#cls-ErrorVerbosity)

Get the default verbosity level for reported errors
 This governs error verbosity for all Formatters which has not
 specifically set their local verbosity level with
 `setErrorVerbosity(ErrorVerbosity)`

**Returns:** the default ErrorVerbosity

### getErrorVerbosity() <a href="#m-getErrorVerbosity-defe49ca237d" id="m-getErrorVerbosity-defe49ca237d"></a>

```java
public com.tailf.conf.ErrorVerbosity getErrorVerbosity()
```

Types: [ErrorVerbosity](ErrorVerbosity.md#cls-ErrorVerbosity)

Get the local verbosity level for reported errors
 If this verbosity is null the the default level governs the error
 verbosity of this Formatter

**Returns:** the local errorVerbosity

### initCauseMessage(Throwable) <a href="#m-initCauseMessage-334589d04193" id="m-initCauseMessage-334589d04193"></a>

```java
public String initCauseMessage(Throwable e)
```

Compose a exception message from the top and initial cause messages.

**Parameters**

- `Throwable e`

**Returns:** the resulting exception message

### setDefaultErrorVerbosity(ErrorVerbosity) <a href="#m-setDefaultErrorVerbosity-b04ecfc4dd74" id="m-setDefaultErrorVerbosity-b04ecfc4dd74"></a>

```java
public static synchronized void setDefaultErrorVerbosity(com.tailf.conf.ErrorVerbosity verbosity)
```

Types: [ErrorVerbosity](ErrorVerbosity.md#cls-ErrorVerbosity)

Set the default verbosity level for reported errors
 This governs error verbosity for all Formatters which has not
 specifically set their local verbosity level with
 `setErrorVerbosity(ErrorVerbosity)`

**Parameters**

- `com.tailf.conf.ErrorVerbosity verbosity` - if null current value is left unchanged

### setErrorVerbosity(ErrorVerbosity) <a href="#m-setErrorVerbosity-bab7950e55c8" id="m-setErrorVerbosity-bab7950e55c8"></a>

```java
public void setErrorVerbosity(com.tailf.conf.ErrorVerbosity verbosity)
```

Types: [ErrorVerbosity](ErrorVerbosity.md#cls-ErrorVerbosity)

set the local verbosity level for reported errors
 If this verbosity is set to null the the default level governs the error
 verbosity of this Formatter

**Parameters**

- `com.tailf.conf.ErrorVerbosity verbosity`
