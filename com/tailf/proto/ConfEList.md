<a id="s-ConfEList"></a>
# ConfEList

```java
public class com.tailf.proto.ConfEList
    extends com.tailf.proto.ConfEObject
    implements Iterable<com.tailf.proto.ConfEObject>
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Provides a Java representation of E lists. Lists are created from zero or
 more arbitrary E terms.


 The arity of the list is the number of elements it contains.

## Members

**Constructors**:

- [ConfEList()](#s-ConfEList-1)
- [ConfEList(ConfEObject)](#s-ConfEList-2)
- [ConfEList(ConfEObject[])](#s-ConfEList-3)
- [ConfEList(ConfEObject[], int, int)](#s-ConfEList-4)
- [ConfEList(ConfInputStream)](#s-ConfEList-5)
- [ConfEList(String)](#s-ConfEList-6)

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
- [iterator()](#s-iterator)
- [proper()](#s-proper)
- [reverse()](#s-reverse)
- [setProper(boolean)](#s-setProper)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfEList-1"></a>
### ConfEList()

```java
public ConfEList()
```

Create an empty list.

<a id="s-ConfEList-2"></a>
### ConfEList(ConfEObject)

```java
public ConfEList(com.tailf.proto.ConfEObject elem)
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Create a list containing one element.

**Parameters**

- `com.tailf.proto.ConfEObject elem` - the element to make the list from.

<a id="s-ConfEList-3"></a>
### ConfEList(ConfEObject[])

```java
public ConfEList(com.tailf.proto.ConfEObject[] elems)
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Create a list from an array of arbitrary E terms.

**Parameters**

- `com.tailf.proto.ConfEObject[] elems` - the array of terms from which to create the list.

<a id="s-ConfEList-4"></a>
### ConfEList(ConfEObject[], int, int)

```java
public ConfEList(com.tailf.proto.ConfEObject[] elems, int start, int count)
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Create a list from an array of arbitrary E terms.

**Parameters**

- `com.tailf.proto.ConfEObject[] elems` - the array of terms from which to create the list.
- `int start` - the offset of the first term to insert.
- `int count` - the number of terms to insert.

<a id="s-ConfEList-5"></a>
### ConfEList(ConfInputStream)

```java
public ConfEList(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#s-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Create a list from a stream containing an list encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded list.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E list.

<a id="s-ConfEList-6"></a>
### ConfEList(String)

```java
public ConfEList(String str)
```

Create a list of characters.

**Parameters**

- `String str` - the characters from which to create the list.


## Fields

<a id="s-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = 5999112769036676548;
```


## Methods

<a id="s-arity"></a>
### arity()

```java
public int arity()
```

Get the arity of the list.

**Returns:** the number of elements contained in the list.

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

Get the specified element from the list.

**Parameters**

- `int i` - the index of the requested element. List elements are numbered
            as array elements, starting at 0.

**Returns:** the requested element, of null if i is not a valid element index.

<a id="s-elements"></a>
### elements()

```java
public com.tailf.proto.ConfEObject[] elements()
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Get all the elements from the list as an array.

**Returns:** an array containing all of the list's elements.

<a id="s-encode"></a>
### encode(ConfOutputStream)

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#s-ConfOutputStream)

Convert this list to the equivalent E external representation. Note that
 this method never encodes lists as strings, even when it is possible to
 do so.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - An output stream to which the encoded list should be written.

<a id="s-equals"></a>
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

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-iterator"></a>
### iterator()

```java
public java.util.Iterator<com.tailf.proto.ConfEObject> iterator()
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

<a id="s-proper"></a>
### proper()

```java
public boolean proper()
```

<a id="s-reverse"></a>
### reverse()

```java
public com.tailf.proto.ConfEList reverse()
```

Types: [ConfEList](ConfEList.md#s-ConfEList)

<a id="s-setProper"></a>
### setProper(boolean)

```java
public void setProper(boolean p)
```

**Parameters**

- `boolean p`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Get the string representation of the list.

**Returns:** the string representation of the list.
