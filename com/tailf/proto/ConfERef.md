# ConfERef <a href="#conferef-8d975d419490" id="conferef-8d975d419490"></a>

```java
public class com.tailf.proto.ConfERef
    extends com.tailf.proto.ConfEObject
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Provides a Java representation of E refs. There are two styles of E refs, old
 style (one id value) and new style (array of id values). This class manages
 both types.

## Members

**Constructors**:

- [ConfERef\(ConfInputStream\)](#conferef-ef452c652e20)
- [ConfERef\(String, int, int\)](#conferef-8d974ce14696)
- [ConfERef\(String, int\[\], int\)](#conferef-c26fc44f32e1)

**Fields**:

- [serialVersionUID](#serialversionuid-b9f0e1ec001d)

**Methods**:

- [clone\(\)](#clone-164c86c45e9b)
- [creation\(\)](#creation-46181b4a88a5)
- [decode\(ConfInputStream\)](ConfEObject.md#decode-e63a2a4cac49) from ConfEObject
- [encode\(ConfOutputStream\)](#encode-cb1ad9eb7771)
- [equals\(Object\)](#equals-fcd6492e0d6c)
- [hashCode\(\)](#hashcode-ef797a217903)
- [id\(\)](#id-1352448ec267)
- [ids\(\)](#ids-ffb689fcb456)
- [isNewRef\(\)](#isnewref-e4f4038aefac)
- [node\(\)](#node-1fe382dfa2c3)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### ConfERef(ConfInputStream) <a href="#conferef-ef452c652e20" id="conferef-ef452c652e20"></a>

```java
public ConfERef(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#confinputstream-c4a961d10b62), [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Create an E ref from a stream containing a ref encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded ref.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E ref.

### ConfERef(String, int, int) <a href="#conferef-8d974ce14696" id="conferef-8d974ce14696"></a>

```java
public ConfERef(String node, int id, int creation)
```

Create an old style E ref from its components.

**Parameters**

- `String node` - the nodename.
- `int id` - an arbitrary number. Only the low order 18 bits will be used.
- `int creation` - another arbitrary number. Only the low order 2 bits will be
            used.

### ConfERef(String, int[], int) <a href="#conferef-c26fc44f32e1" id="conferef-c26fc44f32e1"></a>

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

### serialVersionUID <a href="#serialversionuid-b9f0e1ec001d" id="serialversionuid-b9f0e1ec001d"></a>

**Package-private**

```java
static final long serialVersionUID = -7022666480768586521;
```


## Methods

### clone() <a href="#clone-164c86c45e9b" id="clone-164c86c45e9b"></a>

```java
public Object clone()
```

### creation() <a href="#creation-46181b4a88a5" id="creation-46181b4a88a5"></a>

```java
public int creation()
```

Get the creation number from the ref.

**Returns:** the creation number from the ref.

### encode(ConfOutputStream) <a href="#encode-cb1ad9eb7771" id="encode-cb1ad9eb7771"></a>

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#confoutputstream-e8ef47aca327)

Convert this ref to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded ref should be written.

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Determine if two refs are equal. Refs are equal if their components are
 equal. New refs and old refs are considered equal if the node, creation
 and first id number are equal.

**Parameters**

- `Object o` - the other ref to compare to.

**Returns:** true if the refs are equal, false otherwise.

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### id() <a href="#id-1352448ec267" id="id-1352448ec267"></a>

```java
public int id()
```

Get the id number from the ref. Old style refs have only one id number.
 If this is a new style ref, the first id number is returned.

**Returns:** the id number from the ref.

### ids() <a href="#ids-ffb689fcb456" id="ids-ffb689fcb456"></a>

```java
public int[] ids()
```

Get the array of id numbers from the ref. If this is an old style ref,
 the array is of length 1. If this is a new style ref, the array has
 length 3.

**Returns:** the array of id numbers from the ref.

### isNewRef() <a href="#isnewref-e4f4038aefac" id="isnewref-e4f4038aefac"></a>

```java
public boolean isNewRef()
```

Determine whether this is a new style ref.

**Returns:** true if this ref is a new style ref, false otherwise.

### node() <a href="#node-1fe382dfa2c3" id="node-1fe382dfa2c3"></a>

```java
public String node()
```

Get the node name from the ref.

**Returns:** the node name from the ref.

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Get the string representation of the ref. E refs are printed as
 #Refnode.id

**Returns:** the string representation of the ref.
