# ConfETuple <a href="#cls-ConfETuple" id="cls-ConfETuple"></a>

```java
public class com.tailf.proto.ConfETuple
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Provides a Java representation of E tuples. Tuples are created from one or
 more arbitrary E terms.


 The arity of the tuple is the number of elements it contains. Elements are
 indexed from 0 to (arity-1) and can be retrieved individually by using the
 appropriate index.

## Members

**Constructors**:

- [ConfETuple(ConfEObject)](#m-ConfETuple-48ebb7dfd41b)
- [ConfETuple(ConfEObject[])](#m-ConfETuple-09ff5654dca7)
- [ConfETuple(ConfEObject[], int, int)](#m-ConfETuple-338ae357f4f3)
- [ConfETuple(ConfInputStream)](#m-ConfETuple-8cbdf89cb4e7)

**Fields**:

- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [arity()](#m-arity-2e3299329464)
- [clone()](#m-clone-164c86c45e9b)
- [decode(ConfInputStream)](ConfEObject.md#m-decode-e63a2a4cac49) from ConfEObject
- [elementAt(int)](#m-elementAt-7ff98e6e0268)
- [elements()](#m-elements-1ac1cabc0e96)
- [encode(ConfOutputStream)](#m-encode-cb1ad9eb7771)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [hashCode()](#m-hashCode-ef797a217903)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ConfETuple(ConfEObject) <a href="#m-ConfETuple-48ebb7dfd41b" id="m-ConfETuple-48ebb7dfd41b"></a>

```java
public ConfETuple(com.tailf.proto.ConfEObject elem)
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Create a unary tuple containing the given element.

**Parameters**

- `com.tailf.proto.ConfEObject elem` - the element to create the tuple from.

**Throws**

- `IllegalArgumentException` - if the element is null.

### ConfETuple(ConfEObject[]) <a href="#m-ConfETuple-09ff5654dca7" id="m-ConfETuple-09ff5654dca7"></a>

```java
public ConfETuple(com.tailf.proto.ConfEObject[] elems)
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Create a tuple from an array of terms.

**Parameters**

- `com.tailf.proto.ConfEObject[] elems` - the array of terms to create the tuple from.

**Throws**

- `IllegalArgumentException` - if the array is empty (null) or contains null elements.

### ConfETuple(ConfEObject[], int, int) <a href="#m-ConfETuple-338ae357f4f3" id="m-ConfETuple-338ae357f4f3"></a>

```java
public ConfETuple(com.tailf.proto.ConfEObject[] elems, int start, int count)
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Create a tuple from an array of terms.

**Parameters**

- `com.tailf.proto.ConfEObject[] elems` - the array of terms to create the tuple from.
- `int start` - the offset of the first term to insert.
- `int count` - the number of terms to insert.

**Throws**

- `IllegalArgumentException` - if the array is empty (null) or contains null elements.

### ConfETuple(ConfInputStream) <a href="#m-ConfETuple-8cbdf89cb4e7" id="m-ConfETuple-8cbdf89cb4e7"></a>

```java
public ConfETuple(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#cls-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Create a tuple from a stream containing an tuple encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded tuple.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E tuple.


## Fields

### serialVersionUID <a href="#m-serialVersionUID" id="m-serialVersionUID"></a>

**Package-private**

```java
static final long serialVersionUID = 9163498658004915935;
```


## Methods

### arity() <a href="#m-arity-2e3299329464" id="m-arity-2e3299329464"></a>

```java
public int arity()
```

Get the arity of the tuple.

**Returns:** the number of elements contained in the tuple.

### clone() <a href="#m-clone-164c86c45e9b" id="m-clone-164c86c45e9b"></a>

```java
public Object clone()
```

### elementAt(int) <a href="#m-elementAt-7ff98e6e0268" id="m-elementAt-7ff98e6e0268"></a>

```java
public com.tailf.proto.ConfEObject elementAt(int i)
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Get the specified element from the tuple.

**Parameters**

- `int i` - the index of the requested element. Tuple elements are
            numbered as array elements, starting at 0.

**Returns:** the requested element, of null if i is not a valid element index.

### elements() <a href="#m-elements-1ac1cabc0e96" id="m-elements-1ac1cabc0e96"></a>

```java
public com.tailf.proto.ConfEObject[] elements()
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Get all the elements from the tuple as an array.

**Returns:** an array containing all of the tuple's elements.

### encode(ConfOutputStream) <a href="#m-encode-cb1ad9eb7771" id="m-encode-cb1ad9eb7771"></a>

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#cls-ConfOutputStream)

Convert this tuple to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded tuple should be written.

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Determine if two tuples are equal. Tuples are equal if they have the same
 arity and all of the elements are equal.

**Parameters**

- `Object o` - the tuple to compare to.

**Returns:** true if the tuples have the same arity and all the elements are
         equal.

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Get the string representation of the tuple.

**Returns:** the string representation of the tuple.
