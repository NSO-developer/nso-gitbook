# ConfEBoolean <a href="#cls-ConfEBoolean" id="cls-ConfEBoolean"></a>

```java
public class com.tailf.proto.ConfEBoolean
    extends com.tailf.proto.ConfEAtom
    implements java.io.Serializable, Cloneable
```

Types: [ConfEAtom](ConfEAtom.md#cls-ConfEAtom)

Provides a Java representation of E booleans, which are special cases of
 atoms with values 'true' and 'false'.

## Members

**Constructors**:

- [ConfEBoolean(boolean)](#m-ConfEBoolean-82cee39c0df6)
- [ConfEBoolean(ConfInputStream)](#m-ConfEBoolean-0824f505fca3)

**Fields**:

- [MAX_ATOM_LENGTH](ConfEAtom.md#m-MAX_ATOM_LENGTH) from ConfEAtom
- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [atomValue()](ConfEAtom.md#m-atomValue-e1510c85d5fa) from ConfEAtom
- [booleanValue()](ConfEAtom.md#m-booleanValue-8b1662434d74) from ConfEAtom
- [clone()](ConfEObject.md#m-clone-164c86c45e9b) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#m-decode-e63a2a4cac49) from ConfEObject
- [encode(ConfOutputStream)](ConfEAtom.md#m-encode-cb1ad9eb7771) from ConfEAtom
- [equals(Object)](ConfEAtom.md#m-equals-fcd6492e0d6c) from ConfEAtom
- [hashCode()](ConfEAtom.md#m-hashCode-ef797a217903) from ConfEAtom
- [toString()](ConfEAtom.md#m-toString-e9d48c5503ef) from ConfEAtom

## Constructors

### ConfEBoolean(boolean) <a href="#m-ConfEBoolean-82cee39c0df6" id="m-ConfEBoolean-82cee39c0df6"></a>

```java
public ConfEBoolean(boolean t)
```

Create a boolean from the given value

**Parameters**

- `boolean t` - the boolean value to represent as an atom.

### ConfEBoolean(ConfInputStream) <a href="#m-ConfEBoolean-0824f505fca3" id="m-ConfEBoolean-0824f505fca3"></a>

```java
public ConfEBoolean(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#cls-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Create a boolean from a stream containing an atom encoded in E external
 format. The value of the boolean will be true if the atom represented by
 the stream is "true" without regard to case. For other atom values, the
 boolean will have the value false.

**Parameters**

- `com.tailf.proto.ConfInputStream buf`

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E atom.


## Fields

### serialVersionUID <a href="#m-serialVersionUID" id="m-serialVersionUID"></a>

**Package-private**

```java
static final long serialVersionUID = 1087178844844988393;
```
