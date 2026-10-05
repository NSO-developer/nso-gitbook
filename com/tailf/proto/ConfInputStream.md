# ConfInputStream <a href="#confinputstream-c4a961d10b62" id="confinputstream-c4a961d10b62"></a>

```java
public class com.tailf.proto.ConfInputStream
    extends java.io.ByteArrayInputStream
```

Provides a stream for decoding E terms from external format.


 Note that this class is not synchronized, if you need synchronization you
 must provide it yourself.

## Members

**Constructors**:

- [ConfInputStream(byte[])](#confinputstream-df1e5054f370)
- [ConfInputStream(byte[], int, int)](#confinputstream-31b08369f344)

**Methods**:

- [getPos()](#getpos-ad2d7b30807f)
- [peek()](#peek-a38eaaf8a6a7)
- [read1()](#read1-76d98112fce5)
- [read2BE()](#read2be-87624a22731e)
- [read2LE()](#read2le-569d0a96b4e4)
- [read4BE()](#read4be-2b9ce3ff5038)
- [read4LE()](#read4le-ca46fefc73b2)
- [read_any()](#read_any-6429f2e0a641)
- [read_atom()](#read_atom-7a1ab1363e25)
- [read_big()](#read_big-ea4cd63e86f0)
- [read_binary()](#read_binary-30b4f7e99f93)
- [read_boolean()](#read_boolean-e1457cd2eec8)
- [read_byte()](#read_byte-ccbde9bd7c37)
- [read_char()](#read_char-89ee7c714f77)
- [read_double()](#read_double-ed8d67eaa36d)
- [read_float()](#read_float-db5805e7d389)
- [read_int()](#read_int-52389c5d26b4)
- [read_list_head()](#read_list_head-4c1fa82518be)
- [read_long()](#read_long-7a1b9869cec7)
- [read_long(boolean)](#read_long-0dd206933659)
- [read_long_big()](#read_long_big-5576085237ba)
- [read_nil()](#read_nil-97eaecbbe8c5)
- [read_pid()](#read_pid-ad121f1992f0)
- [read_ref()](#read_ref-044fef100aa5)
- [read_short()](#read_short-87bcf3ec74f3)
- [read_string()](#read_string-223a6743c27e)
- [read_tuple_head()](#read_tuple_head-c50f9ed9beb5)
- [read_uint()](#read_uint-a42a72a36f43)
- [read_ulong()](#read_ulong-d0c7d44596b0)
- [read_ushort()](#read_ushort-c2c654db673c)
- [readBE(int)](#readbe-49e938e712e3)
- [readLE(int)](#readle-749de7f756b0)
- [readN(byte[])](#readn-97646f66d503)
- [setPos(int)](#setpos-a83f79498a31)

## Constructors

### ConfInputStream(byte[]) <a href="#confinputstream-df1e5054f370" id="confinputstream-df1e5054f370"></a>

```java
public ConfInputStream(byte[] buf)
```

Create a stream from a buffer containing encoded E terms.

**Parameters**

- `byte[] buf`

### ConfInputStream(byte[], int, int) <a href="#confinputstream-31b08369f344" id="confinputstream-31b08369f344"></a>

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

### getPos() <a href="#getpos-ad2d7b30807f" id="getpos-ad2d7b30807f"></a>

```java
public int getPos()
```

Get the current position in the stream.

**Returns:** the current position in the stream.

### peek() <a href="#peek-a38eaaf8a6a7" id="peek-a38eaaf8a6a7"></a>

```java
public int peek() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Look ahead one position in the stream without consuming the byte found
 there.

**Returns:** the next byte in the stream, as an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

### read1() <a href="#read1-76d98112fce5" id="read1-76d98112fce5"></a>

```java
public int read1() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read a one byte integer from the stream.

**Returns:** the byte read, as an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

### read2BE() <a href="#read2be-87624a22731e" id="read2be-87624a22731e"></a>

```java
public int read2BE() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read a two byte big endian integer from the stream.

**Returns:** the bytes read, converted from big endian to an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

### read2LE() <a href="#read2le-569d0a96b4e4" id="read2le-569d0a96b4e4"></a>

```java
public int read2LE() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read a two byte little endian integer from the stream.

**Returns:** the bytes read, converted from little endian to an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

### read4BE() <a href="#read4be-2b9ce3ff5038" id="read4be-2b9ce3ff5038"></a>

```java
public int read4BE() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read a four byte big endian integer from the stream.

**Returns:** the bytes read, converted from big endian to an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

### read4LE() <a href="#read4le-ca46fefc73b2" id="read4le-ca46fefc73b2"></a>

```java
public int read4LE() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read a four byte little endian integer from the stream.

**Returns:** the bytes read, converted from little endian to an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

### read_any() <a href="#read_any-6429f2e0a641" id="read_any-6429f2e0a641"></a>

```java
public com.tailf.proto.ConfEObject read_any() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350), [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read an arbitrary E term from the stream.

**Returns:** the E term.

**Throws**

- `ConfEDecodeException` - if the stream does not contain a known E type at the next
                position.

### read_atom() <a href="#read_atom-7a1ab1363e25" id="read_atom-7a1ab1363e25"></a>

```java
public String read_atom() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read an E atom from the stream.

**Returns:** a String containing the value of the atom.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not an atom.

### read_big() <a href="#read_big-ea4cd63e86f0" id="read_big-ea4cd63e86f0"></a>

```java
public java.math.BigInteger read_big() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

### read_binary() <a href="#read_binary-30b4f7e99f93" id="read_binary-30b4f7e99f93"></a>

```java
public byte[] read_binary() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read an E binary from the stream.

**Returns:** a byte array containing the value of the binary.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not a binary.

### read_boolean() <a href="#read_boolean-e1457cd2eec8" id="read_boolean-e1457cd2eec8"></a>

```java
public boolean read_boolean() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read an E atom from the stream and interpret the value as a boolean.

**Returns:** true if the atom at the current position in the stream contains
         the value 'true' (ignoring case), false otherwise.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not an atom.

### read_byte() <a href="#read_byte-ccbde9bd7c37" id="read_byte-ccbde9bd7c37"></a>

```java
public byte read_byte() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read one byte from the stream.

**Returns:** the byte read.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

### read_char() <a href="#read_char-89ee7c714f77" id="read_char-89ee7c714f77"></a>

```java
public char read_char() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read a character from the stream.

**Returns:** the character value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not an integer that can
                be represented as a char.

### read_double() <a href="#read_double-ed8d67eaa36d" id="read_double-ed8d67eaa36d"></a>

```java
public double read_double() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read an E float from the stream.

**Returns:** the float value, as a double.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not a float.

### read_float() <a href="#read_float-db5805e7d389" id="read_float-db5805e7d389"></a>

```java
public float read_float() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read an E float from the stream.

**Returns:** the float value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not a float.

### read_int() <a href="#read_int-52389c5d26b4" id="read_int-52389c5d26b4"></a>

```java
public int read_int() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read an integer from the stream.

**Returns:** the integer value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream can not be represented as
                an integer.

### read_list_head() <a href="#read_list_head-4c1fa82518be" id="read_list_head-4c1fa82518be"></a>

```java
public int read_list_head() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read a list header from the stream.

**Returns:** the arity of the list.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not a list.

### read_long() <a href="#read_long-7a1b9869cec7" id="read_long-7a1b9869cec7"></a>

```java
public long read_long() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read a long from the stream.

**Returns:** the long value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream can not be
                represented as a long.

### read_long(boolean) <a href="#read_long-0dd206933659" id="read_long-0dd206933659"></a>

```java
public long read_long(boolean unsigned) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

**Parameters**

- `boolean unsigned`

### read_long_big() <a href="#read_long_big-5576085237ba" id="read_long_big-5576085237ba"></a>

```java
public com.tailf.proto.ConfEObject read_long_big() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350), [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

### read_nil() <a href="#read_nil-97eaecbbe8c5" id="read_nil-97eaecbbe8c5"></a>

```java
public int read_nil() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read an empty list from the stream.

**Returns:** zero (the arity of the list).

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not an empty list.

### read_pid() <a href="#read_pid-ad121f1992f0" id="read_pid-ad121f1992f0"></a>

```java
public com.tailf.proto.ConfEPid read_pid() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEPid](ConfEPid.md#confepid-a9bc351000fd), [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read an E pid from the stream.

**Returns:** the value of the pid

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not an E pid.

### read_ref() <a href="#read_ref-044fef100aa5" id="read_ref-044fef100aa5"></a>

```java
public com.tailf.proto.ConfERef read_ref() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfERef](ConfERef.md#conferef-8d975d419490), [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read an E reference from the stream.

**Returns:** the value of the reference

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not an E reference.

### read_short() <a href="#read_short-87bcf3ec74f3" id="read_short-87bcf3ec74f3"></a>

```java
public short read_short() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read a short from the stream.

**Returns:** the short value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream can not be represented as a
                short.

### read_string() <a href="#read_string-223a6743c27e" id="read_string-223a6743c27e"></a>

```java
public String read_string() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read a string from the stream.

**Returns:** the value of the string.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not a string.

### read_tuple_head() <a href="#read_tuple_head-c50f9ed9beb5" id="read_tuple_head-c50f9ed9beb5"></a>

```java
public int read_tuple_head() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read a tuple header from the stream.

**Returns:** the arity of the tuple.

**Throws**

- `ConfEDecodeException` - if the next term in the stream is not a tuple.

### read_uint() <a href="#read_uint-a42a72a36f43" id="read_uint-a42a72a36f43"></a>

```java
public int read_uint() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read an unsigned integer from the stream.

**Returns:** the integer value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream can not be represented
                as a positive integer.

### read_ulong() <a href="#read_ulong-d0c7d44596b0" id="read_ulong-d0c7d44596b0"></a>

```java
public long read_ulong() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read an unsigned long from the stream.

**Returns:** the long value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream can not be represented as a
                positive long.

### read_ushort() <a href="#read_ushort-c2c654db673c" id="read_ushort-c2c654db673c"></a>

```java
public short read_ushort() throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read an unsigned short from the stream.

**Returns:** the short value.

**Throws**

- `ConfEDecodeException` - if the next term in the stream can not be represented as a
                positive short.

### readBE(int) <a href="#readbe-49e938e712e3" id="readbe-49e938e712e3"></a>

```java
public long readBE(int n) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read a big endian integer from the stream.

**Parameters**

- `int n` - the number of bytes to read

**Returns:** the bytes read, converted from big endian to an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

### readLE(int) <a href="#readle-749de7f756b0" id="readle-749de7f756b0"></a>

```java
public long readLE(int n) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read a little endian integer from the stream.

**Parameters**

- `int n` - the number of bytes to read

**Returns:** the bytes read, converted from little endian to an integer.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

### readN(byte[]) <a href="#readn-97646f66d503" id="readn-97646f66d503"></a>

```java
public int readN(byte[] buf) throws com.tailf.proto.ConfEDecodeException
```

Types: [ConfEDecodeException](ConfEDecodeException.md#confedecodeexception-3e50145f8aae)

Read an array of bytes from the stream. The method reads at most
 buf.length bytes from the input stream.

**Parameters**

- `byte[] buf`

**Returns:** the number of bytes read.

**Throws**

- `ConfEDecodeException` - if the next byte cannot be read.

### setPos(int) <a href="#setpos-a83f79498a31" id="setpos-a83f79498a31"></a>

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
