<a id="s-ConfEInt"></a>
# ConfEInt

```java
public class com.tailf.proto.ConfEInt
    extends com.tailf.proto.ConfELong
```

Types: [ConfELong](ConfELong.md#s-ConfELong)

Provides a Java representation of E integral types.

## Members

**Constructors**:

- [ConfEInt(ConfInputStream)](#s-ConfEInt-1)
- [ConfEInt(int)](#s-ConfEInt-2)

**Fields**:

- [serialVersionUID](#s-serialVersionUID)

**Methods**:

- [byteValue()](ConfELong.md#s-byteValue) from ConfELong
- [charValue()](ConfELong.md#s-charValue) from ConfELong
- [clone()](ConfEObject.md#s-clone) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#s-decode) from ConfEObject
- [encode(ConfOutputStream)](ConfELong.md#s-encode) from ConfELong
- [equals(Object)](ConfELong.md#s-equals) from ConfELong
- [hashCode()](ConfELong.md#s-hashCode) from ConfELong
- [intValue()](ConfELong.md#s-intValue) from ConfELong
- [longValue()](ConfELong.md#s-longValue) from ConfELong
- [shortValue()](ConfELong.md#s-shortValue) from ConfELong
- [toString()](ConfELong.md#s-toString) from ConfELong
- [uIntValue()](ConfELong.md#s-uIntValue) from ConfELong
- [uShortValue()](ConfELong.md#s-uShortValue) from ConfELong

## Constructors

<a id="s-ConfEInt-1"></a>
### ConfEInt(ConfInputStream)

```java
public ConfEInt(
    com.tailf.proto.ConfInputStream buf
)
    throws com.tailf.proto.ConfERangeException, com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#s-ConfInputStream), [ConfERangeException](ConfERangeException.md#s-ConfERangeException), [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Create an E integer from a stream containing an integer encoded in E
 external format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded value.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E integer.
- `ConfERangeException` - if the value is too large to be represented as an int.

<a id="s-ConfEInt-2"></a>
### ConfEInt(int)

```java
public ConfEInt(int i)
```

Create an E integer from the given value.

**Parameters**

- `int i` - the int value to use.


## Fields

<a id="s-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = 1229430977614805556;
```
