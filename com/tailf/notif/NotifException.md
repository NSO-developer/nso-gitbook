# NotifException <a href="#cls-NotifException" id="cls-NotifException"></a>

```java
public class com.tailf.notif.NotifException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Exceptions raised from the notif package

## Members

**Constructors**:

- [NotifException(String, ErrorCode)](#m-NotifException-97ea59f506f8)
- [NotifException(String, ErrorCode, Throwable)](#m-NotifException-fde89e4ba591)
- [NotifException(String, int, Throwable)](#m-NotifException-f53608ca5bfd)
- [NotifException(String, Throwable)](#m-NotifException-c8adc3e6a9e6)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-getErrorCode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getOpaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](#m-mk-de1cedfc6ea8)
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

### NotifException(String, ErrorCode) <a href="#m-NotifException-97ea59f506f8" id="m-NotifException-97ea59f506f8"></a>

```java
public NotifException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

### NotifException(String, ErrorCode, Throwable) <a href="#m-NotifException-fde89e4ba591" id="m-NotifException-fde89e4ba591"></a>

```java
public NotifException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

### NotifException(String, int, Throwable) <a href="#m-NotifException-f53608ca5bfd" id="m-NotifException-f53608ca5bfd"></a>

```java
public NotifException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

### NotifException(String, Throwable) <a href="#m-NotifException-c8adc3e6a9e6" id="m-NotifException-c8adc3e6a9e6"></a>

```java
public NotifException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`


## Methods

### mk(ConfResponse) <a href="#m-mk-de1cedfc6ea8" id="m-mk-de1cedfc6ea8"></a>

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException), [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse r`
