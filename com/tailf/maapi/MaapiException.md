# MaapiException <a href="#maapiexception-af58eb4e109e" id="maapiexception-af58eb4e109e"></a>

```java
public class com.tailf.maapi.MaapiException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Exception raised from the maapi package

**Related classes**

- [MaapiMNsException](MaapiMNsException.md#maapimnsexception-c5654bb45674)
- [MaapiWarningException](MaapiWarningException.md#maapiwarningexception-52f654d7ae54)

## Members

**Constructors**:

- [MaapiException(String)](#maapiexception-415f096b5036)
- [MaapiException(String, ErrorCode)](#maapiexception-259d1ef61a79)
- [MaapiException(String, ErrorCode, Throwable)](#maapiexception-f9ca62813237)
- [MaapiException(String, int)](#maapiexception-5e33165914c8)
- [MaapiException(String, int, Throwable)](#maapiexception-ecd0bcd458ea)
- [MaapiException(String, Throwable)](#maapiexception-fe7353f5073f)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](#mk-de1cedfc6ea8)
- [mk(ConfResponse, ConfPath)](#mk-79e69ffbc022)

## Constructors

### MaapiException(String) <a href="#maapiexception-415f096b5036" id="maapiexception-415f096b5036"></a>

```java
public MaapiException(String msg)
```

**Parameters**

- `String msg`

### MaapiException(String, ErrorCode) <a href="#maapiexception-259d1ef61a79" id="maapiexception-259d1ef61a79"></a>

```java
public MaapiException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

### MaapiException(String, ErrorCode, Throwable) <a href="#maapiexception-f9ca62813237" id="maapiexception-f9ca62813237"></a>

```java
public MaapiException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

### MaapiException(String, int) <a href="#maapiexception-5e33165914c8" id="maapiexception-5e33165914c8"></a>

```java
public MaapiException(String msg, int codeInteger)
```

**Parameters**

- `String msg`
- `int codeInteger`

### MaapiException(String, int, Throwable) <a href="#maapiexception-ecd0bcd458ea" id="maapiexception-ecd0bcd458ea"></a>

```java
public MaapiException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

### MaapiException(String, Throwable) <a href="#maapiexception-fe7353f5073f" id="maapiexception-fe7353f5073f"></a>

```java
public MaapiException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`


## Methods

### mk(ConfResponse) <a href="#mk-de1cedfc6ea8" id="mk-de1cedfc6ea8"></a>

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9), [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49)

**Parameters**

- `com.tailf.conf.ConfResponse r`

### mk(ConfResponse, ConfPath) <a href="#mk-79e69ffbc022" id="mk-79e69ffbc022"></a>

```java
public static com.tailf.conf.ConfException mk(
    com.tailf.conf.ConfResponse r,
    com.tailf.conf.ConfPath path
)
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9), [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d)

**Parameters**

- `com.tailf.conf.ConfResponse r`
- `com.tailf.conf.ConfPath path`
