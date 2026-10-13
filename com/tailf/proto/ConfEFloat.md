# ConfEFloat <a href="#confefloat-5ab98cf90000" id="confefloat-5ab98cf90000"></a>

```java
public class com.tailf.proto.ConfEFloat
    extends com.tailf.proto.ConfEDouble
```

Types: [ConfEDouble](ConfEDouble.md#confedouble-df2c6e01900e)

Provides a Java representation of E floats and doubles.

## Members

**Constructors**:

- [ConfEFloat\(ConfInputStream\)](#confefloat-80562402c18c)
- [ConfEFloat\(float\)](#confefloat-e5f134be5a8d)

**Fields**:

- [serialVersionUID](#serialversionuid-b9f0e1ec001d)

**Methods**:

- [clone\(\)](ConfEObject.md#clone-164c86c45e9b) from ConfEObject
- [decode\(ConfInputStream\)](ConfEObject.md#decode-e63a2a4cac49) from ConfEObject
- [doubleValue\(\)](ConfEDouble.md#doublevalue-aea67f67de5a) from ConfEDouble
- [encode\(ConfOutputStream\)](ConfEDouble.md#encode-cb1ad9eb7771) from ConfEDouble
- [equals\(Object\)](ConfEDouble.md#equals-fcd6492e0d6c) from ConfEDouble
- [floatValue\(\)](ConfEDouble.md#floatvalue-6e7c2cd63bb9) from ConfEDouble
- [hashCode\(\)](ConfEDouble.md#hashcode-ef797a217903) from ConfEDouble
- [toString\(\)](ConfEDouble.md#tostring-e9d48c5503ef) from ConfEDouble

## Constructors

### ConfEFloat(ConfInputStream) <a href="#confefloat-80562402c18c" id="confefloat-80562402c18c"></a>

```java
public ConfEFloat(
    com.tailf.proto.ConfInputStream buf
)
    throws com.tailf.proto.ConfEDecodeException, com.tailf.proto.ConfERangeException
```

Types: [ConfInputStream](ConfInputStream.md#confinputstream-c4a961d10b62), [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae), [ConfERangeException](ConfERangeException.md#conferangeexception-3f566066d5e7)

Create an E float from a stream containing a float encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded value.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E float.
- `ConfERangeException` - if the value cannot be represented as a Java float.

### ConfEFloat(float) <a href="#confefloat-e5f134be5a8d" id="confefloat-e5f134be5a8d"></a>

```java
public ConfEFloat(float f)
```

Create an E float from the given float value.

**Parameters**

- `float f`


## Fields

### serialVersionUID <a href="#serialversionuid-b9f0e1ec001d" id="serialversionuid-b9f0e1ec001d"></a>

**Package-private**

```java
static final long serialVersionUID = -2231546377289456934;
```
