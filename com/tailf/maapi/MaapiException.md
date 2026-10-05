# MaapiException <a href="#cls-MaapiException" id="cls-MaapiException"></a>

```java
public class com.tailf.maapi.MaapiException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Exception raised from the maapi package

**Related classes**

- [MaapiMNsException](MaapiMNsException.md#cls-MaapiMNsException)
- [MaapiWarningException](MaapiWarningException.md#cls-MaapiWarningException)

## Members

**Constructors**:

- [MaapiException(String)](#m-MaapiException-415f096b5036)
- [MaapiException(String, ErrorCode)](#m-MaapiException-259d1ef61a79)
- [MaapiException(String, ErrorCode, Throwable)](#m-MaapiException-f9ca62813237)
- [MaapiException(String, int)](#m-MaapiException-5e33165914c8)
- [MaapiException(String, int, Throwable)](#m-MaapiException-ecd0bcd458ea)
- [MaapiException(String, Throwable)](#m-MaapiException-fe7353f5073f)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-getErrorCode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getOpaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](#m-mk-de1cedfc6ea8)
- [mk(ConfResponse, ConfPath)](#m-mk-79e69ffbc022)

## Constructors

### MaapiException(String) <a href="#m-MaapiException-415f096b5036" id="m-MaapiException-415f096b5036"></a>

```java
public MaapiException(String msg)
```

**Parameters**

- `String msg`

### MaapiException(String, ErrorCode) <a href="#m-MaapiException-259d1ef61a79" id="m-MaapiException-259d1ef61a79"></a>

```java
public MaapiException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

### MaapiException(String, ErrorCode, Throwable) <a href="#m-MaapiException-f9ca62813237" id="m-MaapiException-f9ca62813237"></a>

```java
public MaapiException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

### MaapiException(String, int) <a href="#m-MaapiException-5e33165914c8" id="m-MaapiException-5e33165914c8"></a>

```java
public MaapiException(String msg, int codeInteger)
```

**Parameters**

- `String msg`
- `int codeInteger`

### MaapiException(String, int, Throwable) <a href="#m-MaapiException-ecd0bcd458ea" id="m-MaapiException-ecd0bcd458ea"></a>

```java
public MaapiException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

### MaapiException(String, Throwable) <a href="#m-MaapiException-fe7353f5073f" id="m-MaapiException-fe7353f5073f"></a>

```java
public MaapiException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`


## Methods

### mk(ConfResponse) <a href="#m-mk-de1cedfc6ea8" id="m-mk-de1cedfc6ea8"></a>

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException), [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse r`

### mk(ConfResponse, ConfPath) <a href="#m-mk-79e69ffbc022" id="m-mk-79e69ffbc022"></a>

```java
public static com.tailf.conf.ConfException mk(
    com.tailf.conf.ConfResponse r,
    com.tailf.conf.ConfPath path
)
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException), [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse), [ConfPath](../conf/ConfPath.md#cls-ConfPath)

**Parameters**

- `com.tailf.conf.ConfResponse r`
- `com.tailf.conf.ConfPath path`
