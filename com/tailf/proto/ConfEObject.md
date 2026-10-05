<a id="s-ConfEObject"></a>
# ConfEObject

```java
public abstract class com.tailf.proto.ConfEObject
    implements java.io.Serializable, Cloneable
```

Base class of the E data type classes. This class is used to represent an
 arbitrary E term.

**Related classes**

- [ConfEAtom](ConfEAtom.md#s-ConfEAtom)
- [ConfEBig](ConfEBig.md#s-ConfEBig)
- [ConfEBinary](ConfEBinary.md#s-ConfEBinary)
- [ConfEDouble](ConfEDouble.md#s-ConfEDouble)
- [ConfEList](ConfEList.md#s-ConfEList)
- [ConfELong](ConfELong.md#s-ConfELong)
- [ConfEPid](ConfEPid.md#s-ConfEPid)
- [ConfERef](ConfERef.md#s-ConfERef)
- [ConfEString](ConfEString.md#s-ConfEString)
- [ConfETuple](ConfETuple.md#s-ConfETuple)

## Members

**Constructors**:

- [ConfEObject()](#s-ConfEObject-1)

**Fields**:

- [serialVersionUID](#s-serialVersionUID)

**Methods**:

- [clone()](#s-clone)
- [decode(ConfInputStream)](#s-decode)
- [encode(ConfOutputStream)](#s-encode)
- [equals(Object)](#s-equals)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfEObject-1"></a>
### ConfEObject()

```java
public ConfEObject()
```


## Fields

<a id="s-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = -8435938572339430044;
```


## Methods

<a id="s-clone"></a>
### clone()

```java
public Object clone()
```

<a id="s-decode"></a>
### decode(ConfInputStream)

```java
public static com.tailf.proto.ConfEObject decode(
    com.tailf.proto.ConfInputStream buf
)
    throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject), [ConfInputStream](ConfInputStream.md#s-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read binary data in the E external format, and produce a corresponding E
 data type object. This method is normally used when E terms are received
 in messages, however it can also be used for reading terms from disk.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - an input stream containing one or more encoded E terms.

**Returns:** an object representing one of the E data types.

**Throws**

- `ConfEDecodeException` - if the stream does not contain a valid representation of
                an E term.

<a id="s-encode"></a>
### encode(ConfOutputStream)

```java
public abstract void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#s-ConfOutputStream)

Convert the object according to the rules of the E external format. This
 is mainly used for sending E terms in messages, however it can also be
 used for storing terms to disk.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded term should be written.

<a id="s-equals"></a>
### equals(Object)

```java
public abstract boolean equals(Object o)
```

Determine if two E objects are equal. In general, E objects are equal if
 the components they consist of are equal.

**Parameters**

- `Object o` - the object to compare to.

**Returns:** true if the objects are identical.

<a id="s-toString"></a>
### toString()

```java
public abstract String toString()
```

**Returns:** the printable representation of the object. This is usually
         similar to the representation used by E for the same type of
         object.
