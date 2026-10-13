# ConfEBoolean <a href="#confeboolean-dd291104280a" id="confeboolean-dd291104280a"></a>

```java
public class com.tailf.proto.ConfEBoolean
    extends com.tailf.proto.ConfEAtom
    implements java.io.Serializable, Cloneable
```

Types: [ConfEAtom](ConfEAtom.md#confeatom-9f9d21cb88dd)

Provides a Java representation of E booleans, which are special cases of
 atoms with values 'true' and 'false'.

## Members

**Constructors**:

- [ConfEBoolean\(boolean\)](#confeboolean-82cee39c0df6)
- [ConfEBoolean\(ConfInputStream\)](#confeboolean-0824f505fca3)

**Fields**:

- [MAX\_ATOM\_LENGTH](ConfEAtom.md#max_atom_length-b3ed4a748361) from ConfEAtom
- [serialVersionUID](#serialversionuid-b9f0e1ec001d)

**Methods**:

- [atomValue\(\)](ConfEAtom.md#atomvalue-e1510c85d5fa) from ConfEAtom
- [booleanValue\(\)](ConfEAtom.md#booleanvalue-8b1662434d74) from ConfEAtom
- [clone\(\)](ConfEObject.md#clone-164c86c45e9b) from ConfEObject
- [decode\(ConfInputStream\)](ConfEObject.md#decode-e63a2a4cac49) from ConfEObject
- [encode\(ConfOutputStream\)](ConfEAtom.md#encode-cb1ad9eb7771) from ConfEAtom
- [equals\(Object\)](ConfEAtom.md#equals-fcd6492e0d6c) from ConfEAtom
- [hashCode\(\)](ConfEAtom.md#hashcode-ef797a217903) from ConfEAtom
- [toString\(\)](ConfEAtom.md#tostring-e9d48c5503ef) from ConfEAtom

## Constructors

### ConfEBoolean(boolean) <a href="#confeboolean-82cee39c0df6" id="confeboolean-82cee39c0df6"></a>

```java
public ConfEBoolean(boolean t)
```

Create a boolean from the given value

**Parameters**

- `boolean t` - the boolean value to represent as an atom.

### ConfEBoolean(ConfInputStream) <a href="#confeboolean-0824f505fca3" id="confeboolean-0824f505fca3"></a>

```java
public ConfEBoolean(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#confinputstream-c4a961d10b62), [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

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

### serialVersionUID <a href="#serialversionuid-b9f0e1ec001d" id="serialversionuid-b9f0e1ec001d"></a>

**Package-private**

```java
static final long serialVersionUID = 1087178844844988393;
```
