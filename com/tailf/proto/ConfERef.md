<a id="s-ConfERef"></a>
# ConfERef

```java
public class com.tailf.proto.ConfERef
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Provides a Java representation of E refs. There are two styles of E refs, old
 style (one id value) and new style (array of id values). This class manages
 both types.

## Members

**Constructors**:

- [ConfERef(ConfInputStream)](#s-ConfERef-1)
- [ConfERef(String, int, int)](#s-ConfERef-2)
- [ConfERef(String, int[], int)](#s-ConfERef-3)

**Fields**:

- [serialVersionUID](#s-serialVersionUID)

**Methods**:

- [clone()](#s-clone)
- [creation()](#s-creation)
- [decode(ConfInputStream)](ConfEObject.md#s-decode) from ConfEObject
- [encode(ConfOutputStream)](#s-encode)
- [equals(Object)](#s-equals)
- [hashCode()](#s-hashCode)
- [id()](#s-id)
- [ids()](#s-ids)
- [isNewRef()](#s-isNewRef)
- [node()](#s-node)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfERef-1"></a>
### ConfERef(ConfInputStream)

```java
public ConfERef(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#s-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Create an E ref from a stream containing a ref encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded ref.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E ref.

<a id="s-ConfERef-2"></a>
### ConfERef(String, int, int)

```java
public ConfERef(String node, int id, int creation)
```

Create an old style E ref from its components.

**Parameters**

- `String node` - the nodename.
- `int id` - an arbitrary number. Only the low order 18 bits will be used.
- `int creation` - another arbitrary number. Only the low order 2 bits will be
            used.

<a id="s-ConfERef-3"></a>
### ConfERef(String, int[], int)

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

<a id="s-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = -7022666480768586521;
```


## Methods

<a id="s-clone"></a>
### clone()

```java
public Object clone()
```

<a id="s-creation"></a>
### creation()

```java
public int creation()
```

Get the creation number from the ref.

**Returns:** the creation number from the ref.

<a id="s-encode"></a>
### encode(ConfOutputStream)

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#s-ConfOutputStream)

Convert this ref to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded ref should be written.

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Determine if two refs are equal. Refs are equal if their components are
 equal. New refs and old refs are considered equal if the node, creation
 and first id number are equal.

**Parameters**

- `Object o` - the other ref to compare to.

**Returns:** true if the refs are equal, false otherwise.

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-id"></a>
### id()

```java
public int id()
```

Get the id number from the ref. Old style refs have only one id number.
 If this is a new style ref, the first id number is returned.

**Returns:** the id number from the ref.

<a id="s-ids"></a>
### ids()

```java
public int[] ids()
```

Get the array of id numbers from the ref. If this is an old style ref,
 the array is of length 1. If this is a new style ref, the array has
 length 3.

**Returns:** the array of id numbers from the ref.

<a id="s-isNewRef"></a>
### isNewRef()

```java
public boolean isNewRef()
```

Determine whether this is a new style ref.

**Returns:** true if this ref is a new style ref, false otherwise.

<a id="s-node"></a>
### node()

```java
public String node()
```

Get the node name from the ref.

**Returns:** the node name from the ref.

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Get the string representation of the ref. E refs are printed as
 #Refnode.id

**Returns:** the string representation of the ref.
