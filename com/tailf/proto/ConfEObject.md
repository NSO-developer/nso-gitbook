# ConfEObject <a href="#confeobject-2a9c0d03e350" id="confeobject-2a9c0d03e350"></a>

```java
public abstract class com.tailf.proto.ConfEObject
    implements java.io.Serializable, Cloneable
```

Base class of the E data type classes. This class is used to represent an
 arbitrary E term.

**Related classes**

- [ConfEAtom](ConfEAtom.md#confeatom-9f9d21cb88dd)
- [ConfEBig](ConfEBig.md#confebig-d075d18cd25e)
- [ConfEBinary](ConfEBinary.md#confebinary-57adaf095772)
- [ConfEDouble](ConfEDouble.md#confedouble-df2c6e01900e)
- [ConfEList](ConfEList.md#confelist-78fa4ba3b3a8)
- [ConfELong](ConfELong.md#confelong-926979f5365d)
- [ConfEPid](ConfEPid.md#confepid-a9bc351000fd)
- [ConfERef](ConfERef.md#conferef-8d975d419490)
- [ConfEString](ConfEString.md#confestring-c60dc35f221d)
- [ConfETuple](ConfETuple.md#confetuple-b1f9702a82a1)

## Members

**Constructors**:

- [ConfEObject()](#confeobject-316d32c106b3)

**Fields**:

- [serialVersionUID](#serialversionuid-b9f0e1ec001d)

**Methods**:

- [clone()](#clone-164c86c45e9b)
- [decode(ConfInputStream)](#decode-e63a2a4cac49)
- [encode(ConfOutputStream)](#encode-cb1ad9eb7771)
- [equals(Object)](#equals-fcd6492e0d6c)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### ConfEObject() <a href="#confeobject-316d32c106b3" id="confeobject-316d32c106b3"></a>

```java
public ConfEObject()
```


## Fields

### serialVersionUID <a href="#serialversionuid-b9f0e1ec001d" id="serialversionuid-b9f0e1ec001d"></a>

**Package-private**

```java
static final long serialVersionUID = -8435938572339430044;
```


## Methods

### clone() <a href="#clone-164c86c45e9b" id="clone-164c86c45e9b"></a>

```java
public Object clone()
```

### decode(ConfInputStream) <a href="#decode-e63a2a4cac49" id="decode-e63a2a4cac49"></a>

```java
public static com.tailf.proto.ConfEObject decode(
    com.tailf.proto.ConfInputStream buf
)
    throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350), [ConfInputStream](ConfInputStream.md#confinputstream-c4a961d10b62), [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read binary data in the E external format, and produce a corresponding E
 data type object. This method is normally used when E terms are received
 in messages, however it can also be used for reading terms from disk.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - an input stream containing one or more encoded E terms.

**Returns:** an object representing one of the E data types.

**Throws**

- `ConfEDecodeException` - if the stream does not contain a valid representation of
                an E term.

### encode(ConfOutputStream) <a href="#encode-cb1ad9eb7771" id="encode-cb1ad9eb7771"></a>

```java
public abstract void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#confoutputstream-e8ef47aca327)

Convert the object according to the rules of the E external format. This
 is mainly used for sending E terms in messages, however it can also be
 used for storing terms to disk.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded term should be written.

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public abstract boolean equals(Object o)
```

Determine if two E objects are equal. In general, E objects are equal if
 the components they consist of are equal.

**Parameters**

- `Object o` - the object to compare to.

**Returns:** true if the objects are identical.

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public abstract String toString()
```

**Returns:** the printable representation of the object. This is usually
         similar to the representation used by E for the same type of
         object.
