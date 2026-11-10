# DpException <a href="#dpexception-79c01c670be8" id="dpexception-79c01c670be8"></a>

```java
public class com.tailf.dp.DpException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

General Dp Exception

**Related classes**

- [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

## Members

**Constructors**:

- [DpException\(String\)](#dpexception-adf0b93881e4)
- [DpException\(String, ErrorCode\)](#dpexception-e3361e681466)
- [DpException\(String, ErrorCode, Throwable\)](#dpexception-e6dd2c98e757)
- [DpException\(String, int, Throwable\)](#dpexception-68c3df6b9602)
- [DpException\(String, Throwable\)](#dpexception-3ddd54e89606)
- [DpException\(Throwable\)](#dpexception-780b792b8566)

**Methods**:

- [getErrorCode\(\)](../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getOpaque\(\)](../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [mk\(ConfResponse\)](#mk-de1cedfc6ea8)
- [mk\(ConfResponse, ConfPath\)](../conf/ConfException.md#mk-79e69ffbc022) from ConfException

## Constructors

### DpException(String) <a href="#dpexception-adf0b93881e4" id="dpexception-adf0b93881e4"></a>

```java
public DpException(String msg)
```

**Parameters**

- `String msg`

### DpException(String, ErrorCode) <a href="#dpexception-e3361e681466" id="dpexception-e3361e681466"></a>

```java
protected DpException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

### DpException(String, ErrorCode, Throwable) <a href="#dpexception-e6dd2c98e757" id="dpexception-e6dd2c98e757"></a>

```java
public DpException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

### DpException(String, int, Throwable) <a href="#dpexception-68c3df6b9602" id="dpexception-68c3df6b9602"></a>

```java
public DpException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

### DpException(String, Throwable) <a href="#dpexception-3ddd54e89606" id="dpexception-3ddd54e89606"></a>

```java
public DpException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

### DpException(Throwable) <a href="#dpexception-780b792b8566" id="dpexception-780b792b8566"></a>

```java
public DpException(Throwable cause)
```

**Parameters**

- `Throwable cause`


## Methods

### mk(ConfResponse) <a href="#mk-de1cedfc6ea8" id="mk-de1cedfc6ea8"></a>

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9), [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49)

**Parameters**

- `com.tailf.conf.ConfResponse r`
