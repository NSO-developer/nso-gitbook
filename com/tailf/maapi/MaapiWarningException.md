# MaapiWarningException <a href="#cls-MaapiWarningException" id="cls-MaapiWarningException"></a>

```java
public class com.tailf.maapi.MaapiWarningException
    extends com.tailf.maapi.MaapiException
```

Types: [MaapiException](MaapiException.md#cls-MaapiException)

Warnings raised from the maapi package

## Members

**Constructors**:

- [MaapiWarningException(String)](#m-MaapiWarningException-8930de4ffd0a)
- [MaapiWarningException(String, ErrorCode, ConfWarning[])](#m-MaapiWarningException-6a1a58c2de36)
- [MaapiWarningException(String, int, ConfWarning[])](#m-MaapiWarningException-e976024f5184)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-getErrorCode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getOpaque-92e4945ec92d) from ConfException
- [getWarnings()](#m-getWarnings-875cbe661ca7)
- [mk(ConfResponse)](MaapiException.md#m-mk-de1cedfc6ea8) from MaapiException
- [mk(ConfResponse, ConfPath)](MaapiException.md#m-mk-79e69ffbc022) from MaapiException

## Constructors

### MaapiWarningException(String) <a href="#m-MaapiWarningException-8930de4ffd0a" id="m-MaapiWarningException-8930de4ffd0a"></a>

```java
public MaapiWarningException(String msg)
```

**Parameters**

- `String msg`

### MaapiWarningException(String, ErrorCode, ConfWarning[]) <a href="#m-MaapiWarningException-6a1a58c2de36" id="m-MaapiWarningException-6a1a58c2de36"></a>

```java
public MaapiWarningException(
    String msg,
    com.tailf.conf.ErrorCode code,
    com.tailf.conf.ConfWarning[] ws
)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode), [ConfWarning](../conf/ConfWarning.md#cls-ConfWarning)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `com.tailf.conf.ConfWarning[] ws`

### MaapiWarningException(String, int, ConfWarning[]) <a href="#m-MaapiWarningException-e976024f5184" id="m-MaapiWarningException-e976024f5184"></a>

```java
public MaapiWarningException(String msg, int codeInteger, com.tailf.conf.ConfWarning[] ws)
```

Types: [ConfWarning](../conf/ConfWarning.md#cls-ConfWarning)

**Parameters**

- `String msg`
- `int codeInteger`
- `com.tailf.conf.ConfWarning[] ws`


## Methods

### getWarnings() <a href="#m-getWarnings-875cbe661ca7" id="m-getWarnings-875cbe661ca7"></a>

```java
public com.tailf.conf.ConfWarning[] getWarnings()
```

Types: [ConfWarning](../conf/ConfWarning.md#cls-ConfWarning)
