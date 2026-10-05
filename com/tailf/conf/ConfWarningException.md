# ConfWarningException <a href="#cls-ConfWarningException" id="cls-ConfWarningException"></a>

```java
public class com.tailf.conf.ConfWarningException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Warning exception base class.

## Members

**Constructors**:

- [ConfWarningException(String, ErrorCode, ConfWarning[])](#m-ConfWarningException-05f73704f552)
- [ConfWarningException(String, int, ConfWarning[])](#m-ConfWarningException-535efc462eac)

**Methods**:

- [getErrorCode()](ConfException.md#m-getErrorCode-812152fc083a) from ConfException
- [getOpaque()](ConfException.md#m-getOpaque-92e4945ec92d) from ConfException
- [getWarnings()](#m-getWarnings-875cbe661ca7)
- [mk(ConfResponse)](ConfException.md#m-mk-de1cedfc6ea8) from ConfException
- [mk(ConfResponse, ConfPath)](ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

### ConfWarningException(String, ErrorCode, ConfWarning[]) <a href="#m-ConfWarningException-05f73704f552" id="m-ConfWarningException-05f73704f552"></a>

```java
public ConfWarningException(
    String msg,
    com.tailf.conf.ErrorCode code,
    com.tailf.conf.ConfWarning[] ws
)
```

Types: [ErrorCode](ErrorCode.md#cls-ErrorCode), [ConfWarning](ConfWarning.md#cls-ConfWarning)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `com.tailf.conf.ConfWarning[] ws`

### ConfWarningException(String, int, ConfWarning[]) <a href="#m-ConfWarningException-535efc462eac" id="m-ConfWarningException-535efc462eac"></a>

```java
public ConfWarningException(String msg, int codeInteger, com.tailf.conf.ConfWarning[] ws)
```

Types: [ConfWarning](ConfWarning.md#cls-ConfWarning)

**Parameters**

- `String msg`
- `int codeInteger`
- `com.tailf.conf.ConfWarning[] ws`


## Methods

### getWarnings() <a href="#m-getWarnings-875cbe661ca7" id="m-getWarnings-875cbe661ca7"></a>

```java
public com.tailf.conf.ConfWarning[] getWarnings()
```

Types: [ConfWarning](ConfWarning.md#cls-ConfWarning)
