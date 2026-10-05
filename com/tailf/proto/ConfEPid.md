<a id="s-ConfEPid"></a>
# ConfEPid

```java
public class com.tailf.proto.ConfEPid
    extends com.tailf.proto.ConfEObject
    implements java.io.Serializable, Cloneable
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Provides a Java representation of E pids.

## Members

**Constructors**:

- [ConfEPid(ConfInputStream)](#s-ConfEPid-1)
- [ConfEPid(String, int, int, int, boolean)](#s-ConfEPid-2)

**Fields**:

- [serialVersionUID](#s-serialVersionUID)

**Methods**:

- [clone()](#s-clone)
- [creation()](#s-creation)
- [decode(ConfInputStream)](ConfEObject.md#s-decode) from ConfEObject
- [encode(ConfOutputStream)](#s-encode)
- [equals(Object)](#s-equals)
- [hashCode()](#s-hashCode)
- [id()](#s-id)
- [node()](#s-node)
- [serial()](#s-serial)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfEPid-1"></a>
### ConfEPid(ConfInputStream)

```java
public ConfEPid(com.tailf.proto.ConfInputStream buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfInputStream](ConfInputStream.md#s-ConfInputStream), [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Create an E pid from a stream containing a pid encoded in E external
 format.

**Parameters**

- `com.tailf.proto.ConfInputStream buf` - the stream containing the encoded ref.

**Throws**

- `ConfEDecodeException` - if the buffer does not contain a valid external
                representation of an E ref.

<a id="s-ConfEPid-2"></a>
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

<a id="s-serialVersionUID"></a>
### serialVersionUID

**Package-private**

```java
static final long serialVersionUID = -7022666480768586521;
```


## Methods

<a id="s-clone"></a>
### clone()

```java
public Object clone()
```

<a id="s-creation"></a>
### creation()

```java
public int creation()
```

Get the creation number from the pid

**Returns:** the creation.

<a id="s-encode"></a>
### encode(ConfOutputStream)

```java
public void encode(com.tailf.proto.ConfOutputStream buf)
```

Types: [ConfOutputStream](ConfOutputStream.md#s-ConfOutputStream)

Convert this pid to the equivalent E external representation.

**Parameters**

- `com.tailf.proto.ConfOutputStream buf` - an output stream to which the encoded pid should be written.

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Determine if two pids are equal. Pids are equal if their components are
 equal.

**Parameters**

- `Object o` - the other pid to compare to.

**Returns:** true if the pids are equal, false otherwise.

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-id"></a>
### id()

```java
public int id()
```

Get the id number from the pid.

**Returns:** the id number from the pid.

<a id="s-node"></a>
### node()

```java
public String node()
```

Get the node from the pid.

**Returns:** the node from the pid.

<a id="s-serial"></a>
### serial()

```java
public int serial()
```

Get the serial number from the pid

**Returns:** the serial.

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Get the string representation of the pid. E pids are printed as
 node.generation.id

**Returns:** the string representation of the pid.
