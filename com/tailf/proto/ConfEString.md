<a id="cls-ConfEString"></a>
# ConfEString

```java
public class com.tailf.proto.ConfEString
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Provides a Java representation of E strings.

## Members

**Constructors**:

- [ConfEString(ConfInputStream)](#m-confestring-56214826ef50)
- [ConfEString(String)](#m-confestring-1abe12804412)

**Fields**:

- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [clone()](ConfEObject.md#m-clone-164c86c45e9b) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#m-decode-e63a2a4cac49) from ConfEObject
- [encode(ConfOutputStream)](#m-encode-cb1ad9eb7771)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [hashCode()](#m-hashcode-ef797a217903)
- [stringValue()](#m-stringvalue-a6efca13ec08)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-confestring-56214826ef50"></a>
### ConfEString(ConfInputStream)

```java
public ConfEString(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#cls-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Create an E string from a stream containing a string encoded in E
 external format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded string.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E string.

<a id="m-confestring-1abe12804412"></a>
### ConfEString(String)

```java
public ConfEString(String str)
```

Create an E string from the given string.

**Parameters**

- `String str`


## Fields

<a id="m-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = -7053595217604929233;
```


## Methods

<a id="m-encode-cb1ad9eb7771"></a>
### encode(ConfOutputStream)

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#cls-ConfOutputStream)

Convert this string to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded string should be
            written.

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Determine if two strings are equal. They are equal if they represent the
 same sequence of characters. This method can be used to compare
 ConfEStrings with each other and with Strings.

**Parameters**

- `Object o` - the ConfEString or String to compare to.

**Returns:** true if the strings consist of the same sequence of characters,
         false otherwise.

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-stringvalue-a6efca13ec08"></a>
### stringValue()

```java
public String stringValue()
```

Get the actual string contained in this object.

**Returns:** the raw string contained in this object, without regard to E
         quoting rules.

**See also:** [`toString`](ConfEString.md#m-tostring-e9d48c5503ef)

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Get the printable version of the string contained in this object.

**Returns:** the string contained in this object, quoted.

**See also:** [`stringValue`](ConfEString.md#m-stringvalue-a6efca13ec08)
