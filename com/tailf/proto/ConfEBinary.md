# ConfEBinary <a href="#confebinary-57adaf095772" id="confebinary-57adaf095772"></a>

```java
public class com.tailf.proto.ConfEBinary
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Provides a Java representation of E binaries. Anything that can be
 represented as a sequence of bytes can be made into an E binary.

## Members

**Constructors**:

- [ConfEBinary(byte[])](#confebinary-506aed111f96)
- [ConfEBinary(ConfInputStream)](#confebinary-d94a11feacbc)
- [ConfEBinary(Object)](#confebinary-879efbf3bf5f)
- [ConfEBinary(String)](#confebinary-d6e30703f244)

**Fields**:

- [serialVersionUID](#serialversionuid-b9f0e1ec001d)

**Methods**:

- [binaryValue()](#binaryvalue-33c968bac7b6)
- [clone()](#clone-164c86c45e9b)
- [decode(ConfInputStream)](ConfEObject.md#decode-e63a2a4cac49) from ConfEObject
- [encode(ConfOutputStream)](#encode-cb1ad9eb7771)
- [equals(Object)](#equals-fcd6492e0d6c)
- [getObject()](#getobject-723a0ba5640e)
- [hashCode()](#hashcode-ef797a217903)
- [size()](#size-c6d8505255fd)
- [stringValue()](#stringvalue-a6efca13ec08)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### ConfEBinary(byte[]) <a href="#confebinary-506aed111f96" id="confebinary-506aed111f96"></a>

```java
public ConfEBinary(byte[] bin)
```

Create a binary from a byte array

**Parameters**

- `byte[] bin` - the array of bytes from which to create the binary.

### ConfEBinary(ConfInputStream) <a href="#confebinary-d94a11feacbc" id="confebinary-d94a11feacbc"></a>

```java
public ConfEBinary(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#confinputstream-c4a961d10b62), [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Create a binary from a stream containing a binary encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded binary.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E binary.

### ConfEBinary(Object) <a href="#confebinary-879efbf3bf5f" id="confebinary-879efbf3bf5f"></a>

```java
public ConfEBinary(Object o)
```

Create a binary from an arbitrary Java Object. The object must implement
 java.io.Serializable or java.io.Externalizable.

**Parameters**

- `Object o` - the object to serialize and create this binary from.

### ConfEBinary(String) <a href="#confebinary-d6e30703f244" id="confebinary-d6e30703f244"></a>

```java
public ConfEBinary(String s)
```

**Parameters**

- `String s`


## Fields

### serialVersionUID <a href="#serialversionuid-b9f0e1ec001d" id="serialversionuid-b9f0e1ec001d"></a>

**Package-private**

```java
static final long serialVersionUID = -3781009633593609217;
```


## Methods

### binaryValue() <a href="#binaryvalue-33c968bac7b6" id="binaryvalue-33c968bac7b6"></a>

```java
public byte[] binaryValue()
```

Get the byte array from a binary.

**Returns:** the byte array containing the bytes for this binary.

### clone() <a href="#clone-164c86c45e9b" id="clone-164c86c45e9b"></a>

```java
public Object clone()
```

### encode(ConfOutputStream) <a href="#encode-cb1ad9eb7771" id="encode-cb1ad9eb7771"></a>

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#confoutputstream-e8ef47aca327)

Convert this binary to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded binary should be
            written.

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Determine if two binaries are equal. Binaries are equal if they have the
 same length and the array of bytes is identical.

**Parameters**

- `Object o` - the binary to compare to.

**Returns:** true if the byte arrays contain the same bytes, false otherwise.

### getObject() <a href="#getobject-723a0ba5640e" id="getobject-723a0ba5640e"></a>

```java
public Object getObject()
```

Get the java Object from the binary. If the binary contains a serialized
 Java object, then this method will recreate the object.

**Returns:** the java Object represented by this binary, or null if the binary
         does not represent a Java Object.

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### size() <a href="#size-c6d8505255fd" id="size-c6d8505255fd"></a>

```java
public int size()
```

Get the size of the binary.

**Returns:** the number of bytes contained in the binary.

### stringValue() <a href="#stringvalue-a6efca13ec08" id="stringvalue-a6efca13ec08"></a>

```java
public String stringValue()
```

Get the string representation of binary

**Returns:** a string object containing the bytes for this binary.

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Get the string representation of this binary object. A binary is printed
 as #BinN, where N is the number of bytes contained in the object.

**Returns:** the E string representation of this binary.
