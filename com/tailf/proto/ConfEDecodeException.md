# ConfEDecodeException <a href="#cls-ConfEDecodeException" id="cls-ConfEDecodeException"></a>

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

- [ConfEDecodeException(String)](#m-ConfEDecodeException-be17763994e7)
- [ConfEDecodeException(String, Throwable)](#m-ConfEDecodeException-0e577e411eca)

## Constructors

### ConfEDecodeException(String) <a href="#m-ConfEDecodeException-be17763994e7" id="m-ConfEDecodeException-be17763994e7"></a>

```java
public ConfEDecodeException(String msg)
```

**Parameters**

- `String msg`

### ConfEDecodeException(String, Throwable) <a href="#m-ConfEDecodeException-0e577e411eca" id="m-ConfEDecodeException-0e577e411eca"></a>

```java
public ConfEDecodeException(String msg, Throwable cause)
```

Provides a detailed message.

**Parameters**

- `String msg`
- `Throwable cause`
