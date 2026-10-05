# ConfBadTermException <a href="#cls-ConfBadTermException" id="cls-ConfBadTermException"></a>

```java
public class com.tailf.conf.ConfBadTermException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Exception thrown when protocol data is malformed.

## Members

**Constructors**:

- [ConfBadTermException(String, ErrorCode, Throwable)](#m-ConfBadTermException-4bfec5e7ece6)
- [ConfBadTermException(String, int, Throwable)](#m-ConfBadTermException-85e234e03090)

**Methods**:

- [getErrorCode()](ConfException.md#m-getErrorCode-812152fc083a) from ConfException
- [getOpaque()](ConfException.md#m-getOpaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](ConfException.md#m-mk-de1cedfc6ea8) from ConfException
- [mk(ConfResponse, ConfPath)](ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

### ConfBadTermException(String, ErrorCode, Throwable) <a href="#m-ConfBadTermException-4bfec5e7ece6" id="m-ConfBadTermException-4bfec5e7ece6"></a>

```java
public ConfBadTermException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

### ConfBadTermException(String, int, Throwable) <a href="#m-ConfBadTermException-85e234e03090" id="m-ConfBadTermException-85e234e03090"></a>

```java
public ConfBadTermException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`
