<a id="cls-ConfEException"></a>
# ConfEException

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

- [ConfEException(String)](#m-confeexception-c640f41f4223)
- [ConfEException(String, Throwable)](#m-confeexception-db09789b919c)
- [ConfEException(Throwable)](#m-confeexception-e03f5666b3e4)

## Constructors

<a id="m-confeexception-c640f41f4223"></a>
### ConfEException(String)

```java
public ConfEException(String msg)
```

**Parameters**

- `String msg`

<a id="m-confeexception-db09789b919c"></a>
### ConfEException(String, Throwable)

```java
public ConfEException(String msg, Throwable cause)
```

Provides a detailed message.

**Parameters**

- `String msg`
- `Throwable cause`

<a id="m-confeexception-e03f5666b3e4"></a>
### ConfEException(Throwable)

```java
public ConfEException(Throwable cause)
```

Provides no message.

**Parameters**

- `Throwable cause`
