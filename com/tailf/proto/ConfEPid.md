# ConfEPid <a href="#confepid-a9bc351000fd" id="confepid-a9bc351000fd"></a>

```java
public class com.tailf.proto.ConfEPid
    extends com.tailf.proto.ConfEObject
    implements java.io.Serializable, Cloneable
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Provides a Java representation of E pids.

## Members

**Constructors**:

- [ConfEPid(ConfInputStream)](#confepid-b561633bc969)
- [ConfEPid(String, int, int, int, boolean)](#confepid-d74983699e9a)

**Fields**:

- [serialVersionUID](#serialversionuid-b9f0e1ec001d)

**Methods**:

- [clone()](#clone-164c86c45e9b)
- [creation()](#creation-46181b4a88a5)
- [decode(ConfInputStream)](ConfEObject.md#decode-e63a2a4cac49) from ConfEObject
- [encode(ConfOutputStream)](#encode-cb1ad9eb7771)
- [equals(Object)](#equals-fcd6492e0d6c)
- [hashCode()](#hashcode-ef797a217903)
- [id()](#id-1352448ec267)
- [node()](#node-1fe382dfa2c3)
- [serial()](#serial-d8ec222a1489)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### ConfEPid(ConfInputStream) <a href="#confepid-b561633bc969" id="confepid-b561633bc969"></a>

```java
public ConfEPid(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#confinputstream-c4a961d10b62), [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Create an E pid from a stream containing a pid encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded ref.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E ref.

### ConfEPid(String, int, int, int, boolean) <a href="#confepid-d74983699e9a" id="confepid-d74983699e9a"></a>

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

Get the creation number from the pid

**Returns:** the creation.

### encode(ConfOutputStream) <a href="#encode-cb1ad9eb7771" id="encode-cb1ad9eb7771"></a>

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#confoutputstream-e8ef47aca327)

Convert this pid to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded pid should be written.

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Determine if two pids are equal. Pids are equal if their components are
 equal.

**Parameters**

- `Object o` - the other pid to compare to.

**Returns:** true if the pids are equal, false otherwise.

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### id() <a href="#id-1352448ec267" id="id-1352448ec267"></a>

```java
public int id()
```

Get the id number from the pid.

**Returns:** the id number from the pid.

### node() <a href="#node-1fe382dfa2c3" id="node-1fe382dfa2c3"></a>

```java
public String node()
```

Get the node from the pid.

**Returns:** the node from the pid.

### serial() <a href="#serial-d8ec222a1489" id="serial-d8ec222a1489"></a>

```java
public int serial()
```

Get the serial number from the pid

**Returns:** the serial.

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Get the string representation of the pid. E pids are printed as
 node.generation.id

**Returns:** the string representation of the pid.
