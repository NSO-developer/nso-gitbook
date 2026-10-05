<a id="s-MaapiWarningException"></a>
# MaapiWarningException

```java
public class com.tailf.maapi.MaapiWarningException
    extends com.tailf.maapi.MaapiException
```

Types: [MaapiException](MaapiException.md#s-MaapiException)

Warnings raised from the maapi package

## Members

**Constructors**:

- [MaapiWarningException(String)](#s-MaapiWarningException-1)
- [MaapiWarningException(String, ErrorCode, ConfWarning[])](#s-MaapiWarningException-2)
- [MaapiWarningException(String, int, ConfWarning[])](#s-MaapiWarningException-3)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#s-getErrorCode) from ConfException
- [getOpaque()](../conf/ConfException.md#s-getOpaque) from ConfException
- [getWarnings()](#s-getWarnings)
- [mk(ConfResponse)](MaapiException.md#s-mk) from MaapiException
- [mk(ConfResponse, ConfPath)](MaapiException.md#s-mk-1) from MaapiException

## Constructors

<a id="s-MaapiWarningException-1"></a>
### MaapiWarningException(String)

```java
public MaapiWarningException(String msg)
```

**Parameters**

- `String msg`

<a id="s-MaapiWarningException-2"></a>
### MaapiWarningException(String, ErrorCode, ConfWarning[])

```java
public MaapiWarningException(
    String msg,
    com.tailf.conf.ErrorCode code,
    com.tailf.conf.ConfWarning[] ws
)
```

Types: [ErrorCode](../conf/ErrorCode.md#s-ErrorCode), [ConfWarning](../conf/ConfWarning.md#s-ConfWarning)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `com.tailf.conf.ConfWarning[] ws`

<a id="s-MaapiWarningException-3"></a>
### MaapiWarningException(String, int, ConfWarning[])

```java
public MaapiWarningException(String msg, int codeInteger, com.tailf.conf.ConfWarning[] ws)
```

Types: [ConfWarning](../conf/ConfWarning.md#s-ConfWarning)

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

Types: [ConfWarning](../conf/ConfWarning.md#s-ConfWarning)
