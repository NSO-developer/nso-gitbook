<a id="cls-DpCallbackException"></a>
# DpCallbackException

```java
public class com.tailf.dp.DpCallbackException
    extends com.tailf.dp.DpException
```

Types: [DpException](DpException.md#cls-DpException)

Exception thrown from inside callbacks to identify problems.
 Care should be taken to set reasonable ErrorCodes for new exceptions

**Related classes**

- [DpCallbackExtendedException](DpCallbackExtendedException.md#cls-DpCallbackExtendedException)
- [DpCallbackWarningException](DpCallbackWarningException.md#cls-DpCallbackWarningException)

## Members

**Constructors**:

- [DpCallbackException(String)](#m-dpcallbackexception-a5652d7c1d08)
- [DpCallbackException(String, ErrorCode)](#m-dpcallbackexception-53b98f1d2897)
- [DpCallbackException(String, ErrorCode, Throwable)](#m-dpcallbackexception-1c2ed9d506c2)
- [DpCallbackException(String, Throwable)](#m-dpcallbackexception-3f993a79a901)
- [DpCallbackException(Throwable)](#m-dpcallbackexception-24c1c7bd7c34)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](DpException.md#m-mk-de1cedfc6ea8) from DpException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

<a id="m-dpcallbackexception-a5652d7c1d08"></a>
### DpCallbackException(String)

```java
public DpCallbackException(String msg)
```

**Parameters**

- `String msg`

<a id="m-dpcallbackexception-53b98f1d2897"></a>
### DpCallbackException(String, ErrorCode)

```java
public DpCallbackException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

<a id="m-dpcallbackexception-1c2ed9d506c2"></a>
### DpCallbackException(String, ErrorCode, Throwable)

```java
public DpCallbackException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

<a id="m-dpcallbackexception-3f993a79a901"></a>
### DpCallbackException(String, Throwable)

```java
public DpCallbackException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

<a id="m-dpcallbackexception-24c1c7bd7c34"></a>
### DpCallbackException(Throwable)

```java
public DpCallbackException(Throwable cause)
```

**Parameters**

- `Throwable cause`
