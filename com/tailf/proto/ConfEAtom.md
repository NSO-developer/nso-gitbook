<a id="cls-ConfEAtom"></a>
# ConfEAtom

```java
public class com.tailf.proto.ConfEAtom
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Provides a Java representation of E atoms. Atoms can be created from strings
 whose length is not more than MAX_ATOM_LENGTH
 characters.

**Related classes**

- [ConfEBoolean](ConfEBoolean.md#cls-ConfEBoolean)

## Members

**Constructors**:

- [ConfEAtom(boolean)](#m-confeatom-ff3304319572)
- [ConfEAtom(ConfInputStream)](#m-confeatom-3aa5fefd12c5)
- [ConfEAtom(String)](#m-confeatom-4bbef374d858)

**Fields**:

- [MAX_ATOM_LENGTH](#m-MAX_ATOM_LENGTH)
- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [atomValue()](#m-atomvalue-e1510c85d5fa)
- [booleanValue()](#m-booleanvalue-8b1662434d74)
- [clone()](ConfEObject.md#m-clone-164c86c45e9b) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#m-decode-e63a2a4cac49) from ConfEObject
- [encode(ConfOutputStream)](#m-encode-cb1ad9eb7771)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [hashCode()](#m-hashcode-ef797a217903)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-confeatom-ff3304319572"></a>
### ConfEAtom(boolean)

```java
public ConfEAtom(boolean t)
```

Create an atom whose value is "true" or "false".

**Parameters**

- `boolean t` - boolean value true/false

<a id="m-confeatom-3aa5fefd12c5"></a>
### ConfEAtom(ConfInputStream)

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

<a id="m-confeatom-4bbef374d858"></a>
### ConfEAtom(String)

```java
public ConfEAtom(String atom)
```

Create an atom from the given string.

**Parameters**

- `String atom` - the string to create the atom from.

**Throws**

- `IllegalArgumentException` - if the string contains more than
                MAX_ATOM_LENGTH characters.


## Fields

<a id="m-MAX_ATOM_LENGTH"></a>
### MAX_ATOM_LENGTH

```java
public static final int MAX_ATOM_LENGTH = 255;
```

The maximum allowed length of an atom, in characters

<a id="m-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = -3204386396807876641;
```


## Methods

<a id="m-atomvalue-e1510c85d5fa"></a>
### atomValue()

```java
public String atomValue()
```

Get the actual string contained in this object.

**Returns:** the raw string contained in this object, without regard to E
         quoting rules.

**See also:** [`toString`](ConfEAtom.md#m-tostring-e9d48c5503ef)

<a id="m-booleanvalue-8b1662434d74"></a>
### booleanValue()

```java
public boolean booleanValue()
```

The boolean value of this atom.

**Returns:** the value of this atom expressed as a boolean value. If the atom
         consists of the characters "true" (independent of case) the value
         will be true. For any other values, the value will be false.

<a id="m-encode-cb1ad9eb7771"></a>
### encode(ConfOutputStream)

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#cls-ConfOutputStream)

Convert this atom to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded atom should be written.

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Determine if two atoms are equal.

**Parameters**

- `Object o` - the other object to compare to.

**Returns:** true if the atoms are equal, false otherwise.

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Get the printname of the atom represented by this object. The difference
 between this method and {link #atomValue atomValue()} is that the
 printname is quoted and escaped where necessary, according to the E rules
 for atom naming.

**Returns:** the printname representation of this atom object.

**See also:** [`atomValue`](ConfEAtom.md#m-atomvalue-e1510c85d5fa)
