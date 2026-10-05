# ConfEPid <a href="#cls-ConfEPid" id="cls-ConfEPid"></a>

```java
public class com.tailf.proto.ConfEPid
    extends com.tailf.proto.ConfEObject
    implements java.io.Serializable, Cloneable
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Provides a Java representation of E pids.

## Members

**Constructors**:

- [ConfEPid(ConfInputStream)](#m-ConfEPid-b561633bc969)
- [ConfEPid(String, int, int, int, boolean)](#m-ConfEPid-d74983699e9a)

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
- [node()](#m-node-1fe382dfa2c3)
- [serial()](#m-serial-d8ec222a1489)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ConfEPid(ConfInputStream) <a href="#m-ConfEPid-b561633bc969" id="m-ConfEPid-b561633bc969"></a>

```java
public ConfEPid(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#cls-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Create an E pid from a stream containing a pid encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded ref.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E ref.

### ConfEPid(String, int, int, int, boolean) <a href="#m-ConfEPid-d74983699e9a" id="m-ConfEPid-d74983699e9a"></a>

```java
public ConfEPid(String node, int id, int serial, int creation, boolean isNew)
```

**Parameters**

- `String node`
- `int id`
- `int serial`
- `int creation`
- `boolean isNew`


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

Get the creation number from the pid

**Returns:** the creation.

### encode(ConfOutputStream) <a href="#m-encode-cb1ad9eb7771" id="m-encode-cb1ad9eb7771"></a>

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#cls-ConfOutputStream)

Convert this pid to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded pid should be written.

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Determine if two pids are equal. Pids are equal if their components are
 equal.

**Parameters**

- `Object o` - the other pid to compare to.

**Returns:** true if the pids are equal, false otherwise.

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### id() <a href="#m-id-1352448ec267" id="m-id-1352448ec267"></a>

```java
public int id()
```

Get the id number from the pid.

**Returns:** the id number from the pid.

### node() <a href="#m-node-1fe382dfa2c3" id="m-node-1fe382dfa2c3"></a>

```java
public String node()
```

Get the node from the pid.

**Returns:** the node from the pid.

### serial() <a href="#m-serial-d8ec222a1489" id="m-serial-d8ec222a1489"></a>

```java
public int serial()
```

Get the serial number from the pid

**Returns:** the serial.

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Get the string representation of the pid. E pids are printed as
 node.generation.id

**Returns:** the string representation of the pid.
