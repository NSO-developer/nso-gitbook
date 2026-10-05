<a id="cls-MaapiWarningException"></a>
# MaapiWarningException

```java
public class com.tailf.maapi.MaapiWarningException
    extends com.tailf.maapi.MaapiException
```

Types: [MaapiException](MaapiException.md#cls-MaapiException)

Warnings raised from the maapi package

## Members

**Constructors**:

- [MaapiWarningException(String)](#m-maapiwarningexception-8930de4ffd0a)
- [MaapiWarningException(String, ErrorCode, ConfWarning[])](#m-maapiwarningexception-6a1a58c2de36)
- [MaapiWarningException(String, int, ConfWarning[])](#m-maapiwarningexception-e976024f5184)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getopaque-92e4945ec92d) from ConfException
- [getWarnings()](#m-getwarnings-875cbe661ca7)
- [mk(ConfResponse)](MaapiException.md#m-mk-de1cedfc6ea8) from MaapiException
- [mk(ConfResponse, ConfPath)](MaapiException.md#m-mk-79e69ffbc022) from MaapiException

## Constructors

<a id="m-maapiwarningexception-8930de4ffd0a"></a>
### MaapiWarningException(String)

```java
public MaapiWarningException(String msg)
```

**Parameters**

- `String msg`

<a id="m-maapiwarningexception-6a1a58c2de36"></a>
### MaapiWarningException(String, ErrorCode, ConfWarning[])

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

<a id="m-maapiwarningexception-e976024f5184"></a>
### MaapiWarningException(String, int, ConfWarning[])

```java
public MaapiWarningException(String msg, int codeInteger, com.tailf.conf.ConfWarning[] ws)
```

Types: [ConfWarning](../conf/ConfWarning.md#cls-ConfWarning)

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

Types: [ConfWarning](../conf/ConfWarning.md#cls-ConfWarning)
