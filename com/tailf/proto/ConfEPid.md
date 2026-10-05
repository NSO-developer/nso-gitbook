<a id="cls-ConfEPid"></a>
# ConfEPid

```java
public class com.tailf.proto.ConfEPid
    extends com.tailf.proto.ConfEObject
    implements java.io.Serializable, Cloneable
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject)

Provides a Java representation of E pids.

## Members

**Constructors**:

- [ConfEPid(ConfInputStream)](#m-confepid-b561633bc969)
- [ConfEPid(String, int, int, int, boolean)](#m-confepid-d74983699e9a)

**Fields**:

- [serialVersionUID](#m-serialVersionUID)

**Methods**:

- [clone()](#m-clone-164c86c45e9b)
- [creation()](#m-creation-46181b4a88a5)
- [decode(ConfInputStream)](ConfEObject.md#m-decode-e63a2a4cac49) from ConfEObject
- [encode(ConfOutputStream)](#m-encode-cb1ad9eb7771)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [hashCode()](#m-hashcode-ef797a217903)
- [id()](#m-id-1352448ec267)
- [node()](#m-node-1fe382dfa2c3)
- [serial()](#m-serial-d8ec222a1489)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-confepid-b561633bc969"></a>
### ConfEPid(ConfInputStream)

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

<a id="m-confepid-d74983699e9a"></a>
### ConfEPid(String, int, int, int, boolean)

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

<a id="m-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = -7022666480768586521;
```


## Methods

<a id="m-clone-164c86c45e9b"></a>
### clone()

```java
public Object clone()
```

<a id="m-creation-46181b4a88a5"></a>
### creation()

```java
public int creation()
```

Get the creation number from the pid

**Returns:** the creation.

<a id="m-encode-cb1ad9eb7771"></a>
### encode(ConfOutputStream)

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#cls-ConfOutputStream)

Convert this pid to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded pid should be written.

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Determine if two pids are equal. Pids are equal if their components are
 equal.

**Parameters**

- `Object o` - the other pid to compare to.

**Returns:** true if the pids are equal, false otherwise.

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-id-1352448ec267"></a>
### id()

```java
public int id()
```

Get the id number from the pid.

**Returns:** the id number from the pid.

<a id="m-node-1fe382dfa2c3"></a>
### node()

```java
public String node()
```

Get the node from the pid.

**Returns:** the node from the pid.

<a id="m-serial-d8ec222a1489"></a>
### serial()

```java
public int serial()
```

Get the serial number from the pid

**Returns:** the serial.

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Get the string representation of the pid. E pids are printed as
 node.generation.id

**Returns:** the string representation of the pid.
