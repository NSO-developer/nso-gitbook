# ConfEBig <a href="#cls-ConfEBig" id="cls-ConfEBig"></a>

```java
public class com.tailf.proto.ConfEBig
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Provides a Java representation of E integral types. E does not distinguish
 between different integral types, however this class and its subclasses
 [`ConfEByte`](ConfEByte.md#cls-ConfEByte), [`ConfEChar`](ConfEChar.md#cls-ConfEChar), [`ConfEInt`](ConfEInt.md#cls-ConfEInt), and
 [`ConfEShort`](ConfEShort.md#cls-ConfEShort) attempt to map the E types onto the various Java integral
 types. Two additional classes, [`ConfEUInt`](ConfEUInt.md#cls-ConfEUInt) and [`ConfEUShort`](ConfEUShort.md#cls-ConfEUShort) are
 provided for Corba compatibility. See the documentation for IC for more
 information.

## Members

**Constructors**:

- [ConfEBig(BigInteger)](#m-ConfEBig-35fdf2f7de83)
- [ConfEBig(byte[])](#m-ConfEBig-97bb5b05e82f)
- [ConfEBig(ConfInputStream)](#m-ConfEBig-c2dca078cfcf)

**Fields**:

- [serialVersionUID](ConfEObject.md#m-serialVersionUID) from ConfEObject

**Methods**:

- [bigValue()](#m-bigValue-eee3ffc9c3fa)
- [clone()](ConfEObject.md#m-clone-164c86c45e9b) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#m-decode-e63a2a4cac49) from ConfEObject
- [encode(ConfOutputStream)](#m-encode-cb1ad9eb7771)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [floatValue()](#m-floatValue-6e7c2cd63bb9)
- [hashCode()](#m-hashCode-ef797a217903)
- [longValue()](#m-longValue-636bfe2d6862)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ConfEBig(BigInteger) <a href="#m-ConfEBig-35fdf2f7de83" id="m-ConfEBig-35fdf2f7de83"></a>

```java
public ConfEBig(java.math.BigInteger val)
```

**Parameters**

- `java.math.BigInteger val`

### ConfEBig(byte[]) <a href="#m-ConfEBig-97bb5b05e82f" id="m-ConfEBig-97bb5b05e82f"></a>

```java
public ConfEBig(byte[] val)
```

Create an E integer from the given value.

**Parameters**

- `byte[] val` - - byte array representing the big value

### ConfEBig(ConfInputStream) <a href="#m-ConfEBig-c2dca078cfcf" id="m-ConfEBig-c2dca078cfcf"></a>

```java
public ConfEBig(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#cls-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Create an E integer from a stream containing an integer encoded in E
 external format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded value.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E integer.


## Methods

### bigValue() <a href="#m-bigValue-eee3ffc9c3fa" id="m-bigValue-eee3ffc9c3fa"></a>

```java
public java.math.BigInteger bigValue()
```

Get this number as a BigInteger.

**Returns:** the value of this number, as a BigInteger.

### encode(ConfOutputStream) <a href="#m-encode-cb1ad9eb7771" id="m-encode-cb1ad9eb7771"></a>

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#cls-ConfOutputStream)

Convert this number to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded number should be
            written.

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Determine if two numbers are equal. Numbers are equal if they contain the
 same value.

**Parameters**

- `Object o` - the number to compare to.

**Returns:** true if the numbers have the same value.

### floatValue() <a href="#m-floatValue-6e7c2cd63bb9" id="m-floatValue-6e7c2cd63bb9"></a>

```java
public float floatValue()
```

Get this number as a float.

**Returns:** the value of this number, as a long.

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### longValue() <a href="#m-longValue-636bfe2d6862" id="m-longValue-636bfe2d6862"></a>

```java
public long longValue()
```

Get this number as a long

**Returns:** the value of this number, as a long.

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Get the string representation of this number.

**Returns:** the string representation of this number.
