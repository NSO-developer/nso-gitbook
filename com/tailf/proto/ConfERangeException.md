<a id="cls-ConfERangeException"></a>
# ConfERangeException

```java
public class com.tailf.proto.ConfERangeException
    extends com.tailf.proto.ConfEException
```

Types: [ConfEException](ConfEException.md#cls-ConfEException)

Exception raised when an attempt is made to create an E term with data that
 is out of range for the term in question.

**See also:** [`ConfEByte`](ConfEByte.md#cls-ConfEByte), [`ConfEChar`](ConfEChar.md#cls-ConfEChar), [`ConfEInt`](ConfEInt.md#cls-ConfEInt), [`ConfEUInt`](ConfEUInt.md#cls-ConfEUInt), [`ConfEShort`](ConfEShort.md#cls-ConfEShort), [`ConfEUShort`](ConfEUShort.md#cls-ConfEUShort), [`ConfELong`](ConfELong.md#cls-ConfELong)

## Members

**Constructors**:

- [ConfERangeException(String)](#m-conferangeexception-de782d935745)
- [ConfERangeException(String, Throwable)](#m-conferangeexception-3e21becd1deb)

## Constructors

<a id="m-conferangeexception-de782d935745"></a>
### ConfERangeException(String)

```java
public ConfERangeException(String msg)
```

**Parameters**

- `String msg`

<a id="m-conferangeexception-3e21becd1deb"></a>
### ConfERangeException(String, Throwable)

```java
public ConfERangeException(String msg, Throwable cause)
```

Provides a detailed message.

**Parameters**

- `String msg`
- `Throwable cause`
