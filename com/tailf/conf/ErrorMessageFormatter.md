# ErrorMessageFormatter <a href="#errormessageformatter-ac64ccc06c80" id="errormessageformatter-ac64ccc06c80"></a>

```java
public class com.tailf.conf.ErrorMessageFormatter
```

## Members

**Constructors**:

- [ErrorMessageFormatter\(\)](#errormessageformatter-e461b8487ab4)

**Methods**:

- [getDefaultErrorVerbosity\(\)](#getdefaulterrorverbosity-e44604dc5cd5)
- [getErrorVerbosity\(\)](#geterrorverbosity-defe49ca237d)
- [initCauseMessage\(Throwable\)](#initcausemessage-334589d04193)
- [setDefaultErrorVerbosity\(ErrorVerbosity\)](#setdefaulterrorverbosity-b04ecfc4dd74)
- [setErrorVerbosity\(ErrorVerbosity\)](#seterrorverbosity-bab7950e55c8)

## Constructors

### ErrorMessageFormatter() <a href="#errormessageformatter-e461b8487ab4" id="errormessageformatter-e461b8487ab4"></a>

```java
public ErrorMessageFormatter()
```


## Methods

### getDefaultErrorVerbosity() <a href="#getdefaulterrorverbosity-e44604dc5cd5" id="getdefaulterrorverbosity-e44604dc5cd5"></a>

```java
public static synchronized com.tailf.conf.ErrorVerbosity getDefaultErrorVerbosity()
```

Types: [ErrorVerbosity](ErrorVerbosity.md#errorverbosity-7dabb9fc7bcd)

Get the default verbosity level for reported errors
 This governs error verbosity for all Formatters which has not
 specifically set their local verbosity level with
 `setErrorVerbosity(ErrorVerbosity)`

**Returns:** the default ErrorVerbosity

### getErrorVerbosity() <a href="#geterrorverbosity-defe49ca237d" id="geterrorverbosity-defe49ca237d"></a>

```java
public com.tailf.conf.ErrorVerbosity getErrorVerbosity()
```

Types: [ErrorVerbosity](ErrorVerbosity.md#errorverbosity-7dabb9fc7bcd)

Get the local verbosity level for reported errors
 If this verbosity is null the the default level governs the error
 verbosity of this Formatter

**Returns:** the local errorVerbosity

### initCauseMessage(Throwable) <a href="#initcausemessage-334589d04193" id="initcausemessage-334589d04193"></a>

```java
public String initCauseMessage(Throwable e)
```

Compose a exception message from the top and initial cause messages.

**Parameters**

- `Throwable e`

**Returns:** the resulting exception message

### setDefaultErrorVerbosity(ErrorVerbosity) <a href="#setdefaulterrorverbosity-b04ecfc4dd74" id="setdefaulterrorverbosity-b04ecfc4dd74"></a>

```java
public static synchronized void setDefaultErrorVerbosity(com.tailf.conf.ErrorVerbosity verbosity)
```

Types: [ErrorVerbosity](ErrorVerbosity.md#errorverbosity-7dabb9fc7bcd)

Set the default verbosity level for reported errors
 This governs error verbosity for all Formatters which has not
 specifically set their local verbosity level with
 `setErrorVerbosity(ErrorVerbosity)`

**Parameters**

- `com.tailf.conf.ErrorVerbosity verbosity` - if null current value is left unchanged

### setErrorVerbosity(ErrorVerbosity) <a href="#seterrorverbosity-bab7950e55c8" id="seterrorverbosity-bab7950e55c8"></a>

```java
public void setErrorVerbosity(com.tailf.conf.ErrorVerbosity verbosity)
```

Types: [ErrorVerbosity](ErrorVerbosity.md#errorverbosity-7dabb9fc7bcd)

set the local verbosity level for reported errors
 If this verbosity is set to null the the default level governs the error
 verbosity of this Formatter

**Parameters**

- `com.tailf.conf.ErrorVerbosity verbosity`
