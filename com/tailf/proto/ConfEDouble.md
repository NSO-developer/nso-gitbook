<a id="s-ConfEDouble"></a>
# ConfEDouble

```java
public class com.tailf.proto.ConfEDouble
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Provides a Java representation of E floats and doubles. E defines only one
 floating point numeric type, however this class and its subclass
 [`ConfEFloat`](ConfEFloat.md#s-ConfEFloat) are used to provide representations corresponding to the
 Java types Double and Float.

**Related classes**

- [ConfEFloat](ConfEFloat.md#s-ConfEFloat)

## Members

**Constructors**:

- [ConfEDouble(ConfInputStream)](#s-ConfEDouble-1)
- [ConfEDouble(double)](#s-ConfEDouble-2)

**Fields**:

- [serialVersionUID](#s-serialVersionUID)

**Methods**:

- [clone()](ConfEObject.md#s-clone) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#s-decode) from ConfEObject
- [doubleValue()](#s-doubleValue)
- [encode(ConfOutputStream)](#s-encode)
- [equals(Object)](#s-equals)
- [floatValue()](#s-floatValue)
- [hashCode()](#s-hashCode)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfEDouble-1"></a>
### ConfEDouble(ConfInputStream)

```java
public ConfEDouble(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#s-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Create an E float from a stream containing a double encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded value.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E float.

<a id="s-ConfEDouble-2"></a>
### ConfEDouble(double)

```java
public ConfEDouble(double d)
```

Create an E float from the given double value.

**Parameters**

- `double d`


## Fields

<a id="s-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = 132947104811974021;
```


## Methods

<a id="s-doubleValue"></a>
### doubleValue()

```java
public double doubleValue()
```

Get the value, as a double.

**Returns:** the value of this object, as a double.

<a id="s-encode"></a>
### encode(ConfOutputStream)

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#s-ConfOutputStream)

Convert this double to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded value should be written.

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Determine if two floats are equal. Floats are equal if they contain the
 same value.

**Parameters**

- `Object o` - the float to compare to.

**Returns:** true if the floats have the same value.

<a id="s-floatValue"></a>
### floatValue()

```java
public float floatValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#s-ConfERangeException)

Get the value, as a float.

**Returns:** the value of this object, as a float.

**Throws**

- `ConfERangeException` - if the value cannot be represented as a float.

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Get the string representation of this double.

**Returns:** the string representation of this double.
