<a id="cls-ConfEDouble"></a>
# ConfEDouble

```java
public class com.tailf.proto.ConfEDouble
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Provides a Java representation of E floats and doubles. E defines only one
 floating point numeric type, however this class and its subclass
 [`ConfEFloat`](ConfEFloat.md#cls-ConfEFloat) are used to provide representations corresponding to the
 Java types Double and Float.

**Related classes**

- [ConfEFloat](ConfEFloat.md#cls-ConfEFloat)

## Members

**Constructors**:

- [ConfEDouble(ConfInputStream)](#m-confedouble-5d29c11b7f1f)
- [ConfEDouble(double)](#m-confedouble-2d502f9ddc23)

**Fields**:

- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [clone()](ConfEObject.md#m-clone-164c86c45e9b) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#m-decode-e63a2a4cac49) from ConfEObject
- [doubleValue()](#m-doublevalue-aea67f67de5a)
- [encode(ConfOutputStream)](#m-encode-cb1ad9eb7771)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [floatValue()](#m-floatvalue-6e7c2cd63bb9)
- [hashCode()](#m-hashcode-ef797a217903)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-confedouble-5d29c11b7f1f"></a>
### ConfEDouble(ConfInputStream)

```java
public ConfEDouble(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#cls-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Create an E float from a stream containing a double encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded value.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E float.

<a id="m-confedouble-2d502f9ddc23"></a>
### ConfEDouble(double)

```java
public ConfEDouble(double d)
```

Create an E float from the given double value.

**Parameters**

- `double d`


## Fields

<a id="m-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = 132947104811974021;
```


## Methods

<a id="m-doublevalue-aea67f67de5a"></a>
### doubleValue()

```java
public double doubleValue()
```

Get the value, as a double.

**Returns:** the value of this object, as a double.

<a id="m-encode-cb1ad9eb7771"></a>
### encode(ConfOutputStream)

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#cls-ConfOutputStream)

Convert this double to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded value should be written.

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Determine if two floats are equal. Floats are equal if they contain the
 same value.

**Parameters**

- `Object o` - the float to compare to.

**Returns:** true if the floats have the same value.

<a id="m-floatvalue-6e7c2cd63bb9"></a>
### floatValue()

```java
public float floatValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#cls-ConfERangeException)

Get the value, as a float.

**Returns:** the value of this object, as a float.

**Throws**

- `ConfERangeException` - if the value cannot be represented as a float.

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Get the string representation of this double.

**Returns:** the string representation of this double.
