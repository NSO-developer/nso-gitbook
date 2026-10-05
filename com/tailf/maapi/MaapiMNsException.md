<a id="cls-MaapiMNsException"></a>
# MaapiMNsException

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

- [MaapiMNsException()](#m-maapimnsexception-ecaf045bb69f)
- [MaapiMNsException(String)](#m-maapimnsexception-685feed2a82c)
- [MaapiMNsException(String, Throwable)](#m-maapimnsexception-9b2e85d8ea1e)
- [MaapiMNsException(Throwable)](#m-maapimnsexception-f03a76028dfc)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](MaapiException.md#m-mk-de1cedfc6ea8) from MaapiException
- [mk(ConfResponse, ConfPath)](MaapiException.md#m-mk-79e69ffbc022) from MaapiException

## Constructors

<a id="m-maapimnsexception-ecaf045bb69f"></a>
### MaapiMNsException()

```java
public MaapiMNsException()
```

<a id="m-maapimnsexception-685feed2a82c"></a>
### MaapiMNsException(String)

```java
protected MaapiMNsException(String message)
```

**Parameters**

- `String message`

<a id="m-maapimnsexception-9b2e85d8ea1e"></a>
### MaapiMNsException(String, Throwable)

```java
protected MaapiMNsException(String message, Throwable e)
```

**Parameters**

- `String message`
- `Throwable e`

<a id="m-maapimnsexception-f03a76028dfc"></a>
### MaapiMNsException(Throwable)

```java
public MaapiMNsException(Throwable e)
```

**Parameters**

- `Throwable e`
