# MaapiOutputStream <a href="#maapioutputstream-97ebc772623b" id="maapioutputstream-97ebc772623b"></a>

```java
public class com.tailf.maapi.MaapiOutputStream
    extends java.io.OutputStream
```

Configuration data output stream used to upload configurations.
 This class is returned as result from
 `Maapi#loadConfigStream(int, java.util.EnumSet)`.

 The application is expected to close the underlying stream socket
 after usage to assure that background socket is closed use
 [`getLocalSocket()`](MaapiOutputStream.md#getlocalsocket-d59b3f74caea) to retrieve the socket stream reference.



```
 // String host = localhost;
 // int port = Conf.PORT; // ConfD TCP; NCS uses Conf.NCS_PATH (Unix socket)
 Socket s = new Socket(host, port);
 Maapi maapi = new Maapi(s);
 maapi.startUserSession(admin,
     maapi,
     new String[] { admin },
     new SocketAddress(InetAddress.getLocalHost(), 0));
 int tid = maapi.startTrans(Conf.DB_RUNNING, Conf.MODE_READ_WRITE);

 MaapiOutputStream outstream =
  maapi.loadConfigStream(tid, EnumSet.of(MaapiConfigFlag.XML_FORMAT));

 FileInputStream fis = new FileInputStream(new File("/tmp/config.xml"));


  byte[] buf = new byte[128];
  int n = -1;

    while((n = fis.read(buf)) != -1){
         outstream.write(buf,0,n);
     }

 fis.close();
 outstream.getLocalSocket().close();

 if(outstream.hasWriteAll())
    System.out.println("All data was uploaded successful!");

 maapi.finishTrans(tid);
 s.close();
```

## Members

**Constructors**:

- [MaapiOutputStream\(Maapi, int, int\)](#maapioutputstream-f1083e369c59)

**Methods**:

- [getErrorCode\(\)](#geterrorcode-812152fc083a)
- [getErrorString\(\)](#geterrorstring-3b4eba00496b)
- [getLocalSocket\(\)](#getlocalsocket-d59b3f74caea)
- [hasWriteAll\(\)](#haswriteall-8546741ca27f)
- [write\(byte\[\], int, int\)](#write-f26dc6393d9b)
- [write\(int\)](#write-5c8da46e8b83)

## Constructors

### MaapiOutputStream(Maapi, int, int) <a href="#maapioutputstream-f1083e369c59" id="maapioutputstream-f1083e369c59"></a>

```java
protected MaapiOutputStream(
    com.tailf.maapi.Maapi maapi,
    int streamId,
    int resultOperation
)
    throws java.io.IOException, com.tailf.maapi.MaapiException
```

Types: [Maapi](Maapi.md#maapi-67bcbe89c42e), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

Protected constructor for MaapiOutputStream. Used internally by Maapi
 class.

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int streamId`
- `int resultOperation`

**Throws**

- `IOException`
- `MaapiException`


## Methods

### getErrorCode() <a href="#geterrorcode-812152fc083a" id="geterrorcode-812152fc083a"></a>

```java
public com.tailf.conf.ErrorCode getErrorCode()
```

Types: [ErrorCode](../conf/ErrorCode.md#errorcode-65263de08890)

This method can be called after a call to
 [`hasWriteAll()`](MaapiOutputStream.md#haswriteall-8546741ca27f) to get the error code in case
 [`hasWriteAll()`](MaapiOutputStream.md#haswriteall-8546741ca27f) returns false, which is the case when writing to
 the output stream fails.
 NOTE: This function will only return useful information after
 [`hasWriteAll()`](MaapiOutputStream.md#haswriteall-8546741ca27f) has been called and returned false.

**Returns:** the error code in case of an error when writing to the output
 stream

### getErrorString() <a href="#geterrorstring-3b4eba00496b" id="geterrorstring-3b4eba00496b"></a>

```java
public String getErrorString()
```

This method can be called after a call to
 [`hasWriteAll()`](MaapiOutputStream.md#haswriteall-8546741ca27f) to get the error message in case
 [`hasWriteAll()`](MaapiOutputStream.md#haswriteall-8546741ca27f) returns false, which is the case when writing to
 the output stream fails.
 NOTE: This function will only return useful information after
 [`hasWriteAll()`](MaapiOutputStream.md#haswriteall-8546741ca27f) has been called and returned false.

**Returns:** the error string in case of an error when writing to the output
 stream

### getLocalSocket() <a href="#getlocalsocket-d59b3f74caea" id="getlocalsocket-d59b3f74caea"></a>

```java
public java.net.Socket getLocalSocket()
```

This method is intended to retrieve reference to the underlying
 stream socket on which the write is performed. To call hasWriteAll()
 the underlying socket must be closed.

**Returns:** The Stream socket that this MaapiOutputStream uses.

### hasWriteAll() <a href="#haswriteall-8546741ca27f" id="haswriteall-8546741ca27f"></a>

```java
public boolean hasWriteAll()
```

Checks with the server if the complete configuration is uploaded. This
 is not performed by reading the stream to EOF but instead a deliberate
 call to the server.
 NOTE: Prior to calling this method it is important that
 the stream socket is closed. Use the `getLocalSocket()`
 to retrieve the stream socket or the method will hang until the socket is
 closed.

 If this call returns false, call [`getErrorString()`](MaapiOutputStream.md#geterrorstring-3b4eba00496b) and
 [`getErrorCode()`](MaapiOutputStream.md#geterrorcode-812152fc083a) to get the error message and the
 error code respectivly.

**Returns:** boolean true if complete configuration is downloaded

### write(byte[], int, int) <a href="#write-f26dc6393d9b" id="write-f26dc6393d9b"></a>

```java
public synchronized void write(byte[] b, int off, int len) throws java.io.IOException
```

Write a portion of an array of bytes.

**Parameters**

- `byte[] b` - Buffer of byte
- `int off` - Offset from which to start writing bytes
- `int len` - Number of characters to write

### write(int) <a href="#write-5c8da46e8b83" id="write-5c8da46e8b83"></a>

```java
public synchronized void write(int b) throws java.io.IOException
```

Write a byte from the input stream or -1 if EOF

**Parameters**

- `int b`
