<a id="cls-NotifException"></a>
# NotifException

```java
public class com.tailf.notif.NotifException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Exceptions raised from the notif package

## Members

**Constructors**:

- [NotifException(String, ErrorCode)](#m-notifexception-97ea59f506f8)
- [NotifException(String, ErrorCode, Throwable)](#m-notifexception-fde89e4ba591)
- [NotifException(String, int, Throwable)](#m-notifexception-f53608ca5bfd)
- [NotifException(String, Throwable)](#m-notifexception-c8adc3e6a9e6)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](#m-mk-de1cedfc6ea8)
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

<a id="m-notifexception-97ea59f506f8"></a>
### NotifException(String, ErrorCode)

```java
public NotifException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

<a id="m-notifexception-fde89e4ba591"></a>
### NotifException(String, ErrorCode, Throwable)

```java
public NotifException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

<a id="m-notifexception-f53608ca5bfd"></a>
### NotifException(String, int, Throwable)

```java
public NotifException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

<a id="m-notifexception-c8adc3e6a9e6"></a>
### NotifException(String, Throwable)

```java
public NotifException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`


## Methods

<a id="m-mk-de1cedfc6ea8"></a>
### mk(ConfResponse)

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException), [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse r`
