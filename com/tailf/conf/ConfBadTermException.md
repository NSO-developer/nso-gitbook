# ConfBadTermException <a href="#confbadtermexception-cf79bd96951c" id="confbadtermexception-cf79bd96951c"></a>

```java
public class com.tailf.conf.ConfBadTermException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Exception thrown when protocol data is malformed.

## Members

**Constructors**:

- [ConfBadTermException(String, ErrorCode, Throwable)](#confbadtermexception-4bfec5e7ece6)
- [ConfBadTermException(String, int, Throwable)](#confbadtermexception-85e234e03090)

**Methods**:

- [getErrorCode()](ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getOpaque()](ConfException.md#getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](ConfException.md#mk-de1cedfc6ea8) from ConfException
- [mk(ConfResponse, ConfPath)](ConfException.md#mk-79e69ffbc022) from ConfException

## Constructors

### ConfBadTermException(String, ErrorCode, Throwable) <a href="#confbadtermexception-4bfec5e7ece6" id="confbadtermexception-4bfec5e7ece6"></a>

```java
public ConfBadTermException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

### ConfBadTermException(String, int, Throwable) <a href="#confbadtermexception-85e234e03090" id="confbadtermexception-85e234e03090"></a>

```java
public ConfBadTermException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`
