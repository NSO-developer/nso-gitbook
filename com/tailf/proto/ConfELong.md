# ConfELong <a href="#cls-ConfELong" id="cls-ConfELong"></a>

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

- [ConfELong(ConfInputStream)](#m-ConfELong-14be370f839d)
- [ConfELong(long)](#m-ConfELong-ef6be4714c98)

**Fields**:

- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [byteValue()](#m-byteValue-a56aac956c5c)
- [charValue()](#m-charValue-4b3a6b868fe4)
- [clone()](ConfEObject.md#m-clone-164c86c45e9b) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#m-decode-e63a2a4cac49) from ConfEObject
- [encode(ConfOutputStream)](#m-encode-cb1ad9eb7771)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [hashCode()](#m-hashCode-ef797a217903)
- [intValue()](#m-intValue-2f745d025d8e)
- [longValue()](#m-longValue-636bfe2d6862)
- [shortValue()](#m-shortValue-438ff2f827fb)
- [toString()](#m-toString-e9d48c5503ef)
- [uIntValue()](#m-uIntValue-11d9c2202272)
- [uShortValue()](#m-uShortValue-5c27a3934662)

## Constructors

### ConfELong(ConfInputStream) <a href="#m-ConfELong-14be370f839d" id="m-ConfELong-14be370f839d"></a>

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

### ConfELong(long) <a href="#m-ConfELong-ef6be4714c98" id="m-ConfELong-ef6be4714c98"></a>

```java
public ConfELong(long l)
```

Create an E integer from the given value.

**Parameters**

- `long l` - the long value to use.


## Fields

### serialVersionUID <a href="#m-serialVersionUID" id="m-serialVersionUID"></a>

**Package-private**

```java
static final long serialVersionUID = 1610466859236755096;
```


## Methods

### byteValue() <a href="#m-byteValue-a56aac956c5c" id="m-byteValue-a56aac956c5c"></a>

```java
public byte byteValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#cls-ConfERangeException)

Get this number as a byte.

**Returns:** the byte value of this number.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as a byte.

### charValue() <a href="#m-charValue-4b3a6b868fe4" id="m-charValue-4b3a6b868fe4"></a>

```java
public char charValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#cls-ConfERangeException)

Get this number as a char.

**Returns:** the char value of this number.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as a char.

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

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### intValue() <a href="#m-intValue-2f745d025d8e" id="m-intValue-2f745d025d8e"></a>

```java
public int intValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#cls-ConfERangeException)

Get this number as an int.

**Returns:** the value of this number, as an int.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as an int.

### longValue() <a href="#m-longValue-636bfe2d6862" id="m-longValue-636bfe2d6862"></a>

```java
public long longValue()
```

Get this number as a long.

**Returns:** the value of this number, as a long.

### shortValue() <a href="#m-shortValue-438ff2f827fb" id="m-shortValue-438ff2f827fb"></a>

```java
public short shortValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#cls-ConfERangeException)

Get this number as a short.

**Returns:** the value of this number, as a short.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as a short.

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Get the string representation of this number.

**Returns:** the string representation of this number.

### uIntValue() <a href="#m-uIntValue-11d9c2202272" id="m-uIntValue-11d9c2202272"></a>

```java
public int uIntValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#cls-ConfERangeException)

Get this number as a non-negative int.

**Returns:** the value of this number, as an int.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as an int, or
                if the value is negative.

### uShortValue() <a href="#m-uShortValue-5c27a3934662" id="m-uShortValue-5c27a3934662"></a>

```java
public short uShortValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#cls-ConfERangeException)

Get this number as a non-negative short.

**Returns:** the value of this number, as a short.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as a short, or
                if the value is negative.
