# MaapiWarningException <a href="#maapiwarningexception-52f654d7ae54" id="maapiwarningexception-52f654d7ae54"></a>

```java
public class com.tailf.maapi.MaapiWarningException
    extends com.tailf.maapi.MaapiException
```

Types: [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

Warnings raised from the maapi package

## Members

**Constructors**:

- [MaapiWarningException(String)](#maapiwarningexception-8930de4ffd0a)
- [MaapiWarningException(String, ErrorCode, ConfWarning[])](#maapiwarningexception-6a1a58c2de36)
- [MaapiWarningException(String, int, ConfWarning[])](#maapiwarningexception-e976024f5184)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [getWarnings()](#getwarnings-875cbe661ca7)
- [mk(ConfResponse)](MaapiException.md#mk-de1cedfc6ea8) from MaapiException
- [mk(ConfResponse, ConfPath)](MaapiException.md#mk-79e69ffbc022) from MaapiException

## Constructors

### MaapiWarningException(String) <a href="#maapiwarningexception-8930de4ffd0a" id="maapiwarningexception-8930de4ffd0a"></a>

```java
public MaapiWarningException(String msg)
```

**Parameters**

- `String msg`

### MaapiWarningException(String, ErrorCode, ConfWarning[]) <a href="#maapiwarningexception-6a1a58c2de36" id="maapiwarningexception-6a1a58c2de36"></a>

```java
public MaapiWarningException(
    String msg,
    com.tailf.conf.ErrorCode code,
    com.tailf.conf.ConfWarning[] ws
)
```

Types: [ErrorCode](../conf/ErrorCode.md#errorcode-65263de08890), [ConfWarning](../conf/ConfWarning.md#confwarning-732794cbb596)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `com.tailf.conf.ConfWarning[] ws`

### MaapiWarningException(String, int, ConfWarning[]) <a href="#maapiwarningexception-e976024f5184" id="maapiwarningexception-e976024f5184"></a>

```java
public MaapiWarningException(String msg, int codeInteger, com.tailf.conf.ConfWarning[] ws)
```

Types: [ConfWarning](../conf/ConfWarning.md#confwarning-732794cbb596)

**Parameters**

- `String msg`
- `int codeInteger`
- `com.tailf.conf.ConfWarning[] ws`


## Methods

### getWarnings() <a href="#getwarnings-875cbe661ca7" id="getwarnings-875cbe661ca7"></a>

```java
public com.tailf.conf.ConfWarning[] getWarnings()
```

Types: [ConfWarning](../conf/ConfWarning.md#confwarning-732794cbb596)
