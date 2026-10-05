# DpException <a href="#cls-DpException" id="cls-DpException"></a>

```java
public class com.tailf.dp.DpException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

General Dp Exception

**Related classes**

- [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

## Members

**Constructors**:

- [DpException(String)](#m-DpException-adf0b93881e4)
- [DpException(String, ErrorCode)](#m-DpException-e3361e681466)
- [DpException(String, ErrorCode, Throwable)](#m-DpException-e6dd2c98e757)
- [DpException(String, int, Throwable)](#m-DpException-68c3df6b9602)
- [DpException(String, Throwable)](#m-DpException-3ddd54e89606)
- [DpException(Throwable)](#m-DpException-780b792b8566)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-getErrorCode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getOpaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](#m-mk-de1cedfc6ea8)
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

### DpException(String) <a href="#m-DpException-adf0b93881e4" id="m-DpException-adf0b93881e4"></a>

```java
public DpException(String msg)
```

**Parameters**

- `String msg`

### DpException(String, ErrorCode) <a href="#m-DpException-e3361e681466" id="m-DpException-e3361e681466"></a>

```java
protected DpException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

### DpException(String, ErrorCode, Throwable) <a href="#m-DpException-e6dd2c98e757" id="m-DpException-e6dd2c98e757"></a>

```java
public DpException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

### DpException(String, int, Throwable) <a href="#m-DpException-68c3df6b9602" id="m-DpException-68c3df6b9602"></a>

```java
public DpException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

### DpException(String, Throwable) <a href="#m-DpException-3ddd54e89606" id="m-DpException-3ddd54e89606"></a>

```java
public DpException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

### DpException(Throwable) <a href="#m-DpException-780b792b8566" id="m-DpException-780b792b8566"></a>

```java
public DpException(Throwable cause)
```

**Parameters**

- `Throwable cause`


## Methods

### mk(ConfResponse) <a href="#m-mk-de1cedfc6ea8" id="m-mk-de1cedfc6ea8"></a>

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException), [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse r`
