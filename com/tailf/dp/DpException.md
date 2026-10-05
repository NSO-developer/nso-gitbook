<a id="cls-DpException"></a>
# DpException

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

- [DpException(String)](#m-dpexception-adf0b93881e4)
- [DpException(String, ErrorCode)](#m-dpexception-e3361e681466)
- [DpException(String, ErrorCode, Throwable)](#m-dpexception-e6dd2c98e757)
- [DpException(String, int, Throwable)](#m-dpexception-68c3df6b9602)
- [DpException(String, Throwable)](#m-dpexception-3ddd54e89606)
- [DpException(Throwable)](#m-dpexception-780b792b8566)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](#m-mk-de1cedfc6ea8)
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

<a id="m-dpexception-adf0b93881e4"></a>
### DpException(String)

```java
public DpException(String msg)
```

**Parameters**

- `String msg`

<a id="m-dpexception-e3361e681466"></a>
### DpException(String, ErrorCode)

```java
protected DpException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

<a id="m-dpexception-e6dd2c98e757"></a>
### DpException(String, ErrorCode, Throwable)

```java
public DpException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

<a id="m-dpexception-68c3df6b9602"></a>
### DpException(String, int, Throwable)

```java
public DpException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

<a id="m-dpexception-3ddd54e89606"></a>
### DpException(String, Throwable)

```java
public DpException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

<a id="m-dpexception-780b792b8566"></a>
### DpException(Throwable)

```java
public DpException(Throwable cause)
```

**Parameters**

- `Throwable cause`


## Methods

<a id="m-mk-de1cedfc6ea8"></a>
### mk(ConfResponse)

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException), [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse r`
