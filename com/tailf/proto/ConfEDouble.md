# ConfEDouble <a href="#confedouble-df2c6e01900e" id="confedouble-df2c6e01900e"></a>

```java
public class com.tailf.proto.ConfEDouble
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Provides a Java representation of E floats and doubles. E defines only one
 floating point numeric type, however this class and its subclass
 [`ConfEFloat`](ConfEFloat.md#confefloat-5ab98cf90000) are used to provide representations corresponding to the
 Java types Double and Float.

**Related classes**

- [ConfEFloat](ConfEFloat.md#confefloat-5ab98cf90000)

## Members

**Constructors**:

- [ConfEDouble\(ConfInputStream\)](#confedouble-5d29c11b7f1f)
- [ConfEDouble\(double\)](#confedouble-2d502f9ddc23)

**Fields**:

- [serialVersionUID](#serialversionuid-b9f0e1ec001d)

**Methods**:

- [clone\(\)](ConfEObject.md#clone-164c86c45e9b) from ConfEObject
- [decode\(ConfInputStream\)](ConfEObject.md#decode-e63a2a4cac49) from ConfEObject
- [doubleValue\(\)](#doublevalue-aea67f67de5a)
- [encode\(ConfOutputStream\)](#encode-cb1ad9eb7771)
- [equals\(Object\)](#equals-fcd6492e0d6c)
- [floatValue\(\)](#floatvalue-6e7c2cd63bb9)
- [hashCode\(\)](#hashcode-ef797a217903)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### ConfEDouble(ConfInputStream) <a href="#confedouble-5d29c11b7f1f" id="confedouble-5d29c11b7f1f"></a>

```java
public ConfEDouble(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#confinputstream-c4a961d10b62), [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Create an E float from a stream containing a double encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded value.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E float.

### ConfEDouble(double) <a href="#confedouble-2d502f9ddc23" id="confedouble-2d502f9ddc23"></a>

```java
public ConfEDouble(double d)
```

Create an E float from the given double value.

**Parameters**

- `double d`


## Fields

### serialVersionUID <a href="#serialversionuid-b9f0e1ec001d" id="serialversionuid-b9f0e1ec001d"></a>

**Package-private**

```java
static final long serialVersionUID = 132947104811974021;
```


## Methods

### doubleValue() <a href="#doublevalue-aea67f67de5a" id="doublevalue-aea67f67de5a"></a>

```java
public double doubleValue()
```

Get the value, as a double.

**Returns:** the value of this object, as a double.

### encode(ConfOutputStream) <a href="#encode-cb1ad9eb7771" id="encode-cb1ad9eb7771"></a>

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#confoutputstream-e8ef47aca327)

Convert this double to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded value should be written.

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Determine if two floats are equal. Floats are equal if they contain the
 same value.

**Parameters**

- `Object o` - the float to compare to.

**Returns:** true if the floats have the same value.

### floatValue() <a href="#floatvalue-6e7c2cd63bb9" id="floatvalue-6e7c2cd63bb9"></a>

```java
public float floatValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#conferangeexception-3f566066d5e7)

Get the value, as a float.

**Returns:** the value of this object, as a float.

**Throws**

- `ConfERangeException` - if the value cannot be represented as a float.

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Get the string representation of this double.

**Returns:** the string representation of this double.
