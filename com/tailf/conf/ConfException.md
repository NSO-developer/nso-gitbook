<a id="s-ConfException"></a>
# ConfException

```java
public class com.tailf.conf.ConfException
    extends Exception
```

Exception base class. Capable of formatting protocol errors into exceptions.
 This is also baseclass for all other exceptions.

**Related classes**

- [CdbException](../cdb/CdbException.md#s-CdbException)
- [ConfBadTermException](ConfBadTermException.md#s-ConfBadTermException)
- [ConfWarningException](ConfWarningException.md#s-ConfWarningException)
- [DpException](../dp/DpException.md#s-DpException)
- [HaException](../ha/HaException.md#s-HaException)
- [MaapiException](../maapi/MaapiException.md#s-MaapiException)
- [MmapSchemaException](../ncs/maapi/MmapSchemaException.md#s-MmapSchemaException)
- [NavuException](../navu/NavuException.md#s-NavuException)
- [NcsException](../ncs/NcsException.md#s-NcsException)
- [NotifException](../notif/NotifException.md#s-NotifException)

## Members

**Constructors**:

- [ConfException(String)](#s-ConfException-1)
- [ConfException(String, ErrorCode)](#s-ConfException-2)
- [ConfException(String, ErrorCode, Throwable)](#s-ConfException-3)
- [ConfException(String, ErrorCode, Throwable, Object)](#s-ConfException-4)
- [ConfException(String, int)](#s-ConfException-5)
- [ConfException(String, int, Throwable)](#s-ConfException-6)
- [ConfException(String, Throwable)](#s-ConfException-7)
- [ConfException(Throwable)](#s-ConfException-8)

**Methods**:

- [getErrorCode()](#s-getErrorCode)
- [getOpaque()](#s-getOpaque)
- [mk(ConfResponse)](#s-mk)
- [mk(ConfResponse, ConfPath)](#s-mk-1)

## Constructors

<a id="s-ConfException-1"></a>
### ConfException(String)

```java
public ConfException(String msg)
```

**Parameters**

- `String msg`

<a id="s-ConfException-2"></a>
### ConfException(String, ErrorCode)

```java
public ConfException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](ErrorCode.md#s-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

<a id="s-ConfException-3"></a>
### ConfException(String, ErrorCode, Throwable)

```java
public ConfException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](ErrorCode.md#s-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

<a id="s-ConfException-4"></a>
### ConfException(String, ErrorCode, Throwable, Object)

```java
public ConfException(String msg, com.tailf.conf.ErrorCode code, Throwable cause, Object o)
```

Types: [ErrorCode](ErrorCode.md#s-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`
- `Object o`

<a id="s-ConfException-5"></a>
### ConfException(String, int)

```java
public ConfException(String msg, int codeInteger)
```

**Parameters**

- `String msg`
- `int codeInteger`

<a id="s-ConfException-6"></a>
### ConfException(String, int, Throwable)

```java
public ConfException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

<a id="s-ConfException-7"></a>
### ConfException(String, Throwable)

```java
public ConfException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

<a id="s-ConfException-8"></a>
### ConfException(Throwable)

```java
public ConfException(Throwable cause)
```

**Parameters**

- `Throwable cause`


## Methods

<a id="s-getErrorCode"></a>
### getErrorCode()

```java
public com.tailf.conf.ErrorCode getErrorCode()
```

Types: [ErrorCode](ErrorCode.md#s-ErrorCode)

<a id="s-getOpaque"></a>
### getOpaque()

```java
public Object getOpaque()
```

<a id="s-mk"></a>
### mk(ConfResponse)

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](ConfException.md#s-ConfException), [ConfResponse](ConfResponse.md#s-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse r`

<a id="s-mk-1"></a>
### mk(ConfResponse, ConfPath)

```java
public static com.tailf.conf.ConfException mk(
    com.tailf.conf.ConfResponse r,
    com.tailf.conf.ConfPath errPath
)
```

Types: [ConfException](ConfException.md#s-ConfException), [ConfResponse](ConfResponse.md#s-ConfResponse), [ConfPath](ConfPath.md#s-ConfPath)

**Parameters**

- `com.tailf.conf.ConfResponse r`
- `com.tailf.conf.ConfPath errPath`
