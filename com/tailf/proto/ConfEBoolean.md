<a id="s-ConfEBoolean"></a>
# ConfEBoolean

```java
public class com.tailf.proto.ConfEBoolean
    extends com.tailf.proto.ConfEAtom
    implements java.io.Serializable, Cloneable
```

Types: [ConfEAtom](ConfEAtom.md#s-ConfEAtom)

Provides a Java representation of E booleans, which are special cases of
 atoms with values 'true' and 'false'.

## Members

**Constructors**:

- [ConfEBoolean(boolean)](#s-ConfEBoolean-1)
- [ConfEBoolean(ConfInputStream)](#s-ConfEBoolean-2)

**Fields**:

- [MAX_ATOM_LENGTH](ConfEAtom.md#s-MAX_ATOM_LENGTH) from ConfEAtom
- [serialVersionUID](#s-serialVersionUID)

**Methods**:

- [atomValue()](ConfEAtom.md#s-atomValue) from ConfEAtom
- [booleanValue()](ConfEAtom.md#s-booleanValue) from ConfEAtom
- [clone()](ConfEObject.md#s-clone) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#s-decode) from ConfEObject
- [encode(ConfOutputStream)](ConfEAtom.md#s-encode) from ConfEAtom
- [equals(Object)](ConfEAtom.md#s-equals) from ConfEAtom
- [hashCode()](ConfEAtom.md#s-hashCode) from ConfEAtom
- [toString()](ConfEAtom.md#s-toString) from ConfEAtom

## Constructors

<a id="s-ConfEBoolean-1"></a>
### ConfEBoolean(boolean)

```java
public ConfEBoolean(boolean t)
```

Create a boolean from the given value

**Parameters**

- `boolean t` - the boolean value to represent as an atom.

<a id="s-ConfEBoolean-2"></a>
### ConfEBoolean(ConfInputStream)

```java
public ConfEBoolean(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#s-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

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

<a id="s-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = 1087178844844988393;
```
