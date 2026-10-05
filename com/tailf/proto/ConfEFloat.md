<a id="s-ConfEFloat"></a>
# ConfEFloat

```java
public class com.tailf.proto.ConfEFloat
    extends com.tailf.proto.ConfEDouble
```

Types: [ConfEDouble](ConfEDouble.md#s-ConfEDouble)

Provides a Java representation of E floats and doubles.

## Members

**Constructors**:

- [ConfEFloat(ConfInputStream)](#s-ConfEFloat-1)
- [ConfEFloat(float)](#s-ConfEFloat-2)

**Fields**:

- [serialVersionUID](#s-serialVersionUID)

**Methods**:

- [clone()](ConfEObject.md#s-clone) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#s-decode) from ConfEObject
- [doubleValue()](ConfEDouble.md#s-doubleValue) from ConfEDouble
- [encode(ConfOutputStream)](ConfEDouble.md#s-encode) from ConfEDouble
- [equals(Object)](ConfEDouble.md#s-equals) from ConfEDouble
- [floatValue()](ConfEDouble.md#s-floatValue) from ConfEDouble
- [hashCode()](ConfEDouble.md#s-hashCode) from ConfEDouble
- [toString()](ConfEDouble.md#s-toString) from ConfEDouble

## Constructors

<a id="s-ConfEFloat-1"></a>
### ConfEFloat(ConfInputStream)

```java
public ConfEFloat(
    com.tailf.proto.ConfInputStream buf
)
    throws com.tailf.proto.ConfEDecodeException, com.tailf.proto.ConfERangeException
```

Types: [ConfInputStream](ConfInputStream.md#s-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException), [ConfERangeException](ConfERangeException.md#s-ConfERangeException)

Create an E float from a stream containing a float encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded value.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E float.
- `ConfERangeException` - if the value cannot be represented as a Java float.

<a id="s-ConfEFloat-2"></a>
### ConfEFloat(float)

```java
public ConfEFloat(float f)
```

Create an E float from the given float value.

**Parameters**

- `float f`


## Fields

<a id="s-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = -2231546377289456934;
```
