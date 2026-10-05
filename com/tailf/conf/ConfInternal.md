# ConfInternal <a href="#cls-ConfInternal" id="cls-ConfInternal"></a>

```java
public class com.tailf.conf.ConfInternal
```

This class implements the internal communication API in Java.

 The class contains internal static methods to read and write Erlang
 structures,terms. The Java representations of Erlang terms resides
 in `com.tailf.proto` package.

 It is used internally by the API and
 thus should not be used by user of this API directly.


 This class is a translation of the C library confd_internal.c.

## Members

**Constructors**:

- [ConfInternal()](#m-ConfInternal-3cc414d364dd)

**Methods**:

- [bufWrite(SelectionKey, int, int, byte[])](#m-bufWrite-d33523fe82db)
- [bufWrite(Socket, int, int, byte[])](#m-bufWrite-94d76be3d42a)
- [diffIterate(Object, ConfIterate, Object)](#m-diffIterate-034170f5a030)
- [diffIterate(SelectionKey, ConfIterate, Object)](#m-diffIterate-3a0becef6295)
- [doConnect(SelectionKey, int)](#m-doConnect-a5d7493473e0)
- [doConnect(Socket, int)](#m-doConnect-5288b1c56f77)
- [flushToSocket(Object, ConfOutputStream)](#m-flushToSocket-0587eb53c17c)
- [flushToSocket(SelectionKey, ConfOutputStream)](#m-flushToSocket-5c0c54d6c247)
- [get_int16(int, byte[])](#m-get_int16-65c9cfe02f76)
- [get_int32(int, byte[])](#m-get_int32-08ef7a55ec05)
- [hk_keypath(ConfEObject)](#m-hk_keypath-b48c416c1f1c)
- [intWrite(Socket, int, int, int)](#m-intWrite-721f33cb3e78)
- [mk_keypath(ConfEObject, List<ConfNamespace>)](#m-mk_keypath-0b6f5c337acd)
- [put_int16(int, int, byte[])](#m-put_int16-430883d863df)
- [put_int32(int, int, byte[])](#m-put_int32-a1bdd1462219)
- [readFill(SelectionKey, ByteBuffer, int)](#m-readFill-a250e734855a)
- [readFill(Socket, byte[])](#m-readFill-f24254cdc166)
- [readPayLoad(SelectionKey, ByteBuffer, int)](#m-readPayLoad-19f1f0759b9b)
- [readSize(SelectionKey, ByteBuffer, int)](#m-readSize-9b9eb695cca2)
- [requestInt(Socket, int)](#m-requestInt-a1c24de5f8f1)
- [requestInt(Socket, int, int)](#m-requestInt-fb8fde4d0d13)
- [requestTerm(SelectionKey, int)](#m-requestTerm-29f26a37f01d)
- [requestTerm(SelectionKey, int, ConfEObject)](#m-requestTerm-8825787a78c9)
- [requestTerm(SelectionKey, int, int, boolean, ConfEObject)](#m-requestTerm-15683fcc881a)
- [requestTerm(Socket, int)](#m-requestTerm-ff5162bfe272)
- [requestTerm(Socket, int, ConfEObject)](#m-requestTerm-f966587fc3d9)
- [requestTerm(Socket, int, int, boolean, ConfEObject)](#m-requestTerm-7ec615ba84b5)
- [substitute_percent(String, Object[])](#m-substitute_percent-2065ae27a6bc)
- [termRead(Object)](#m-termRead-dde69cb8c07f)
- [termRead(SelectionKey)](#m-termRead-1f9fd627b396)
- [termRead(SelectionKey, int)](#m-termRead-1f2ce37a445b)
- [termRead(Socket)](#m-termRead-a6eabc408efc)
- [termRead(Socket, int)](#m-termRead-56b02dc51c58)
- [termWrite(int, int, ConfEObject)](#m-termWrite-c67483238ac9)
- [termWrite(SelectionKey, int, int, ConfEObject)](#m-termWrite-c427eeaa3adb)
- [termWrite(Socket, ConfEObject)](#m-termWrite-9ddad78c26d9)
- [termWrite(Socket, int, ConfEObject)](#m-termWrite-86f265b572d8)
- [termWrite(Socket, int, int, ConfEObject)](#m-termWrite-0fccfabe0503)
- [write(int, int)](#m-write-92888bad2444)
- [write(SelectionKey, int, int)](#m-write-8822ef3e60fa)
- [write(Socket, int)](#m-write-e15b958a280b)
- [write(Socket, int, int)](#m-write-f3ba282b5baf)

## Constructors

### ConfInternal() <a href="#m-ConfInternal-3cc414d364dd" id="m-ConfInternal-3cc414d364dd"></a>

```java
public ConfInternal()
```


## Methods

### bufWrite(SelectionKey, int, int, byte[]) <a href="#m-bufWrite-d33523fe82db" id="m-bufWrite-d33523fe82db"></a>

```java
public static void bufWrite(
    java.nio.channels.SelectionKey key,
    int cdbop,
    int thandle,
    byte[] buf
)
    throws java.io.IOException
```

Writes OP + string

**Parameters**

- `java.nio.channels.SelectionKey key` - A socket connected to ConfD/NCS
- `int cdbop` - The op code.
- `int thandle` - The transaction handle
- `byte[] buf` - The byte buffer to write

### bufWrite(Socket, int, int, byte[]) <a href="#m-bufWrite-94d76be3d42a" id="m-bufWrite-94d76be3d42a"></a>

```java
public static void bufWrite(
    java.net.Socket socket,
    int cdbop,
    int thandle,
    byte[] buf
)
    throws java.io.IOException
```

Writes OP + string

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int cdbop` - The op code.
- `int thandle` - The transaction handle
- `byte[] buf` - The byte buffer to write

### diffIterate(Object, ConfIterate, Object) <a href="#m-diffIterate-034170f5a030" id="m-diffIterate-034170f5a030"></a>

```java
public static void diffIterate(
    Object socket,
    com.tailf.conf.ConfIterate iter,
    Object initstate
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfIterate](ConfIterate.md#cls-ConfIterate), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `Object socket`
- `com.tailf.conf.ConfIterate iter`
- `Object initstate`

### diffIterate(SelectionKey, ConfIterate, Object) <a href="#m-diffIterate-3a0becef6295" id="m-diffIterate-3a0becef6295"></a>

```java
public static void diffIterate(
    java.nio.channels.SelectionKey key,
    com.tailf.conf.ConfIterate iter,
    Object initstate
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfIterate](ConfIterate.md#cls-ConfIterate), [ConfException](ConfException.md#cls-ConfException)

Common static method for diffIterate with CdbSubscription.
 This method is used internally by the Cdb API.

**Parameters**

- `java.nio.channels.SelectionKey key` - The registration representation of a particular
        channel object with a particular selector object.
        The key parameter is not part of the "ready set" but its
        internal "interest set" has been registered with the selector.
        The key's attachment holds a reference to the
        ByteBuffer that is used to read/write bytes from/to
        ConfD/NCS.
- `com.tailf.conf.ConfIterate iter` - The callback user code
- `Object initstate` - The opaque object passed from user code

**Throws**

- `IOException` - if an general I/O error occurred
- `ConfException` - if ConfD/NCS protocol error occurred

### doConnect(SelectionKey, int) <a href="#m-doConnect-a5d7493473e0" id="m-doConnect-a5d7493473e0"></a>

```java
public static long doConnect(
    java.nio.channels.SelectionKey key,
    int id
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Connects the provided selectable channel to the Erlang process
  using the supplied selector with the buffer buf with the identifier
  id.

  This should be the first call by the constructor from
  Cdb.

**Parameters**

- `java.nio.channels.SelectionKey key` - The registration representation of a particular
        channel object with a particular selector object.
        The key parameter is not part of the "ready set" but its
        internal "interest set" has been registered with the selector.
        The key's attachment holds a reference to the
        ByteBuffer that is used to read/write bytes from/to
        ConfD/NCS.
- `int id` - the integer which specifies what kind of socket
  ( should always be CdbProto.OP_CLIENT_NAME )

**Throws**

- `ConfException` - If the IPCAccessSecret check
  throws IOException it will be wrapped inside the ConfExcepion
  to be able to retrieve the cause use getCause().
- `IOException` - if an I/O error occured

### doConnect(Socket, int) <a href="#m-doConnect-5288b1c56f77" id="m-doConnect-5288b1c56f77"></a>

```java
public static long doConnect(java.net.Socket socket, int id) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `java.net.Socket socket`
- `int id`

### flushToSocket(Object, ConfOutputStream) <a href="#m-flushToSocket-0587eb53c17c" id="m-flushToSocket-0587eb53c17c"></a>

```java
public static void flushToSocket(
    Object socket,
    com.tailf.proto.ConfOutputStream out
)
    throws java.io.IOException
```

Types: [ConfOutputStream](../proto/ConfOutputStream.md#cls-ConfOutputStream)

**Parameters**

- `Object socket`
- `com.tailf.proto.ConfOutputStream out`

### flushToSocket(SelectionKey, ConfOutputStream) <a href="#m-flushToSocket-5c0c54d6c247" id="m-flushToSocket-5c0c54d6c247"></a>

```java
public static void flushToSocket(
    java.nio.channels.SelectionKey key,
    com.tailf.proto.ConfOutputStream out
)
    throws java.io.IOException
```

Types: [ConfOutputStream](../proto/ConfOutputStream.md#cls-ConfOutputStream)

**Parameters**

- `java.nio.channels.SelectionKey key`
- `com.tailf.proto.ConfOutputStream out`

### get_int16(int, byte[]) <a href="#m-get_int16-65c9cfe02f76" id="m-get_int16-65c9cfe02f76"></a>

```java
public static int get_int16(int offset, byte[] s)
```

**Parameters**

- `int offset`
- `byte[] s`

### get_int32(int, byte[]) <a href="#m-get_int32-08ef7a55ec05" id="m-get_int32-08ef7a55ec05"></a>

```java
public static long get_int32(int offset, byte[] s)
```

**Parameters**

- `int offset`
- `byte[] s`

### hk_keypath(ConfEObject) <a href="#m-hk_keypath-b48c416c1f1c" id="m-hk_keypath-b48c416c1f1c"></a>

```java
public static com.tailf.conf.ConfObject[] hk_keypath(
    com.tailf.proto.ConfEObject term
)
    throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#cls-ConfObject), [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

Create a hkeypath from a term. This method takes
 a ConfEList as its actual polymorphic type.
 The ConfEList should represent e HKEY-Path.

**Parameters**

- `com.tailf.proto.ConfEObject term` - - A HKey path as ConfEList

**Returns:** KeyPath of ConfEObject.

### intWrite(Socket, int, int, int) <a href="#m-intWrite-721f33cb3e78" id="m-intWrite-721f33cb3e78"></a>

```java
public static void intWrite(
    java.net.Socket socket,
    int cdbop,
    int thandle,
    int arg
)
    throws java.io.IOException
```

Writes an integer op, a thandle, and a single integer argument to
 ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int cdbop` - The op code.
- `int thandle`
- `int arg`

### mk_keypath(ConfEObject, List<ConfNamespace>) <a href="#m-mk_keypath-0b6f5c337acd" id="m-mk_keypath-0b6f5c337acd"></a>

```java
public static com.tailf.conf.ConfObject[] mk_keypath(
    com.tailf.proto.ConfEObject term,
    java.util.List<com.tailf.conf.ConfNamespace> nsList
)
    throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#cls-ConfObject), [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfNamespace](ConfNamespace.md#cls-ConfNamespace), [ConfException](ConfException.md#cls-ConfException)

Makes a keypath from a term.
 This method us obsolete but the problem is
 that deref() did not get hashes even though useikp = false on
 erlang side val2ext() does not work correctly.
 So if the schema is not loaded the ConfNamespace.findNamespace()
 will fail and throw a ConfException.

**Parameters**

- `com.tailf.proto.ConfEObject term`
- `java.util.List<com.tailf.conf.ConfNamespace> nsList`

### put_int16(int, int, byte[]) <a href="#m-put_int16-430883d863df" id="m-put_int16-430883d863df"></a>

```java
public static void put_int16(int offset, int i, byte[] s)
```

**Parameters**

- `int offset`
- `int i`
- `byte[] s`

### put_int32(int, int, byte[]) <a href="#m-put_int32-a1bdd1462219" id="m-put_int32-a1bdd1462219"></a>

```java
public static void put_int32(int offset, int i, byte[] s)
```

**Parameters**

- `int offset`
- `int i`
- `byte[] s`

### readFill(SelectionKey, ByteBuffer, int) <a href="#m-readFill-a250e734855a" id="m-readFill-a250e734855a"></a>

```java
public static void readFill(
    java.nio.channels.SelectionKey key,
    java.nio.ByteBuffer buf,
    int siz
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Read exactly `siz` data into the buffer
 `buf`.

**Parameters**

- `java.nio.channels.SelectionKey key` - The registration representation of a particular
        channel object with a particular selector object.
        The key parameter is not part of the "ready set" but its
        internal "interest set" has been registered with the selector.
        The key's attachment holds a reference to the
        ByteBuffer that is used to read/write bytes from/to
        ConfD/NCS. NOTE: The attached buffer is supplied from
        the readPayLoad method only!
- `java.nio.ByteBuffer buf` - ByteBuffer of bytes to read data into
- `int siz` - The number of bytes to read into the buffer `buf`

**Throws**

- `IOException` - if an general I/O error occurred
- `ConfException` - if ConfD/NCS protocol error occurred

### readFill(Socket, byte[]) <a href="#m-readFill-f24254cdc166" id="m-readFill-f24254cdc166"></a>

```java
public static void readFill(
    java.net.Socket socket,
    byte[] b
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Reads data into a buffer. Exactly all bytes as specified by the buffer
 size is read.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `byte[] b` - Buffer array of bytes to read data into

### readPayLoad(SelectionKey, ByteBuffer, int) <a href="#m-readPayLoad-19f1f0759b9b" id="m-readPayLoad-19f1f0759b9b"></a>

```java
public static void readPayLoad(
    java.nio.channels.SelectionKey key,
    java.nio.ByteBuffer buf,
    int size
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `java.nio.channels.SelectionKey key`
- `java.nio.ByteBuffer buf`
- `int size`

### readSize(SelectionKey, ByteBuffer, int) <a href="#m-readSize-9b9eb695cca2" id="m-readSize-9b9eb695cca2"></a>

```java
public static void readSize(
    java.nio.channels.SelectionKey key,
    java.nio.ByteBuffer buf,
    int size
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `java.nio.channels.SelectionKey key`
- `java.nio.ByteBuffer buf`
- `int size`

### requestInt(Socket, int) <a href="#m-requestInt-a1c24de5f8f1" id="m-requestInt-a1c24de5f8f1"></a>

```java
public static int requestInt(
    java.net.Socket socket,
    int op
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Request an integer from ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int op` - The op code.

### requestInt(Socket, int, int) <a href="#m-requestInt-fb8fde4d0d13" id="m-requestInt-fb8fde4d0d13"></a>

```java
public static int requestInt(
    java.net.Socket socket,
    int op,
    int thandle
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Requests an integer value from ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int op` - The op code.
- `int thandle` - The transaction handle.

### requestTerm(SelectionKey, int) <a href="#m-requestTerm-29f26a37f01d" id="m-requestTerm-29f26a37f01d"></a>

```java
public static com.tailf.conf.ConfResponse requestTerm(
    java.nio.channels.SelectionKey key,
    int op
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#cls-ConfResponse), [ConfException](ConfException.md#cls-ConfException)

Request the operation `op` with no argument,
  and read the response from ConfD/NCS.

 Specifying the operation as not relative.

  The `isrel` parameter determines if the term
  written contains path that should treated as a relative.
  Request a term for the specified operation
  `op`.

  NOTE: This method is called by Cdb when used with a
  `SocketChannel` and should not be used directly
  by the user of this API.

**Parameters**

- `java.nio.channels.SelectionKey key` - The registration representation of a particular
        channel object with a particular selector object.
        The key parameter is not part of the "ready set" but its
        internal "interest set" has been registered with the selector.
        The key's attachment holds a reference to the
        ByteBuffer that is used to read/write bytes from/to
        ConfD/NCS.
- `int op` - The operation performed on ConfD/NCS

**Returns:** The response for the operation `op`

**Throws**

- `IOException` - if an general I/O error occurred
- `ConfException` - if ConfD/NCS protocol error occurred

### requestTerm(SelectionKey, int, ConfEObject) <a href="#m-requestTerm-8825787a78c9" id="m-requestTerm-8825787a78c9"></a>

```java
public static com.tailf.conf.ConfResponse requestTerm(
    java.nio.channels.SelectionKey key,
    int op,
    com.tailf.proto.ConfEObject arg
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#cls-ConfResponse), [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

Write a term `arg` for the specified operation
  `op` and read the response,
  from ConfD/NCS.

 Specifying the operation as not relative.

 NOTE: This method is called by Cdb when used with a
 `SocketChannel` and should not be used directly
 by the user of this API.

**Parameters**

- `java.nio.channels.SelectionKey key` - The registration representation of a particular
        channel object with a particular selector object.
        The key parameter is not part of the "ready set" but its
        internal "interest set" has been registered with the selector.
        The key's attachment holds a reference to the
        ByteBuffer that is used to read/write bytes from/to
        ConfD/NCS.
- `int op` - The operation performed on ConfD/NCS
- `com.tailf.proto.ConfEObject arg`

**Returns:** The response for the operation `op`

**Throws**

- `IOException` - if an general I/O error occurred
- `ConfException` - if ConfD/NCS protocol error occurred

### requestTerm(SelectionKey, int, int, boolean, ConfEObject) <a href="#m-requestTerm-15683fcc881a" id="m-requestTerm-15683fcc881a"></a>

```java
public static com.tailf.conf.ConfResponse requestTerm(
    java.nio.channels.SelectionKey key,
    int op,
    int thandle,
    boolean isrel,
    com.tailf.proto.ConfEObject arg
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#cls-ConfResponse), [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

Write a term `arg` for the specified operation
  `op` , transaction handle `thandle`
  ( if available -1 otherwise ) and read the response,
  from ConfD/NCS.

  The `isrel` parameter determines if the term
  written contains path that should treated as a relative.

 NOTE: This method is called by Cdb when used with a
 `SocketChannel` and should not be used directly
 by the user of this API.

**Parameters**

- `java.nio.channels.SelectionKey key` - The registration representation of a particular
        channel object with a particular selector object.
        The key parameter is not part of the "ready set" but its
        internal "interest set" has been registered with the selector.
        The key's attachment holds a reference to the
        ByteBuffer that is used to read/write bytes from/to
        ConfD/NCS.
- `int op` - The operation performed on ConfD/NCS
- `int thandle` - The transaction handle ( if Maapi) -1 otherwise
- `boolean isrel` - Determines if the operation is relative
- `com.tailf.proto.ConfEObject arg` - The argument term to the operation `op`

**Returns:** The response for the operation `op`

**Throws**

- `IOException` - if an general I/O error occurred
- `ConfException` - if ConfD/NCS protocol error occurred

### requestTerm(Socket, int) <a href="#m-requestTerm-ff5162bfe272" id="m-requestTerm-ff5162bfe272"></a>

```java
public static com.tailf.conf.ConfResponse requestTerm(
    java.net.Socket socket,
    int op
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#cls-ConfResponse), [ConfException](ConfException.md#cls-ConfException)

Requests a term from ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int op` - The op code.

### requestTerm(Socket, int, ConfEObject) <a href="#m-requestTerm-f966587fc3d9" id="m-requestTerm-f966587fc3d9"></a>

```java
public static com.tailf.conf.ConfResponse requestTerm(
    java.net.Socket socket,
    int op,
    com.tailf.proto.ConfEObject arg
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#cls-ConfResponse), [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

Requests a term from ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int op` - The op code.
- `com.tailf.proto.ConfEObject arg` - An argument to send in the request

### requestTerm(Socket, int, int, boolean, ConfEObject) <a href="#m-requestTerm-7ec615ba84b5" id="m-requestTerm-7ec615ba84b5"></a>

```java
public static com.tailf.conf.ConfResponse requestTerm(
    java.net.Socket socket,
    int op,
    int thandle,
    boolean isrel,
    com.tailf.proto.ConfEObject arg
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#cls-ConfResponse), [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

Requests a term from ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int op` - The op code.
- `int thandle`
- `boolean isrel` - Boolean flag that says that if the provided arg is a path
               if it is relative or not
- `com.tailf.proto.ConfEObject arg` - Argument ConfObject object

### substitute_percent(String, Object[]) <a href="#m-substitute_percent-2065ae27a6bc" id="m-substitute_percent-2065ae27a6bc"></a>

```java
public static String substitute_percent(String fmt, Object[] arguments)
```

**Parameters**

- `String fmt`
- `Object[] arguments`

### termRead(Object) <a href="#m-termRead-dde69cb8c07f" id="m-termRead-dde69cb8c07f"></a>

```java
public static com.tailf.conf.ConfResponse termRead(
    Object sock
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#cls-ConfResponse), [ConfException](ConfException.md#cls-ConfException)

Common method to read a term from ConfD/NCS

 NOTE: This method should not be used by users of this API. This
 method delegates to either termRead( Socket ) or
 to termRead ( SelectionKey ).

 PRECONDITION: A term should have been written to ConfD/NCS
 before calling this method.

**Parameters**

- `Object sock` - Either instance of a Socket or a SocketChannel.

**Returns:** The response which have been sent back from ConfD/NCS

**Throws**

- `IOException` - if an general I/O error occurred
- `ConfException` - if ConfD/NCS protocol error occurred

### termRead(SelectionKey) <a href="#m-termRead-1f9fd627b396" id="m-termRead-1f9fd627b396"></a>

```java
public static com.tailf.conf.ConfResponse termRead(
    java.nio.channels.SelectionKey key
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#cls-ConfResponse), [ConfException](ConfException.md#cls-ConfException)

Common method to read ( request )  a term from ConfD/NCS

 NOTE: This method should not be used by users of this API. This
 method is used by Cdb API ( where Cdb instance is created with a
 instance of a  SocketChannel ).

 PRECONDITION: A term should have been written to ConfD/NCS
 before calling this method.

**Parameters**

- `java.nio.channels.SelectionKey key` - The registration representation of a particular
        channel object with a particular selector object.
        The key parameter is not part of the "ready set" but its
        internal "interest set" has been registered with the selector.
        The key's attachment holds a reference to the
        ByteBuffer that is used to read/write bytes from/to
        ConfD/NCS.

**Returns:** The response which have been sent back from ConfD/NCS

**Throws**

- `IOException` - if an general I/O error occurred
- `ConfException` - if ConfD/NCS protocol error occurred

### termRead(SelectionKey, int) <a href="#m-termRead-1f2ce37a445b" id="m-termRead-1f2ce37a445b"></a>

```java
public static com.tailf.conf.ConfResponse termRead(
    java.nio.channels.SelectionKey key,
    int cdbop
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#cls-ConfResponse), [ConfException](ConfException.md#cls-ConfException)

Read a response, term from ConfD/NCS with the
  given `SelectionKey` and the op `cdbop`.

 NOTE: This method is called by Cdb when used with a
 `SocketChannel` and should not be used directly
 by the user of this API.

**Parameters**

- `java.nio.channels.SelectionKey key` - The registration representation of a particular
        channel object with a particular selector object.
        The key parameter is not part of the "ready set" but its
        internal "interest set" has been registered with the selector.
        The key's attachment holds a reference to the
        ByteBuffer that is used to read/write bytes from/to
        ConfD/NCS.
- `int cdbop`

**Throws**

- `IOException` - if an general I/O error occurred
- `ConfException` - if ConfD/NCS protocol error occurred

### termRead(Socket) <a href="#m-termRead-a6eabc408efc" id="m-termRead-a6eabc408efc"></a>

```java
public static com.tailf.conf.ConfResponse termRead(
    java.net.Socket sock
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#cls-ConfResponse), [ConfException](ConfException.md#cls-ConfException)

Request one term from ConfD/NCS.

**Parameters**

- `java.net.Socket sock` - A socket connected to ConfD/NCS

### termRead(Socket, int) <a href="#m-termRead-56b02dc51c58" id="m-termRead-56b02dc51c58"></a>

```java
public static com.tailf.conf.ConfResponse termRead(
    java.net.Socket sock,
    int cdbop
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#cls-ConfResponse), [ConfException](ConfException.md#cls-ConfException)

Request one term from ConfD/NCS.

**Parameters**

- `java.net.Socket sock` - A socket connected to ConfD/NCS
- `int cdbop` - The op code

### termWrite(int, int, ConfEObject) <a href="#m-termWrite-c67483238ac9" id="m-termWrite-c67483238ac9"></a>

```java
public static byte[] termWrite(
    int cdbop,
    int thandle,
    com.tailf.proto.ConfEObject term
)
    throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

**Parameters**

- `int cdbop`
- `int thandle`
- `com.tailf.proto.ConfEObject term`

### termWrite(SelectionKey, int, int, ConfEObject) <a href="#m-termWrite-c427eeaa3adb" id="m-termWrite-c427eeaa3adb"></a>

```java
public static void termWrite(
    java.nio.channels.SelectionKey key,
    int cdbop,
    int thandle,
    com.tailf.proto.ConfEObject term
)
    throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

Request that the operation `op` should be performed,
 with argument term `term` and with the transaction handle
 `thandle` to ConfD/NCS.

**Parameters**

- `java.nio.channels.SelectionKey key` - The registration representation of a particular
        channel object with a particular selector object.
        The key parameter is not part of the "ready set" but its
        internal "interest set" has been registered with the selector.
        The key's attachment holds a reference to the
        ByteBuffer that is used to read/write bytes from/to
        ConfD/NCS.
- `int cdbop` - The operation performed on ConfD/NCS
- `int thandle` - The transaction handle ( if Maapi) -1 otherwise
        usually when Cdb
- `com.tailf.proto.ConfEObject term` - The argument term to the operation `op`

**Throws**

- `IOException` - if an general I/O error occurred

### termWrite(Socket, ConfEObject) <a href="#m-termWrite-9ddad78c26d9" id="m-termWrite-9ddad78c26d9"></a>

```java
public static void termWrite(
    java.net.Socket socket,
    com.tailf.proto.ConfEObject term
)
    throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

Writes a term argument to ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `com.tailf.proto.ConfEObject term` - The ConfEObject term to write.

### termWrite(Socket, int, ConfEObject) <a href="#m-termWrite-86f265b572d8" id="m-termWrite-86f265b572d8"></a>

```java
public static void termWrite(
    java.net.Socket socket,
    int op,
    com.tailf.proto.ConfEObject term
)
    throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

Writes a term argument to ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int op` - The op code.
- `com.tailf.proto.ConfEObject term` - The ConfEObject term to write.

### termWrite(Socket, int, int, ConfEObject) <a href="#m-termWrite-0fccfabe0503" id="m-termWrite-0fccfabe0503"></a>

```java
public static void termWrite(
    java.net.Socket socket,
    int cdbop,
    int thandle,
    com.tailf.proto.ConfEObject term
)
    throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

Writes a term argument to ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int cdbop` - The op code.
- `int thandle` - The transaction handle
- `com.tailf.proto.ConfEObject term` - The ConfEObject term to write.

### write(int, int) <a href="#m-write-92888bad2444" id="m-write-92888bad2444"></a>

```java
public static byte[] write(int op, int thandle) throws java.io.IOException
```

**Parameters**

- `int op`
- `int thandle`

### write(SelectionKey, int, int) <a href="#m-write-8822ef3e60fa" id="m-write-8822ef3e60fa"></a>

```java
public static void write(
    java.nio.channels.SelectionKey key,
    int op,
    int thandle
)
    throws java.io.IOException
```

Request that the operation `op` should be performed,
 with no argument and with the  transaction handle
 `thandle` to ConfD/NCS.

**Parameters**

- `java.nio.channels.SelectionKey key` - The registration representation of a particular
        channel object with a particular selector object.
        The key parameter is not part of the "ready set" but its
        internal "interest set" has been registered with the selector.
        The key's attachment holds a reference to the
        ByteBuffer that is used to read/write bytes from/to
        ConfD/NCS.
- `int op` - The operation performed on ConfD/NCS
- `int thandle` - The transaction handle ( if Maapi) -1 otherwise

**Throws**

- `IOException` - if an general I/O error occurred

### write(Socket, int) <a href="#m-write-e15b958a280b" id="m-write-e15b958a280b"></a>

```java
public static void write(java.net.Socket socket, int op) throws java.io.IOException
```

Write a simple op to ConfD/NCS

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int op` - The op code.

### write(Socket, int, int) <a href="#m-write-f3ba282b5baf" id="m-write-f3ba282b5baf"></a>

```java
public static void write(java.net.Socket socket, int op, int thandle) throws java.io.IOException
```

Writes an op and a transaction handle to ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int op` - The op code.
- `int thandle`
