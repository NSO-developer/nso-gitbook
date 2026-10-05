<a id="s-MaapiInputStream"></a>
# MaapiInputStream

```java
public class com.tailf.maapi.MaapiInputStream
    extends java.io.InputStream
```

Represents configuration data input stream used to download configurations.

 This class is returned as result from
 [`Maapi`](Maapi.md#s-Maapi) and
 [`Maapi`](Maapi.md#s-Maapi).

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

- [MaapiInputStream(Maapi, int, int)](#s-MaapiInputStream-1)

**Methods**:

- [getStreamId()](#s-getStreamId)
- [hasReadAll()](#s-hasReadAll)
- [read()](#s-read)
- [read(byte[], int, int)](#s-read-1)

## Constructors

<a id="s-MaapiInputStream-1"></a>
### MaapiInputStream(Maapi, int, int)

```java
protected MaapiInputStream(
    com.tailf.maapi.Maapi maapi,
    int streamId,
    int resultOperation
)
    throws java.io.IOException, com.tailf.maapi.MaapiException
```

Types: [Maapi](Maapi.md#s-Maapi), [MaapiException](MaapiException.md#s-MaapiException)

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

<a id="s-getStreamId"></a>
### getStreamId()

**Package-private**

```java
int getStreamId()
```

<a id="s-hasReadAll"></a>
### hasReadAll()

```java
public synchronized boolean hasReadAll()
```

Checks with the server is the complete configuration is downloaded. This
 is not performed by reading the stream to EOF but instead a deliberate
 call to the server.

**Returns:** boolean true if complete configuration is downloaded

<a id="s-read"></a>
### read()

```java
public synchronized int read() throws java.io.IOException
```

read a byte from the input stream or -1 if EOF

<a id="s-read-1"></a>
### read(byte[], int, int)

```java
public synchronized int read(byte[] b, int off, int len) throws java.io.IOException
```

**Parameters**

- `byte[] b`
- `int off`
- `int len`
