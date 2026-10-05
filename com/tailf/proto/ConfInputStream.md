<a id="cls-ConfInputStream"></a>
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

- [ConfInputStream(byte[])](#m-confinputstream-df1e5054f370)
- [ConfInputStream(byte[], int, int)](#m-confinputstream-31b08369f344)

**Methods**:

- [getPos()](#m-getpos-ad2d7b30807f)
- [peek()](#m-peek-a38eaaf8a6a7)
- [read1()](#m-read1-76d98112fce5)
- [read2BE()](#m-read2be-87624a22731e)
- [read2LE()](#m-read2le-569d0a96b4e4)
- [read4BE()](#m-read4be-2b9ce3ff5038)
- [read4LE()](#m-read4le-ca46fefc73b2)
- [read_any()](#m-read_any-6429f2e0a641)
- [read_atom()](#m-read_atom-7a1ab1363e25)
- [read_big()](#m-read_big-ea4cd63e86f0)
- [read_binary()](#m-read_binary-30b4f7e99f93)
- [read_boolean()](#m-read_boolean-e1457cd2eec8)
- [read_byte()](#m-read_byte-ccbde9bd7c37)
- [read_char()](#m-read_char-89ee7c714f77)
- [read_double()](#m-read_double-ed8d67eaa36d)
- [read_float()](#m-read_float-db5805e7d389)
- [read_int()](#m-read_int-52389c5d26b4)
- [read_list_head()](#m-read_list_head-4c1fa82518be)
- [read_long()](#m-read_long-7a1b9869cec7)
- [read_long(boolean)](#m-read_long-0dd206933659)
- [read_long_big()](#m-read_long_big-5576085237ba)
- [read_nil()](#m-read_nil-97eaecbbe8c5)
- [read_pid()](#m-read_pid-ad121f1992f0)
- [read_ref()](#m-read_ref-044fef100aa5)
- [read_short()](#m-read_short-87bcf3ec74f3)
- [read_string()](#m-read_string-223a6743c27e)
- [read_tuple_head()](#m-read_tuple_head-c50f9ed9beb5)
- [read_uint()](#m-read_uint-a42a72a36f43)
- [read_ulong()](#m-read_ulong-d0c7d44596b0)
- [read_ushort()](#m-read_ushort-c2c654db673c)
- [readBE(int)](#m-readbe-49e938e712e3)
- [readLE(int)](#m-readle-749de7f756b0)
- [readN(byte[])](#m-readn-97646f66d503)
- [setPos(int)](#m-setpos-a83f79498a31)

## Constructors

<a id="m-confinputstream-df1e5054f370"></a>
### ConfInputStream(byte[])

```java
public ConfInputStream(byte[] buf)
```

Create a stream from a buffer containing encoded E terms.

**Parameters**

- `byte[] buf`

<a id="m-confinputstream-31b08369f344"></a>
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

<a id="m-getpos-ad2d7b30807f"></a>
### getPos()

```java
public int getPos()
```

Get the current position in the stream.

**Returns:** the current position in the stream.

<a id="m-peek-a38eaaf8a6a7"></a>
### peek()

```java
public int peek() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Look ahead one position in the stream without consuming the byte found
 there.

**Returns:** the next byte in the stream, as an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="m-read1-76d98112fce5"></a>
### read1()

```java
public int read1() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read a one byte integer from the stream.

**Returns:** the byte read, as an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="m-read2be-87624a22731e"></a>
### read2BE()

```java
public int read2BE() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read a two byte big endian integer from the stream.

**Returns:** the bytes read, converted from big endian to an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="m-read2le-569d0a96b4e4"></a>
### read2LE()

```java
public int read2LE() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read a two byte little endian integer from the stream.

**Returns:** the bytes read, converted from little endian to an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="m-read4be-2b9ce3ff5038"></a>
### read4BE()

```java
public int read4BE() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read a four byte big endian integer from the stream.

**Returns:** the bytes read, converted from big endian to an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="m-read4le-ca46fefc73b2"></a>
### read4LE()

```java
public int read4LE() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read a four byte little endian integer from the stream.

**Returns:** the bytes read, converted from little endian to an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="m-read_any-6429f2e0a641"></a>
### read_any()

```java
public com.tailf.proto.ConfEObject read_any() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject), [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read an arbitrary E term from the stream.

**Returns:** the E term.

**Throws**

- `ConfEDecodeException` - if the stream does not contain a known E type at the next
                position.

<a id="m-read_atom-7a1ab1363e25"></a>
### read_atom()

```java
public String read_atom() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read an E atom from the stream.

**Returns:** a String containing the value of the atom.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not an atom.

<a id="m-read_big-ea4cd63e86f0"></a>
### read_big()

```java
public java.math.BigInteger read_big() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

<a id="m-read_binary-30b4f7e99f93"></a>
### read_binary()

```java
public byte[] read_binary() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read an E binary from the stream.

**Returns:** a byte array containing the value of the binary.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not a binary.

<a id="m-read_boolean-e1457cd2eec8"></a>
### read_boolean()

```java
public boolean read_boolean() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read an E atom from the stream and interpret the value as a boolean.

**Returns:** true if the atom at the current position in the stream contains
         the value 'true' (ignoring case), false otherwise.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not an atom.

<a id="m-read_byte-ccbde9bd7c37"></a>
### read_byte()

```java
public byte read_byte() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read one byte from the stream.

**Returns:** the byte read.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="m-read_char-89ee7c714f77"></a>
### read_char()

```java
public char read_char() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read a character from the stream.

**Returns:** the character value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not an integer that can
                be represented as a char.

<a id="m-read_double-ed8d67eaa36d"></a>
### read_double()

```java
public double read_double() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read an E float from the stream.

**Returns:** the float value, as a double.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not a float.

<a id="m-read_float-db5805e7d389"></a>
### read_float()

```java
public float read_float() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read an E float from the stream.

**Returns:** the float value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not a float.

<a id="m-read_int-52389c5d26b4"></a>
### read_int()

```java
public int read_int() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read an integer from the stream.

**Returns:** the integer value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream can not be represented as
                an integer.

<a id="m-read_list_head-4c1fa82518be"></a>
### read_list_head()

```java
public int read_list_head() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read a list header from the stream.

**Returns:** the arity of the list.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not a list.

<a id="m-read_long-7a1b9869cec7"></a>
### read_long()

```java
public long read_long() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read a long from the stream.

**Returns:** the long value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream can not be
                represented as a long.

<a id="m-read_long-0dd206933659"></a>
### read_long(boolean)

```java
public long read_long(boolean unsigned) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

**Parameters**

- `boolean unsigned`

<a id="m-read_long_big-5576085237ba"></a>
### read_long_big()

```java
public com.tailf.proto.ConfEObject read_long_big() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEObject](ConfEObject.md#cls-ConfEObject), [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

<a id="m-read_nil-97eaecbbe8c5"></a>
### read_nil()

```java
public int read_nil() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read an empty list from the stream.

**Returns:** zero (the arity of the list).

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not an empty list.

<a id="m-read_pid-ad121f1992f0"></a>
### read_pid()

```java
public com.tailf.proto.ConfEPid read_pid() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEPid](ConfEPid.md#cls-ConfEPid), [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read an E pid from the stream.

**Returns:** the value of the pid

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not an E pid.

<a id="m-read_ref-044fef100aa5"></a>
### read_ref()

```java
public com.tailf.proto.ConfERef read_ref() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfERef](ConfERef.md#cls-ConfERef), [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read an E reference from the stream.

**Returns:** the value of the reference

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not an E reference.

<a id="m-read_short-87bcf3ec74f3"></a>
### read_short()

```java
public short read_short() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read a short from the stream.

**Returns:** the short value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream can not be represented as a
                short.

<a id="m-read_string-223a6743c27e"></a>
### read_string()

```java
public String read_string() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read a string from the stream.

**Returns:** the value of the string.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not a string.

<a id="m-read_tuple_head-c50f9ed9beb5"></a>
### read_tuple_head()

```java
public int read_tuple_head() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read a tuple header from the stream.

**Returns:** the arity of the tuple.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not a tuple.

<a id="m-read_uint-a42a72a36f43"></a>
### read_uint()

```java
public int read_uint() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read an unsigned integer from the stream.

**Returns:** the integer value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream can not be represented
                as a positive integer.

<a id="m-read_ulong-d0c7d44596b0"></a>
### read_ulong()

```java
public long read_ulong() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read an unsigned long from the stream.

**Returns:** the long value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream can not be represented as a
                positive long.

<a id="m-read_ushort-c2c654db673c"></a>
### read_ushort()

```java
public short read_ushort() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read an unsigned short from the stream.

**Returns:** the short value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream can not be represented as a
                positive short.

<a id="m-readbe-49e938e712e3"></a>
### readBE(int)

```java
public long readBE(int n) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read a big endian integer from the stream.

**Parameters**

- `int n` - the number of bytes to read

**Returns:** the bytes read, converted from big endian to an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="m-readle-749de7f756b0"></a>
### readLE(int)

```java
public long readLE(int n) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read a little endian integer from the stream.

**Parameters**

- `int n` - the number of bytes to read

**Returns:** the bytes read, converted from little endian to an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="m-readn-97646f66d503"></a>
### readN(byte[])

```java
public int readN(byte[] buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#cls-ConfEDecodeException)

Read an array of bytes from the stream. The method reads at most
 buf.length bytes from the input stream.

**Parameters**

- `byte[] buf`

**Returns:** the number of bytes read.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

<a id="m-setpos-a83f79498a31"></a>
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
