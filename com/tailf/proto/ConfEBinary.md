<a id="cls-ConfEBinary"></a>
# ConfEBinary

```java
public class com.tailf.proto.ConfEBinary
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Provides a Java representation of E binaries. Anything that can be
 represented as a sequence of bytes can be made into an E binary.

## Members

**Constructors**:

- [ConfEBinary(byte[])](#m-confebinary-506aed111f96)
- [ConfEBinary(ConfInputStream)](#m-confebinary-d94a11feacbc)
- [ConfEBinary(Object)](#m-confebinary-879efbf3bf5f)
- [ConfEBinary(String)](#m-confebinary-d6e30703f244)

**Fields**:

- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [binaryValue()](#m-binaryvalue-33c968bac7b6)
- [clone()](#m-clone-164c86c45e9b)
- [decode(ConfInputStream)](ConfEObject.md#m-decode-e63a2a4cac49) from ConfEObject
- [encode(ConfOutputStream)](#m-encode-cb1ad9eb7771)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getObject()](#m-getobject-723a0ba5640e)
- [hashCode()](#m-hashcode-ef797a217903)
- [size()](#m-size-c6d8505255fd)
- [stringValue()](#m-stringvalue-a6efca13ec08)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-confebinary-506aed111f96"></a>
### ConfEBinary(byte[])

```java
public ConfEBinary(byte[] bin)
```

Create a binary from a byte array

**Parameters**

- `byte[] bin` - the array of bytes from which to create the binary.

<a id="m-confebinary-d94a11feacbc"></a>
### ConfEBinary(ConfInputStream)

```java
public ConfEBinary(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#cls-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Create a binary from a stream containing a binary encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded binary.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E binary.

<a id="m-confebinary-879efbf3bf5f"></a>
### ConfEBinary(Object)

```java
public ConfEBinary(Object o)
```

Create a binary from an arbitrary Java Object. The object must implement
 java.io.Serializable or java.io.Externalizable.

**Parameters**

- `Object o` - the object to serialize and create this binary from.

<a id="m-confebinary-d6e30703f244"></a>
### ConfEBinary(String)

```java
public ConfEBinary(String s)
```

**Parameters**

- `String s`


## Fields

<a id="m-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = -3781009633593609217;
```


## Methods

<a id="m-binaryvalue-33c968bac7b6"></a>
### binaryValue()

```java
public byte[] binaryValue()
```

Get the byte array from a binary.

**Returns:** the byte array containing the bytes for this binary.

<a id="m-clone-164c86c45e9b"></a>
### clone()

```java
public Object clone()
```

<a id="m-encode-cb1ad9eb7771"></a>
### encode(ConfOutputStream)

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#cls-ConfOutputStream)

Convert this binary to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded binary should be
            written.

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Determine if two binaries are equal. Binaries are equal if they have the
 same length and the array of bytes is identical.

**Parameters**

- `Object o` - the binary to compare to.

**Returns:** true if the byte arrays contain the same bytes, false otherwise.

<a id="m-getobject-723a0ba5640e"></a>
### getObject()

```java
public Object getObject()
```

Get the java Object from the binary. If the binary contains a serialized
 Java object, then this method will recreate the object.

**Returns:** the java Object represented by this binary, or null if the binary
         does not represent a Java Object.

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-size-c6d8505255fd"></a>
### size()

```java
public int size()
```

Get the size of the binary.

**Returns:** the number of bytes contained in the binary.

<a id="m-stringvalue-a6efca13ec08"></a>
### stringValue()

```java
public String stringValue()
```

Get the string representation of binary

**Returns:** a string object containing the bytes for this binary.

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Get the string representation of this binary object. A binary is printed
 as #BinN, where N is the number of bytes contained in the object.

**Returns:** the E string representation of this binary.
