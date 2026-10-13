# ConfWarningException <a href="#confwarningexception-0eb4469acfd8" id="confwarningexception-0eb4469acfd8"></a>

```java
public class com.tailf.conf.ConfWarningException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Warning exception base class.

## Members

**Constructors**:

- [ConfWarningException\(String, ErrorCode, ConfWarning\[\]\)](#confwarningexception-05f73704f552)
- [ConfWarningException\(String, int, ConfWarning\[\]\)](#confwarningexception-535efc462eac)

**Methods**:

- [getErrorCode\(\)](ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getOpaque\(\)](ConfException.md#getopaque-92e4945ec92d) from ConfException
- [getWarnings\(\)](#getwarnings-875cbe661ca7)
- [mk\(ConfResponse\)](ConfException.md#mk-de1cedfc6ea8) from ConfException
- [mk\(ConfResponse, ConfPath\)](ConfException.md#mk-79e69ffbc022) from ConfException

## Constructors

### ConfWarningException(String, ErrorCode, ConfWarning[]) <a href="#confwarningexception-05f73704f552" id="confwarningexception-05f73704f552"></a>

```java
public ConfWarningException(
    String msg,
    com.tailf.conf.ErrorCode code,
    com.tailf.conf.ConfWarning[] ws
)
```

Types: [ErrorCode](ErrorCode.md#errorcode-65263de08890), [ConfWarning](ConfWarning.md#confwarning-732794cbb596)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `com.tailf.conf.ConfWarning[] ws`

### ConfWarningException(String, int, ConfWarning[]) <a href="#confwarningexception-535efc462eac" id="confwarningexception-535efc462eac"></a>

```java
public ConfWarningException(String msg, int codeInteger, com.tailf.conf.ConfWarning[] ws)
```

Types: [ConfWarning](ConfWarning.md#confwarning-732794cbb596)

**Parameters**

- `String msg`
- `int codeInteger`
- `com.tailf.conf.ConfWarning[] ws`


## Methods

### getWarnings() <a href="#getwarnings-875cbe661ca7" id="getwarnings-875cbe661ca7"></a>

```java
public com.tailf.conf.ConfWarning[] getWarnings()
```

Types: [ConfWarning](ConfWarning.md#confwarning-732794cbb596)
