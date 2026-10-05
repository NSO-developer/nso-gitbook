<a id="s-MaapiMNsException"></a>
# MaapiMNsException

```java
public class com.tailf.maapi.MaapiMNsException
    extends com.tailf.maapi.MaapiException
```

Types: [MaapiException](MaapiException.md#s-MaapiException)

Warnings raised from the maapi package

**Related classes**

- [MaapiMNsMissingException](MaapiMNsMissingException.md#s-MaapiMNsMissingException)

## Members

**Constructors**:

- [MaapiMNsException()](#s-MaapiMNsException-1)
- [MaapiMNsException(String)](#s-MaapiMNsException-2)
- [MaapiMNsException(String, Throwable)](#s-MaapiMNsException-3)
- [MaapiMNsException(Throwable)](#s-MaapiMNsException-4)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#s-getErrorCode) from ConfException
- [getOpaque()](../conf/ConfException.md#s-getOpaque) from ConfException
- [mk(ConfResponse)](MaapiException.md#s-mk) from MaapiException
- [mk(ConfResponse, ConfPath)](MaapiException.md#s-mk-1) from MaapiException

## Constructors

<a id="s-MaapiMNsException-1"></a>
### MaapiMNsException()

```java
public MaapiMNsException()
```

<a id="s-MaapiMNsException-2"></a>
### MaapiMNsException(String)

```java
protected MaapiMNsException(String message)
```

**Parameters**

- `String message`

<a id="s-MaapiMNsException-3"></a>
### MaapiMNsException(String, Throwable)

```java
protected MaapiMNsException(String message, Throwable e)
```

**Parameters**

- `String message`
- `Throwable e`

<a id="s-MaapiMNsException-4"></a>
### MaapiMNsException(Throwable)

```java
public MaapiMNsException(Throwable e)
```

**Parameters**

- `Throwable e`
