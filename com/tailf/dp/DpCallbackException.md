# DpCallbackException <a href="#cls-DpCallbackException" id="cls-DpCallbackException"></a>

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

- [DpCallbackException(String)](#m-DpCallbackException-a5652d7c1d08)
- [DpCallbackException(String, ErrorCode)](#m-DpCallbackException-53b98f1d2897)
- [DpCallbackException(String, ErrorCode, Throwable)](#m-DpCallbackException-1c2ed9d506c2)
- [DpCallbackException(String, Throwable)](#m-DpCallbackException-3f993a79a901)
- [DpCallbackException(Throwable)](#m-DpCallbackException-24c1c7bd7c34)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-getErrorCode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getOpaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](DpException.md#m-mk-de1cedfc6ea8) from DpException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

### DpCallbackException(String) <a href="#m-DpCallbackException-a5652d7c1d08" id="m-DpCallbackException-a5652d7c1d08"></a>

```java
public DpCallbackException(String msg)
```

**Parameters**

- `String msg`

### DpCallbackException(String, ErrorCode) <a href="#m-DpCallbackException-53b98f1d2897" id="m-DpCallbackException-53b98f1d2897"></a>

```java
public DpCallbackException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

### DpCallbackException(String, ErrorCode, Throwable) <a href="#m-DpCallbackException-1c2ed9d506c2" id="m-DpCallbackException-1c2ed9d506c2"></a>

```java
public DpCallbackException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

### DpCallbackException(String, Throwable) <a href="#m-DpCallbackException-3f993a79a901" id="m-DpCallbackException-3f993a79a901"></a>

```java
public DpCallbackException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

### DpCallbackException(Throwable) <a href="#m-DpCallbackException-24c1c7bd7c34" id="m-DpCallbackException-24c1c7bd7c34"></a>

```java
public DpCallbackException(Throwable cause)
```

**Parameters**

- `Throwable cause`
