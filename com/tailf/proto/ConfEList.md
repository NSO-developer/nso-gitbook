# ConfEList <a href="#confelist-78fa4ba3b3a8" id="confelist-78fa4ba3b3a8"></a>

```java
public class com.tailf.proto.ConfEList
    extends com.tailf.proto.ConfEObject
    implements Iterable<com.tailf.proto.ConfEObject>
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Provides a Java representation of E lists. Lists are created from zero or
 more arbitrary E terms.


 The arity of the list is the number of elements it contains.

## Members

**Constructors**:

- [ConfEList()](#confelist-6520e4a2b2b0)
- [ConfEList(ConfEObject)](#confelist-b47cbbec1eea)
- [ConfEList(ConfEObject[])](#confelist-d192515762f2)
- [ConfEList(ConfEObject[], int, int)](#confelist-23ce111a3f2d)
- [ConfEList(ConfInputStream)](#confelist-4ee5cf06b592)
- [ConfEList(String)](#confelist-abe60ec15a23)

**Fields**:

- [serialVersionUID](#serialversionuid-b9f0e1ec001d)

**Methods**:

- [arity()](#arity-2e3299329464)
- [clone()](#clone-164c86c45e9b)
- [decode(ConfInputStream)](ConfEObject.md#decode-e63a2a4cac49) from ConfEObject
- [elementAt(int)](#elementat-7ff98e6e0268)
- [elements()](#elements-1ac1cabc0e96)
- [encode(ConfOutputStream)](#encode-cb1ad9eb7771)
- [equals(Object)](#equals-fcd6492e0d6c)
- [hashCode()](#hashcode-ef797a217903)
- [iterator()](#iterator-188aa52d1f86)
- [proper()](#proper-e327c5f55f3c)
- [reverse()](#reverse-70d4d279e86c)
- [setProper(boolean)](#setproper-d2777201f8d3)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### ConfEList() <a href="#confelist-6520e4a2b2b0" id="confelist-6520e4a2b2b0"></a>

```java
public ConfEList()
```

Create an empty list.

### ConfEList(ConfEObject) <a href="#confelist-b47cbbec1eea" id="confelist-b47cbbec1eea"></a>

```java
public ConfEList(com.tailf.proto.ConfEObject elem)
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Create a list containing one element.

**Parameters**

- `com.tailf.proto.ConfEObject elem` - the element to make the list from.

### ConfEList(ConfEObject[]) <a href="#confelist-d192515762f2" id="confelist-d192515762f2"></a>

```java
public ConfEList(com.tailf.proto.ConfEObject[] elems)
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Create a list from an array of arbitrary E terms.

**Parameters**

- `com.tailf.proto.ConfEObject[] elems` - the array of terms from which to create the list.

### ConfEList(ConfEObject[], int, int) <a href="#confelist-23ce111a3f2d" id="confelist-23ce111a3f2d"></a>

```java
public ConfEList(com.tailf.proto.ConfEObject[] elems, int start, int count)
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Create a list from an array of arbitrary E terms.

**Parameters**

- `com.tailf.proto.ConfEObject[] elems` - the array of terms from which to create the list.
- `int start` - the offset of the first term to insert.
- `int count` - the number of terms to insert.

### ConfEList(ConfInputStream) <a href="#confelist-4ee5cf06b592" id="confelist-4ee5cf06b592"></a>

```java
public ConfEList(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#confinputstream-c4a961d10b62), [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Create a list from a stream containing an list encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded list.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E list.

### ConfEList(String) <a href="#confelist-abe60ec15a23" id="confelist-abe60ec15a23"></a>

```java
public ConfEList(String str)
```

Create a list of characters.

**Parameters**

- `String str` - the characters from which to create the list.


## Fields

### serialVersionUID <a href="#serialversionuid-b9f0e1ec001d" id="serialversionuid-b9f0e1ec001d"></a>

**Package-private**

```java
static final long serialVersionUID = 5999112769036676548;
```


## Methods

### arity() <a href="#arity-2e3299329464" id="arity-2e3299329464"></a>

```java
public int arity()
```

Get the arity of the list.

**Returns:** the number of elements contained in the list.

### clone() <a href="#clone-164c86c45e9b" id="clone-164c86c45e9b"></a>

```java
public Object clone()
```

### elementAt(int) <a href="#elementat-7ff98e6e0268" id="elementat-7ff98e6e0268"></a>

```java
public com.tailf.proto.ConfEObject elementAt(int i)
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Get the specified element from the list.

**Parameters**

- `int i` - the index of the requested element. List elements are numbered
            as array elements, starting at 0.

**Returns:** the requested element, of null if i is not a valid element index.

### elements() <a href="#elements-1ac1cabc0e96" id="elements-1ac1cabc0e96"></a>

```java
public com.tailf.proto.ConfEObject[] elements()
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Get all the elements from the list as an array.

**Returns:** an array containing all of the list's elements.

### encode(ConfOutputStream) <a href="#encode-cb1ad9eb7771" id="encode-cb1ad9eb7771"></a>

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#confoutputstream-e8ef47aca327)

Convert this list to the equivalent E external representation. Note that
 this method never encodes lists as strings, even when it is possible to
 do so.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - An output stream to which the encoded list should be written.

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Determine if two lists are equal. Lists are equal if they have the same
 arity and all of the elements are equal.

**Parameters**

- `Object o` - the list to compare to.

**Returns:** true if the lists have the same arity and all the elements are
         equal.

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### iterator() <a href="#iterator-188aa52d1f86" id="iterator-188aa52d1f86"></a>

```java
public java.util.Iterator<com.tailf.proto.ConfEObject> iterator()
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

### proper() <a href="#proper-e327c5f55f3c" id="proper-e327c5f55f3c"></a>

```java
public boolean proper()
```

### reverse() <a href="#reverse-70d4d279e86c" id="reverse-70d4d279e86c"></a>

```java
public com.tailf.proto.ConfEList reverse()
```

Types: [ConfEList](ConfEList.md#confelist-78fa4ba3b3a8)

### setProper(boolean) <a href="#setproper-d2777201f8d3" id="setproper-d2777201f8d3"></a>

```java
public void setProper(boolean p)
```

**Parameters**

- `boolean p`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Get the string representation of the list.

**Returns:** the string representation of the list.
