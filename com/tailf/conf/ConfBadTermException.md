<a id="s-ConfBadTermException"></a>
# ConfBadTermException

```java
public class com.tailf.conf.ConfBadTermException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Exception thrown when protocol data is malformed.

## Members

**Constructors**:

- [ConfBadTermException(String, ErrorCode, Throwable)](#s-ConfBadTermException-1)
- [ConfBadTermException(String, int, Throwable)](#s-ConfBadTermException-2)

**Methods**:

- [getErrorCode()](ConfException.md#s-getErrorCode) from ConfException
- [getOpaque()](ConfException.md#s-getOpaque) from ConfException
- [mk(ConfResponse)](ConfException.md#s-mk) from ConfException
- [mk(ConfResponse, ConfPath)](ConfException.md#s-mk-1) from ConfException

## Constructors

<a id="s-ConfBadTermException-1"></a>
### ConfBadTermException(String, ErrorCode, Throwable)

```java
public ConfBadTermException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](ErrorCode.md#s-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

<a id="s-ConfBadTermException-2"></a>
### ConfBadTermException(String, int, Throwable)

```java
public ConfBadTermException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`
