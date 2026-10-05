<a id="cls-NcsException"></a>
# NcsException

```java
public class com.tailf.ncs.NcsException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Ncs package generic exception

**Related classes**

- [NcsCtrlException](ctrl/NcsCtrlException.md#cls-NcsCtrlException)

## Members

**Constructors**:

- [NcsException(String)](#m-ncsexception-4c8498b021a1)
- [NcsException(String, ErrorCode, Throwable)](#m-ncsexception-4c5d5b8901ed)
- [NcsException(String, Throwable)](#m-ncsexception-d4d509601928)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](../conf/ConfException.md#m-mk-de1cedfc6ea8) from ConfException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

<a id="m-ncsexception-4c8498b021a1"></a>
### NcsException(String)

```java
protected NcsException(String msg)
```

**Parameters**

- `String msg`

<a id="m-ncsexception-4c5d5b8901ed"></a>
### NcsException(String, ErrorCode, Throwable)

```java
public NcsException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

<a id="m-ncsexception-d4d509601928"></a>
### NcsException(String, Throwable)

```java
public NcsException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`
