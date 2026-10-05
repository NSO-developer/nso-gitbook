<a id="s-MaapiException"></a>
# MaapiException

```java
public class com.tailf.maapi.MaapiException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Exception raised from the maapi package

**Related classes**

- [MaapiMNsException](MaapiMNsException.md#s-MaapiMNsException)
- [MaapiWarningException](MaapiWarningException.md#s-MaapiWarningException)

## Members

**Constructors**:

- [MaapiException(String)](#s-MaapiException-1)
- [MaapiException(String, ErrorCode)](#s-MaapiException-2)
- [MaapiException(String, ErrorCode, Throwable)](#s-MaapiException-3)
- [MaapiException(String, int)](#s-MaapiException-4)
- [MaapiException(String, int, Throwable)](#s-MaapiException-5)
- [MaapiException(String, Throwable)](#s-MaapiException-6)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#s-getErrorCode) from ConfException
- [getOpaque()](../conf/ConfException.md#s-getOpaque) from ConfException
- [mk(ConfResponse)](#s-mk)
- [mk(ConfResponse, ConfPath)](#s-mk-1)

## Constructors

<a id="s-MaapiException-1"></a>
### MaapiException(String)

```java
public MaapiException(String msg)
```

**Parameters**

- `String msg`

<a id="s-MaapiException-2"></a>
### MaapiException(String, ErrorCode)

```java
public MaapiException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#s-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

<a id="s-MaapiException-3"></a>
### MaapiException(String, ErrorCode, Throwable)

```java
public MaapiException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#s-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

<a id="s-MaapiException-4"></a>
### MaapiException(String, int)

```java
public MaapiException(String msg, int codeInteger)
```

**Parameters**

- `String msg`
- `int codeInteger`

<a id="s-MaapiException-5"></a>
### MaapiException(String, int, Throwable)

```java
public MaapiException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

<a id="s-MaapiException-6"></a>
### MaapiException(String, Throwable)

```java
public MaapiException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`


## Methods

<a id="s-mk"></a>
### mk(ConfResponse)

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](../conf/ConfException.md#s-ConfException), [ConfResponse](../conf/ConfResponse.md#s-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse r`

<a id="s-mk-1"></a>
### mk(ConfResponse, ConfPath)

```java
public static com.tailf.conf.ConfException mk(
    com.tailf.conf.ConfResponse r,
    com.tailf.conf.ConfPath path
)
```

Types: [ConfException](../conf/ConfException.md#s-ConfException), [ConfResponse](../conf/ConfResponse.md#s-ConfResponse), [ConfPath](../conf/ConfPath.md#s-ConfPath)

**Parameters**

- `com.tailf.conf.ConfResponse r`
- `com.tailf.conf.ConfPath path`
