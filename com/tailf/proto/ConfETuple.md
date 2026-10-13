# ConfETuple <a href="#confetuple-b1f9702a82a1" id="confetuple-b1f9702a82a1"></a>

```java
public class com.tailf.proto.ConfETuple
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Provides a Java representation of E tuples. Tuples are created from one or
 more arbitrary E terms.


 The arity of the tuple is the number of elements it contains. Elements are
 indexed from 0 to (arity-1) and can be retrieved individually by using the
 appropriate index.

## Members

**Constructors**:

- [ConfETuple\(ConfEObject\)](#confetuple-48ebb7dfd41b)
- [ConfETuple\(ConfEObject\[\]\)](#confetuple-09ff5654dca7)
- [ConfETuple\(ConfEObject\[\], int, int\)](#confetuple-338ae357f4f3)
- [ConfETuple\(ConfInputStream\)](#confetuple-8cbdf89cb4e7)

**Fields**:

- [serialVersionUID](#serialversionuid-b9f0e1ec001d)

**Methods**:

- [arity\(\)](#arity-2e3299329464)
- [clone\(\)](#clone-164c86c45e9b)
- [decode\(ConfInputStream\)](ConfEObject.md#decode-e63a2a4cac49) from ConfEObject
- [elementAt\(int\)](#elementat-7ff98e6e0268)
- [elements\(\)](#elements-1ac1cabc0e96)
- [encode\(ConfOutputStream\)](#encode-cb1ad9eb7771)
- [equals\(Object\)](#equals-fcd6492e0d6c)
- [hashCode\(\)](#hashcode-ef797a217903)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### ConfETuple(ConfEObject) <a href="#confetuple-48ebb7dfd41b" id="confetuple-48ebb7dfd41b"></a>

```java
public ConfETuple(com.tailf.proto.ConfEObject elem)
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Create a unary tuple containing the given element.

**Parameters**

- `com.tailf.proto.ConfEObject elem` - the element to create the tuple from.

**Throws**

- `IllegalArgumentException` - if the element is null.

### ConfETuple(ConfEObject[]) <a href="#confetuple-09ff5654dca7" id="confetuple-09ff5654dca7"></a>

```java
public ConfETuple(com.tailf.proto.ConfEObject[] elems)
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Create a tuple from an array of terms.

**Parameters**

- `com.tailf.proto.ConfEObject[] elems` - the array of terms to create the tuple from.

**Throws**

- `IllegalArgumentException` - if the array is empty (null) or contains null elements.

### ConfETuple(ConfEObject[], int, int) <a href="#confetuple-338ae357f4f3" id="confetuple-338ae357f4f3"></a>

```java
public ConfETuple(com.tailf.proto.ConfEObject[] elems, int start, int count)
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Create a tuple from an array of terms.

**Parameters**

- `com.tailf.proto.ConfEObject[] elems` - the array of terms to create the tuple from.
- `int start` - the offset of the first term to insert.
- `int count` - the number of terms to insert.

**Throws**

- `IllegalArgumentException` - if the array is empty (null) or contains null elements.

### ConfETuple(ConfInputStream) <a href="#confetuple-8cbdf89cb4e7" id="confetuple-8cbdf89cb4e7"></a>

```java
public ConfETuple(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#confinputstream-c4a961d10b62), [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Create a tuple from a stream containing an tuple encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded tuple.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E tuple.


## Fields

### serialVersionUID <a href="#serialversionuid-b9f0e1ec001d" id="serialversionuid-b9f0e1ec001d"></a>

**Package-private**

```java
static final long serialVersionUID = 9163498658004915935;
```


## Methods

### arity() <a href="#arity-2e3299329464" id="arity-2e3299329464"></a>

```java
public int arity()
```

Get the arity of the tuple.

**Returns:** the number of elements contained in the tuple.

### clone() <a href="#clone-164c86c45e9b" id="clone-164c86c45e9b"></a>

```java
public Object clone()
```

### elementAt(int) <a href="#elementat-7ff98e6e0268" id="elementat-7ff98e6e0268"></a>

```java
public com.tailf.proto.ConfEObject elementAt(int i)
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Get the specified element from the tuple.

**Parameters**

- `int i` - the index of the requested element. Tuple elements are
            numbered as array elements, starting at 0.

**Returns:** the requested element, of null if i is not a valid element index.

### elements() <a href="#elements-1ac1cabc0e96" id="elements-1ac1cabc0e96"></a>

```java
public com.tailf.proto.ConfEObject[] elements()
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Get all the elements from the tuple as an array.

**Returns:** an array containing all of the tuple's elements.

### encode(ConfOutputStream) <a href="#encode-cb1ad9eb7771" id="encode-cb1ad9eb7771"></a>

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#confoutputstream-e8ef47aca327)

Convert this tuple to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded tuple should be written.

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Determine if two tuples are equal. Tuples are equal if they have the same
 arity and all of the elements are equal.

**Parameters**

- `Object o` - the tuple to compare to.

**Returns:** true if the tuples have the same arity and all the elements are
         equal.

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Get the string representation of the tuple.

**Returns:** the string representation of the tuple.
