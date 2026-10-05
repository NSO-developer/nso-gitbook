# ConfELong <a href="#confelong-926979f5365d" id="confelong-926979f5365d"></a>

```java
public class com.tailf.proto.ConfELong
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Provides a Java representation of E integral types. E does not distinguish
 between different integral types, however this class and its subclasses
 [`ConfEByte`](ConfEByte.md#confebyte-983739ca0c0b), [`ConfEChar`](ConfEChar.md#confechar-5508552b6df0), [`ConfEInt`](ConfEInt.md#confeint-71ffd8a18157), and
 [`ConfEShort`](ConfEShort.md#confeshort-f731373fcabf) attempt to map the E types onto the various Java integral
 types. Two additional classes, [`ConfEUInt`](ConfEUInt.md#confeuint-121a73198dd9) and [`ConfEUShort`](ConfEUShort.md#confeushort-5795f0387e29) are
 provided for Corba compatibility. See the documentation for IC for more
 information.

**Related classes**

- [ConfEByte](ConfEByte.md#confebyte-983739ca0c0b)
- [ConfEChar](ConfEChar.md#confechar-5508552b6df0)
- [ConfEInt](ConfEInt.md#confeint-71ffd8a18157)
- [ConfEShort](ConfEShort.md#confeshort-f731373fcabf)
- [ConfEUInt](ConfEUInt.md#confeuint-121a73198dd9)
- [ConfEUShort](ConfEUShort.md#confeushort-5795f0387e29)

## Members

**Constructors**:

- [ConfELong\(ConfInputStream\)](#confelong-14be370f839d)
- [ConfELong\(long\)](#confelong-ef6be4714c98)

**Fields**:

- [serialVersionUID](#serialversionuid-b9f0e1ec001d)

**Methods**:

- [byteValue\(\)](#bytevalue-a56aac956c5c)
- [charValue\(\)](#charvalue-4b3a6b868fe4)
- [clone\(\)](ConfEObject.md#clone-164c86c45e9b) from ConfEObject
- [decode\(ConfInputStream\)](ConfEObject.md#decode-e63a2a4cac49) from ConfEObject
- [encode\(ConfOutputStream\)](#encode-cb1ad9eb7771)
- [equals\(Object\)](#equals-fcd6492e0d6c)
- [hashCode\(\)](#hashcode-ef797a217903)
- [intValue\(\)](#intvalue-2f745d025d8e)
- [longValue\(\)](#longvalue-636bfe2d6862)
- [shortValue\(\)](#shortvalue-438ff2f827fb)
- [toString\(\)](#tostring-e9d48c5503ef)
- [uIntValue\(\)](#uintvalue-11d9c2202272)
- [uShortValue\(\)](#ushortvalue-5c27a3934662)

## Constructors

### ConfELong(ConfInputStream) <a href="#confelong-14be370f839d" id="confelong-14be370f839d"></a>

```java
public ConfELong(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#confinputstream-c4a961d10b62), [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Create an E integer from a stream containing an integer encoded in E
 external format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded value.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E integer.

### ConfELong(long) <a href="#confelong-ef6be4714c98" id="confelong-ef6be4714c98"></a>

```java
public ConfELong(long l)
```

Create an E integer from the given value.

**Parameters**

- `long l` - the long value to use.


## Fields

### serialVersionUID <a href="#serialversionuid-b9f0e1ec001d" id="serialversionuid-b9f0e1ec001d"></a>

**Package-private**

```java
static final long serialVersionUID = 1610466859236755096;
```


## Methods

### byteValue() <a href="#bytevalue-a56aac956c5c" id="bytevalue-a56aac956c5c"></a>

```java
public byte byteValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#conferangeexception-3f566066d5e7)

Get this number as a byte.

**Returns:** the byte value of this number.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as a byte.

### charValue() <a href="#charvalue-4b3a6b868fe4" id="charvalue-4b3a6b868fe4"></a>

```java
public char charValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#conferangeexception-3f566066d5e7)

Get this number as a char.

**Returns:** the char value of this number.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as a char.

### encode(ConfOutputStream) <a href="#encode-cb1ad9eb7771" id="encode-cb1ad9eb7771"></a>

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#confoutputstream-e8ef47aca327)

Convert this number to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded number should be
            written.

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Determine if two numbers are equal. Numbers are equal if they contain the
 same value.

**Parameters**

- `Object o` - the number to compare to.

**Returns:** true if the numbers have the same value.

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### intValue() <a href="#intvalue-2f745d025d8e" id="intvalue-2f745d025d8e"></a>

```java
public int intValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#conferangeexception-3f566066d5e7)

Get this number as an int.

**Returns:** the value of this number, as an int.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as an int.

### longValue() <a href="#longvalue-636bfe2d6862" id="longvalue-636bfe2d6862"></a>

```java
public long longValue()
```

Get this number as a long.

**Returns:** the value of this number, as a long.

### shortValue() <a href="#shortvalue-438ff2f827fb" id="shortvalue-438ff2f827fb"></a>

```java
public short shortValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#conferangeexception-3f566066d5e7)

Get this number as a short.

**Returns:** the value of this number, as a short.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as a short.

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Get the string representation of this number.

**Returns:** the string representation of this number.

### uIntValue() <a href="#uintvalue-11d9c2202272" id="uintvalue-11d9c2202272"></a>

```java
public int uIntValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#conferangeexception-3f566066d5e7)

Get this number as a non-negative int.

**Returns:** the value of this number, as an int.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as an int, or
                if the value is negative.

### uShortValue() <a href="#ushortvalue-5c27a3934662" id="ushortvalue-5c27a3934662"></a>

```java
public short uShortValue() throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#conferangeexception-3f566066d5e7)

Get this number as a non-negative short.

**Returns:** the value of this number, as a short.

**Throws**

- `ConfERangeException` - if the value is too large to be represented as a short, or
                if the value is negative.
