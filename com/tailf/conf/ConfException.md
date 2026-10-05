<a id="cls-ConfException"></a>
# ConfException

```java
public class com.tailf.conf.ConfException
    extends Exception
```

Exception base class. Capable of formatting protocol errors into exceptions.
 This is also baseclass for all other exceptions.

**Related classes**

- [CdbException](../cdb/CdbException.md#cls-CdbException)
- [ConfBadTermException](ConfBadTermException.md#cls-ConfBadTermException)
- [ConfWarningException](ConfWarningException.md#cls-ConfWarningException)
- [DpException](../dp/DpException.md#cls-DpException)
- [HaException](../ha/HaException.md#cls-HaException)
- [MaapiException](../maapi/MaapiException.md#cls-MaapiException)
- [MmapSchemaException](../ncs/maapi/MmapSchemaException.md#cls-MmapSchemaException)
- [NavuException](../navu/NavuException.md#cls-NavuException)
- [NcsException](../ncs/NcsException.md#cls-NcsException)
- [NotifException](../notif/NotifException.md#cls-NotifException)

## Members

**Constructors**:

- [ConfException(String)](#m-confexception-dc970c7fe4fe)
- [ConfException(String, ErrorCode)](#m-confexception-d917b21fb864)
- [ConfException(String, ErrorCode, Throwable)](#m-confexception-2ef26e60c90a)
- [ConfException(String, ErrorCode, Throwable, Object)](#m-confexception-1d5a0544c033)
- [ConfException(String, int)](#m-confexception-f9ced700f545)
- [ConfException(String, int, Throwable)](#m-confexception-b28d9204d01c)
- [ConfException(String, Throwable)](#m-confexception-c87e2ff2e68c)
- [ConfException(Throwable)](#m-confexception-97f34dedf669)

**Methods**:

- [getErrorCode()](#m-geterrorcode-812152fc083a)
- [getOpaque()](#m-getopaque-92e4945ec92d)
- [mk(ConfResponse)](#m-mk-de1cedfc6ea8)
- [mk(ConfResponse, ConfPath)](#m-mk-79e69ffbc022)

## Constructors

<a id="m-confexception-dc970c7fe4fe"></a>
### ConfException(String)

```java
public ConfException(String msg)
```

**Parameters**

- `String msg`

<a id="m-confexception-d917b21fb864"></a>
### ConfException(String, ErrorCode)

```java
public ConfException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

<a id="m-confexception-2ef26e60c90a"></a>
### ConfException(String, ErrorCode, Throwable)

```java
public ConfException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

<a id="m-confexception-1d5a0544c033"></a>
### ConfException(String, ErrorCode, Throwable, Object)

```java
public ConfException(String msg, com.tailf.conf.ErrorCode code, Throwable cause, Object o)
```

Types: [ErrorCode](ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`
- `Object o`

<a id="m-confexception-f9ced700f545"></a>
### ConfException(String, int)

```java
public ConfException(String msg, int codeInteger)
```

**Parameters**

- `String msg`
- `int codeInteger`

<a id="m-confexception-b28d9204d01c"></a>
### ConfException(String, int, Throwable)

```java
public ConfException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

<a id="m-confexception-c87e2ff2e68c"></a>
### ConfException(String, Throwable)

```java
public ConfException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

<a id="m-confexception-97f34dedf669"></a>
### ConfException(Throwable)

```java
public ConfException(Throwable cause)
```

**Parameters**

- `Throwable cause`


## Methods

<a id="m-geterrorcode-812152fc083a"></a>
### getErrorCode()

```java
public com.tailf.conf.ErrorCode getErrorCode()
```

Types: [ErrorCode](ErrorCode.md#cls-ErrorCode)

<a id="m-getopaque-92e4945ec92d"></a>
### getOpaque()

```java
public Object getOpaque()
```

<a id="m-mk-de1cedfc6ea8"></a>
### mk(ConfResponse)

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](ConfException.md#cls-ConfException), [ConfResponse](ConfResponse.md#cls-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse r`

<a id="m-mk-79e69ffbc022"></a>
### mk(ConfResponse, ConfPath)

```java
public static com.tailf.conf.ConfException mk(
    com.tailf.conf.ConfResponse r,
    com.tailf.conf.ConfPath errPath
)
```

Types: [ConfException](ConfException.md#cls-ConfException), [ConfResponse](ConfResponse.md#cls-ConfResponse), [ConfPath](ConfPath.md#cls-ConfPath)

**Parameters**

- `com.tailf.conf.ConfResponse r`
- `com.tailf.conf.ConfPath errPath`
