# ConfEFloat <a href="#cls-ConfEFloat" id="cls-ConfEFloat"></a>

```java
public class com.tailf.proto.ConfEFloat
    extends com.tailf.proto.ConfEDouble
```

Types: [ConfEDouble](ConfEDouble.md#cls-ConfEDouble)

Provides a Java representation of E floats and doubles.

## Members

**Constructors**:

- [ConfEFloat(ConfInputStream)](#m-ConfEFloat-80562402c18c)
- [ConfEFloat(float)](#m-ConfEFloat-e5f134be5a8d)

**Fields**:

- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [clone()](ConfEObject.md#m-clone-164c86c45e9b) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#m-decode-e63a2a4cac49) from ConfEObject
- [doubleValue()](ConfEDouble.md#m-doubleValue-aea67f67de5a) from ConfEDouble
- [encode(ConfOutputStream)](ConfEDouble.md#m-encode-cb1ad9eb7771) from ConfEDouble
- [equals(Object)](ConfEDouble.md#m-equals-fcd6492e0d6c) from ConfEDouble
- [floatValue()](ConfEDouble.md#m-floatValue-6e7c2cd63bb9) from ConfEDouble
- [hashCode()](ConfEDouble.md#m-hashCode-ef797a217903) from ConfEDouble
- [toString()](ConfEDouble.md#m-toString-e9d48c5503ef) from ConfEDouble

## Constructors

### ConfEFloat(ConfInputStream) <a href="#m-ConfEFloat-80562402c18c" id="m-ConfEFloat-80562402c18c"></a>

```java
public ConfEFloat(
    com.tailf.proto.ConfInputStream buf
)
    throws com.tailf.proto.ConfEDecodeException, com.tailf.proto.ConfERangeException
```

Types: [ConfInputStream](ConfInputStream.md#cls-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException), [ConfERangeException](ConfERangeException.md#cls-ConfERangeException)

Create an E float from a stream containing a float encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded value.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E float.
- `ConfERangeException` - if the value cannot be represented as a Java float.

### ConfEFloat(float) <a href="#m-ConfEFloat-e5f134be5a8d" id="m-ConfEFloat-e5f134be5a8d"></a>

```java
public ConfEFloat(float f)
```

Create an E float from the given float value.

**Parameters**

- `float f`


## Fields

### serialVersionUID <a href="#m-serialVersionUID" id="m-serialVersionUID"></a>

**Package-private**

```java
static final long serialVersionUID = -2231546377289456934;
```
