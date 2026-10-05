# ConfEException <a href="#cls-ConfEException" id="cls-ConfEException"></a>

```java
public abstract class com.tailf.proto.ConfEException
    extends Exception
```

Base class for the other Conf E exception classes.

**Related classes**

- [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)
- [ConfERangeException](ConfERangeException.md#cls-ConfERangeException)

## Members

**Constructors**:

- [ConfEException(String)](#m-ConfEException-c640f41f4223)
- [ConfEException(String, Throwable)](#m-ConfEException-db09789b919c)
- [ConfEException(Throwable)](#m-ConfEException-e03f5666b3e4)

## Constructors

### ConfEException(String) <a href="#m-ConfEException-c640f41f4223" id="m-ConfEException-c640f41f4223"></a>

```java
public ConfEException(String msg)
```

**Parameters**

- `String msg`

### ConfEException(String, Throwable) <a href="#m-ConfEException-db09789b919c" id="m-ConfEException-db09789b919c"></a>

```java
public ConfEException(String msg, Throwable cause)
```

Provides a detailed message.

**Parameters**

- `String msg`
- `Throwable cause`

### ConfEException(Throwable) <a href="#m-ConfEException-e03f5666b3e4" id="m-ConfEException-e03f5666b3e4"></a>

```java
public ConfEException(Throwable cause)
```

Provides no message.

**Parameters**

- `Throwable cause`
