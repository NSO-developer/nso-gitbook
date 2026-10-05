<a id="s-ConfERangeException"></a>
# ConfERangeException

```java
public class com.tailf.proto.ConfERangeException
    extends com.tailf.proto.ConfEException
```

Types: [ConfEException](ConfEException.md#s-ConfEException)

Exception raised when an attempt is made to create an E term with data that
 is out of range for the term in question.

**See also:** [`ConfEByte`](ConfEByte.md#s-ConfEByte), [`ConfEChar`](ConfEChar.md#s-ConfEChar), [`ConfEInt`](ConfEInt.md#s-ConfEInt), [`ConfEUInt`](ConfEUInt.md#s-ConfEUInt), [`ConfEShort`](ConfEShort.md#s-ConfEShort), [`ConfEUShort`](ConfEUShort.md#s-ConfEUShort), [`ConfELong`](ConfELong.md#s-ConfELong)

## Members

**Constructors**:

- [ConfERangeException(String)](#s-ConfERangeException-1)
- [ConfERangeException(String, Throwable)](#s-ConfERangeException-2)

## Constructors

<a id="s-ConfERangeException-1"></a>
### ConfERangeException(String)

```java
public ConfERangeException(String msg)
```

**Parameters**

- `String msg`

<a id="s-ConfERangeException-2"></a>
### ConfERangeException(String, Throwable)

```java
public ConfERangeException(String msg, Throwable cause)
```

Provides a detailed message.

**Parameters**

- `String msg`
- `Throwable cause`
