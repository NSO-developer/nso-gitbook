<a id="s-ConfOutputStream"></a>
# ConfOutputStream

```java
public class com.tailf.proto.ConfOutputStream
```

Provides a stream for encoding E terms to external format, for transmission
 or storage.


 Note that this class is not synchronized, if you need synchronization you
 must provide it yourself.

## Members

**Constructors**:

- [ConfOutputStream()](#s-ConfOutputStream-1)
- [ConfOutputStream(ConfEObject)](#s-ConfOutputStream-2)
- [ConfOutputStream(int)](#s-ConfOutputStream-3)

**Fields**:

- [DEFAULT_INITIAL_SIZE](#s-DEFAULT_INITIAL_SIZE)

**Methods**:

- [count()](#s-count)
- [getConfInputStream(int)](#s-getConfInputStream)
- [getPos()](#s-getPos)
- [poke4BE(int, long)](#s-poke4BE)
- [reset()](#s-reset)
- [size()](#s-size)
- [toByteArray()](#s-toByteArray)
- [write(byte)](#s-write)
- [write(byte[])](#s-write-1)
- [write1(long)](#s-write1)
- [write2BE(long)](#s-write2BE)
- [write2LE(long)](#s-write2LE)
- [write4BE(long)](#s-write4BE)
- [write4LE(long)](#s-write4LE)
- [write8LE(long)](#s-write8LE)
- [write_any(ConfEObject)](#s-write_any)
- [write_atom(String)](#s-write_atom)
- [write_atom(String, boolean)](#s-write_atom-1)
- [write_big(BigInteger)](#s-write_big)
- [write_binary(byte[])](#s-write_binary)
- [write_boolean(boolean)](#s-write_boolean)
- [write_byte(byte)](#s-write_byte)
- [write_char(char)](#s-write_char)
- [write_double(double)](#s-write_double)
- [write_float(float)](#s-write_float)
- [write_int(int)](#s-write_int)
- [write_list_head(int)](#s-write_list_head)
- [write_long(long)](#s-write_long)
- [write_long(long, boolean)](#s-write_long-1)
- [write_nil()](#s-write_nil)
- [write_pid(String, int, int, int, boolean)](#s-write_pid)
- [write_port(String, int, int)](#s-write_port)
- [write_ref(String, int, int)](#s-write_ref)
- [write_ref(String, int[], int)](#s-write_ref-1)
- [write_short(short)](#s-write_short)
- [write_string(String)](#s-write_string)
- [write_tuple_head(int)](#s-write_tuple_head)
- [write_uint(int)](#s-write_uint)
- [write_ulong(long)](#s-write_ulong)
- [write_ushort(short)](#s-write_ushort)
- [writeLE(long, int)](#s-writeLE)
- [writeN(byte[])](#s-writeN)
- [writeTo(OutputStream)](#s-writeTo)
- [writeTo(SocketChannel, SelectionKey)](#s-writeTo-1)

## Constructors

<a id="s-ConfOutputStream-1"></a>
### ConfOutputStream()

```java
public ConfOutputStream()
```

Create a stream with the default initial size.

<a id="s-ConfOutputStream-2"></a>
### ConfOutputStream(ConfEObject)

```java
public ConfOutputStream(com.tailf.proto.ConfEObject o)
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Create a stream containing the encoded version of the given E term.

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="s-ConfOutputStream-3"></a>
### ConfOutputStream(int)

```java
public ConfOutputStream(int size)
```

Create a stream with the specified initial size.

**Parameters**

- `int size`


## Fields

<a id="s-DEFAULT_INITIAL_SIZE"></a>
### DEFAULT_INITIAL_SIZE

```java
public static final int DEFAULT_INITIAL_SIZE = 2048;
```

The default initial size of the stream.


## Methods

<a id="s-count"></a>
### count()

```java
public int count()
```

Get the number of bytes in the stream.

**Returns:** the number of bytes in the stream.

<a id="s-getConfInputStream"></a>
### getConfInputStream(int)

**Package-private**

```java
com.tailf.proto.ConfInputStream getConfInputStream(int offset)
```

Types: [ConfInputStream](ConfInputStream.md#s-ConfInputStream)

**Parameters**

- `int offset`

<a id="s-getPos"></a>
### getPos()

```java
public int getPos()
```

Get the current position in the stream.

**Returns:** the current position in the stream.

<a id="s-poke4BE"></a>
### poke4BE(int, long)

```java
public void poke4BE(int offset, long n)
```

Write the low four bytes of a value to the stream in bif endian order, at
 the specified position. If the position specified is beyond the end of
 the stream, this method will have no effect.

 Normally this method should be used in conjunction with getPos(), when is is necessary to insert data into the stream before it
 is known what the actual value should be. For example:



```
 int pos = s.getPos();
      s.write4BE(0); // make space for length data,
      // but final value is not yet known

      [ ...more write statements...]

      // later... when we know the length value
      s.poke4BE(pos, length);
```

**Parameters**

- `int offset` - the position in the stream.
- `long n` - the value to use.

<a id="s-reset"></a>
### reset()

```java
public void reset()
```

Reset the stream so that it can be reused.

<a id="s-size"></a>
### size()

```java
public int size()
```

Get the current capacity of the stream. As bytes are added the capacity
 of the stream is increased automatically, however this method returns the
 current size.

**Returns:** the size of the internal buffer used by the stream.

<a id="s-toByteArray"></a>
### toByteArray()

```java
public byte[] toByteArray()
```

Get the contents of the stream in a byte array.

**Returns:** a byte array containing a copy of the stream contents.

<a id="s-write"></a>
### write(byte)

```java
public void write(byte b)
```

Write one byte to the stream.

**Parameters**

- `byte b` - the byte to write.

<a id="s-write-1"></a>
### write(byte[])

```java
public void write(byte[] buf)
```

Write an array of bytes to the stream.

**Parameters**

- `byte[] buf` - the array of bytes to write.

<a id="s-write1"></a>
### write1(long)

```java
public void write1(long n)
```

Write the low byte of a value to the stream.

**Parameters**

- `long n` - the value to use.

<a id="s-write2BE"></a>
### write2BE(long)

```java
public void write2BE(long n)
```

Write the low two bytes of a value to the stream in big endian order.

**Parameters**

- `long n` - the value to use.

<a id="s-write2LE"></a>
### write2LE(long)

```java
public void write2LE(long n)
```

Write the low two bytes of a value to the stream in little endian order.

**Parameters**

- `long n` - the value to use.

<a id="s-write4BE"></a>
### write4BE(long)

```java
public void write4BE(long n)
```

Write the low four bytes of a value to the stream in big endian order.

**Parameters**

- `long n` - the value to use.

<a id="s-write4LE"></a>
### write4LE(long)

```java
public void write4LE(long n)
```

Write the low four bytes of a value to the stream in little endian order.

**Parameters**

- `long n` - the value to use.

<a id="s-write8LE"></a>
### write8LE(long)

```java
public void write8LE(long n)
```

Write the low eight bytes of a value to the stream in little endian
 order.

**Parameters**

- `long n` - the value to use.

<a id="s-write_any"></a>
### write_any(ConfEObject)

```java
public void write_any(com.tailf.proto.ConfEObject o)
```

Types: [ConfEObject](ConfEObject.md#s-ConfEObject)

Write an arbitrary E term to the stream.

**Parameters**

- `com.tailf.proto.ConfEObject o` - the E term to write.

<a id="s-write_atom"></a>
### write_atom(String)

```java
public void write_atom(String atom)
```

Write a string to the stream as an E atom.

**Parameters**

- `String atom` - the string to write.

<a id="s-write_atom-1"></a>
### write_atom(String, boolean)

```java
public void write_atom(String atom, boolean isSmallUtf8)
```

Write a string to the stream as an E atom.

**Parameters**

- `String atom` - the string to write.
- `boolean isSmallUtf8` - whether to encode atoms using SMALL_ATOM_UTF8_EXT

<a id="s-write_big"></a>
### write_big(BigInteger)

**Package-private**

```java
void write_big(java.math.BigInteger big)
```

**Parameters**

- `java.math.BigInteger big`

<a id="s-write_binary"></a>
### write_binary(byte[])

```java
public void write_binary(byte[] bin)
```

Write an array of bytes to the stream as an E binary.

**Parameters**

- `byte[] bin` - the array of bytes to write.

<a id="s-write_boolean"></a>
### write_boolean(boolean)

```java
public void write_boolean(boolean b)
```

Write a boolean value to the stream as the E atom 'true' or 'false'.

**Parameters**

- `boolean b` - the boolean value to write.

<a id="s-write_byte"></a>
### write_byte(byte)

```java
public void write_byte(byte b)
```

Write a single byte to the stream as an E integer. The byte is really an
 IDL 'octet', that is, unsigned.

**Parameters**

- `byte b` - the byte to use.

<a id="s-write_char"></a>
### write_char(char)

```java
public void write_char(char c)
```

Write a character to the stream as an E integer. The character may be a
 16 bit character, kind of IDL 'wchar'. It is up to the E side to take
 care of souch, if they should be used.

**Parameters**

- `char c` - the character to use.

<a id="s-write_double"></a>
### write_double(double)

```java
public void write_double(double d)
```

Write a double value to the stream.

**Parameters**

- `double d` - the double to use.

<a id="s-write_float"></a>
### write_float(float)

```java
public void write_float(float f)
```

Write a float value to the stream.

**Parameters**

- `float f` - the float to use.

<a id="s-write_int"></a>
### write_int(int)

```java
public void write_int(int i)
```

Write an integer to the stream.

**Parameters**

- `int i` - the integer to use.

<a id="s-write_list_head"></a>
### write_list_head(int)

```java
public void write_list_head(int arity)
```

Write an E list header to the stream. After calling this method, you must
 write 'arity' elements to the stream followed by nil, or it will not be
 possible to decode it later.

**Parameters**

- `int arity` - the number of elements in the list.

<a id="s-write_long"></a>
### write_long(long)

```java
public void write_long(long l)
```

Write a long to the stream.

**Parameters**

- `long l` - the long to use.

<a id="s-write_long-1"></a>
### write_long(long, boolean)

**Package-private**

```java
void write_long(long v, boolean unsigned)
```

**Parameters**

- `long v`
- `boolean unsigned`

<a id="s-write_nil"></a>
### write_nil()

```java
public void write_nil()
```

Write an empty E list to the stream.

<a id="s-write_pid"></a>
### write_pid(String, int, int, int, boolean)

```java
public void write_pid(String node, int id, int serial, int creation, boolean isNew)
```

Write an E PID to the stream.

**Parameters**

- `String node` - the nodename.
- `int id` - an arbitrary number. Only the low order 15 bits will be used.
- `int serial` - another arbitrary number. Only the low order 13 bits will be
            used.
- `int creation` - yet another arbitrary number. Only the low order 2 bits will
            be used.
- `boolean isNew`

<a id="s-write_port"></a>
### write_port(String, int, int)

```java
public void write_port(String node, int id, int creation)
```

Write an E port to the stream.

**Parameters**

- `String node` - the nodename.
- `int id` - an arbitrary number. Only the low order 28 bits will be used.
- `int creation` - another arbitrary number. Only the low order 2 bits will be
            used.

<a id="s-write_ref"></a>
### write_ref(String, int, int)

```java
public void write_ref(String node, int id, int creation)
```

Write an old style E ref to the stream.

**Parameters**

- `String node` - the nodename.
- `int id` - an arbitrary number. Only the low order 18 bits will be used.
- `int creation` - another arbitrary number. Only the low order 2 bits will be
            used.

<a id="s-write_ref-1"></a>
### write_ref(String, int[], int)

```java
public void write_ref(String node, int[] ids, int creation)
```

Write a new style (R6 and later) E ref to the stream.

**Parameters**

- `String node` - the nodename.
- `int[] ids` - an array of arbitrary numbers. Only the low order 18 bits of
            the first number will be used. If the array contains only one
            number, an old style ref will be written instead. At most
            three numbers will be read from the array.
- `int creation` - another arbitrary number. Only the low order 2 bits will be
            used.

<a id="s-write_short"></a>
### write_short(short)

```java
public void write_short(short s)
```

Write a short to the stream.

**Parameters**

- `short s` - the short to use.

<a id="s-write_string"></a>
### write_string(String)

```java
public void write_string(String s)
```

Write a string to the stream.

**Parameters**

- `String s` - the string to write.

<a id="s-write_tuple_head"></a>
### write_tuple_head(int)

```java
public void write_tuple_head(int arity)
```

Write an E tuple header to the stream. After calling this method, you
 must write 'arity' elements to the stream or it will not be possible to
 decode it later.

**Parameters**

- `int arity` - the number of elements in the tuple.

<a id="s-write_uint"></a>
### write_uint(int)

```java
public void write_uint(int ui)
```

Write a positive integer to the stream. The integer is interpreted as a
 two's complement unsigned integer even if it is negative.

**Parameters**

- `int ui` - the integer to use.

<a id="s-write_ulong"></a>
### write_ulong(long)

```java
public void write_ulong(long ul)
```

Write a positive long to the stream. The long is interpreted as a two's
 complement unsigned long even if it is negative.

**Parameters**

- `long ul` - the long to use.

<a id="s-write_ushort"></a>
### write_ushort(short)

```java
public void write_ushort(short us)
```

Write a positive short to the stream. The short is interpreted as a two's
 complement unsigned short even if it is negative.

**Parameters**

- `short us` - the short to use.

<a id="s-writeLE"></a>
### writeLE(long, int)

```java
public void writeLE(long n, int b)
```

Write any number of bytes in little endian format.

**Parameters**

- `long n` - the value to use.
- `int b` - the number of bytes to write from the little end.

<a id="s-writeN"></a>
### writeN(byte[])

```java
public void writeN(byte[] bytes)
```

Write an array of bytes to the stream.

**Parameters**

- `byte[] bytes` - the array of bytes to write.

<a id="s-writeTo"></a>
### writeTo(OutputStream)

```java
public void writeTo(java.io.OutputStream os) throws java.io.IOException
```

Write the contents of the stream to an OutputStream.

**Parameters**

- `java.io.OutputStream os` - the OutputStream to write to.

**Throws**

- `java.io.IOException` - if there is an error writing to the OutputStream.

<a id="s-writeTo-1"></a>
### writeTo(SocketChannel, SelectionKey)

```java
public void writeTo(
    java.nio.channels.SocketChannel channel,
    java.nio.channels.SelectionKey key
)
    throws java.io.IOException
```

**Parameters**

- `java.nio.channels.SocketChannel channel`
- `java.nio.channels.SelectionKey key`
