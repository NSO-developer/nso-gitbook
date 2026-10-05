# ConfEObject <a href="#cls-ConfEObject" id="cls-ConfEObject"></a>

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

- [ConfEObject()](#m-ConfEObject-316d32c106b3)

**Fields**:

- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [clone()](#m-clone-164c86c45e9b)
- [decode(ConfInputStream)](#m-decode-e63a2a4cac49)
- [encode(ConfOutputStream)](#m-encode-cb1ad9eb7771)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ConfEObject() <a href="#m-ConfEObject-316d32c106b3" id="m-ConfEObject-316d32c106b3"></a>

```java
public ConfEObject()
```


## Fields

### serialVersionUID <a href="#m-serialVersionUID" id="m-serialVersionUID"></a>

**Package-private**

```java
static final long serialVersionUID = -8435938572339430044;
```


## Methods

### clone() <a href="#m-clone-164c86c45e9b" id="m-clone-164c86c45e9b"></a>

```java
public Object clone()
```

### decode(ConfInputStream) <a href="#m-decode-e63a2a4cac49" id="m-decode-e63a2a4cac49"></a>

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

### encode(ConfOutputStream) <a href="#m-encode-cb1ad9eb7771" id="m-encode-cb1ad9eb7771"></a>

```java
public abstract void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#cls-ConfOutputStream)

Convert the object according to the rules of the E external format. This
 is mainly used for sending E terms in messages, however it can also be
 used for storing terms to disk.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded term should be written.

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public abstract boolean equals(Object o)
```

Determine if two E objects are equal. In general, E objects are equal if
 the components they consist of are equal.

**Parameters**

- `Object o` - the object to compare to.

**Returns:** true if the objects are identical.

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public abstract String toString()
```

**Returns:** the printable representation of the object. This is usually
         similar to the representation used by E for the same type of
         object.
