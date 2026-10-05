# ConfEAtom <a href="#confeatom-9f9d21cb88dd" id="confeatom-9f9d21cb88dd"></a>

```java
public class com.tailf.proto.ConfEAtom
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Provides a Java representation of E atoms. Atoms can be created from strings
 whose length is not more than [MAX\_ATOM\_LENGTH](ConfEAtom.md#max_atom_length-b3ed4a748361)
 characters.

**Related classes**

- [ConfEBoolean](ConfEBoolean.md#confeboolean-dd291104280a)

## Members

**Constructors**:

- [ConfEAtom\(boolean\)](#confeatom-ff3304319572)
- [ConfEAtom\(ConfInputStream\)](#confeatom-3aa5fefd12c5)
- [ConfEAtom\(String\)](#confeatom-4bbef374d858)

**Fields**:

- [MAX\_ATOM\_LENGTH](#max_atom_length-b3ed4a748361)
- [serialVersionUID](#serialversionuid-b9f0e1ec001d)

**Methods**:

- [atomValue\(\)](#atomvalue-e1510c85d5fa)
- [booleanValue\(\)](#booleanvalue-8b1662434d74)
- [clone\(\)](ConfEObject.md#clone-164c86c45e9b) from ConfEObject
- [decode\(ConfInputStream\)](ConfEObject.md#decode-e63a2a4cac49) from ConfEObject
- [encode\(ConfOutputStream\)](#encode-cb1ad9eb7771)
- [equals\(Object\)](#equals-fcd6492e0d6c)
- [hashCode\(\)](#hashcode-ef797a217903)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### ConfEAtom(boolean) <a href="#confeatom-ff3304319572" id="confeatom-ff3304319572"></a>

```java
public ConfEAtom(boolean t)
```

Create an atom whose value is "true" or "false".

**Parameters**

- `boolean t` - boolean value true/false

### ConfEAtom(ConfInputStream) <a href="#confeatom-3aa5fefd12c5" id="confeatom-3aa5fefd12c5"></a>

```java
public ConfEAtom(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#confinputstream-c4a961d10b62), [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Create an atom from a stream containing an atom encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded atom.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E atom.

### ConfEAtom(String) <a href="#confeatom-4bbef374d858" id="confeatom-4bbef374d858"></a>

```java
public ConfEAtom(String atom)
```

Create an atom from the given string.

**Parameters**

- `String atom` - the string to create the atom from.

**Throws**

- `IllegalArgumentException` - if the string contains more than
                [MAX\_ATOM\_LENGTH](ConfEAtom.md#max_atom_length-b3ed4a748361) characters.


## Fields

### MAX_ATOM_LENGTH <a href="#max_atom_length-b3ed4a748361" id="max_atom_length-b3ed4a748361"></a>

```java
public static final int MAX_ATOM_LENGTH = 255;
```

The maximum allowed length of an atom, in characters

### serialVersionUID <a href="#serialversionuid-b9f0e1ec001d" id="serialversionuid-b9f0e1ec001d"></a>

**Package-private**

```java
static final long serialVersionUID = -3204386396807876641;
```


## Methods

### atomValue() <a href="#atomvalue-e1510c85d5fa" id="atomvalue-e1510c85d5fa"></a>

```java
public String atomValue()
```

Get the actual string contained in this object.

**Returns:** the raw string contained in this object, without regard to E
         quoting rules.

**See also:** [`toString`](ConfEAtom.md#tostring-e9d48c5503ef)

### booleanValue() <a href="#booleanvalue-8b1662434d74" id="booleanvalue-8b1662434d74"></a>

```java
public boolean booleanValue()
```

The boolean value of this atom.

**Returns:** the value of this atom expressed as a boolean value. If the atom
         consists of the characters "true" (independent of case) the value
         will be true. For any other values, the value will be false.

### encode(ConfOutputStream) <a href="#encode-cb1ad9eb7771" id="encode-cb1ad9eb7771"></a>

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#confoutputstream-e8ef47aca327)

Convert this atom to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded atom should be written.

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Determine if two atoms are equal.

**Parameters**

- `Object o` - the other object to compare to.

**Returns:** true if the atoms are equal, false otherwise.

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Get the printname of the atom represented by this object. The difference
 between this method and {link #atomValue atomValue()} is that the
 printname is quoted and escaped where necessary, according to the E rules
 for atom naming.

**Returns:** the printname representation of this atom object.

**See also:** [`atomValue`](ConfEAtom.md#atomvalue-e1510c85d5fa)
