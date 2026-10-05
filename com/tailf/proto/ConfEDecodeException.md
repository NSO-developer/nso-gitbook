<a id="cls-ConfEDecodeException"></a>
# ConfEDecodeException

```java
public class com.tailf.proto.ConfEDecodeException
    extends com.tailf.proto.ConfEException
```

Types: [ConfEException](ConfEException.md#cls-ConfEException)

Exception raised when an attempt is made to create an E term by decoding a
 sequence of bytes that does not represent the type of term that was
 requested.

**See also:** [`ConfInputStream`](ConfInputStream.md#cls-ConfInputStream)

## Members

**Constructors**:

- [ConfEDecodeException(String)](#m-confedecodeexception-be17763994e7)
- [ConfEDecodeException(String, Throwable)](#m-confedecodeexception-0e577e411eca)

## Constructors

<a id="m-confedecodeexception-be17763994e7"></a>
### ConfEDecodeException(String)

```java
public ConfEDecodeException(String msg)
```

**Parameters**

- `String msg`

<a id="m-confedecodeexception-0e577e411eca"></a>
### ConfEDecodeException(String, Throwable)

```java
public ConfEDecodeException(String msg, Throwable cause)
```

Provides a detailed message.

**Parameters**

- `String msg`
- `Throwable cause`
