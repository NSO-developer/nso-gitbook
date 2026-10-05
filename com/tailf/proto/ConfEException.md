# ConfEException <a href="#confeexception-b29dcf955149" id="confeexception-b29dcf955149"></a>

```java
public abstract class com.tailf.proto.ConfEException
    extends Exception
```

Base class for the other Conf E exception classes.

**Related classes**

- [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)
- [ConfERangeException](ConfERangeException.md#conferangeexception-3f566066d5e7)

## Members

**Constructors**:

- [ConfEException(String)](#confeexception-c640f41f4223)
- [ConfEException(String, Throwable)](#confeexception-db09789b919c)
- [ConfEException(Throwable)](#confeexception-e03f5666b3e4)

## Constructors

### ConfEException(String) <a href="#confeexception-c640f41f4223" id="confeexception-c640f41f4223"></a>

```java
public ConfEException(String msg)
```

**Parameters**

- `String msg`

### ConfEException(String, Throwable) <a href="#confeexception-db09789b919c" id="confeexception-db09789b919c"></a>

```java
public ConfEException(String msg, Throwable cause)
```

Provides a detailed message.

**Parameters**

- `String msg`
- `Throwable cause`

### ConfEException(Throwable) <a href="#confeexception-e03f5666b3e4" id="confeexception-e03f5666b3e4"></a>

```java
public ConfEException(Throwable cause)
```

Provides no message.

**Parameters**

- `Throwable cause`
