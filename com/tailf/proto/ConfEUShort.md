<a id="cls-ConfEUShort"></a>
# ConfEUShort

```java
public class com.tailf.proto.ConfEUShort
    extends com.tailf.proto.ConfELong
```

Types: [ConfELong](ConfELong.md#cls-ConfELong)

Provides a Java representation of E integral types.

## Members

**Constructors**:

- [ConfEUShort(ConfInputStream)](#m-confeushort-ad7e7e5b6889)
- [ConfEUShort(short)](#m-confeushort-3d6adcb58c0d)

**Fields**:

- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [byteValue()](ConfELong.md#m-bytevalue-a56aac956c5c) from ConfELong
- [charValue()](ConfELong.md#m-charvalue-4b3a6b868fe4) from ConfELong
- [clone()](ConfEObject.md#m-clone-164c86c45e9b) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#m-decode-e63a2a4cac49) from ConfEObject
- [encode(ConfOutputStream)](ConfELong.md#m-encode-cb1ad9eb7771) from ConfELong
- [equals(Object)](ConfELong.md#m-equals-fcd6492e0d6c) from ConfELong
- [hashCode()](ConfELong.md#m-hashcode-ef797a217903) from ConfELong
- [intValue()](ConfELong.md#m-intvalue-2f745d025d8e) from ConfELong
- [longValue()](ConfELong.md#m-longvalue-636bfe2d6862) from ConfELong
- [shortValue()](ConfELong.md#m-shortvalue-438ff2f827fb) from ConfELong
- [toString()](ConfELong.md#m-tostring-e9d48c5503ef) from ConfELong
- [uIntValue()](ConfELong.md#m-uintvalue-11d9c2202272) from ConfELong
- [uShortValue()](ConfELong.md#m-ushortvalue-5c27a3934662) from ConfELong

## Constructors

<a id="m-confeushort-ad7e7e5b6889"></a>
### ConfEUShort(ConfInputStream)

```java
public ConfEUShort(
    com.tailf.proto.ConfInputStream buf
)
    throws com.tailf.proto.ConfERangeException, com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#cls-ConfInputStream), [ConfERangeException](ConfERangeException.md#cls-ConfERangeException), [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Create an E integer from a stream containing an integer encoded in E
 external format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded value.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E integer.
- `ConfERangeException` - if the value is too large to be represented as a short, or
                the value is negative.

<a id="m-confeushort-3d6adcb58c0d"></a>
### ConfEUShort(short)

```java
public ConfEUShort(short s) throws com.tailf.proto.ConfERangeException
```

Types: [ConfERangeException](ConfERangeException.md#cls-ConfERangeException)

Create an E integer from the given value.

**Parameters**

- `short s` - the non-negative short value to use.

**Throws**

- `ConfERangeException` - if the value is negative.


## Fields

<a id="m-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = 300370950578307246;
```
