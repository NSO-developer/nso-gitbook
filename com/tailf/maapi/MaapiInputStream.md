# MaapiInputStream <a href="#maapiinputstream-2e53bf185d47" id="maapiinputstream-2e53bf185d47"></a>

```java
public class com.tailf.maapi.MaapiInputStream
    extends java.io.InputStream
```

Represents configuration data input stream used to download configurations.

 This class is returned as result from
 `Maapi#saveConfig(int, java.util.EnumSet, String, Object...)` and
 [`Maapi#rollbackConfig(int, String, String...)`](Maapi.md#rollbackconfig-859e41b41c22).

 The application is expected to close the
 `MaapiInputStream` after usage, to assure that background socket
 is closed.

 The instance return will open a new socket to the end server.


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

 // Save the entire configuration
 MaapiInputStream in = maapi.saveConfig(tid,
                         EnumSet.of(MaapiConfigFlag.MAAPI_CONFIG_C));

 while ( (bytesRead = is.read (buf, 0, buf.length)) != -1 )
   // do something with the buf..

  is.close();
 maapi.finishTrans(tid);
 s.close();
```

## Members

**Constructors**:

- [MaapiInputStream\(Maapi, int, int\)](#maapiinputstream-5fb25a8abbc7)

**Methods**:

- [getStreamId\(\)](#getstreamid-97befd015dba)
- [hasReadAll\(\)](#hasreadall-90559f69e54d)
- [read\(\)](#read-b28b830b98d6)
- [read\(byte\[\], int, int\)](#read-0ea898e534b6)

## Constructors

### MaapiInputStream(Maapi, int, int) <a href="#maapiinputstream-5fb25a8abbc7" id="maapiinputstream-5fb25a8abbc7"></a>

```java
protected MaapiInputStream(
    com.tailf.maapi.Maapi maapi,
    int streamId,
    int resultOperation
)
    throws java.io.IOException, com.tailf.maapi.MaapiException
```

Types: [Maapi](Maapi.md#maapi-67bcbe89c42e), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

Protected constructor for MaapiInputStream. Used internally by Maapi
 class.

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int streamId`
- `int resultOperation`

**Throws**

- `IOException`
- `MaapiException`


## Methods

### getStreamId() <a href="#getstreamid-97befd015dba" id="getstreamid-97befd015dba"></a>

**Package-private**

```java
int getStreamId()
```

### hasReadAll() <a href="#hasreadall-90559f69e54d" id="hasreadall-90559f69e54d"></a>

```java
public synchronized boolean hasReadAll()
```

Checks with the server is the complete configuration is downloaded. This
 is not performed by reading the stream to EOF but instead a deliberate
 call to the server.

**Returns:** boolean true if complete configuration is downloaded

### read() <a href="#read-b28b830b98d6" id="read-b28b830b98d6"></a>

```java
public synchronized int read() throws java.io.IOException
```

read a byte from the input stream or -1 if EOF

### read(byte[], int, int) <a href="#read-0ea898e534b6" id="read-0ea898e534b6"></a>

```java
public synchronized int read(byte[] b, int off, int len) throws java.io.IOException
```

**Parameters**

- `byte[] b`
- `int off`
- `int len`
