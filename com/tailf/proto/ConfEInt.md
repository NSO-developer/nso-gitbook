# ConfEInt <a href="#confeint-71ffd8a18157" id="confeint-71ffd8a18157"></a>

```java
public class com.tailf.proto.ConfEInt
    extends com.tailf.proto.ConfELong
```

Types: [ConfELong](ConfELong.md#confelong-926979f5365d)

Provides a Java representation of E integral types.

## Members

**Constructors**:

- [ConfEInt\(ConfInputStream\)](#confeint-53a4f0d6d749)
- [ConfEInt\(int\)](#confeint-771bba52a670)

**Fields**:

- [serialVersionUID](#serialversionuid-b9f0e1ec001d)

**Methods**:

- [byteValue\(\)](ConfELong.md#bytevalue-a56aac956c5c) from ConfELong
- [charValue\(\)](ConfELong.md#charvalue-4b3a6b868fe4) from ConfELong
- [clone\(\)](ConfEObject.md#clone-164c86c45e9b) from ConfEObject
- [decode\(ConfInputStream\)](ConfEObject.md#decode-e63a2a4cac49) from ConfEObject
- [encode\(ConfOutputStream\)](ConfELong.md#encode-cb1ad9eb7771) from ConfELong
- [equals\(Object\)](ConfELong.md#equals-fcd6492e0d6c) from ConfELong
- [hashCode\(\)](ConfELong.md#hashcode-ef797a217903) from ConfELong
- [intValue\(\)](ConfELong.md#intvalue-2f745d025d8e) from ConfELong
- [longValue\(\)](ConfELong.md#longvalue-636bfe2d6862) from ConfELong
- [shortValue\(\)](ConfELong.md#shortvalue-438ff2f827fb) from ConfELong
- [toString\(\)](ConfELong.md#tostring-e9d48c5503ef) from ConfELong
- [uIntValue\(\)](ConfELong.md#uintvalue-11d9c2202272) from ConfELong
- [uShortValue\(\)](ConfELong.md#ushortvalue-5c27a3934662) from ConfELong

## Constructors

### ConfEInt(ConfInputStream) <a href="#confeint-53a4f0d6d749" id="confeint-53a4f0d6d749"></a>

```java
public ConfEInt(
    com.tailf.proto.ConfInputStream buf
)
    throws com.tailf.proto.ConfERangeException, com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#confinputstream-c4a961d10b62), [ConfERangeException](ConfERangeException.md#conferangeexception-3f566066d5e7), [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Create an E integer from a stream containing an integer encoded in E
 external format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded value.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E integer.
- `ConfERangeException` - if the value is too large to be represented as an int.

### ConfEInt(int) <a href="#confeint-771bba52a670" id="confeint-771bba52a670"></a>

```java
public ConfEInt(int i)
```

Create an E integer from the given value.

**Parameters**

- `int i` - the int value to use.


## Fields

### serialVersionUID <a href="#serialversionuid-b9f0e1ec001d" id="serialversionuid-b9f0e1ec001d"></a>

**Package-private**

```java
static final long serialVersionUID = 1229430977614805556;
```
