<a id="s-DpCallbackException"></a>
# DpCallbackException

```java
public class com.tailf.dp.DpCallbackException
    extends com.tailf.dp.DpException
```

Types: [DpException](DpException.md#s-DpException)

Exception thrown from inside callbacks to identify problems.
 Care should be taken to set reasonable ErrorCodes for new exceptions

**Related classes**

- [DpCallbackExtendedException](DpCallbackExtendedException.md#s-DpCallbackExtendedException)
- [DpCallbackWarningException](DpCallbackWarningException.md#s-DpCallbackWarningException)

## Members

**Constructors**:

- [DpCallbackException(String)](#s-DpCallbackException-1)
- [DpCallbackException(String, ErrorCode)](#s-DpCallbackException-2)
- [DpCallbackException(String, ErrorCode, Throwable)](#s-DpCallbackException-3)
- [DpCallbackException(String, Throwable)](#s-DpCallbackException-4)
- [DpCallbackException(Throwable)](#s-DpCallbackException-5)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#s-getErrorCode) from ConfException
- [getOpaque()](../conf/ConfException.md#s-getOpaque) from ConfException
- [mk(ConfResponse)](DpException.md#s-mk) from DpException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#s-mk-1) from ConfException

## Constructors

<a id="s-DpCallbackException-1"></a>
### DpCallbackException(String)

```java
public DpCallbackException(String msg)
```

**Parameters**

- `String msg`

<a id="s-DpCallbackException-2"></a>
### DpCallbackException(String, ErrorCode)

```java
public DpCallbackException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#s-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

<a id="s-DpCallbackException-3"></a>
### DpCallbackException(String, ErrorCode, Throwable)

```java
public DpCallbackException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#s-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

<a id="s-DpCallbackException-4"></a>
### DpCallbackException(String, Throwable)

```java
public DpCallbackException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

<a id="s-DpCallbackException-5"></a>
### DpCallbackException(Throwable)

```java
public DpCallbackException(Throwable cause)
```

**Parameters**

- `Throwable cause`
