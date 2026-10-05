<a id="cls-ErrorMessageFormatter"></a>
# ErrorMessageFormatter

```java
public class com.tailf.conf.ErrorMessageFormatter
```

## Members

**Constructors**:

- [ErrorMessageFormatter()](#m-errormessageformatter-e461b8487ab4)

**Methods**:

- [getDefaultErrorVerbosity()](#m-getdefaulterrorverbosity-e44604dc5cd5)
- [getErrorVerbosity()](#m-geterrorverbosity-defe49ca237d)
- [initCauseMessage(Throwable)](#m-initcausemessage-334589d04193)
- [setDefaultErrorVerbosity(ErrorVerbosity)](#m-setdefaulterrorverbosity-b04ecfc4dd74)
- [setErrorVerbosity(ErrorVerbosity)](#m-seterrorverbosity-bab7950e55c8)

## Constructors

<a id="m-errormessageformatter-e461b8487ab4"></a>
### ErrorMessageFormatter()

```java
public ErrorMessageFormatter()
```


## Methods

<a id="m-getdefaulterrorverbosity-e44604dc5cd5"></a>
### getDefaultErrorVerbosity()

```java
public static synchronized com.tailf.conf.ErrorVerbosity getDefaultErrorVerbosity()
```

Types: [ErrorVerbosity](ErrorVerbosity.md#cls-ErrorVerbosity)

Get the default verbosity level for reported errors
 This governs error verbosity for all Formatters which has not
 specifically set their local verbosity level with
 `ErrorVerbosity#setErrorVerbosity(ErrorVerbosity)`

**Returns:** the default ErrorVerbosity

<a id="m-geterrorverbosity-defe49ca237d"></a>
### getErrorVerbosity()

```java
public com.tailf.conf.ErrorVerbosity getErrorVerbosity()
```

Types: [ErrorVerbosity](ErrorVerbosity.md#cls-ErrorVerbosity)

Get the local verbosity level for reported errors
 If this verbosity is null the the default level governs the error
 verbosity of this Formatter

**Returns:** the local errorVerbosity

<a id="m-initcausemessage-334589d04193"></a>
### initCauseMessage(Throwable)

```java
public String initCauseMessage(Throwable e)
```

Compose a exception message from the top and initial cause messages.

**Parameters**

- `Throwable e`

**Returns:** the resulting exception message

<a id="m-setdefaulterrorverbosity-b04ecfc4dd74"></a>
### setDefaultErrorVerbosity(ErrorVerbosity)

```java
public static synchronized void setDefaultErrorVerbosity(com.tailf.conf.ErrorVerbosity verbosity)
```

Types: [ErrorVerbosity](ErrorVerbosity.md#cls-ErrorVerbosity)

Set the default verbosity level for reported errors
 This governs error verbosity for all Formatters which has not
 specifically set their local verbosity level with
 `ErrorVerbosity#setErrorVerbosity(ErrorVerbosity)`

**Parameters**

- `com.tailf.conf.ErrorVerbosity verbosity` - if null current value is left unchanged

<a id="m-seterrorverbosity-bab7950e55c8"></a>
### setErrorVerbosity(ErrorVerbosity)

```java
public void setErrorVerbosity(com.tailf.conf.ErrorVerbosity verbosity)
```

Types: [ErrorVerbosity](ErrorVerbosity.md#cls-ErrorVerbosity)

set the local verbosity level for reported errors
 If this verbosity is set to null the the default level governs the error
 verbosity of this Formatter

**Parameters**

- `com.tailf.conf.ErrorVerbosity verbosity`
