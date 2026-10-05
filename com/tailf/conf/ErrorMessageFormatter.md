<a id="s-ErrorMessageFormatter"></a>
# ErrorMessageFormatter

```java
public class com.tailf.conf.ErrorMessageFormatter
```

## Members

**Constructors**:

- [ErrorMessageFormatter()](#s-ErrorMessageFormatter-1)

**Methods**:

- [getDefaultErrorVerbosity()](#s-getDefaultErrorVerbosity)
- [getErrorVerbosity()](#s-getErrorVerbosity)
- [initCauseMessage(Throwable)](#s-initCauseMessage)
- [setDefaultErrorVerbosity(ErrorVerbosity)](#s-setDefaultErrorVerbosity)
- [setErrorVerbosity(ErrorVerbosity)](#s-setErrorVerbosity)

## Constructors

<a id="s-ErrorMessageFormatter-1"></a>
### ErrorMessageFormatter()

```java
public ErrorMessageFormatter()
```


## Methods

<a id="s-getDefaultErrorVerbosity"></a>
### getDefaultErrorVerbosity()

```java
public static synchronized com.tailf.conf.ErrorVerbosity getDefaultErrorVerbosity()
```

Types: [ErrorVerbosity](ErrorVerbosity.md#s-ErrorVerbosity)

Get the default verbosity level for reported errors
 This governs error verbosity for all Formatters which has not
 specifically set their local verbosity level with
 [`ErrorVerbosity`](ErrorVerbosity.md#s-ErrorVerbosity)

**Returns:** the default ErrorVerbosity

<a id="s-getErrorVerbosity"></a>
### getErrorVerbosity()

```java
public com.tailf.conf.ErrorVerbosity getErrorVerbosity()
```

Types: [ErrorVerbosity](ErrorVerbosity.md#s-ErrorVerbosity)

Get the local verbosity level for reported errors
 If this verbosity is null the the default level governs the error
 verbosity of this Formatter

**Returns:** the local errorVerbosity

<a id="s-initCauseMessage"></a>
### initCauseMessage(Throwable)

```java
public String initCauseMessage(Throwable e)
```

Compose a exception message from the top and initial cause messages.

**Parameters**

- `Throwable e`

**Returns:** the resulting exception message

<a id="s-setDefaultErrorVerbosity"></a>
### setDefaultErrorVerbosity(ErrorVerbosity)

```java
public static synchronized void setDefaultErrorVerbosity(com.tailf.conf.ErrorVerbosity verbosity)
```

Types: [ErrorVerbosity](ErrorVerbosity.md#s-ErrorVerbosity)

Set the default verbosity level for reported errors
 This governs error verbosity for all Formatters which has not
 specifically set their local verbosity level with
 [`ErrorVerbosity`](ErrorVerbosity.md#s-ErrorVerbosity)

**Parameters**

- `com.tailf.conf.ErrorVerbosity verbosity` - if null current value is left unchanged

<a id="s-setErrorVerbosity"></a>
### setErrorVerbosity(ErrorVerbosity)

```java
public void setErrorVerbosity(com.tailf.conf.ErrorVerbosity verbosity)
```

Types: [ErrorVerbosity](ErrorVerbosity.md#s-ErrorVerbosity)

set the local verbosity level for reported errors
 If this verbosity is set to null the the default level governs the error
 verbosity of this Formatter

**Parameters**

- `com.tailf.conf.ErrorVerbosity verbosity`
