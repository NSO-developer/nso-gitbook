<a id="s-ConfEAtom"></a>
# ConfEAtom

```java
public class com.tailf.proto.ConfEAtom
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Provides a Java representation of E atoms. Atoms can be created from strings
 whose length is not more than MAX_ATOM_LENGTH
 characters.

**Related classes**

- [ConfEBoolean](ConfEBoolean.md#s-ConfEBoolean)

## Members

**Constructors**:

- [ConfEAtom(boolean)](#s-ConfEAtom-1)
- [ConfEAtom(ConfInputStream)](#s-ConfEAtom-2)
- [ConfEAtom(String)](#s-ConfEAtom-3)

**Fields**:

- [MAX_ATOM_LENGTH](#s-MAX_ATOM_LENGTH)
- [serialVersionUID](#s-serialVersionUID)

**Methods**:

- [atomValue()](#s-atomValue)
- [booleanValue()](#s-booleanValue)
- [clone()](ConfEObject.md#s-clone) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#s-decode) from ConfEObject
- [encode(ConfOutputStream)](#s-encode)
- [equals(Object)](#s-equals)
- [hashCode()](#s-hashCode)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfEAtom-1"></a>
### ConfEAtom(boolean)

```java
public ConfEAtom(boolean t)
```

Create an atom whose value is "true" or "false".

**Parameters**

- `boolean t` - boolean value true/false

<a id="s-ConfEAtom-2"></a>
### ConfEAtom(ConfInputStream)

```java
public ConfEAtom(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#s-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Create an atom from a stream containing an atom encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded atom.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E atom.

<a id="s-ConfEAtom-3"></a>
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

<a id="s-MAX_ATOM_LENGTH"></a>
### MAX_ATOM_LENGTH

```java
public static final int MAX_ATOM_LENGTH = 255;
```

The maximum allowed length of an atom, in characters

<a id="s-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = -3204386396807876641;
```


## Methods

<a id="s-atomValue"></a>
### atomValue()

```java
public String atomValue()
```

Get the actual string contained in this object.

**Returns:** the raw string contained in this object, without regard to E
         quoting rules.

**See also:** [`toString`](ConfEAtom.md#s-toString)

<a id="s-booleanValue"></a>
### booleanValue()

```java
public boolean booleanValue()
```

The boolean value of this atom.

**Returns:** the value of this atom expressed as a boolean value. If the atom
         consists of the characters "true" (independent of case) the value
         will be true. For any other values, the value will be false.

<a id="s-encode"></a>
### encode(ConfOutputStream)

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#s-ConfOutputStream)

Convert this atom to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded atom should be written.

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Determine if two atoms are equal.

**Parameters**

- `Object o` - the other object to compare to.

**Returns:** true if the atoms are equal, false otherwise.

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Get the printname of the atom represented by this object. The difference
 between this method and {link #atomValue atomValue()} is that the
 printname is quoted and escaped where necessary, according to the E rules
 for atom naming.

**Returns:** the printname representation of this atom object.

**See also:** [`atomValue`](ConfEAtom.md#s-atomValue)
