<a id="s-ConfEBinary"></a>
# ConfEBinary

```java
public class com.tailf.proto.ConfEBinary
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Provides a Java representation of E binaries. Anything that can be
 represented as a sequence of bytes can be made into an E binary.

## Members

**Constructors**:

- [ConfEBinary(byte[])](#s-ConfEBinary-1)
- [ConfEBinary(ConfInputStream)](#s-ConfEBinary-2)
- [ConfEBinary(Object)](#s-ConfEBinary-3)
- [ConfEBinary(String)](#s-ConfEBinary-4)

**Fields**:

- [serialVersionUID](#s-serialVersionUID)

**Methods**:

- [binaryValue()](#s-binaryValue)
- [clone()](#s-clone)
- [decode(ConfInputStream)](ConfEObject.md#s-decode) from ConfEObject
- [encode(ConfOutputStream)](#s-encode)
- [equals(Object)](#s-equals)
- [getObject()](#s-getObject)
- [hashCode()](#s-hashCode)
- [size()](#s-size)
- [stringValue()](#s-stringValue)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfEBinary-1"></a>
### ConfEBinary(byte[])

```java
public ConfEBinary(byte[] bin)
```

Create a binary from a byte array

**Parameters**

- `byte[] bin` - the array of bytes from which to create the binary.

<a id="s-ConfEBinary-2"></a>
### ConfEBinary(ConfInputStream)

```java
public ConfEBinary(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#s-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Create a binary from a stream containing a binary encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded binary.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E binary.

<a id="s-ConfEBinary-3"></a>
### ConfEBinary(Object)

```java
public ConfEBinary(Object o)
```

Create a binary from an arbitrary Java Object. The object must implement
 java.io.Serializable or java.io.Externalizable.

**Parameters**

- `Object o` - the object to serialize and create this binary from.

<a id="s-ConfEBinary-4"></a>
### ConfEBinary(String)

```java
public ConfEBinary(String s)
```

**Parameters**

- `String s`


## Fields

<a id="s-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = -3781009633593609217;
```


## Methods

<a id="s-binaryValue"></a>
### binaryValue()

```java
public byte[] binaryValue()
```

Get the byte array from a binary.

**Returns:** the byte array containing the bytes for this binary.

<a id="s-clone"></a>
### clone()

```java
public Object clone()
```

<a id="s-encode"></a>
### encode(ConfOutputStream)

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#s-ConfOutputStream)

Convert this binary to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded binary should be
            written.

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Determine if two binaries are equal. Binaries are equal if they have the
 same length and the array of bytes is identical.

**Parameters**

- `Object o` - the binary to compare to.

**Returns:** true if the byte arrays contain the same bytes, false otherwise.

<a id="s-getObject"></a>
### getObject()

```java
public Object getObject()
```

Get the java Object from the binary. If the binary contains a serialized
 Java object, then this method will recreate the object.

**Returns:** the java Object represented by this binary, or null if the binary
         does not represent a Java Object.

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-size"></a>
### size()

```java
public int size()
```

Get the size of the binary.

**Returns:** the number of bytes contained in the binary.

<a id="s-stringValue"></a>
### stringValue()

```java
public String stringValue()
```

Get the string representation of binary

**Returns:** a string object containing the bytes for this binary.

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Get the string representation of this binary object. A binary is printed
 as #BinN, where N is the number of bytes contained in the object.

**Returns:** the E string representation of this binary.
