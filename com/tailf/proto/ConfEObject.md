<a id="cls-ConfEObject"></a>
# ConfEObject

```java
public abstract class com.tailf.proto.ConfEObject
    implements java.io.Serializable, Cloneable
```

Base class of the E data type classes. This class is used to represent an
 arbitrary E term.

**Related classes**

- [ConfEAtom](ConfEAtom.md#cls-ConfEAtom)
- [ConfEBig](ConfEBig.md#cls-ConfEBig)
- [ConfEBinary](ConfEBinary.md#cls-ConfEBinary)
- [ConfEDouble](ConfEDouble.md#cls-ConfEDouble)
- [ConfEList](ConfEList.md#cls-ConfEList)
- [ConfELong](ConfELong.md#cls-ConfELong)
- [ConfEPid](ConfEPid.md#cls-ConfEPid)
- [ConfERef](ConfERef.md#cls-ConfERef)
- [ConfEString](ConfEString.md#cls-ConfEString)
- [ConfETuple](ConfETuple.md#cls-ConfETuple)

## Members

**Constructors**:

- [ConfEObject()](#m-confeobject-316d32c106b3)

**Fields**:

- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [clone()](#m-clone-164c86c45e9b)
- [decode(ConfInputStream)](#m-decode-e63a2a4cac49)
- [encode(ConfOutputStream)](#m-encode-cb1ad9eb7771)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-confeobject-316d32c106b3"></a>
### ConfEObject()

```java
public ConfEObject()
```


## Fields

<a id="m-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = -8435938572339430044;
```


## Methods

<a id="m-clone-164c86c45e9b"></a>
### clone()

```java
public Object clone()
```

<a id="m-decode-e63a2a4cac49"></a>
### decode(ConfInputStream)

```java
public static com.tailf.proto.ConfEObject decode(
    com.tailf.proto.ConfInputStream buf
)
    throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject), [ConfInputStream](ConfInputStream.md#cls-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read binary data in the E external format, and produce a corresponding E
 data type object. This method is normally used when E terms are received
 in messages, however it can also be used for reading terms from disk.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - an input stream containing one or more encoded E terms.

**Returns:** an object representing one of the E data types.

**Throws**

- `ConfEDecodeException` - if the stream does not contain a valid representation of
                an E term.

<a id="m-encode-cb1ad9eb7771"></a>
### encode(ConfOutputStream)

```java
public abstract void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#cls-ConfOutputStream)

Convert the object according to the rules of the E external format. This
 is mainly used for sending E terms in messages, however it can also be
 used for storing terms to disk.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded term should be written.

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public abstract boolean equals(Object o)
```

Determine if two E objects are equal. In general, E objects are equal if
 the components they consist of are equal.

**Parameters**

- `Object o` - the object to compare to.

**Returns:** true if the objects are identical.

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public abstract String toString()
```

**Returns:** the printable representation of the object. This is usually
         similar to the representation used by E for the same type of
         object.
