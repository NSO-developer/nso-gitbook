# DpCallbackException <a href="#dpcallbackexception-faf15838e5cb" id="dpcallbackexception-faf15838e5cb"></a>

```java
public class com.tailf.dp.DpCallbackException
    extends com.tailf.dp.DpException
```

Types: [DpException](DpException.md#dpexception-79c01c670be8)

Exception thrown from inside callbacks to identify problems.
 Care should be taken to set reasonable ErrorCodes for new exceptions

**Related classes**

- [DpCallbackExtendedException](DpCallbackExtendedException.md#dpcallbackextendedexception-56110945bf17)
- [DpCallbackWarningException](DpCallbackWarningException.md#dpcallbackwarningexception-82a350729169)

## Members

**Constructors**:

- [DpCallbackException\(String\)](#dpcallbackexception-a5652d7c1d08)
- [DpCallbackException\(String, ErrorCode\)](#dpcallbackexception-53b98f1d2897)
- [DpCallbackException\(String, ErrorCode, Throwable\)](#dpcallbackexception-1c2ed9d506c2)
- [DpCallbackException\(String, Throwable\)](#dpcallbackexception-3f993a79a901)
- [DpCallbackException\(Throwable\)](#dpcallbackexception-24c1c7bd7c34)

**Methods**:

- [getErrorCode\(\)](../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getOpaque\(\)](../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [mk\(ConfResponse\)](DpException.md#mk-de1cedfc6ea8) from DpException
- [mk\(ConfResponse, ConfPath\)](../conf/ConfException.md#mk-79e69ffbc022) from ConfException

## Constructors

### DpCallbackException(String) <a href="#dpcallbackexception-a5652d7c1d08" id="dpcallbackexception-a5652d7c1d08"></a>

```java
public DpCallbackException(String msg)
```

**Parameters**

- `String msg`

### DpCallbackException(String, ErrorCode) <a href="#dpcallbackexception-53b98f1d2897" id="dpcallbackexception-53b98f1d2897"></a>

```java
public DpCallbackException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

### DpCallbackException(String, ErrorCode, Throwable) <a href="#dpcallbackexception-1c2ed9d506c2" id="dpcallbackexception-1c2ed9d506c2"></a>

```java
public DpCallbackException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

### DpCallbackException(String, Throwable) <a href="#dpcallbackexception-3f993a79a901" id="dpcallbackexception-3f993a79a901"></a>

```java
public DpCallbackException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

### DpCallbackException(Throwable) <a href="#dpcallbackexception-24c1c7bd7c34" id="dpcallbackexception-24c1c7bd7c34"></a>

```java
public DpCallbackException(Throwable cause)
```

**Parameters**

- `Throwable cause`
