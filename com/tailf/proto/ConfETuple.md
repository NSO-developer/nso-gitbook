<a id="s-ConfETuple"></a>
# ConfETuple

```java
public class com.tailf.proto.ConfETuple
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Provides a Java representation of E tuples. Tuples are created from one or
 more arbitrary E terms.


 The arity of the tuple is the number of elements it contains. Elements are
 indexed from 0 to (arity-1) and can be retrieved individually by using the
 appropriate index.

## Members

**Constructors**:

- [ConfETuple(ConfEObject)](#s-ConfETuple-1)
- [ConfETuple(ConfEObject[])](#s-ConfETuple-2)
- [ConfETuple(ConfEObject[], int, int)](#s-ConfETuple-3)
- [ConfETuple(ConfInputStream)](#s-ConfETuple-4)

**Fields**:

- [serialVersionUID](#s-serialVersionUID)

**Methods**:

- [arity()](#s-arity)
- [clone()](#s-clone)
- [decode(ConfInputStream)](ConfEObject.md#s-decode) from ConfEObject
- [elementAt(int)](#s-elementAt)
- [elements()](#s-elements)
- [encode(ConfOutputStream)](#s-encode)
- [equals(Object)](#s-equals)
- [hashCode()](#s-hashCode)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfETuple-1"></a>
### ConfETuple(ConfEObject)

```java
public ConfETuple(com.tailf.proto.ConfEObject elem)
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Create a unary tuple containing the given element.

**Parameters**

- `com.tailf.proto.ConfEObject elem` - the element to create the tuple from.

**Throws**

- `IllegalArgumentException` - if the element is null.

<a id="s-ConfETuple-2"></a>
### ConfETuple(ConfEObject[])

```java
public ConfETuple(com.tailf.proto.ConfEObject[] elems)
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Create a tuple from an array of terms.

**Parameters**

- `com.tailf.proto.ConfEObject[] elems` - the array of terms to create the tuple from.

**Throws**

- `IllegalArgumentException` - if the array is empty (null) or contains null elements.

<a id="s-ConfETuple-3"></a>
### ConfETuple(ConfEObject[], int, int)

```java
public ConfETuple(com.tailf.proto.ConfEObject[] elems, int start, int count)
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Create a tuple from an array of terms.

**Parameters**

- `com.tailf.proto.ConfEObject[] elems` - the array of terms to create the tuple from.
- `int start` - the offset of the first term to insert.
- `int count` - the number of terms to insert.

**Throws**

- `IllegalArgumentException` - if the array is empty (null) or contains null elements.

<a id="s-ConfETuple-4"></a>
### ConfETuple(ConfInputStream)

```java
public ConfETuple(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#s-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Create a tuple from a stream containing an tuple encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded tuple.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E tuple.


## Fields

<a id="s-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = 9163498658004915935;
```


## Methods

<a id="s-arity"></a>
### arity()

```java
public int arity()
```

Get the arity of the tuple.

**Returns:** the number of elements contained in the tuple.

<a id="s-clone"></a>
### clone()

```java
public Object clone()
```

<a id="s-elementAt"></a>
### elementAt(int)

```java
public com.tailf.proto.ConfEObject elementAt(int i)
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Get the specified element from the tuple.

**Parameters**

- `int i` - the index of the requested element. Tuple elements are
            numbered as array elements, starting at 0.

**Returns:** the requested element, of null if i is not a valid element index.

<a id="s-elements"></a>
### elements()

```java
public com.tailf.proto.ConfEObject[] elements()
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Get all the elements from the tuple as an array.

**Returns:** an array containing all of the tuple's elements.

<a id="s-encode"></a>
### encode(ConfOutputStream)

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#s-ConfOutputStream)

Convert this tuple to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded tuple should be written.

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Determine if two tuples are equal. Tuples are equal if they have the same
 arity and all of the elements are equal.

**Parameters**

- `Object o` - the tuple to compare to.

**Returns:** true if the tuples have the same arity and all the elements are
         equal.

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

Get the string representation of the tuple.

**Returns:** the string representation of the tuple.
