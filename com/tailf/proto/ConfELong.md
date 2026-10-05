<a id="cls-ConfELong"></a>
# ConfELong

```java
public class com.tailf.proto.ConfELong
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

**Related classes**

- [ConfEByte](ConfEByte.md#cls-ConfEByte)
- [ConfEChar](ConfEChar.md#cls-ConfEChar)
- [ConfEInt](ConfEInt.md#cls-ConfEInt)
- [ConfEShort](ConfEShort.md#cls-ConfEShort)
- [ConfEUInt](ConfEUInt.md#cls-ConfEUInt)
- [ConfEUShort](ConfEUShort.md#cls-ConfEUShort)

## Members

**Constructors**:

- [ConfELong(ConfInputStream)](#m-confelong-14be370f839d)
- [ConfELong(long)](#m-confelong-ef6be4714c98)

**Fields**:

- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [byteValue()](#m-bytevalue-a56aac956c5c)
- [charValue()](#m-charvalue-4b3a6b868fe4)
- [clone()](ConfEObject.md#m-clone-164c86c45e9b) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#m-decode-e63a2a4cac49) from ConfEObject
- [encode(ConfOutputStream)](#m-encode-cb1ad9eb7771)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [hashCode()](#m-hashcode-ef797a217903)
- [intValue()](#m-intvalue-2f745d025d8e)
- [longValue()](#m-longvalue-636bfe2d6862)
- [shortValue()](#m-shortvalue-438ff2f827fb)
- [toString()](#m-tostring-e9d48c5503ef)
- [uIntValue()](#m-uintvalue-11d9c2202272)
- [uShortValue()](#m-ushortvalue-5c27a3934662)

## Constructors

<a id="m-confelong-14be370f839d"></a>
### ConfELong(ConfInputStream)

```java
public ConfELong(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#cls-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Create an E integer from a stream containing an integer encoded in E
 external format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded value.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E integer.

<a id="m-confelong-ef6be4714c98"></a>
### ConfELong(long)

```java
public ConfELong(long l)
```

Create an E integer from the given value.

**Parameters**

- `long l` - the long value to use.


## Fields

<a id="m-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = 1610466859236755096;
```


## Methods

<a id="m-bytevalue-a56aac956c5c"></a>
### byteValue()

```java
public byte byteValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#cls-ConfERangeException)

Get this number as a byte.

**Returns:** the byte value of this number.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as a byte.

<a id="m-charvalue-4b3a6b868fe4"></a>
### charValue()

```java
public char charValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#cls-ConfERangeException)

Get this number as a char.

**Returns:** the char value of this number.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as a char.

<a id="m-encode-cb1ad9eb7771"></a>
### encode(ConfOutputStream)

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#cls-ConfOutputStream)

Convert this number to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded number should be
            written.

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Determine if two numbers are equal. Numbers are equal if they contain the
 same value.

**Parameters**

- `Object o` - the number to compare to.

**Returns:** true if the numbers have the same value.

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-intvalue-2f745d025d8e"></a>
### intValue()

```java
public int intValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#cls-ConfERangeException)

Get this number as an int.

**Returns:** the value of this number, as an int.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as an int.

<a id="m-longvalue-636bfe2d6862"></a>
### longValue()

```java
public long longValue()
```

Get this number as a long.

**Returns:** the value of this number, as a long.

<a id="m-shortvalue-438ff2f827fb"></a>
### shortValue()

```java
public short shortValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#cls-ConfERangeException)

Get this number as a short.

**Returns:** the value of this number, as a short.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as a short.

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Get the string representation of this number.

**Returns:** the string representation of this number.

<a id="m-uintvalue-11d9c2202272"></a>
### uIntValue()

```java
public int uIntValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#cls-ConfERangeException)

Get this number as a non-negative int.

**Returns:** the value of this number, as an int.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as an int, or
                if the value is negative.

<a id="m-ushortvalue-5c27a3934662"></a>
### uShortValue()

```java
public short uShortValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#cls-ConfERangeException)

Get this number as a non-negative short.

**Returns:** the value of this number, as a short.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as a short, or
                if the value is negative.
