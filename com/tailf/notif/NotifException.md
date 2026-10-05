<a id="s-NotifException"></a>
# NotifException

```java
public class com.tailf.notif.NotifException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Exceptions raised from the notif package

## Members

**Constructors**:

- [NotifException(String, ErrorCode)](#s-NotifException-1)
- [NotifException(String, ErrorCode, Throwable)](#s-NotifException-2)
- [NotifException(String, int, Throwable)](#s-NotifException-3)
- [NotifException(String, Throwable)](#s-NotifException-4)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#s-getErrorCode) from ConfException
- [getOpaque()](../conf/ConfException.md#s-getOpaque) from ConfException
- [mk(ConfResponse)](#s-mk)
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#s-mk-1) from ConfException

## Constructors

<a id="s-NotifException-1"></a>
### NotifException(String, ErrorCode)

```java
public NotifException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#s-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

<a id="s-NotifException-2"></a>
### NotifException(String, ErrorCode, Throwable)

```java
public NotifException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#s-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

<a id="s-NotifException-3"></a>
### NotifException(String, int, Throwable)

```java
public NotifException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

<a id="s-NotifException-4"></a>
### NotifException(String, Throwable)

```java
public NotifException(String msg, Throwable cause)
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
