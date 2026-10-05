# MaapiMNsException <a href="#cls-MaapiMNsException" id="cls-MaapiMNsException"></a>

```java
public class com.tailf.maapi.MaapiMNsException
    extends com.tailf.maapi.MaapiException
```

Types: [MaapiException](MaapiException.md#cls-MaapiException)

Warnings raised from the maapi package

**Related classes**

- [MaapiMNsMissingException](MaapiMNsMissingException.md#cls-MaapiMNsMissingException)

## Members

**Constructors**:

- [MaapiMNsException()](#m-MaapiMNsException-ecaf045bb69f)
- [MaapiMNsException(String)](#m-MaapiMNsException-685feed2a82c)
- [MaapiMNsException(String, Throwable)](#m-MaapiMNsException-9b2e85d8ea1e)
- [MaapiMNsException(Throwable)](#m-MaapiMNsException-f03a76028dfc)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-getErrorCode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getOpaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](MaapiException.md#m-mk-de1cedfc6ea8) from MaapiException
- [mk(ConfResponse, ConfPath)](MaapiException.md#m-mk-79e69ffbc022) from MaapiException

## Constructors

### MaapiMNsException() <a href="#m-MaapiMNsException-ecaf045bb69f" id="m-MaapiMNsException-ecaf045bb69f"></a>

```java
public MaapiMNsException()
```

### MaapiMNsException(String) <a href="#m-MaapiMNsException-685feed2a82c" id="m-MaapiMNsException-685feed2a82c"></a>

```java
protected MaapiMNsException(String message)
```

**Parameters**

- `String message`

### MaapiMNsException(String, Throwable) <a href="#m-MaapiMNsException-9b2e85d8ea1e" id="m-MaapiMNsException-9b2e85d8ea1e"></a>

```java
protected MaapiMNsException(String message, Throwable e)
```

**Parameters**

- `String message`
- `Throwable e`

### MaapiMNsException(Throwable) <a href="#m-MaapiMNsException-f03a76028dfc" id="m-MaapiMNsException-f03a76028dfc"></a>

```java
public MaapiMNsException(Throwable e)
```

**Parameters**

- `Throwable e`
