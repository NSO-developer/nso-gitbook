<a id="s-HaException"></a>
# HaException

```java
public class com.tailf.ha.HaException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Exception for the HA handling

## Members

**Constructors**:

- [HaException(String)](#s-HaException-1)
- [HaException(String, ErrorCode)](#s-HaException-2)
- [HaException(String, ErrorCode, Throwable)](#s-HaException-3)
- [HaException(String, Throwable)](#s-HaException-4)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#s-getErrorCode) from ConfException
- [getOpaque()](../conf/ConfException.md#s-getOpaque) from ConfException
- [mk(ConfResponse)](#s-mk)
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#s-mk-1) from ConfException

## Constructors

<a id="s-HaException-1"></a>
### HaException(String)

```java
public HaException(String msg)
```

**Parameters**

- `String msg`

<a id="s-HaException-2"></a>
### HaException(String, ErrorCode)

```java
public HaException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#s-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

<a id="s-HaException-3"></a>
### HaException(String, ErrorCode, Throwable)

```java
public HaException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#s-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

<a id="s-HaException-4"></a>
### HaException(String, Throwable)

```java
public HaException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`


## Methods

<a id="s-mk"></a>
### mk(ConfResponse)

```java
public static com.tailf.ha.HaException mk(com.tailf.conf.ConfResponse r)
```

Types: [HaException](HaException.md#s-HaException), [ConfResponse](../conf/ConfResponse.md#s-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse r`
