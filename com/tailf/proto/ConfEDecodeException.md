# ConfEDecodeException <a href="#confedecodeexception-3e50145f8aae" id="confedecodeexception-3e50145f8aae"></a>

```java
public class com.tailf.proto.ConfEDecodeException
    extends com.tailf.proto.ConfEException
```

Types: [ConfEException](ConfEException.md#confeexception-b29dcf955149)

Exception raised when an attempt is made to create an E term by decoding a
 sequence of bytes that does not represent the type of term that was
 requested.

**See also:** [`ConfInputStream`](ConfInputStream.md#confinputstream-c4a961d10b62)

## Members

**Constructors**:

- [ConfEDecodeException(String)](#confedecodeexception-be17763994e7)
- [ConfEDecodeException(String, Throwable)](#confedecodeexception-0e577e411eca)

## Constructors

### ConfEDecodeException(String) <a href="#confedecodeexception-be17763994e7" id="confedecodeexception-be17763994e7"></a>

```java
public ConfEDecodeException(String msg)
```

**Parameters**

- `String msg`

### ConfEDecodeException(String, Throwable) <a href="#confedecodeexception-0e577e411eca" id="confedecodeexception-0e577e411eca"></a>

```java
public ConfEDecodeException(String msg, Throwable cause)
```

Provides a detailed message.

**Parameters**

- `String msg`
- `Throwable cause`
