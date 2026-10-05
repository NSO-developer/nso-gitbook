<a id="s-ConfEString"></a>
# ConfEString

```java
public class com.tailf.proto.ConfEString
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Provides a Java representation of E strings.

## Members

**Constructors**:

- [ConfEString(ConfInputStream)](#s-ConfEString-1)
- [ConfEString(String)](#s-ConfEString-2)

**Fields**:

- [serialVersionUID](#s-serialVersionUID)

**Methods**:

- [clone()](ConfEObject.md#s-clone) from ConfEObject
- [decode(ConfInputStream)](ConfEObject.md#s-decode) from ConfEObject
- [encode(ConfOutputStream)](#s-encode)
- [equals(Object)](#s-equals)
- [hashCode()](#s-hashCode)
- [stringValue()](#s-stringValue)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfEString-1"></a>
### ConfEString(ConfInputStream)

```java
public ConfEString(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#s-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Create an E string from a stream containing a string encoded in E
 external format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded string.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E string.

<a id="s-ConfEString-2"></a>
### ConfEString(String)

```java
public ConfEString(String str)
```

Create an E string from the given string.

**Parameters**

- `String str`


## Fields

<a id="s-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = -7053595217604929233;
```


## Methods

<a id="s-encode"></a>
### encode(ConfOutputStream)

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#s-ConfOutputStream)

Convert this string to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded string should be
            written.

<a id="s-equals"></a>
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

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-stringValue"></a>
### stringValue()

```java
public String stringValue()
```

Get the actual string contained in this object.

**Returns:** the raw string contained in this object, without regard to E
         quoting rules.

**See also:** [`toString`](ConfEString.md#s-toString)

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Get the printable version of the string contained in this object.

**Returns:** the string contained in this object, quoted.

**See also:** [`stringValue`](ConfEString.md#s-stringValue)
