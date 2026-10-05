# NcsException <a href="#ncsexception-d2b40ca98ea5" id="ncsexception-d2b40ca98ea5"></a>

```java
public class com.tailf.ncs.NcsException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Ncs package generic exception

**Related classes**

- [NcsCtrlException](ctrl/NcsCtrlException.md#ncsctrlexception-5ca72987a4d7)

## Members

**Constructors**:

- [NcsException(String)](#ncsexception-4c8498b021a1)
- [NcsException(String, ErrorCode, Throwable)](#ncsexception-4c5d5b8901ed)
- [NcsException(String, Throwable)](#ncsexception-d4d509601928)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](../conf/ConfException.md#mk-de1cedfc6ea8) from ConfException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#mk-79e69ffbc022) from ConfException

## Constructors

### NcsException(String) <a href="#ncsexception-4c8498b021a1" id="ncsexception-4c8498b021a1"></a>

```java
protected NcsException(String msg)
```

**Parameters**

- `String msg`

### NcsException(String, ErrorCode, Throwable) <a href="#ncsexception-4c5d5b8901ed" id="ncsexception-4c5d5b8901ed"></a>

```java
public NcsException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

### NcsException(String, Throwable) <a href="#ncsexception-d4d509601928" id="ncsexception-d4d509601928"></a>

```java
public NcsException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`
