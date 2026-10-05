<a id="s-ConfInputStream"></a>
# ConfInputStream

```java
public class com.tailf.proto.ConfInputStream
    extends java.io.ByteArrayInputStream
```

Provides a stream for decoding E terms from external format.


 Note that this class is not synchronized, if you need synchronization you
 must provide it yourself.

## Members

**Constructors**:

- [ConfInputStream(byte[])](#s-ConfInputStream-1)
- [ConfInputStream(byte[], int, int)](#s-ConfInputStream-2)

**Methods**:

- [getPos()](#s-getPos)
- [peek()](#s-peek)
- [read1()](#s-read1)
- [read2BE()](#s-read2BE)
- [read2LE()](#s-read2LE)
- [read4BE()](#s-read4BE)
- [read4LE()](#s-read4LE)
- [read_any()](#s-read_any)
- [read_atom()](#s-read_atom)
- [read_big()](#s-read_big)
- [read_binary()](#s-read_binary)
- [read_boolean()](#s-read_boolean)
- [read_byte()](#s-read_byte)
- [read_char()](#s-read_char)
- [read_double()](#s-read_double)
- [read_float()](#s-read_float)
- [read_int()](#s-read_int)
- [read_list_head()](#s-read_list_head)
- [read_long()](#s-read_long)
- [read_long(boolean)](#s-read_long-1)
- [read_long_big()](#s-read_long_big)
- [read_nil()](#s-read_nil)
- [read_pid()](#s-read_pid)
- [read_ref()](#s-read_ref)
- [read_short()](#s-read_short)
- [read_string()](#s-read_string)
- [read_tuple_head()](#s-read_tuple_head)
- [read_uint()](#s-read_uint)
- [read_ulong()](#s-read_ulong)
- [read_ushort()](#s-read_ushort)
- [readBE(int)](#s-readBE)
- [readLE(int)](#s-readLE)
- [readN(byte[])](#s-readN)
- [setPos(int)](#s-setPos)

## Constructors

<a id="s-ConfInputStream-1"></a>
### ConfInputStream(byte[])

```java
public ConfInputStream(byte[] buf)
```

Create a stream from a buffer containing encoded E terms.

**Parameters**

- `byte[] buf`

<a id="s-ConfInputStream-2"></a>
### ConfInputStream(byte[], int, int)

```java
public ConfInputStream(byte[] buf, int offset, int length)
```

Create a stream from a buffer containing encoded E terms at the given
 offset and length.

**Parameters**

- `byte[] buf`
- `int offset`
- `int length`


## Methods

<a id="s-getPos"></a>
### getPos()

```java
public int getPos()
```

Get the current position in the stream.

**Returns:** the current position in the stream.

<a id="s-peek"></a>
### peek()

```java
public int peek() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Look ahead one position in the stream without consuming the byte found
 there.

**Returns:** the next byte in the stream, as an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="s-read1"></a>
### read1()

```java
public int read1() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read a one byte integer from the stream.

**Returns:** the byte read, as an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="s-read2BE"></a>
### read2BE()

```java
public int read2BE() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read a two byte big endian integer from the stream.

**Returns:** the bytes read, converted from big endian to an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="s-read2LE"></a>
### read2LE()

```java
public int read2LE() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read a two byte little endian integer from the stream.

**Returns:** the bytes read, converted from little endian to an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="s-read4BE"></a>
### read4BE()

```java
public int read4BE() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read a four byte big endian integer from the stream.

**Returns:** the bytes read, converted from big endian to an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="s-read4LE"></a>
### read4LE()

```java
public int read4LE() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read a four byte little endian integer from the stream.

**Returns:** the bytes read, converted from little endian to an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="s-read_any"></a>
### read_any()

```java
public com.tailf.proto.ConfEObject read_any() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject), [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read an arbitrary E term from the stream.

**Returns:** the E term.

**Throws**

- `ConfEDecodeException` - if the stream does not contain a known E type at the next
                position.

<a id="s-read_atom"></a>
### read_atom()

```java
public String read_atom() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read an E atom from the stream.

**Returns:** a String containing the value of the atom.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not an atom.

<a id="s-read_big"></a>
### read_big()

```java
public java.math.BigInteger read_big() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

<a id="s-read_binary"></a>
### read_binary()

```java
public byte[] read_binary() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read an E binary from the stream.

**Returns:** a byte array containing the value of the binary.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not a binary.

<a id="s-read_boolean"></a>
### read_boolean()

```java
public boolean read_boolean() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read an E atom from the stream and interpret the value as a boolean.

**Returns:** true if the atom at the current position in the stream contains
         the value 'true' (ignoring case), false otherwise.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not an atom.

<a id="s-read_byte"></a>
### read_byte()

```java
public byte read_byte() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read one byte from the stream.

**Returns:** the byte read.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="s-read_char"></a>
### read_char()

```java
public char read_char() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read a character from the stream.

**Returns:** the character value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not an integer that can
                be represented as a char.

<a id="s-read_double"></a>
### read_double()

```java
public double read_double() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read an E float from the stream.

**Returns:** the float value, as a double.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not a float.

<a id="s-read_float"></a>
### read_float()

```java
public float read_float() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read an E float from the stream.

**Returns:** the float value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not a float.

<a id="s-read_int"></a>
### read_int()

```java
public int read_int() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read an integer from the stream.

**Returns:** the integer value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream can not be represented as
                an integer.

<a id="s-read_list_head"></a>
### read_list_head()

```java
public int read_list_head() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read a list header from the stream.

**Returns:** the arity of the list.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not a list.

<a id="s-read_long"></a>
### read_long()

```java
public long read_long() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read a long from the stream.

**Returns:** the long value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream can not be
                represented as a long.

<a id="s-read_long-1"></a>
### read_long(boolean)

```java
public long read_long(boolean unsigned) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

**Parameters**

- `boolean unsigned`

<a id="s-read_long_big"></a>
### read_long_big()

```java
public com.tailf.proto.ConfEObject read_long_big() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject), [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

<a id="s-read_nil"></a>
### read_nil()

```java
public int read_nil() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read an empty list from the stream.

**Returns:** zero (the arity of the list).

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not an empty list.

<a id="s-read_pid"></a>
### read_pid()

```java
public com.tailf.proto.ConfEPid read_pid() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEPid](ConfEPid.md#s-ConfEPid), [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read an E pid from the stream.

**Returns:** the value of the pid

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not an E pid.

<a id="s-read_ref"></a>
### read_ref()

```java
public com.tailf.proto.ConfERef read_ref() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfERef](ConfERef.md#s-ConfERef), [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read an E reference from the stream.

**Returns:** the value of the reference

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not an E reference.

<a id="s-read_short"></a>
### read_short()

```java
public short read_short() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read a short from the stream.

**Returns:** the short value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream can not be represented as a
                short.

<a id="s-read_string"></a>
### read_string()

```java
public String read_string() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read a string from the stream.

**Returns:** the value of the string.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not a string.

<a id="s-read_tuple_head"></a>
### read_tuple_head()

```java
public int read_tuple_head() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read a tuple header from the stream.

**Returns:** the arity of the tuple.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not a tuple.

<a id="s-read_uint"></a>
### read_uint()

```java
public int read_uint() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read an unsigned integer from the stream.

**Returns:** the integer value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream can not be represented
                as a positive integer.

<a id="s-read_ulong"></a>
### read_ulong()

```java
public long read_ulong() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read an unsigned long from the stream.

**Returns:** the long value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream can not be represented as a
                positive long.

<a id="s-read_ushort"></a>
### read_ushort()

```java
public short read_ushort() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read an unsigned short from the stream.

**Returns:** the short value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream can not be represented as a
                positive short.

<a id="s-readBE"></a>
### readBE(int)

```java
public long readBE(int n) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read a big endian integer from the stream.

**Parameters**

- `int n` - the number of bytes to read

**Returns:** the bytes read, converted from big endian to an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="s-readLE"></a>
### readLE(int)

```java
public long readLE(int n) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read a little endian integer from the stream.

**Parameters**

- `int n` - the number of bytes to read

**Returns:** the bytes read, converted from little endian to an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="s-readN"></a>
### readN(byte[])

```java
public int readN(byte[] buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#s-ConfEDecodeException)

Read an array of bytes from the stream. The method reads at most
 buf.length bytes from the input stream.

**Parameters**

- `byte[] buf`

**Returns:** the number of bytes read.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="s-setPos"></a>
### setPos(int)

```java
public int setPos(int pos)
```

Set the current position in the stream.

**Parameters**

- `int pos` - the position to move to in the stream. If pos indicates a
            position beyond the end of the stream, the position is move to
            the end of the stream instead. If pos is negative, the
            position is moved to the beginning of the stream instead.

**Returns:** the previous position in the stream.
