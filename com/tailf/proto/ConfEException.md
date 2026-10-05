<a id="s-ConfEException"></a>
# ConfEException

```java
public abstract class com.tailf.proto.ConfEException
    extends Exception
```

Base class for the other Conf E exception classes.

**Related classes**

- [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)
- [ConfERangeException](ConfERangeException.md#s-ConfERangeException)

## Members

**Constructors**:

- [ConfEException(String)](#s-ConfEException-1)
- [ConfEException(String, Throwable)](#s-ConfEException-2)
- [ConfEException(Throwable)](#s-ConfEException-3)

## Constructors

<a id="s-ConfEException-1"></a>
### ConfEException(String)

```java
public ConfEException(String msg)
```

**Parameters**

- `String msg`

<a id="s-ConfEException-2"></a>
### ConfEException(String, Throwable)

```java
public ConfEException(String msg, Throwable cause)
```

Provides a detailed message.

**Parameters**

- `String msg`
- `Throwable cause`

<a id="s-ConfEException-3"></a>
### ConfEException(Throwable)

```java
public ConfEException(Throwable cause)
```

Provides no message.

**Parameters**

- `Throwable cause`
