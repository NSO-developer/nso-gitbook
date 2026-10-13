# ConfEBig <a href="#confebig-d075d18cd25e" id="confebig-d075d18cd25e"></a>

```java
public class com.tailf.proto.ConfEBig
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

## Members

**Constructors**:

- [ConfEBig\(BigInteger\)](#confebig-35fdf2f7de83)
- [ConfEBig\(byte\[\]\)](#confebig-97bb5b05e82f)
- [ConfEBig\(ConfInputStream\)](#confebig-c2dca078cfcf)

**Fields**:

- [serialVersionUID](ConfEObject.md#serialversionuid-b9f0e1ec001d) from ConfEObject

**Methods**:

- [bigValue\(\)](#bigvalue-eee3ffc9c3fa)
- [clone\(\)](ConfEObject.md#clone-164c86c45e9b) from ConfEObject
- [decode\(ConfInputStream\)](ConfEObject.md#decode-e63a2a4cac49) from ConfEObject
- [encode\(ConfOutputStream\)](#encode-cb1ad9eb7771)
- [equals\(Object\)](#equals-fcd6492e0d6c)
- [floatValue\(\)](#floatvalue-6e7c2cd63bb9)
- [hashCode\(\)](#hashcode-ef797a217903)
- [longValue\(\)](#longvalue-636bfe2d6862)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### ConfEBig(BigInteger) <a href="#confebig-35fdf2f7de83" id="confebig-35fdf2f7de83"></a>

```java
public ConfEBig(java.math.BigInteger val)
```

**Parameters**

- `java.math.BigInteger val`

### ConfEBig(byte[]) <a href="#confebig-97bb5b05e82f" id="confebig-97bb5b05e82f"></a>

```java
public ConfEBig(byte[] val)
```

Create an E integer from the given value.

**Parameters**

- `byte[] val` - - byte array representing the big value

### ConfEBig(ConfInputStream) <a href="#confebig-c2dca078cfcf" id="confebig-c2dca078cfcf"></a>

```java
public ConfEBig(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#confinputstream-c4a961d10b62), [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Create an E integer from a stream containing an integer encoded in E
 external format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded value.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E integer.


## Methods

### bigValue() <a href="#bigvalue-eee3ffc9c3fa" id="bigvalue-eee3ffc9c3fa"></a>

```java
public java.math.BigInteger bigValue()
```

Get this number as a BigInteger.

**Returns:** the value of this number, as a BigInteger.

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

### floatValue() <a href="#floatvalue-6e7c2cd63bb9" id="floatvalue-6e7c2cd63bb9"></a>

```java
public float floatValue()
```

Get this number as a float.

**Returns:** the value of this number, as a long.

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### longValue() <a href="#longvalue-636bfe2d6862" id="longvalue-636bfe2d6862"></a>

```java
public long longValue()
```

Get this number as a long

**Returns:** the value of this number, as a long.

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Get the string representation of this number.

**Returns:** the string representation of this number.
