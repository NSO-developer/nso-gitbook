<a id="s-ConfInternal"></a>
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

- [ConfInternal()](#s-ConfInternal-1)

**Methods**:

- [bufWrite(SelectionKey, int, int, byte[])](#s-bufWrite)
- [bufWrite(Socket, int, int, byte[])](#s-bufWrite-1)
- [diffIterate(Object, ConfIterate, Object)](#s-diffIterate)
- [diffIterate(SelectionKey, ConfIterate, Object)](#s-diffIterate-1)
- [doConnect(SelectionKey, int)](#s-doConnect)
- [doConnect(Socket, int)](#s-doConnect-1)
- [flushToSocket(Object, ConfOutputStream)](#s-flushToSocket)
- [flushToSocket(SelectionKey, ConfOutputStream)](#s-flushToSocket-1)
- [get_int16(int, byte[])](#s-get_int16)
- [get_int32(int, byte[])](#s-get_int32)
- [hk_keypath(ConfEObject)](#s-hk_keypath)
- [intWrite(Socket, int, int, int)](#s-intWrite)
- [mk_keypath(ConfEObject, List<ConfNamespace>)](#s-mk_keypath)
- [put_int16(int, int, byte[])](#s-put_int16)
- [put_int32(int, int, byte[])](#s-put_int32)
- [readFill(SelectionKey, ByteBuffer, int)](#s-readFill)
- [readFill(Socket, byte[])](#s-readFill-1)
- [readPayLoad(SelectionKey, ByteBuffer, int)](#s-readPayLoad)
- [readSize(SelectionKey, ByteBuffer, int)](#s-readSize)
- [requestInt(Socket, int)](#s-requestInt)
- [requestInt(Socket, int, int)](#s-requestInt-1)
- [requestTerm(SelectionKey, int)](#s-requestTerm)
- [requestTerm(SelectionKey, int, ConfEObject)](#s-requestTerm-1)
- [requestTerm(SelectionKey, int, int, boolean, ConfEObject)](#s-requestTerm-2)
- [requestTerm(Socket, int)](#s-requestTerm-3)
- [requestTerm(Socket, int, ConfEObject)](#s-requestTerm-4)
- [requestTerm(Socket, int, int, boolean, ConfEObject)](#s-requestTerm-5)
- [substitute_percent(String, Object[])](#s-substitute_percent)
- [termRead(Object)](#s-termRead)
- [termRead(SelectionKey)](#s-termRead-1)
- [termRead(SelectionKey, int)](#s-termRead-2)
- [termRead(Socket)](#s-termRead-3)
- [termRead(Socket, int)](#s-termRead-4)
- [termWrite(int, int, ConfEObject)](#s-termWrite)
- [termWrite(SelectionKey, int, int, ConfEObject)](#s-termWrite-1)
- [termWrite(Socket, ConfEObject)](#s-termWrite-2)
- [termWrite(Socket, int, ConfEObject)](#s-termWrite-3)
- [termWrite(Socket, int, int, ConfEObject)](#s-termWrite-4)
- [write(int, int)](#s-write)
- [write(SelectionKey, int, int)](#s-write-1)
- [write(Socket, int)](#s-write-2)
- [write(Socket, int, int)](#s-write-3)

## Constructors

<a id="s-ConfInternal-1"></a>
### ConfInternal()

```java
public ConfInternal()
```


## Methods

<a id="s-bufWrite"></a>
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

<a id="s-bufWrite-1"></a>
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

<a id="s-diffIterate"></a>
### diffIterate(Object, ConfIterate, Object)

```java
public static void diffIterate(
    Object socket,
    com.tailf.conf.ConfIterate iter,
    Object initstate
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfIterate](ConfIterate.md#s-ConfIterate), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `Object socket`
- `com.tailf.conf.ConfIterate iter`
- `Object initstate`

<a id="s-diffIterate-1"></a>
### diffIterate(SelectionKey, ConfIterate, Object)

```java
public static void diffIterate(
    java.nio.channels.SelectionKey key,
    com.tailf.conf.ConfIterate iter,
    Object initstate
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfIterate](ConfIterate.md#s-ConfIterate), [ConfException](ConfException.md#s-ConfException)

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

<a id="s-doConnect"></a>
### doConnect(SelectionKey, int)

```java
public static long doConnect(
    java.nio.channels.SelectionKey key,
    int id
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#s-ConfException)

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

<a id="s-doConnect-1"></a>
### doConnect(Socket, int)

```java
public static long doConnect(java.net.Socket socket, int id) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `java.net.Socket socket`
- `int id`

<a id="s-flushToSocket"></a>
### flushToSocket(Object, ConfOutputStream)

```java
public static void flushToSocket(
    Object socket,
    com.tailf.proto.ConfOutputStream out
)
    throws java.io.IOException
```

Types: [ConfOutputStream](../proto/ConfOutputStream.md#s-ConfOutputStream)

**Parameters**

- `Object socket`
- `com.tailf.proto.ConfOutputStream out`

<a id="s-flushToSocket-1"></a>
### flushToSocket(SelectionKey, ConfOutputStream)

```java
public static void flushToSocket(
    java.nio.channels.SelectionKey key,
    com.tailf.proto.ConfOutputStream out
)
    throws java.io.IOException
```

Types: [ConfOutputStream](../proto/ConfOutputStream.md#s-ConfOutputStream)

**Parameters**

- `java.nio.channels.SelectionKey key`
- `com.tailf.proto.ConfOutputStream out`

<a id="s-get_int16"></a>
### get_int16(int, byte[])

```java
public static int get_int16(int offset, byte[] s)
```

**Parameters**

- `int offset`
- `byte[] s`

<a id="s-get_int32"></a>
### get_int32(int, byte[])

```java
public static long get_int32(int offset, byte[] s)
```

**Parameters**

- `int offset`
- `byte[] s`

<a id="s-hk_keypath"></a>
### hk_keypath(ConfEObject)

```java
public static com.tailf.conf.ConfObject[] hk_keypath(
    com.tailf.proto.ConfEObject term
)
    throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#s-ConfObject), [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

Create a hkeypath from a term. This method takes
 a ConfEList as its actual polymorphic type.
 The ConfEList should represent e HKEY-Path.

**Parameters**

- `com.tailf.proto.ConfEObject term` - - A HKey path as ConfEList

**Returns:** KeyPath of ConfEObject.

<a id="s-intWrite"></a>
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

<a id="s-mk_keypath"></a>
### mk_keypath(ConfEObject, List<ConfNamespace>)

```java
public static com.tailf.conf.ConfObject[] mk_keypath(
    com.tailf.proto.ConfEObject term,
    java.util.List<com.tailf.conf.ConfNamespace> nsList
)
    throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#s-ConfObject), [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfNamespace](ConfNamespace.md#s-ConfNamespace), [ConfException](ConfException.md#s-ConfException)

Makes a keypath from a term.
 This method us obsolete but the problem is
 that deref() did not get hashes even though useikp = false on
 erlang side val2ext() does not work correctly.
 So if the schema is not loaded the ConfNamespace.findNamespace()
 will fail and throw a ConfException.

**Parameters**

- `com.tailf.proto.ConfEObject term`
- `java.util.List<com.tailf.conf.ConfNamespace> nsList`

<a id="s-put_int16"></a>
### put_int16(int, int, byte[])

```java
public static void put_int16(int offset, int i, byte[] s)
```

**Parameters**

- `int offset`
- `int i`
- `byte[] s`

<a id="s-put_int32"></a>
### put_int32(int, int, byte[])

```java
public static void put_int32(int offset, int i, byte[] s)
```

**Parameters**

- `int offset`
- `int i`
- `byte[] s`

<a id="s-readFill"></a>
### readFill(SelectionKey, ByteBuffer, int)

```java
public static void readFill(
    java.nio.channels.SelectionKey key,
    java.nio.ByteBuffer buf,
    int siz
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#s-ConfException)

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

<a id="s-readFill-1"></a>
### readFill(Socket, byte[])

```java
public static void readFill(
    java.net.Socket socket,
    byte[] b
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#s-ConfException)

Reads data into a buffer. Exactly all bytes as specified by the buffer
 size is read.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `byte[] b` - Buffer array of bytes to read data into

<a id="s-readPayLoad"></a>
### readPayLoad(SelectionKey, ByteBuffer, int)

```java
public static void readPayLoad(
    java.nio.channels.SelectionKey key,
    java.nio.ByteBuffer buf,
    int size
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `java.nio.channels.SelectionKey key`
- `java.nio.ByteBuffer buf`
- `int size`

<a id="s-readSize"></a>
### readSize(SelectionKey, ByteBuffer, int)

```java
public static void readSize(
    java.nio.channels.SelectionKey key,
    java.nio.ByteBuffer buf,
    int size
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `java.nio.channels.SelectionKey key`
- `java.nio.ByteBuffer buf`
- `int size`

<a id="s-requestInt"></a>
### requestInt(Socket, int)

```java
public static int requestInt(
    java.net.Socket socket,
    int op
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#s-ConfException)

Request an integer from ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int op` - The op code.

<a id="s-requestInt-1"></a>
### requestInt(Socket, int, int)

```java
public static int requestInt(
    java.net.Socket socket,
    int op,
    int thandle
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#s-ConfException)

Requests an integer value from ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int op` - The op code.
- `int thandle` - The transaction handle.

<a id="s-requestTerm"></a>
### requestTerm(SelectionKey, int)

```java
public static com.tailf.conf.ConfResponse requestTerm(
    java.nio.channels.SelectionKey key,
    int op
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#s-ConfResponse), [ConfException](ConfException.md#s-ConfException)

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

<a id="s-requestTerm-1"></a>
### requestTerm(SelectionKey, int, ConfEObject)

```java
public static com.tailf.conf.ConfResponse requestTerm(
    java.nio.channels.SelectionKey key,
    int op,
    com.tailf.proto.ConfEObject arg
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#s-ConfResponse), [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

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

<a id="s-requestTerm-2"></a>
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

Types: [ConfResponse](ConfResponse.md#s-ConfResponse), [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

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

<a id="s-requestTerm-3"></a>
### requestTerm(Socket, int)

```java
public static com.tailf.conf.ConfResponse requestTerm(
    java.net.Socket socket,
    int op
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#s-ConfResponse), [ConfException](ConfException.md#s-ConfException)

Requests a term from ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int op` - The op code.

<a id="s-requestTerm-4"></a>
### requestTerm(Socket, int, ConfEObject)

```java
public static com.tailf.conf.ConfResponse requestTerm(
    java.net.Socket socket,
    int op,
    com.tailf.proto.ConfEObject arg
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#s-ConfResponse), [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

Requests a term from ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int op` - The op code.
- `com.tailf.proto.ConfEObject arg` - An argument to send in the request

<a id="s-requestTerm-5"></a>
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

Types: [ConfResponse](ConfResponse.md#s-ConfResponse), [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

Requests a term from ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int op` - The op code.
- `int thandle`
- `boolean isrel` - Boolean flag that says that if the provided arg is a path
               if it is relative or not
- `com.tailf.proto.ConfEObject arg` - Argument ConfObject object

<a id="s-substitute_percent"></a>
### substitute_percent(String, Object[])

```java
public static String substitute_percent(String fmt, Object[] arguments)
```

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="s-termRead"></a>
### termRead(Object)

```java
public static com.tailf.conf.ConfResponse termRead(
    Object sock
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#s-ConfResponse), [ConfException](ConfException.md#s-ConfException)

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

<a id="s-termRead-1"></a>
### termRead(SelectionKey)

```java
public static com.tailf.conf.ConfResponse termRead(
    java.nio.channels.SelectionKey key
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#s-ConfResponse), [ConfException](ConfException.md#s-ConfException)

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

<a id="s-termRead-2"></a>
### termRead(SelectionKey, int)

```java
public static com.tailf.conf.ConfResponse termRead(
    java.nio.channels.SelectionKey key,
    int cdbop
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#s-ConfResponse), [ConfException](ConfException.md#s-ConfException)

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

<a id="s-termRead-3"></a>
### termRead(Socket)

```java
public static com.tailf.conf.ConfResponse termRead(
    java.net.Socket sock
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#s-ConfResponse), [ConfException](ConfException.md#s-ConfException)

Request one term from ConfD/NCS.

**Parameters**

- `java.net.Socket sock` - A socket connected to ConfD/NCS

<a id="s-termRead-4"></a>
### termRead(Socket, int)

```java
public static com.tailf.conf.ConfResponse termRead(
    java.net.Socket sock,
    int cdbop
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](ConfResponse.md#s-ConfResponse), [ConfException](ConfException.md#s-ConfException)

Request one term from ConfD/NCS.

**Parameters**

- `java.net.Socket sock` - A socket connected to ConfD/NCS
- `int cdbop` - The op code

<a id="s-termWrite"></a>
### termWrite(int, int, ConfEObject)

```java
public static byte[] termWrite(
    int cdbop,
    int thandle,
    com.tailf.proto.ConfEObject term
)
    throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

**Parameters**

- `int cdbop`
- `int thandle`
- `com.tailf.proto.ConfEObject term`

<a id="s-termWrite-1"></a>
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

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

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

<a id="s-termWrite-2"></a>
### termWrite(Socket, ConfEObject)

```java
public static void termWrite(
    java.net.Socket socket,
    com.tailf.proto.ConfEObject term
)
    throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

Writes a term argument to ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `com.tailf.proto.ConfEObject term` - The ConfEObject term to write.

<a id="s-termWrite-3"></a>
### termWrite(Socket, int, ConfEObject)

```java
public static void termWrite(
    java.net.Socket socket,
    int op,
    com.tailf.proto.ConfEObject term
)
    throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

Writes a term argument to ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int op` - The op code.
- `com.tailf.proto.ConfEObject term` - The ConfEObject term to write.

<a id="s-termWrite-4"></a>
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

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

Writes a term argument to ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int cdbop` - The op code.
- `int thandle` - The transaction handle
- `com.tailf.proto.ConfEObject term` - The ConfEObject term to write.

<a id="s-write"></a>
### write(int, int)

```java
public static byte[] write(int op, int thandle) throws java.io.IOException
```

**Parameters**

- `int op`
- `int thandle`

<a id="s-write-1"></a>
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

<a id="s-write-2"></a>
### write(Socket, int)

```java
public static void write(java.net.Socket socket, int op) throws java.io.IOException
```

Write a simple op to ConfD/NCS

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int op` - The op code.

<a id="s-write-3"></a>
### write(Socket, int, int)

```java
public static void write(java.net.Socket socket, int op, int thandle) throws java.io.IOException
```

Writes an op and a transaction handle to ConfD/NCS.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS
- `int op` - The op code.
- `int thandle`
