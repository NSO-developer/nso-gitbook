<a id="s-ConfELong"></a>
# ConfELong

```java
public class com.tailf.proto.ConfELong
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

**Related classes**

- [ConfEByte](ConfEByte.md#s-ConfEByte)
- [ConfEChar](ConfEChar.md#s-ConfEChar)
- [ConfEInt](ConfEInt.md#s-ConfEInt)
- [ConfEShort](ConfEShort.md#s-ConfEShort)
- [ConfEUInt](ConfEUInt.md#s-ConfEUInt)
- [ConfEUShort](ConfEUShort.md#s-ConfEUShort)

## Members

**Constructors**:

- [ConfELong(ConfInputStream)](#s-ConfELong-1)
- [ConfELong(long)](#s-ConfELong-2)

**Fields**:

- [serialVersionUID](#s-serialVersionUID)

**Methods**:

- [byteValue()](#s-byteValue)
- [charValue()](#s-charValue)
- [clone()](ConfEObject.md#s-clone) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#s-decode) from ConfEObject
- [encode(ConfOutputStream)](#s-encode)
- [equals(Object)](#s-equals)
- [hashCode()](#s-hashCode)
- [intValue()](#s-intValue)
- [longValue()](#s-longValue)
- [shortValue()](#s-shortValue)
- [toString()](#s-toString)
- [uIntValue()](#s-uIntValue)
- [uShortValue()](#s-uShortValue)

## Constructors

<a id="s-ConfELong-1"></a>
### ConfELong(ConfInputStream)

```java
public ConfELong(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#s-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Create an E integer from a stream containing an integer encoded in E
 external format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded value.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E integer.

<a id="s-ConfELong-2"></a>
### ConfELong(long)

```java
public ConfELong(long l)
```

Create an E integer from the given value.

**Parameters**

- `long l` - the long value to use.


## Fields

<a id="s-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = 1610466859236755096;
```


## Methods

<a id="s-byteValue"></a>
### byteValue()

```java
public byte byteValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#s-ConfERangeException)

Get this number as a byte.

**Returns:** the byte value of this number.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as a byte.

<a id="s-charValue"></a>
### charValue()

```java
public char charValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#s-ConfERangeException)

Get this number as a char.

**Returns:** the char value of this number.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as a char.

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

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-intValue"></a>
### intValue()

```java
public int intValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#s-ConfERangeException)

Get this number as an int.

**Returns:** the value of this number, as an int.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as an int.

<a id="s-longValue"></a>
### longValue()

```java
public long longValue()
```

Get this number as a long.

**Returns:** the value of this number, as a long.

<a id="s-shortValue"></a>
### shortValue()

```java
public short shortValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#s-ConfERangeException)

Get this number as a short.

**Returns:** the value of this number, as a short.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as a short.

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Get the string representation of this number.

**Returns:** the string representation of this number.

<a id="s-uIntValue"></a>
### uIntValue()

```java
public int uIntValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#s-ConfERangeException)

Get this number as a non-negative int.

**Returns:** the value of this number, as an int.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as an int, or
                if the value is negative.

<a id="s-uShortValue"></a>
### uShortValue()

```java
public short uShortValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#s-ConfERangeException)

Get this number as a non-negative short.

**Returns:** the value of this number, as a short.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as a short, or
                if the value is negative.
