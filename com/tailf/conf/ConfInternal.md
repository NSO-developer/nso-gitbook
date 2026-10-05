<a id="cls-ConfInternal"></a>
# ConfInternal

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

- [ConfInternal()](#m-confinternal-3cc414d364dd)

**Methods**:

- [bufWrite(SelectionKey, int, int, byte[])](#m-bufwrite-d33523fe82db)
- [bufWrite(Socket, int, int, byte[])](#m-bufwrite-94d76be3d42a)
- [diffIterate(Object, ConfIterate, Object)](#m-diffiterate-034170f5a030)
- [diffIterate(SelectionKey, ConfIterate, Object)](#m-diffiterate-3a0becef6295)
- [doConnect(SelectionKey, int)](#m-doconnect-a5d7493473e0)
- [doConnect(Socket, int)](#m-doconnect-5288b1c56f77)
- [flushToSocket(Object, ConfOutputStream)](#m-flushtosocket-0587eb53c17c)
- [flushToSocket(SelectionKey, ConfOutputStream)](#m-flushtosocket-5c0c54d6c247)
- [get_int16(int, byte[])](#m-get_int16-65c9cfe02f76)
- [get_int32(int, byte[])](#m-get_int32-08ef7a55ec05)
- [hk_keypath(ConfEObject)](#m-hk_keypath-b48c416c1f1c)
- [intWrite(Socket, int, int, int)](#m-intwrite-721f33cb3e78)
- [mk_keypath(ConfEObject, List<ConfNamespace>)](#m-mk_keypath-0b6f5c337acd)
- [put_int16(int, int, byte[])](#m-put_int16-430883d863df)
- [put_int32(int, int, byte[])](#m-put_int32-a1bdd1462219)
- [readFill(SelectionKey, ByteBuffer, int)](#m-readfill-a250e734855a)
- [readFill(Socket, byte[])](#m-readfill-f24254cdc166)
- [readPayLoad(SelectionKey, ByteBuffer, int)](#m-readpayload-19f1f0759b9b)
- [readSize(SelectionKey, ByteBuffer, int)](#m-readsize-9b9eb695cca2)
- [requestInt(Socket, int)](#m-requestint-a1c24de5f8f1)
- [requestInt(Socket, int, int)](#m-requestint-fb8fde4d0d13)
- [requestTerm(SelectionKey, int)](#m-requestterm-29f26a37f01d)
- [requestTerm(SelectionKey, int, ConfEObject)](#m-requestterm-8825787a78c9)
- [requestTerm(SelectionKey, int, int, boolean, ConfEObject)](#m-requestterm-15683fcc881a)
- [requestTerm(Socket, int)](#m-requestterm-ff5162bfe272)
- [requestTerm(Socket, int, ConfEObject)](#m-requestterm-f966587fc3d9)
- [requestTerm(Socket, int, int, boolean, ConfEObject)](#m-requestterm-7ec615ba84b5)
- [substitute_percent(String, Object[])](#m-substitute_percent-2065ae27a6bc)
- [termRead(Object)](#m-termread-dde69cb8c07f)
- [termRead(SelectionKey)](#m-termread-1f9fd627b396)
- [termRead(SelectionKey, int)](#m-termread-1f2ce37a445b)
- [termRead(Socket)](#m-termread-a6eabc408efc)
- [termRead(Socket, int)](#m-termread-56b02dc51c58)
- [termWrite(int, int, ConfEObject)](#m-termwrite-c67483238ac9)
- [termWrite(SelectionKey, int, int, ConfEObject)](#m-termwrite-c427eeaa3adb)
- [termWrite(Socket, ConfEObject)](#m-termwrite-9ddad78c26d9)
- [termWrite(Socket, int, ConfEObject)](#m-termwrite-86f265b572d8)
- [termWrite(Socket, int, int, ConfEObject)](#m-termwrite-0fccfabe0503)
- [write(int, int)](#m-write-92888bad2444)
- [write(SelectionKey, int, int)](#m-write-8822ef3e60fa)
- [write(Socket, int)](#m-write-e15b958a280b)
- [write(Socket, int, int)](#m-write-f3ba282b5baf)

## Constructors

<a id="m-confinternal-3cc414d364dd"></a>
### ConfInternal()

```java
public ConfInternal()
```


## Methods

<a id="m-bufwrite-d33523fe82db"></a>
### bufWrite(SelectionKey, int, int, byte[])

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

<a id="m-bufwrite-94d76be3d42a"></a>
### bufWrite(Socket, int, int, byte[])

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

<a id="m-diffiterate-034170f5a030"></a>
### diffIterate(Object, ConfIterate, Object)

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

<a id="m-diffiterate-3a0becef6295"></a>
### diffIterate(SelectionKey, ConfIterate, Object)

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

<a id="m-doconnect-a5d7493473e0"></a>
### doConnect(SelectionKey, int)

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

<a id="m-doconnect-5288b1c56f77"></a>
### doConnect(Socket, int)

```java
public static long doConnect(java.net.Socket socket, int id) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `java.net.Socket socket`
- `int id`

<a id="m-flushtosocket-0587eb53c17c"></a>
### flushToSocket(Object, ConfOutputStream)

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

<a id="m-flushtosocket-5c0c54d6c247"></a>
### flushToSocket(SelectionKey, ConfOutputStream)

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

<a id="m-get_int16-65c9cfe02f76"></a>
### get_int16(int, byte[])

```java
public static int get_int16(int offset, byte[] s)
```

**Parameters**

- `int offset`
- `byte[] s`

<a id="m-get_int32-08ef7a55ec05"></a>
### get_int32(int, byte[])

```java
public static long get_int32(int offset, byte[] s)
```

**Parameters**

- `int offset`
- `byte[] s`

<a id="m-hk_keypath-b48c416c1f1c"></a>
### hk_keypath(ConfEObject)

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

<a id="m-intwrite-721f33cb3e78"></a>
### intWrite(Socket, int, int, int)

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

<a id="m-mk_keypath-0b6f5c337acd"></a>
### mk_keypath(ConfEObject, List<ConfNamespace>)

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

<a id="m-put_int16-430883d863df"></a>
### put_int16(int, int, byte[])

```java
public static void put_int16(int offset, int i, byte[] s)
```

**Parameters**

- `int offset`
- `int i`
- `byte[] s`

<a id="m-put_int32-a1bdd1462219"></a>
### put_int32(int, int, byte[])

```java
public static void put_int32(int offset, int i, byte[] s)
```

**Parameters**

- `int offset`
- `int i`
- `byte[] s`

<a id="m-readfill-a250e734855a"></a>
### readFill(SelectionKey, ByteBuffer, int)

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

<a id="m-readfill-f24254cdc166"></a>
### readFill(Socket, byte[])

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

<a id="m-readpayload-19f1f0759b9b"></a>
### readPayLoad(SelectionKey, ByteBuffer, int)

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

<a id="m-readsize-9b9eb695cca2"></a>
### readSize(SelectionKey, ByteBuffer, int)

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

<a id="m-requestint-a1c24de5f8f1"></a>
### requestInt(Socket, int)

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

<a id="m-requestint-fb8fde4d0d13"></a>
### requestInt(Socket, int, int)

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

<a id="m-requestterm-29f26a37f01d"></a>
### requestTerm(SelectionKey, int)

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

<a id="m-requestterm-8825787a78c9"></a>
### requestTerm(SelectionKey, int, ConfEObject)

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

<a id="m-requestterm-15683fcc881a"></a>
### requestTerm(SelectionKey, int, int, boolean, ConfEObject)

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

<a id="m-requestterm-ff5162bfe272"></a>
### requestTerm(Socket, int)

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

<a id="m-requestterm-f966587fc3d9"></a>
### requestTerm(Socket, int, ConfEObject)

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

<a id="m-requestterm-7ec615ba84b5"></a>
### requestTerm(Socket, int, int, boolean, ConfEObject)

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

<a id="m-substitute_percent-2065ae27a6bc"></a>
### substitute_percent(String, Object[])

```java
public static String substitute_percent(String fmt, Object[] arguments)
```

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="m-termread-dde69cb8c07f"></a>
### termRead(Object)

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

<a id="m-termread-1f9fd627b396"></a>
### termRead(SelectionKey)

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

<a id="m-termread-1f2ce37a445b"></a>
### termRead(SelectionKey, int)

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

<a id="m-termread-a6eabc408efc"></a>
### termRead(Socket)

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

<a id="m-termread-56b02dc51c58"></a>
### termRead(Socket, int)

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

<a id="m-termwrite-c67483238ac9"></a>
### termWrite(int, int, ConfEObject)

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

<a id="m-termwrite-c427eeaa3adb"></a>
### termWrite(SelectionKey, int, int, ConfEObject)

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

<a id="m-termwrite-9ddad78c26d9"></a>
### termWrite(Socket, ConfEObject)

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

<a id="m-termwrite-86f265b572d8"></a>
### termWrite(Socket, int, ConfEObject)

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

<a id="m-termwrite-0fccfabe0503"></a>
### termWrite(Socket, int, int, ConfEObject)

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

<a id="m-write-92888bad2444"></a>
### write(int, int)

```java
public static byte[] write(int op, int thandle) throws java.io.IOException
```

**Parameters**

- `int op`
- `int thandle`

<a id="m-write-8822ef3e60fa"></a>
### write(SelectionKey, int, int)

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

<a id="m-write-e15b958a280b"></a>
### write(Socket, int)

```java
public static void write(java.net.Socket socket, int op) throws java.io.IOException
```

Write a simple op to ConfD/NCS

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int op` - The op code.

<a id="m-write-f3ba282b5baf"></a>
### write(Socket, int, int)

```java
public static void write(java.net.Socket socket, int op, int thandle) throws java.io.IOException
```

Writes an op and a transaction handle to ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int op` - The op code.
- `int thandle`
