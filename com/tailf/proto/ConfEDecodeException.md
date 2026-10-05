<a id="s-ConfEDecodeException"></a>
# ConfEDecodeException

```java
public class com.tailf.proto.ConfEDecodeException
    extends com.tailf.proto.ConfEException
```

Types: [ConfEException](ConfEException.md#s-ConfEException)

Exception raised when an attempt is made to create an E term by decoding a
 sequence of bytes that does not represent the type of term that was
 requested.

**See also:** [`ConfInputStream`](ConfInputStream.md#s-ConfInputStream)

## Members

**Constructors**:

- [ConfEDecodeException(String)](#s-ConfEDecodeException-1)
- [ConfEDecodeException(String, Throwable)](#s-ConfEDecodeException-2)

## Constructors

<a id="s-ConfEDecodeException-1"></a>
### ConfEDecodeException(String)

```java
public ConfEDecodeException(String msg)
```

**Parameters**

- `String msg`

<a id="s-ConfEDecodeException-2"></a>
### ConfEDecodeException(String, Throwable)

```java
public ConfEDecodeException(String msg, Throwable cause)
```

Provides a detailed message.

**Parameters**

- `String msg`
- `Throwable cause`
