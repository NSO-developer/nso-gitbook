# MaapiMNsException <a href="#maapimnsexception-c5654bb45674" id="maapimnsexception-c5654bb45674"></a>

```java
public class com.tailf.maapi.MaapiMNsException
    extends com.tailf.maapi.MaapiException
```

Types: [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

Warnings raised from the maapi package

**Related classes**

- [MaapiMNsMissingException](MaapiMNsMissingException.md#maapimnsmissingexception-37f8556358f1)

## Members

**Constructors**:

- [MaapiMNsException\(\)](#maapimnsexception-ecaf045bb69f)
- [MaapiMNsException\(String\)](#maapimnsexception-685feed2a82c)
- [MaapiMNsException\(String, Throwable\)](#maapimnsexception-9b2e85d8ea1e)
- [MaapiMNsException\(Throwable\)](#maapimnsexception-f03a76028dfc)

**Methods**:

- [getErrorCode\(\)](../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getOpaque\(\)](../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [mk\(ConfResponse\)](MaapiException.md#mk-de1cedfc6ea8) from MaapiException
- [mk\(ConfResponse, ConfPath\)](MaapiException.md#mk-79e69ffbc022) from MaapiException

## Constructors

### MaapiMNsException() <a href="#maapimnsexception-ecaf045bb69f" id="maapimnsexception-ecaf045bb69f"></a>

```java
public MaapiMNsException()
```

### MaapiMNsException(String) <a href="#maapimnsexception-685feed2a82c" id="maapimnsexception-685feed2a82c"></a>

```java
protected MaapiMNsException(String message)
```

**Parameters**

- `String message`

### MaapiMNsException(String, Throwable) <a href="#maapimnsexception-9b2e85d8ea1e" id="maapimnsexception-9b2e85d8ea1e"></a>

```java
protected MaapiMNsException(String message, Throwable e)
```

**Parameters**

- `String message`
- `Throwable e`

### MaapiMNsException(Throwable) <a href="#maapimnsexception-f03a76028dfc" id="maapimnsexception-f03a76028dfc"></a>

```java
public MaapiMNsException(Throwable e)
```

**Parameters**

- `Throwable e`
