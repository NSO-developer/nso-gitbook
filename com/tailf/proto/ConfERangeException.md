# ConfERangeException <a href="#conferangeexception-3f566066d5e7" id="conferangeexception-3f566066d5e7"></a>

```java
public class com.tailf.proto.ConfERangeException
    extends com.tailf.proto.ConfEException
```

Types: [ConfEException](ConfEException.md#confeexception-b29dcf955149)

Exception raised when an attempt is made to create an E term with data that
 is out of range for the term in question.

**See also:** [`ConfEByte`](ConfEByte.md#confebyte-983739ca0c0b), [`ConfEChar`](ConfEChar.md#confechar-5508552b6df0), [`ConfEInt`](ConfEInt.md#confeint-71ffd8a18157), [`ConfEUInt`](ConfEUInt.md#confeuint-121a73198dd9), [`ConfEShort`](ConfEShort.md#confeshort-f731373fcabf), [`ConfEUShort`](ConfEUShort.md#confeushort-5795f0387e29), [`ConfELong`](ConfELong.md#confelong-926979f5365d)

## Members

**Constructors**:

- [ConfERangeException\(String\)](#conferangeexception-de782d935745)
- [ConfERangeException\(String, Throwable\)](#conferangeexception-3e21becd1deb)

## Constructors

### ConfERangeException(String) <a href="#conferangeexception-de782d935745" id="conferangeexception-de782d935745"></a>

```java
public ConfERangeException(String msg)
```

**Parameters**

- `String msg`

### ConfERangeException(String, Throwable) <a href="#conferangeexception-3e21becd1deb" id="conferangeexception-3e21becd1deb"></a>

```java
public ConfERangeException(String msg, Throwable cause)
```

Provides a detailed message.

**Parameters**

- `String msg`
- `Throwable cause`
