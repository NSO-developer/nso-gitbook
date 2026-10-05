<a id="s-ConfWarningException"></a>
# ConfWarningException

```java
public class com.tailf.conf.ConfWarningException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Warning exception base class.

## Members

**Constructors**:

- [ConfWarningException(String, ErrorCode, ConfWarning[])](#s-ConfWarningException-1)
- [ConfWarningException(String, int, ConfWarning[])](#s-ConfWarningException-2)

**Methods**:

- [getErrorCode()](ConfException.md#s-getErrorCode) from ConfException
- [getOpaque()](ConfException.md#s-getOpaque) from ConfException
- [getWarnings()](#s-getWarnings)
- [mk(ConfResponse)](ConfException.md#s-mk) from ConfException
- [mk(ConfResponse, ConfPath)](ConfException.md#s-mk-1) from ConfException

## Constructors

<a id="s-ConfWarningException-1"></a>
### ConfWarningException(String, ErrorCode, ConfWarning[])

```java
public ConfWarningException(
    String msg,
    com.tailf.conf.ErrorCode code,
    com.tailf.conf.ConfWarning[] ws
)
```

Types: [ErrorCode](ErrorCode.md#s-ErrorCode), [ConfWarning](ConfWarning.md#s-ConfWarning)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `com.tailf.conf.ConfWarning[] ws`

<a id="s-ConfWarningException-2"></a>
### ConfWarningException(String, int, ConfWarning[])

```java
public ConfWarningException(String msg, int codeInteger, com.tailf.conf.ConfWarning[] ws)
```

Types: [ConfWarning](ConfWarning.md#s-ConfWarning)

**Parameters**

- `String msg`
- `int codeInteger`
- `com.tailf.conf.ConfWarning[] ws`


## Methods

<a id="s-getWarnings"></a>
### getWarnings()

```java
public com.tailf.conf.ConfWarning[] getWarnings()
```

Types: [ConfWarning](ConfWarning.md#s-ConfWarning)
