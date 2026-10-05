<a id="cls-ConfEList"></a>
# ConfEList

```java
public class com.tailf.proto.ConfEList
    extends com.tailf.proto.ConfEObject
    implements Iterable<com.tailf.proto.ConfEObject>
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Provides a Java representation of E lists. Lists are created from zero or
 more arbitrary E terms.


 The arity of the list is the number of elements it contains.

## Members

**Constructors**:

- [ConfEList()](#m-confelist-6520e4a2b2b0)
- [ConfEList(ConfEObject)](#m-confelist-b47cbbec1eea)
- [ConfEList(ConfEObject[])](#m-confelist-d192515762f2)
- [ConfEList(ConfEObject[], int, int)](#m-confelist-23ce111a3f2d)
- [ConfEList(ConfInputStream)](#m-confelist-4ee5cf06b592)
- [ConfEList(String)](#m-confelist-abe60ec15a23)

**Fields**:

- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [arity()](#m-arity-2e3299329464)
- [clone()](#m-clone-164c86c45e9b)
- [decode(ConfInputStream)](ConfEObject.md#m-decode-e63a2a4cac49) from ConfEObject
- [elementAt(int)](#m-elementat-7ff98e6e0268)
- [elements()](#m-elements-1ac1cabc0e96)
- [encode(ConfOutputStream)](#m-encode-cb1ad9eb7771)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [hashCode()](#m-hashcode-ef797a217903)
- [iterator()](#m-iterator-188aa52d1f86)
- [proper()](#m-proper-e327c5f55f3c)
- [reverse()](#m-reverse-70d4d279e86c)
- [setProper(boolean)](#m-setproper-d2777201f8d3)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-confelist-6520e4a2b2b0"></a>
### ConfEList()

```java
public ConfEList()
```

Create an empty list.

<a id="m-confelist-b47cbbec1eea"></a>
### ConfEList(ConfEObject)

```java
public ConfEList(com.tailf.proto.ConfEObject elem)
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Create a list containing one element.

**Parameters**

- `com.tailf.proto.ConfEObject elem` - the element to make the list from.

<a id="m-confelist-d192515762f2"></a>
### ConfEList(ConfEObject[])

```java
public ConfEList(com.tailf.proto.ConfEObject[] elems)
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Create a list from an array of arbitrary E terms.

**Parameters**

- `com.tailf.proto.ConfEObject[] elems` - the array of terms from which to create the list.

<a id="m-confelist-23ce111a3f2d"></a>
### ConfEList(ConfEObject[], int, int)

```java
public ConfEList(com.tailf.proto.ConfEObject[] elems, int start, int count)
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Create a list from an array of arbitrary E terms.

**Parameters**

- `com.tailf.proto.ConfEObject[] elems` - the array of terms from which to create the list.
- `int start` - the offset of the first term to insert.
- `int count` - the number of terms to insert.

<a id="m-confelist-4ee5cf06b592"></a>
### ConfEList(ConfInputStream)

```java
public ConfEList(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#cls-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Create a list from a stream containing an list encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded list.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E list.

<a id="m-confelist-abe60ec15a23"></a>
### ConfEList(String)

```java
public ConfEList(String str)
```

Create a list of characters.

**Parameters**

- `String str` - the characters from which to create the list.


## Fields

<a id="m-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = 5999112769036676548;
```


## Methods

<a id="m-arity-2e3299329464"></a>
### arity()

```java
public int arity()
```

Get the arity of the list.

**Returns:** the number of elements contained in the list.

<a id="m-clone-164c86c45e9b"></a>
### clone()

```java
public Object clone()
```

<a id="m-elementat-7ff98e6e0268"></a>
### elementAt(int)

```java
public com.tailf.proto.ConfEObject elementAt(int i)
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Get the specified element from the list.

**Parameters**

- `int i` - the index of the requested element. List elements are numbered
            as array elements, starting at 0.

**Returns:** the requested element, of null if i is not a valid element index.

<a id="m-elements-1ac1cabc0e96"></a>
### elements()

```java
public com.tailf.proto.ConfEObject[] elements()
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Get all the elements from the list as an array.

**Returns:** an array containing all of the list's elements.

<a id="m-encode-cb1ad9eb7771"></a>
### encode(ConfOutputStream)

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#cls-ConfOutputStream)

Convert this list to the equivalent E external representation. Note that
 this method never encodes lists as strings, even when it is possible to
 do so.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - An output stream to which the encoded list should be written.

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Determine if two lists are equal. Lists are equal if they have the same
 arity and all of the elements are equal.

**Parameters**

- `Object o` - the list to compare to.

**Returns:** true if the lists have the same arity and all the elements are
         equal.

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-iterator-188aa52d1f86"></a>
### iterator()

```java
public java.util.Iterator<com.tailf.proto.ConfEObject> iterator()
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

<a id="m-proper-e327c5f55f3c"></a>
### proper()

```java
public boolean proper()
```

<a id="m-reverse-70d4d279e86c"></a>
### reverse()

```java
public com.tailf.proto.ConfEList reverse()
```

Types: [ConfEList](ConfEList.md#cls-ConfEList)

<a id="m-setproper-d2777201f8d3"></a>
### setProper(boolean)

```java
public void setProper(boolean p)
```

**Parameters**

- `boolean p`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Get the string representation of the list.

**Returns:** the string representation of the list.
