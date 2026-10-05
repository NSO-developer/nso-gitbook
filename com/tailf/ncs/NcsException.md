<a id="s-NcsException"></a>
# NcsException

```java
public class com.tailf.ncs.NcsException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Ncs package generic exception

**Related classes**

- [NcsCtrlException](ctrl/NcsCtrlException.md#s-NcsCtrlException)

## Members

**Constructors**:

- [NcsException(String)](#s-NcsException-1)
- [NcsException(String, ErrorCode, Throwable)](#s-NcsException-2)
- [NcsException(String, Throwable)](#s-NcsException-3)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#s-getErrorCode) from ConfException
- [getOpaque()](../conf/ConfException.md#s-getOpaque) from ConfException
- [mk(ConfResponse)](../conf/ConfException.md#s-mk) from ConfException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#s-mk-1) from ConfException

## Constructors

<a id="s-NcsException-1"></a>
### NcsException(String)

```java
protected NcsException(String msg)
```

**Parameters**

- `String msg`

<a id="s-NcsException-2"></a>
### NcsException(String, ErrorCode, Throwable)

```java
public NcsException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#s-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

<a id="s-NcsException-3"></a>
### NcsException(String, Throwable)

```java
public NcsException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`
