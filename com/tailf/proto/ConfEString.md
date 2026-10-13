# ConfEString <a href="#confestring-c60dc35f221d" id="confestring-c60dc35f221d"></a>

```java
public class com.tailf.proto.ConfEString
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Provides a Java representation of E strings.

## Members

**Constructors**:

- [ConfEString\(ConfInputStream\)](#confestring-56214826ef50)
- [ConfEString\(String\)](#confestring-1abe12804412)

**Fields**:

- [serialVersionUID](#serialversionuid-b9f0e1ec001d)

**Methods**:

- [clone\(\)](ConfEObject.md#clone-164c86c45e9b) from ConfEObject
- [decode\(ConfInputStream\)](ConfEObject.md#decode-e63a2a4cac49) from ConfEObject
- [encode\(ConfOutputStream\)](#encode-cb1ad9eb7771)
- [equals\(Object\)](#equals-fcd6492e0d6c)
- [hashCode\(\)](#hashcode-ef797a217903)
- [stringValue\(\)](#stringvalue-a6efca13ec08)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### ConfEString(ConfInputStream) <a href="#confestring-56214826ef50" id="confestring-56214826ef50"></a>

```java
public ConfEString(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#confinputstream-c4a961d10b62), [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Create an E string from a stream containing a string encoded in E
 external format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded string.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E string.

### ConfEString(String) <a href="#confestring-1abe12804412" id="confestring-1abe12804412"></a>

```java
public ConfEString(String str)
```

Create an E string from the given string.

**Parameters**

- `String str`


## Fields

### serialVersionUID <a href="#serialversionuid-b9f0e1ec001d" id="serialversionuid-b9f0e1ec001d"></a>

**Package-private**

```java
static final long serialVersionUID = -7053595217604929233;
```


## Methods

### encode(ConfOutputStream) <a href="#encode-cb1ad9eb7771" id="encode-cb1ad9eb7771"></a>

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#confoutputstream-e8ef47aca327)

Convert this string to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded string should be
            written.

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

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

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### stringValue() <a href="#stringvalue-a6efca13ec08" id="stringvalue-a6efca13ec08"></a>

```java
public String stringValue()
```

Get the actual string contained in this object.

**Returns:** the raw string contained in this object, without regard to E
         quoting rules.

**See also:** [`toString`](ConfEString.md#tostring-e9d48c5503ef)

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Get the printable version of the string contained in this object.

**Returns:** the string contained in this object, quoted.

**See also:** [`stringValue`](ConfEString.md#stringvalue-a6efca13ec08)
