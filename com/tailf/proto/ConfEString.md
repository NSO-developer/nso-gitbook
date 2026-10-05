# ConfEString <a href="#cls-ConfEString" id="cls-ConfEString"></a>

```java
public class com.tailf.proto.ConfEString
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Provides a Java representation of E strings.

## Members

**Constructors**:

- [ConfEString(ConfInputStream)](#m-ConfEString-56214826ef50)
- [ConfEString(String)](#m-ConfEString-1abe12804412)

**Fields**:

- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [clone()](ConfEObject.md#m-clone-164c86c45e9b) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#m-decode-e63a2a4cac49) from ConfEObject
- [encode(ConfOutputStream)](#m-encode-cb1ad9eb7771)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [hashCode()](#m-hashCode-ef797a217903)
- [stringValue()](#m-stringValue-a6efca13ec08)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ConfEString(ConfInputStream) <a href="#m-ConfEString-56214826ef50" id="m-ConfEString-56214826ef50"></a>

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

### ConfEString(String) <a href="#m-ConfEString-1abe12804412" id="m-ConfEString-1abe12804412"></a>

```java
public ConfEString(String str)
```

Create an E string from the given string.

**Parameters**

- `String str`


## Fields

### serialVersionUID <a href="#m-serialVersionUID" id="m-serialVersionUID"></a>

**Package-private**

```java
static final long serialVersionUID = -7053595217604929233;
```


## Methods

### encode(ConfOutputStream) <a href="#m-encode-cb1ad9eb7771" id="m-encode-cb1ad9eb7771"></a>

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#cls-ConfOutputStream)

Convert this string to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded string should be
            written.

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

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

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### stringValue() <a href="#m-stringValue-a6efca13ec08" id="m-stringValue-a6efca13ec08"></a>

```java
public String stringValue()
```

Get the actual string contained in this object.

**Returns:** the raw string contained in this object, without regard to E
         quoting rules.

**See also:** [`toString`](ConfEString.md#m-toString-e9d48c5503ef)

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Get the printable version of the string contained in this object.

**Returns:** the string contained in this object, quoted.

**See also:** [`stringValue`](ConfEString.md#m-stringValue-a6efca13ec08)
