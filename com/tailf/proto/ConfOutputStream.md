# ConfOutputStream <a href="#confoutputstream-e8ef47aca327" id="confoutputstream-e8ef47aca327"></a>

```java
public class com.tailf.proto.ConfOutputStream
```

Provides a stream for encoding E terms to external format, for transmission
 or storage.


 Note that this class is not synchronized, if you need synchronization you
 must provide it yourself.

## Members

**Constructors**:

- [ConfOutputStream()](#confoutputstream-3b0d6874ec87)
- [ConfOutputStream(ConfEObject)](#confoutputstream-2a51f10515bc)
- [ConfOutputStream(int)](#confoutputstream-62871c47af75)

**Fields**:

- [DEFAULT_INITIAL_SIZE](#default_initial_size-e0230bad2fee)

**Methods**:

- [count()](#count-9e5d07d4db9b)
- [getConfInputStream(int)](#getconfinputstream-066a2b2f92ac)
- [getPos()](#getpos-ad2d7b30807f)
- [poke4BE(int, long)](#poke4be-1599f0eb9562)
- [reset()](#reset-6927918ac70a)
- [size()](#size-c6d8505255fd)
- [toByteArray()](#tobytearray-c018e63cfbd3)
- [write(byte)](#write-049afc536dce)
- [write(byte[])](#write-d030181b06a2)
- [write1(long)](#write1-407167cfd7df)
- [write2BE(long)](#write2be-caea454aa8a6)
- [write2LE(long)](#write2le-2de33fb15724)
- [write4BE(long)](#write4be-0fffd36474ae)
- [write4LE(long)](#write4le-8f00d63df00e)
- [write8LE(long)](#write8le-e4974e925e78)
- [write_any(ConfEObject)](#write_any-39f3c731f9af)
- [write_atom(String)](#write_atom-cb0e872c619b)
- [write_atom(String, boolean)](#write_atom-e9bc357deb03)
- [write_big(BigInteger)](#write_big-eef182ab6880)
- [write_binary(byte[])](#write_binary-59f71b69853a)
- [write_boolean(boolean)](#write_boolean-85ed730c2c6c)
- [write_byte(byte)](#write_byte-b8a1b8055add)
- [write_char(char)](#write_char-2466c696db56)
- [write_double(double)](#write_double-140f4c04ed78)
- [write_float(float)](#write_float-611b23aca3a6)
- [write_int(int)](#write_int-ecbd574d3a55)
- [write_list_head(int)](#write_list_head-8afa4a647bc5)
- [write_long(long)](#write_long-52726186f08e)
- [write_long(long, boolean)](#write_long-1566e4a476c3)
- [write_nil()](#write_nil-454e0dfb8a20)
- [write_pid(String, int, int, int, boolean)](#write_pid-1e498a2fcff8)
- [write_port(String, int, int)](#write_port-f3d21f5605a4)
- [write_ref(String, int, int)](#write_ref-229e9927dc2e)
- [write_ref(String, int[], int)](#write_ref-f24efc920831)
- [write_short(short)](#write_short-0269bc417d02)
- [write_string(String)](#write_string-efdb49b76fb2)
- [write_tuple_head(int)](#write_tuple_head-43d64516902f)
- [write_uint(int)](#write_uint-92bf35c74b5e)
- [write_ulong(long)](#write_ulong-5f1cbcab6a8d)
- [write_ushort(short)](#write_ushort-8144cb5f16e1)
- [writeLE(long, int)](#writele-202a5a78afe5)
- [writeN(byte[])](#writen-60a742cb45f4)
- [writeTo(OutputStream)](#writeto-9f8bc5cc5279)
- [writeTo(SocketChannel, SelectionKey)](#writeto-d4adf7f1bd5a)

## Constructors

### ConfOutputStream() <a href="#confoutputstream-3b0d6874ec87" id="confoutputstream-3b0d6874ec87"></a>

```java
public ConfOutputStream()
```

Create a stream with the default initial size.

### ConfOutputStream(ConfEObject) <a href="#confoutputstream-2a51f10515bc" id="confoutputstream-2a51f10515bc"></a>

```java
public ConfOutputStream(com.tailf.proto.ConfEObject o)
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Create a stream containing the encoded version of the given E term.

**Parameters**

- `com.tailf.proto.ConfEObject o`

### ConfOutputStream(int) <a href="#confoutputstream-62871c47af75" id="confoutputstream-62871c47af75"></a>

```java
public ConfOutputStream(int size)
```

Create a stream with the specified initial size.

**Parameters**

- `int size`


## Fields

### DEFAULT_INITIAL_SIZE <a href="#default_initial_size-e0230bad2fee" id="default_initial_size-e0230bad2fee"></a>

```java
public static final int DEFAULT_INITIAL_SIZE = 2048;
```

The default initial size of the stream.


## Methods

### count() <a href="#count-9e5d07d4db9b" id="count-9e5d07d4db9b"></a>

```java
public int count()
```

Get the number of bytes in the stream.

**Returns:** the number of bytes in the stream.

### getConfInputStream(int) <a href="#getconfinputstream-066a2b2f92ac" id="getconfinputstream-066a2b2f92ac"></a>

**Package-private**

```java
com.tailf.proto.ConfInputStream getConfInputStream(int offset)
```

Types: [ConfInputStream](ConfInputStream.md#confinputstream-c4a961d10b62)

**Parameters**

- `int offset`

### getPos() <a href="#getpos-ad2d7b30807f" id="getpos-ad2d7b30807f"></a>

```java
public int getPos()
```

Get the current position in the stream.

**Returns:** the current position in the stream.

### poke4BE(int, long) <a href="#poke4be-1599f0eb9562" id="poke4be-1599f0eb9562"></a>

```java
public void poke4BE(int offset, long n)
```

Write the low four bytes of a value to the stream in bif endian order, at
 the specified position. If the position specified is beyond the end of
 the stream, this method will have no effect.

 Normally this method should be used in conjunction with [getPos()](ConfOutputStream.md#getpos-ad2d7b30807f), when is is necessary to insert data into the stream before it
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

### reset() <a href="#reset-6927918ac70a" id="reset-6927918ac70a"></a>

```java
public void reset()
```

Reset the stream so that it can be reused.

### size() <a href="#size-c6d8505255fd" id="size-c6d8505255fd"></a>

```java
public int size()
```

Get the current capacity of the stream. As bytes are added the capacity
 of the stream is increased automatically, however this method returns the
 current size.

**Returns:** the size of the internal buffer used by the stream.

### toByteArray() <a href="#tobytearray-c018e63cfbd3" id="tobytearray-c018e63cfbd3"></a>

```java
public byte[] toByteArray()
```

Get the contents of the stream in a byte array.

**Returns:** a byte array containing a copy of the stream contents.

### write(byte) <a href="#write-049afc536dce" id="write-049afc536dce"></a>

```java
public void write(byte b)
```

Write one byte to the stream.

**Parameters**

- `byte b` - the byte to write.

### write(byte[]) <a href="#write-d030181b06a2" id="write-d030181b06a2"></a>

```java
public void write(byte[] buf)
```

Write an array of bytes to the stream.

**Parameters**

- `byte[] buf` - the array of bytes to write.

### write1(long) <a href="#write1-407167cfd7df" id="write1-407167cfd7df"></a>

```java
public void write1(long n)
```

Write the low byte of a value to the stream.

**Parameters**

- `long n` - the value to use.

### write2BE(long) <a href="#write2be-caea454aa8a6" id="write2be-caea454aa8a6"></a>

```java
public void write2BE(long n)
```

Write the low two bytes of a value to the stream in big endian order.

**Parameters**

- `long n` - the value to use.

### write2LE(long) <a href="#write2le-2de33fb15724" id="write2le-2de33fb15724"></a>

```java
public void write2LE(long n)
```

Write the low two bytes of a value to the stream in little endian order.

**Parameters**

- `long n` - the value to use.

### write4BE(long) <a href="#write4be-0fffd36474ae" id="write4be-0fffd36474ae"></a>

```java
public void write4BE(long n)
```

Write the low four bytes of a value to the stream in big endian order.

**Parameters**

- `long n` - the value to use.

### write4LE(long) <a href="#write4le-8f00d63df00e" id="write4le-8f00d63df00e"></a>

```java
public void write4LE(long n)
```

Write the low four bytes of a value to the stream in little endian order.

**Parameters**

- `long n` - the value to use.

### write8LE(long) <a href="#write8le-e4974e925e78" id="write8le-e4974e925e78"></a>

```java
public void write8LE(long n)
```

Write the low eight bytes of a value to the stream in little endian
 order.

**Parameters**

- `long n` - the value to use.

### write_any(ConfEObject) <a href="#write_any-39f3c731f9af" id="write_any-39f3c731f9af"></a>

```java
public void write_any(com.tailf.proto.ConfEObject o)
```

Types: [ConfEObject](ConfEObject.md#confeobject-2a9c0d03e350)

Write an arbitrary E term to the stream.

**Parameters**

- `com.tailf.proto.ConfEObject o` - the E term to write.

### write_atom(String) <a href="#write_atom-cb0e872c619b" id="write_atom-cb0e872c619b"></a>

```java
public void write_atom(String atom)
```

Write a string to the stream as an E atom.

**Parameters**

- `String atom` - the string to write.

### write_atom(String, boolean) <a href="#write_atom-e9bc357deb03" id="write_atom-e9bc357deb03"></a>

```java
public void write_atom(String atom, boolean isSmallUtf8)
```

Write a string to the stream as an E atom.

**Parameters**

- `String atom` - the string to write.
- `boolean isSmallUtf8` - whether to encode atoms using SMALL_ATOM_UTF8_EXT

### write_big(BigInteger) <a href="#write_big-eef182ab6880" id="write_big-eef182ab6880"></a>

**Package-private**

```java
void write_big(java.math.BigInteger big)
```

**Parameters**

- `java.math.BigInteger big`

### write_binary(byte[]) <a href="#write_binary-59f71b69853a" id="write_binary-59f71b69853a"></a>

```java
public void write_binary(byte[] bin)
```

Write an array of bytes to the stream as an E binary.

**Parameters**

- `byte[] bin` - the array of bytes to write.

### write_boolean(boolean) <a href="#write_boolean-85ed730c2c6c" id="write_boolean-85ed730c2c6c"></a>

```java
public void write_boolean(boolean b)
```

Write a boolean value to the stream as the E atom 'true' or 'false'.

**Parameters**

- `boolean b` - the boolean value to write.

### write_byte(byte) <a href="#write_byte-b8a1b8055add" id="write_byte-b8a1b8055add"></a>

```java
public void write_byte(byte b)
```

Write a single byte to the stream as an E integer. The byte is really an
 IDL 'octet', that is, unsigned.

**Parameters**

- `byte b` - the byte to use.

### write_char(char) <a href="#write_char-2466c696db56" id="write_char-2466c696db56"></a>

```java
public void write_char(char c)
```

Write a character to the stream as an E integer. The character may be a
 16 bit character, kind of IDL 'wchar'. It is up to the E side to take
 care of souch, if they should be used.

**Parameters**

- `char c` - the character to use.

### write_double(double) <a href="#write_double-140f4c04ed78" id="write_double-140f4c04ed78"></a>

```java
public void write_double(double d)
```

Write a double value to the stream.

**Parameters**

- `double d` - the double to use.

### write_float(float) <a href="#write_float-611b23aca3a6" id="write_float-611b23aca3a6"></a>

```java
public void write_float(float f)
```

Write a float value to the stream.

**Parameters**

- `float f` - the float to use.

### write_int(int) <a href="#write_int-ecbd574d3a55" id="write_int-ecbd574d3a55"></a>

```java
public void write_int(int i)
```

Write an integer to the stream.

**Parameters**

- `int i` - the integer to use.

### write_list_head(int) <a href="#write_list_head-8afa4a647bc5" id="write_list_head-8afa4a647bc5"></a>

```java
public void write_list_head(int arity)
```

Write an E list header to the stream. After calling this method, you must
 write 'arity' elements to the stream followed by nil, or it will not be
 possible to decode it later.

**Parameters**

- `int arity` - the number of elements in the list.

### write_long(long) <a href="#write_long-52726186f08e" id="write_long-52726186f08e"></a>

```java
public void write_long(long l)
```

Write a long to the stream.

**Parameters**

- `long l` - the long to use.

### write_long(long, boolean) <a href="#write_long-1566e4a476c3" id="write_long-1566e4a476c3"></a>

**Package-private**

```java
void write_long(long v, boolean unsigned)
```

**Parameters**

- `long v`
- `boolean unsigned`

### write_nil() <a href="#write_nil-454e0dfb8a20" id="write_nil-454e0dfb8a20"></a>

```java
public void write_nil()
```

Write an empty E list to the stream.

### write_pid(String, int, int, int, boolean) <a href="#write_pid-1e498a2fcff8" id="write_pid-1e498a2fcff8"></a>

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

### write_port(String, int, int) <a href="#write_port-f3d21f5605a4" id="write_port-f3d21f5605a4"></a>

```java
public void write_port(String node, int id, int creation)
```

Write an E port to the stream.

**Parameters**

- `String node` - the nodename.
- `int id` - an arbitrary number. Only the low order 28 bits will be used.
- `int creation` - another arbitrary number. Only the low order 2 bits will be
            used.

### write_ref(String, int, int) <a href="#write_ref-229e9927dc2e" id="write_ref-229e9927dc2e"></a>

```java
public void write_ref(String node, int id, int creation)
```

Write an old style E ref to the stream.

**Parameters**

- `String node` - the nodename.
- `int id` - an arbitrary number. Only the low order 18 bits will be used.
- `int creation` - another arbitrary number. Only the low order 2 bits will be
            used.

### write_ref(String, int[], int) <a href="#write_ref-f24efc920831" id="write_ref-f24efc920831"></a>

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

### write_short(short) <a href="#write_short-0269bc417d02" id="write_short-0269bc417d02"></a>

```java
public void write_short(short s)
```

Write a short to the stream.

**Parameters**

- `short s` - the short to use.

### write_string(String) <a href="#write_string-efdb49b76fb2" id="write_string-efdb49b76fb2"></a>

```java
public void write_string(String s)
```

Write a string to the stream.

**Parameters**

- `String s` - the string to write.

### write_tuple_head(int) <a href="#write_tuple_head-43d64516902f" id="write_tuple_head-43d64516902f"></a>

```java
public void write_tuple_head(int arity)
```

Write an E tuple header to the stream. After calling this method, you
 must write 'arity' elements to the stream or it will not be possible to
 decode it later.

**Parameters**

- `int arity` - the number of elements in the tuple.

### write_uint(int) <a href="#write_uint-92bf35c74b5e" id="write_uint-92bf35c74b5e"></a>

```java
public void write_uint(int ui)
```

Write a positive integer to the stream. The integer is interpreted as a
 two's complement unsigned integer even if it is negative.

**Parameters**

- `int ui` - the integer to use.

### write_ulong(long) <a href="#write_ulong-5f1cbcab6a8d" id="write_ulong-5f1cbcab6a8d"></a>

```java
public void write_ulong(long ul)
```

Write a positive long to the stream. The long is interpreted as a two's
 complement unsigned long even if it is negative.

**Parameters**

- `long ul` - the long to use.

### write_ushort(short) <a href="#write_ushort-8144cb5f16e1" id="write_ushort-8144cb5f16e1"></a>

```java
public void write_ushort(short us)
```

Write a positive short to the stream. The short is interpreted as a two's
 complement unsigned short even if it is negative.

**Parameters**

- `short us` - the short to use.

### writeLE(long, int) <a href="#writele-202a5a78afe5" id="writele-202a5a78afe5"></a>

```java
public void writeLE(long n, int b)
```

Write any number of bytes in little endian format.

**Parameters**

- `long n` - the value to use.
- `int b` - the number of bytes to write from the little end.

### writeN(byte[]) <a href="#writen-60a742cb45f4" id="writen-60a742cb45f4"></a>

```java
public void writeN(byte[] bytes)
```

Write an array of bytes to the stream.

**Parameters**

- `byte[] bytes` - the array of bytes to write.

### writeTo(OutputStream) <a href="#writeto-9f8bc5cc5279" id="writeto-9f8bc5cc5279"></a>

```java
public void writeTo(java.io.OutputStream os) throws java.io.IOException
```

Write the contents of the stream to an OutputStream.

**Parameters**

- `java.io.OutputStream os` - the OutputStream to write to.

**Throws**

- `java.io.IOException` - if there is an error writing to the OutputStream.

### writeTo(SocketChannel, SelectionKey) <a href="#writeto-d4adf7f1bd5a" id="writeto-d4adf7f1bd5a"></a>

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
