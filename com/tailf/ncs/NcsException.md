# NcsException <a href="#cls-NcsException" id="cls-NcsException"></a>

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

- [NcsException(String)](#m-NcsException-4c8498b021a1)
- [NcsException(String, ErrorCode, Throwable)](#m-NcsException-4c5d5b8901ed)
- [NcsException(String, Throwable)](#m-NcsException-d4d509601928)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-getErrorCode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getOpaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](../conf/ConfException.md#m-mk-de1cedfc6ea8) from ConfException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

### NcsException(String) <a href="#m-NcsException-4c8498b021a1" id="m-NcsException-4c8498b021a1"></a>

```java
protected NcsException(String msg)
```

**Parameters**

- `String msg`

### NcsException(String, ErrorCode, Throwable) <a href="#m-NcsException-4c5d5b8901ed" id="m-NcsException-4c5d5b8901ed"></a>

```java
public NcsException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

### NcsException(String, Throwable) <a href="#m-NcsException-d4d509601928" id="m-NcsException-d4d509601928"></a>

```java
public NcsException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`
