<a id="cls-ConfWarningException"></a>
# ConfWarningException

```java
public class com.tailf.conf.ConfWarningException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Warning exception base class.

## Members

**Constructors**:

- [ConfWarningException(String, ErrorCode, ConfWarning[])](#m-confwarningexception-05f73704f552)
- [ConfWarningException(String, int, ConfWarning[])](#m-confwarningexception-535efc462eac)

**Methods**:

- [getErrorCode()](ConfException.md#m-geterrorcode-812152fc083a) from ConfException
- [getOpaque()](ConfException.md#m-getopaque-92e4945ec92d) from ConfException
- [getWarnings()](#m-getwarnings-875cbe661ca7)
- [mk(ConfResponse)](ConfException.md#m-mk-de1cedfc6ea8) from ConfException
- [mk(ConfResponse, ConfPath)](ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

<a id="m-confwarningexception-05f73704f552"></a>
### ConfWarningException(String, ErrorCode, ConfWarning[])

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

<a id="m-confwarningexception-535efc462eac"></a>
### ConfWarningException(String, int, ConfWarning[])

```java
public ConfWarningException(String msg, int codeInteger, com.tailf.conf.ConfWarning[] ws)
```

Types: [ConfWarning](ConfWarning.md#cls-ConfWarning)

**Parameters**

- `String msg`
- `int codeInteger`
- `com.tailf.conf.ConfWarning[] ws`


## Methods

<a id="m-getwarnings-875cbe661ca7"></a>
### getWarnings()

```java
public com.tailf.conf.ConfWarning[] getWarnings()
```

Types: [ConfWarning](ConfWarning.md#cls-ConfWarning)
