# ConfEDouble <a href="#cls-ConfEDouble" id="cls-ConfEDouble"></a>

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

- [ConfEDouble(ConfInputStream)](#m-ConfEDouble-5d29c11b7f1f)
- [ConfEDouble(double)](#m-ConfEDouble-2d502f9ddc23)

**Fields**:

- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [clone()](ConfEObject.md#m-clone-164c86c45e9b) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#m-decode-e63a2a4cac49) from ConfEObject
- [doubleValue()](#m-doubleValue-aea67f67de5a)
- [encode(ConfOutputStream)](#m-encode-cb1ad9eb7771)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [floatValue()](#m-floatValue-6e7c2cd63bb9)
- [hashCode()](#m-hashCode-ef797a217903)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ConfEDouble(ConfInputStream) <a href="#m-ConfEDouble-5d29c11b7f1f" id="m-ConfEDouble-5d29c11b7f1f"></a>

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

### ConfEDouble(double) <a href="#m-ConfEDouble-2d502f9ddc23" id="m-ConfEDouble-2d502f9ddc23"></a>

```java
public ConfEDouble(double d)
```

Create an E float from the given double value.

**Parameters**

- `double d`


## Fields

### serialVersionUID <a href="#m-serialVersionUID" id="m-serialVersionUID"></a>

**Package-private**

```java
static final long serialVersionUID = 132947104811974021;
```


## Methods

### doubleValue() <a href="#m-doubleValue-aea67f67de5a" id="m-doubleValue-aea67f67de5a"></a>

```java
public double doubleValue()
```

Get the value, as a double.

**Returns:** the value of this object, as a double.

### encode(ConfOutputStream) <a href="#m-encode-cb1ad9eb7771" id="m-encode-cb1ad9eb7771"></a>

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#cls-ConfOutputStream)

Convert this double to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded value should be written.

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Determine if two floats are equal. Floats are equal if they contain the
 same value.

**Parameters**

- `Object o` - the float to compare to.

**Returns:** true if the floats have the same value.

### floatValue() <a href="#m-floatValue-6e7c2cd63bb9" id="m-floatValue-6e7c2cd63bb9"></a>

```java
public float floatValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#cls-ConfERangeException)

Get the value, as a float.

**Returns:** the value of this object, as a float.

**Throws**

- `ConfERangeException` - if the value cannot be represented as a float.

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Get the string representation of this double.

**Returns:** the string representation of this double.
