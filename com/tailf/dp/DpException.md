<a id="s-DpException"></a>
# DpException

```java
public class com.tailf.dp.DpException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

General Dp Exception

**Related classes**

- [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

## Members

**Constructors**:

- [DpException(String)](#s-DpException-1)
- [DpException(String, ErrorCode)](#s-DpException-2)
- [DpException(String, ErrorCode, Throwable)](#s-DpException-3)
- [DpException(String, int, Throwable)](#s-DpException-4)
- [DpException(String, Throwable)](#s-DpException-5)
- [DpException(Throwable)](#s-DpException-6)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#s-getErrorCode) from ConfException
- [getOpaque()](../conf/ConfException.md#s-getOpaque) from ConfException
- [mk(ConfResponse)](#s-mk)
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#s-mk-1) from ConfException

## Constructors

<a id="s-DpException-1"></a>
### DpException(String)

```java
public DpException(String msg)
```

**Parameters**

- `String msg`

<a id="s-DpException-2"></a>
### DpException(String, ErrorCode)

```java
protected DpException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#s-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

<a id="s-DpException-3"></a>
### DpException(String, ErrorCode, Throwable)

```java
public DpException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#s-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

<a id="s-DpException-4"></a>
### DpException(String, int, Throwable)

```java
public DpException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

<a id="s-DpException-5"></a>
### DpException(String, Throwable)

```java
public DpException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

<a id="s-DpException-6"></a>
### DpException(Throwable)

```java
public DpException(Throwable cause)
```

**Parameters**

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
