# ConfEAtom <a href="#cls-ConfEAtom" id="cls-ConfEAtom"></a>

```java
public class com.tailf.proto.ConfEAtom
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Provides a Java representation of E atoms. Atoms can be created from strings
 whose length is not more than [MAX_ATOM_LENGTH](ConfEAtom.md#m-MAX_ATOM_LENGTH)
 characters.

**Related classes**

- [ConfEBoolean](ConfEBoolean.md#cls-ConfEBoolean)

## Members

**Constructors**:

- [ConfEAtom(boolean)](#m-ConfEAtom-ff3304319572)
- [ConfEAtom(ConfInputStream)](#m-ConfEAtom-3aa5fefd12c5)
- [ConfEAtom(String)](#m-ConfEAtom-4bbef374d858)

**Fields**:

- [MAX_ATOM_LENGTH](#m-MAX_ATOM_LENGTH)
- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [atomValue()](#m-atomValue-e1510c85d5fa)
- [booleanValue()](#m-booleanValue-8b1662434d74)
- [clone()](ConfEObject.md#m-clone-164c86c45e9b) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#m-decode-e63a2a4cac49) from ConfEObject
- [encode(ConfOutputStream)](#m-encode-cb1ad9eb7771)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [hashCode()](#m-hashCode-ef797a217903)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ConfEAtom(boolean) <a href="#m-ConfEAtom-ff3304319572" id="m-ConfEAtom-ff3304319572"></a>

```java
public ConfEAtom(boolean t)
```

Create an atom whose value is "true" or "false".

**Parameters**

- `boolean t` - boolean value true/false

### ConfEAtom(ConfInputStream) <a href="#m-ConfEAtom-3aa5fefd12c5" id="m-ConfEAtom-3aa5fefd12c5"></a>

```java
public ConfEAtom(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#cls-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Create an atom from a stream containing an atom encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded atom.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E atom.

### ConfEAtom(String) <a href="#m-ConfEAtom-4bbef374d858" id="m-ConfEAtom-4bbef374d858"></a>

```java
public ConfEAtom(String atom)
```

Create an atom from the given string.

**Parameters**

- `String atom` - the string to create the atom from.

**Throws**

- `IllegalArgumentException` - if the string contains more than
                [MAX_ATOM_LENGTH](ConfEAtom.md#m-MAX_ATOM_LENGTH) characters.


## Fields

### MAX_ATOM_LENGTH <a href="#m-MAX_ATOM_LENGTH" id="m-MAX_ATOM_LENGTH"></a>

```java
public static final int MAX_ATOM_LENGTH = 255;
```

The maximum allowed length of an atom, in characters

### serialVersionUID <a href="#m-serialVersionUID" id="m-serialVersionUID"></a>

**Package-private**

```java
static final long serialVersionUID = -3204386396807876641;
```


## Methods

### atomValue() <a href="#m-atomValue-e1510c85d5fa" id="m-atomValue-e1510c85d5fa"></a>

```java
public String atomValue()
```

Get the actual string contained in this object.

**Returns:** the raw string contained in this object, without regard to E
         quoting rules.

**See also:** [`toString`](ConfEAtom.md#m-toString-e9d48c5503ef)

### booleanValue() <a href="#m-booleanValue-8b1662434d74" id="m-booleanValue-8b1662434d74"></a>

```java
public boolean booleanValue()
```

The boolean value of this atom.

**Returns:** the value of this atom expressed as a boolean value. If the atom
         consists of the characters "true" (independent of case) the value
         will be true. For any other values, the value will be false.

### encode(ConfOutputStream) <a href="#m-encode-cb1ad9eb7771" id="m-encode-cb1ad9eb7771"></a>

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#cls-ConfOutputStream)

Convert this atom to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded atom should be written.

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Determine if two atoms are equal.

**Parameters**

- `Object o` - the other object to compare to.

**Returns:** true if the atoms are equal, false otherwise.

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Get the printname of the atom represented by this object. The difference
 between this method and {link #atomValue atomValue()} is that the
 printname is quoted and escaped where necessary, according to the E rules
 for atom naming.

**Returns:** the printname representation of this atom object.

**See also:** [`atomValue`](ConfEAtom.md#m-atomValue-e1510c85d5fa)
