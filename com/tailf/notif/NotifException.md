# NotifException <a href="#notifexception-d843ea72ec3f" id="notifexception-d843ea72ec3f"></a>

```java
public class com.tailf.notif.NotifException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Exceptions raised from the notif package

## Members

**Constructors**:

- [NotifException(String, ErrorCode)](#notifexception-97ea59f506f8)
- [NotifException(String, ErrorCode, Throwable)](#notifexception-fde89e4ba591)
- [NotifException(String, int, Throwable)](#notifexception-f53608ca5bfd)
- [NotifException(String, Throwable)](#notifexception-c8adc3e6a9e6)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](#mk-de1cedfc6ea8)
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#mk-79e69ffbc022) from ConfException

## Constructors

### NotifException(String, ErrorCode) <a href="#notifexception-97ea59f506f8" id="notifexception-97ea59f506f8"></a>

```java
public NotifException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

### NotifException(String, ErrorCode, Throwable) <a href="#notifexception-fde89e4ba591" id="notifexception-fde89e4ba591"></a>

```java
public NotifException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

### NotifException(String, int, Throwable) <a href="#notifexception-f53608ca5bfd" id="notifexception-f53608ca5bfd"></a>

```java
public NotifException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

### NotifException(String, Throwable) <a href="#notifexception-c8adc3e6a9e6" id="notifexception-c8adc3e6a9e6"></a>

```java
public NotifException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`


## Methods

### mk(ConfResponse) <a href="#mk-de1cedfc6ea8" id="mk-de1cedfc6ea8"></a>

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9), [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49)

**Parameters**

- `com.tailf.conf.ConfResponse r`
