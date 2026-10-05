# ConfEShort <a href="#cls-ConfEShort" id="cls-ConfEShort"></a>

```java
public class com.tailf.proto.ConfEShort
    extends com.tailf.proto.ConfELong
```

Types: [ConfELong](ConfELong.md#cls-ConfELong)

Provides a Java representation of E integral types.

## Members

**Constructors**:

- [ConfEShort(ConfInputStream)](#m-ConfEShort-9b2f8ff9c5b9)
- [ConfEShort(short)](#m-ConfEShort-ca5228fbbb9a)

**Fields**:

- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [byteValue()](ConfELong.md#m-byteValue-a56aac956c5c) from ConfELong
- [charValue()](ConfELong.md#m-charValue-4b3a6b868fe4) from ConfELong
- [clone()](ConfEObject.md#m-clone-164c86c45e9b) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#m-decode-e63a2a4cac49) from ConfEObject
- [encode(ConfOutputStream)](ConfELong.md#m-encode-cb1ad9eb7771) from ConfELong
- [equals(Object)](ConfELong.md#m-equals-fcd6492e0d6c) from ConfELong
- [hashCode()](ConfELong.md#m-hashCode-ef797a217903) from ConfELong
- [intValue()](ConfELong.md#m-intValue-2f745d025d8e) from ConfELong
- [longValue()](ConfELong.md#m-longValue-636bfe2d6862) from ConfELong
- [shortValue()](ConfELong.md#m-shortValue-438ff2f827fb) from ConfELong
- [toString()](ConfELong.md#m-toString-e9d48c5503ef) from ConfELong
- [uIntValue()](ConfELong.md#m-uIntValue-11d9c2202272) from ConfELong
- [uShortValue()](ConfELong.md#m-uShortValue-5c27a3934662) from ConfELong

## Constructors

### ConfEShort(ConfInputStream) <a href="#m-ConfEShort-9b2f8ff9c5b9" id="m-ConfEShort-9b2f8ff9c5b9"></a>

```java
public ConfEShort(
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
- `ConfERangeException` - if the value is too large to be represented as a short.

### ConfEShort(short) <a href="#m-ConfEShort-ca5228fbbb9a" id="m-ConfEShort-ca5228fbbb9a"></a>

```java
public ConfEShort(short s)
```

Create an E integer from the given value.

**Parameters**

- `short s` - the short value to use.


## Fields

### serialVersionUID <a href="#m-serialVersionUID" id="m-serialVersionUID"></a>

**Package-private**

```java
static final long serialVersionUID = 7162345156603088099;
```
