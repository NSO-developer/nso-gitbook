# MaapiInputStream <a href="#maapiinputstream-2e53bf185d47" id="maapiinputstream-2e53bf185d47"></a>

```java
public class com.tailf.maapi.MaapiInputStream
    extends java.io.InputStream
```

Represents configuration data input stream used to download configurations.

This class is returned as result from
 [`Maapi#saveConfig(int, java.util.EnumSet, String, Object...)`](Maapi.md#saveconfig-eabd7f81580a) and
 [`Maapi#rollbackConfig(int, String, String...)`](Maapi.md#rollbackconfig-913830d11c06).

The application is expected to close the
 `MaapiInputStream` after usage, to assure that background socket
 is closed.

 The instance return will open a new socket to the end server.

```
// String host = "localhost";
// int port = Conf.PORT; // ConfD TCP; NCS uses Conf.NCS_PATH (Unix socket)
Socket s = new Socket(host, port);
Maapi maapi = new Maapi(s);
maapi.startUserSession("admin",
    "maapi",
    new String[] { "admin" },
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

**Methods**:

- [hasReadAll\(\)](#hasreadall-90559f69e54d)
- [read\(\)](#read-b28b830b98d6)
- [read\(byte\[\], int, int\)](#read-0ea898e534b6)

## Methods

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
