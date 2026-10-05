<a id="cls-MaapiException"></a>
# MaapiException

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

- [MaapiException(String)](#m-maapiexception-415f096b5036)
- [MaapiException(String, ErrorCode)](#m-maapiexception-259d1ef61a79)
- [MaapiException(String, ErrorCode, Throwable)](#m-maapiexception-f9ca62813237)
- [MaapiException(String, int)](#m-maapiexception-5e33165914c8)
- [MaapiException(String, int, Throwable)](#m-maapiexception-ecd0bcd458ea)
- [MaapiException(String, Throwable)](#m-maapiexception-fe7353f5073f)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](#m-mk-de1cedfc6ea8)
- [mk(ConfResponse, ConfPath)](#m-mk-79e69ffbc022)

## Constructors

<a id="m-maapiexception-415f096b5036"></a>
### MaapiException(String)

```java
public MaapiException(String msg)
```

**Parameters**

- `String msg`

<a id="m-maapiexception-259d1ef61a79"></a>
### MaapiException(String, ErrorCode)

```java
public MaapiException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

<a id="m-maapiexception-f9ca62813237"></a>
### MaapiException(String, ErrorCode, Throwable)

```java
public MaapiException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

<a id="m-maapiexception-5e33165914c8"></a>
### MaapiException(String, int)

```java
public MaapiException(String msg, int codeInteger)
```

**Parameters**

- `String msg`
- `int codeInteger`

<a id="m-maapiexception-ecd0bcd458ea"></a>
### MaapiException(String, int, Throwable)

```java
public MaapiException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

<a id="m-maapiexception-fe7353f5073f"></a>
### MaapiException(String, Throwable)

```java
public MaapiException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
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

<a id="m-mk-79e69ffbc022"></a>
### mk(ConfResponse, ConfPath)

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
