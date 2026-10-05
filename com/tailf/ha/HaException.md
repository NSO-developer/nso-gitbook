# HaException <a href="#cls-HaException" id="cls-HaException"></a>

```java
public class com.tailf.ha.HaException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Exception for the HA handling

## Members

**Constructors**:

- [HaException(String)](#m-HaException-6466f26d1012)
- [HaException(String, ErrorCode)](#m-HaException-32139dd642cc)
- [HaException(String, ErrorCode, Throwable)](#m-HaException-c7b840ccd056)
- [HaException(String, Throwable)](#m-HaException-21b4bcf9175b)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-getErrorCode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getOpaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](#m-mk-de1cedfc6ea8)
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

### HaException(String) <a href="#m-HaException-6466f26d1012" id="m-HaException-6466f26d1012"></a>

```java
public HaException(String msg)
```

**Parameters**

- `String msg`

### HaException(String, ErrorCode) <a href="#m-HaException-32139dd642cc" id="m-HaException-32139dd642cc"></a>

```java
public HaException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

### HaException(String, ErrorCode, Throwable) <a href="#m-HaException-c7b840ccd056" id="m-HaException-c7b840ccd056"></a>

```java
public HaException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

### HaException(String, Throwable) <a href="#m-HaException-21b4bcf9175b" id="m-HaException-21b4bcf9175b"></a>

```java
public HaException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`


## Methods

### mk(ConfResponse) <a href="#m-mk-de1cedfc6ea8" id="m-mk-de1cedfc6ea8"></a>

```java
public static com.tailf.ha.HaException mk(com.tailf.conf.ConfResponse r)
```

Types: [HaException](HaException.md#cls-HaException), [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse r`
