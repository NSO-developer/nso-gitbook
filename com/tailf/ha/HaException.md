<a id="cls-HaException"></a>
# HaException

```java
public class com.tailf.ha.HaException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Exception for the HA handling

## Members

**Constructors**:

- [HaException(String)](#m-haexception-6466f26d1012)
- [HaException(String, ErrorCode)](#m-haexception-32139dd642cc)
- [HaException(String, ErrorCode, Throwable)](#m-haexception-c7b840ccd056)
- [HaException(String, Throwable)](#m-haexception-21b4bcf9175b)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](#m-mk-de1cedfc6ea8)
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

<a id="m-haexception-6466f26d1012"></a>
### HaException(String)

```java
public HaException(String msg)
```

**Parameters**

- `String msg`

<a id="m-haexception-32139dd642cc"></a>
### HaException(String, ErrorCode)

```java
public HaException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

<a id="m-haexception-c7b840ccd056"></a>
### HaException(String, ErrorCode, Throwable)

```java
public HaException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

<a id="m-haexception-21b4bcf9175b"></a>
### HaException(String, Throwable)

```java
public HaException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`


## Methods

<a id="m-mk-de1cedfc6ea8"></a>
### mk(ConfResponse)

```java
public static com.tailf.ha.HaException mk(com.tailf.conf.ConfResponse r)
```

Types: [HaException](HaException.md#cls-HaException), [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse r`
