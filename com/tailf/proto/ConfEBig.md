<a id="s-ConfEBig"></a>
# ConfEBig

```java
public class com.tailf.proto.ConfEBig
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Provides a Java representation of E integral types. E does not distinguish
 between different integral types, however this class and its subclasses
 [`ConfEByte`](ConfEByte.md#s-ConfEByte), [`ConfEChar`](ConfEChar.md#s-ConfEChar), [`ConfEInt`](ConfEInt.md#s-ConfEInt), and
 [`ConfEShort`](ConfEShort.md#s-ConfEShort) attempt to map the E types onto the various Java integral
 types. Two additional classes, [`ConfEUInt`](ConfEUInt.md#s-ConfEUInt) and [`ConfEUShort`](ConfEUShort.md#s-ConfEUShort) are
 provided for Corba compatibility. See the documentation for IC for more
 information.

## Members

**Constructors**:

- [ConfEBig(BigInteger)](#s-ConfEBig-1)
- [ConfEBig(byte[])](#s-ConfEBig-2)
- [ConfEBig(ConfInputStream)](#s-ConfEBig-3)

**Fields**:

- [serialVersionUID](ConfEObject.md#s-serialVersionUID) from ConfEObject

**Methods**:

- [bigValue()](#s-bigValue)
- [clone()](ConfEObject.md#s-clone) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#s-decode) from ConfEObject
- [encode(ConfOutputStream)](#s-encode)
- [equals(Object)](#s-equals)
- [floatValue()](#s-floatValue)
- [hashCode()](#s-hashCode)
- [longValue()](#s-longValue)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfEBig-1"></a>
### ConfEBig(BigInteger)

```java
public ConfEBig(java.math.BigInteger val)
```

**Parameters**

- `java.math.BigInteger val`

<a id="s-ConfEBig-2"></a>
### ConfEBig(byte[])

```java
public ConfEBig(byte[] val)
```

Create an E integer from the given value.

**Parameters**

- `byte[] val` - - byte array representing the big value

<a id="s-ConfEBig-3"></a>
### ConfEBig(ConfInputStream)

```java
public ConfEBig(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#s-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Create an E integer from a stream containing an integer encoded in E
 external format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded value.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E integer.


## Methods

<a id="s-bigValue"></a>
### bigValue()

```java
public java.math.BigInteger bigValue()
```

Get this number as a BigInteger.

**Returns:** the value of this number, as a BigInteger.

<a id="s-encode"></a>
### encode(ConfOutputStream)

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#s-ConfOutputStream)

Convert this number to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded number should be
            written.

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Determine if two numbers are equal. Numbers are equal if they contain the
 same value.

**Parameters**

- `Object o` - the number to compare to.

**Returns:** true if the numbers have the same value.

<a id="s-floatValue"></a>
### floatValue()

```java
public float floatValue()
```

Get this number as a float.

**Returns:** the value of this number, as a long.

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-longValue"></a>
### longValue()

```java
public long longValue()
```

Get this number as a long

**Returns:** the value of this number, as a long.

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Get the string representation of this number.

**Returns:** the string representation of this number.
