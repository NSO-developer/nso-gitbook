# ConfException <a href="#cls-ConfException" id="cls-ConfException"></a>

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

- [ConfException(String)](#m-ConfException-dc970c7fe4fe)
- [ConfException(String, ErrorCode)](#m-ConfException-d917b21fb864)
- [ConfException(String, ErrorCode, Throwable)](#m-ConfException-2ef26e60c90a)
- [ConfException(String, ErrorCode, Throwable, Object)](#m-ConfException-1d5a0544c033)
- [ConfException(String, int)](#m-ConfException-f9ced700f545)
- [ConfException(String, int, Throwable)](#m-ConfException-b28d9204d01c)
- [ConfException(String, Throwable)](#m-ConfException-c87e2ff2e68c)
- [ConfException(Throwable)](#m-ConfException-97f34dedf669)

**Methods**:

- [getErrorCode()](#m-getErrorCode-812152fc083a)
- [getOpaque()](#m-getOpaque-92e4945ec92d)
- [mk(ConfResponse)](#m-mk-de1cedfc6ea8)
- [mk(ConfResponse, ConfPath)](#m-mk-79e69ffbc022)

## Constructors

### ConfException(String) <a href="#m-ConfException-dc970c7fe4fe" id="m-ConfException-dc970c7fe4fe"></a>

```java
public ConfException(String msg)
```

**Parameters**

- `String msg`

### ConfException(String, ErrorCode) <a href="#m-ConfException-d917b21fb864" id="m-ConfException-d917b21fb864"></a>

```java
public ConfException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

### ConfException(String, ErrorCode, Throwable) <a href="#m-ConfException-2ef26e60c90a" id="m-ConfException-2ef26e60c90a"></a>

```java
public ConfException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

### ConfException(String, ErrorCode, Throwable, Object) <a href="#m-ConfException-1d5a0544c033" id="m-ConfException-1d5a0544c033"></a>

```java
public ConfException(String msg, com.tailf.conf.ErrorCode code, Throwable cause, Object o)
```

Types: [ErrorCode](ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`
- `Object o`

### ConfException(String, int) <a href="#m-ConfException-f9ced700f545" id="m-ConfException-f9ced700f545"></a>

```java
public ConfException(String msg, int codeInteger)
```

**Parameters**

- `String msg`
- `int codeInteger`

### ConfException(String, int, Throwable) <a href="#m-ConfException-b28d9204d01c" id="m-ConfException-b28d9204d01c"></a>

```java
public ConfException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

### ConfException(String, Throwable) <a href="#m-ConfException-c87e2ff2e68c" id="m-ConfException-c87e2ff2e68c"></a>

```java
public ConfException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

### ConfException(Throwable) <a href="#m-ConfException-97f34dedf669" id="m-ConfException-97f34dedf669"></a>

```java
public ConfException(Throwable cause)
```

**Parameters**

- `Throwable cause`


## Methods

### getErrorCode() <a href="#m-getErrorCode-812152fc083a" id="m-getErrorCode-812152fc083a"></a>

```java
public com.tailf.conf.ErrorCode getErrorCode()
```

Types: [ErrorCode](ErrorCode.md#cls-ErrorCode)

### getOpaque() <a href="#m-getOpaque-92e4945ec92d" id="m-getOpaque-92e4945ec92d"></a>

```java
public Object getOpaque()
```

### mk(ConfResponse) <a href="#m-mk-de1cedfc6ea8" id="m-mk-de1cedfc6ea8"></a>

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](ConfException.md#cls-ConfException), [ConfResponse](ConfResponse.md#cls-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse r`

### mk(ConfResponse, ConfPath) <a href="#m-mk-79e69ffbc022" id="m-mk-79e69ffbc022"></a>

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
