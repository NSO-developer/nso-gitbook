# ConfERef <a href="#cls-ConfERef" id="cls-ConfERef"></a>

```java
public class com.tailf.proto.ConfERef
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Provides a Java representation of E refs. There are two styles of E refs, old
 style (one id value) and new style (array of id values). This class manages
 both types.

## Members

**Constructors**:

- [ConfERef(ConfInputStream)](#m-ConfERef-ef452c652e20)
- [ConfERef(String, int, int)](#m-ConfERef-8d974ce14696)
- [ConfERef(String, int[], int)](#m-ConfERef-c26fc44f32e1)

**Fields**:

- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [clone()](#m-clone-164c86c45e9b)
- [creation()](#m-creation-46181b4a88a5)
- [decode(ConfInputStream)](ConfEObject.md#m-decode-e63a2a4cac49) from ConfEObject
- [encode(ConfOutputStream)](#m-encode-cb1ad9eb7771)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [hashCode()](#m-hashCode-ef797a217903)
- [id()](#m-id-1352448ec267)
- [ids()](#m-ids-ffb689fcb456)
- [isNewRef()](#m-isNewRef-e4f4038aefac)
- [node()](#m-node-1fe382dfa2c3)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ConfERef(ConfInputStream) <a href="#m-ConfERef-ef452c652e20" id="m-ConfERef-ef452c652e20"></a>

```java
public ConfERef(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#cls-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Create an E ref from a stream containing a ref encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded ref.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E ref.

### ConfERef(String, int, int) <a href="#m-ConfERef-8d974ce14696" id="m-ConfERef-8d974ce14696"></a>

```java
public ConfERef(String node, int id, int creation)
```

Create an old style E ref from its components.

**Parameters**

- `String node` - the nodename.
- `int id` - an arbitrary number. Only the low order 18 bits will be used.
- `int creation` - another arbitrary number. Only the low order 2 bits will be
            used.

### ConfERef(String, int[], int) <a href="#m-ConfERef-c26fc44f32e1" id="m-ConfERef-c26fc44f32e1"></a>

```java
public ConfERef(String node, int[] ids, int creation)
```

Create a new style E ref from its components.

**Parameters**

- `String node` - the nodename.
- `int[] ids` - an array of arbitrary numbers. Only the low order 18 bits of
            the first number will be used. If the array contains only one
            number, an old style ref will be written instead. At most
            three numbers will be read from the array.
- `int creation` - another arbitrary number. Only the low order 2 bits will be
            used.


## Fields

### serialVersionUID <a href="#m-serialVersionUID" id="m-serialVersionUID"></a>

**Package-private**

```java
static final long serialVersionUID = -7022666480768586521;
```


## Methods

### clone() <a href="#m-clone-164c86c45e9b" id="m-clone-164c86c45e9b"></a>

```java
public Object clone()
```

### creation() <a href="#m-creation-46181b4a88a5" id="m-creation-46181b4a88a5"></a>

```java
public int creation()
```

Get the creation number from the ref.

**Returns:** the creation number from the ref.

### encode(ConfOutputStream) <a href="#m-encode-cb1ad9eb7771" id="m-encode-cb1ad9eb7771"></a>

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#cls-ConfOutputStream)

Convert this ref to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded ref should be written.

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Determine if two refs are equal. Refs are equal if their components are
 equal. New refs and old refs are considered equal if the node, creation
 and first id number are equal.

**Parameters**

- `Object o` - the other ref to compare to.

**Returns:** true if the refs are equal, false otherwise.

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### id() <a href="#m-id-1352448ec267" id="m-id-1352448ec267"></a>

```java
public int id()
```

Get the id number from the ref. Old style refs have only one id number.
 If this is a new style ref, the first id number is returned.

**Returns:** the id number from the ref.

### ids() <a href="#m-ids-ffb689fcb456" id="m-ids-ffb689fcb456"></a>

```java
public int[] ids()
```

Get the array of id numbers from the ref. If this is an old style ref,
 the array is of length 1. If this is a new style ref, the array has
 length 3.

**Returns:** the array of id numbers from the ref.

### isNewRef() <a href="#m-isNewRef-e4f4038aefac" id="m-isNewRef-e4f4038aefac"></a>

```java
public boolean isNewRef()
```

Determine whether this is a new style ref.

**Returns:** true if this ref is a new style ref, false otherwise.

### node() <a href="#m-node-1fe382dfa2c3" id="m-node-1fe382dfa2c3"></a>

```java
public String node()
```

Get the node name from the ref.

**Returns:** the node name from the ref.

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Get the string representation of the ref. E refs are printed as
 #Refnode.id

**Returns:** the string representation of the ref.
