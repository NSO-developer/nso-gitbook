<a id="cls-SSHJSession"></a>
# SSHJSession

```java
public class com.tailf.ned.SSHJSession
    implements com.tailf.ned.SSHClient.CliSession
```

Types: [CliSession](SSHClient/CliSession.md#cls-CliSession)

Class implementing the SSHClient.CliSession interface using
 the net.schmizz.sshj framework.

**Authors:** jrendel

## Members

**Constructors**:

- [SSHJSession(SSHJClient, NedWorker, NedConnectionBase, int, int)](#m-sshjsession-fec161c6178e)

**Fields**:

- [log](#m-log)
- [MODE_OCRNL](SSHClient/CliSession.md#m-MODE_OCRNL) from CliSession
- [MODE_ONLRET](SSHClient/CliSession.md#m-MODE_ONLRET) from CliSession
- [MODE_ONOCR](SSHClient/CliSession.md#m-MODE_ONOCR) from CliSession

**Methods**:

- [close()](#m-close-8107c6dc012b)
- [expect(Pattern)](SSHClient/CliSession.md#m-expect-98936155685a) from CliSession
- [expect(Pattern, boolean, int)](SSHClient/CliSession.md#m-expect-ae0bda32ace3) from CliSession
- [expect(Pattern, boolean, int, NedWorker)](SSHClient/CliSession.md#m-expect-7eb828b58e63) from CliSession
- [expect(Pattern, NedWorker)](SSHClient/CliSession.md#m-expect-a363c018c396) from CliSession
- [expect(Pattern[])](SSHClient/CliSession.md#m-expect-8149faa90d9d) from CliSession
- [expect(Pattern[], boolean, int)](SSHClient/CliSession.md#m-expect-5cc2e4122c7b) from CliSession
- [expect(Pattern[], boolean, int, boolean)](SSHClient/CliSession.md#m-expect-7b0546ada421) from CliSession
- [expect(Pattern[], boolean, int, boolean, NedWorker)](SSHClient/CliSession.md#m-expect-8367e41003a6) from CliSession
- [expect(Pattern[], boolean, int, NedWorker)](SSHClient/CliSession.md#m-expect-6c58bada9cc6) from CliSession
- [expect(Pattern[], NedWorker)](SSHClient/CliSession.md#m-expect-b0896c6a7b2a) from CliSession
- [expect(String)](SSHClient/CliSession.md#m-expect-5f5d11ad490b) from CliSession
- [expect(String, boolean, boolean, int)](SSHClient/CliSession.md#m-expect-b7ee8aa21949) from CliSession
- [expect(String, boolean, boolean, int, NedWorker)](SSHClient/CliSession.md#m-expect-a44ee9613d91) from CliSession
- [expect(String, boolean, int)](SSHClient/CliSession.md#m-expect-16cd2f682137) from CliSession
- [expect(String, boolean, int, NedWorker)](SSHClient/CliSession.md#m-expect-6e2d86346550) from CliSession
- [expect(String, int)](SSHClient/CliSession.md#m-expect-37295e1967db) from CliSession
- [expect(String, int, NedWorker)](SSHClient/CliSession.md#m-expect-4ba232d952f7) from CliSession
- [expect(String, NedWorker)](SSHClient/CliSession.md#m-expect-6426c41e07e7) from CliSession
- [expect(String[])](SSHClient/CliSession.md#m-expect-740d81a74e4b) from CliSession
- [expect(String[], boolean, int)](SSHClient/CliSession.md#m-expect-f6cb6c02c198) from CliSession
- [expect(String[], boolean, int, NedWorker)](SSHClient/CliSession.md#m-expect-90d4e3ee7ac2) from CliSession
- [expect(String[], NedWorker)](SSHClient/CliSession.md#m-expect-4485477b99db) from CliSession
- [flush()](SSHClient/CliSession.md#m-flush-a4d76f158943) from CliSession
- [getErrorStream()](#m-geterrorstream-8577e8676bda)
- [getInputStream()](#m-getinputstream-cb1d1fa14d56)
- [getLine()](#m-getline-6cb6167e418b)
- [getOutputStream()](#m-getoutputstream-b7e39f99be28)
- [getReader()](#m-getreader-ca9cb7876cc5)
- [getReadTimeout()](#m-getreadtimeout-640fc089c1de)
- [getTermPrintlnMode()](#m-gettermprintlnmode-bbc6ff231fae)
- [getWriter()](#m-getwriter-23ba297ab3e8)
- [logDebug(String)](#m-logdebug-91653b5096b0)
- [logInfo(String)](#m-loginfo-32ae00d19c47)
- [print(int)](SSHClient/CliSession.md#m-print-41f2f1534264) from CliSession
- [print(String)](SSHClient/CliSession.md#m-print-b202251f9230) from CliSession
- [println(int)](SSHClient/CliSession.md#m-println-4c26ee676efb) from CliSession
- [println(String)](SSHClient/CliSession.md#m-println-15aea44318e6) from CliSession
- [ready()](SSHClient/CliSession.md#m-ready-92162bd485a2) from CliSession
- [ready(int)](#m-ready-c585210c0993)
- [serverSideClosed()](#m-serversideclosed-0dfe26b0733e)
- [setReadTimeout(int)](#m-setreadtimeout-4f6742da7687)
- [setTermPrintlnMode(String)](#m-settermprintlnmode-36c6657337c2)
- [setTracer(NedTracer)](#m-settracer-6943f9aadf68)
- [trace(String, String)](#m-trace-684478bdb6cc)
- [traceInBufAppend(String)](#m-traceinbufappend-948da59d599a)
- [traceInBufFlush()](#m-traceinbufflush-5f53f59ed390)

## Constructors

<a id="m-sshjsession-fec161c6178e"></a>
### SSHJSession(SSHJClient, NedWorker, NedConnectionBase, int, int)

**Package-private**

```java
SSHJSession(
    com.tailf.ned.SSHJClient client,
    com.tailf.ned.NedWorker worker,
    com.tailf.ned.NedConnectionBase ned,
    int width,
    int height
)
    throws java.io.IOException
```

Types: [SSHJClient](SSHJClient.md#cls-SSHJClient), [NedWorker](NedWorker.md#cls-NedWorker), [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase)

Constructor accessible by the SSHJClient class.

**Parameters**

- `com.tailf.ned.SSHJClient client` - - The SSHJClient instance
- `com.tailf.ned.NedWorker worker` - - The NED worker thread
- `com.tailf.ned.NedConnectionBase ned` - - The NED instance
- `int width` - - Terminal width
- `int height` - - Terminal height

**Throws**

- `IOException`


## Fields

<a id="m-log"></a>
### log

```java
protected static org.apache.logging.log4j.Logger log = null;
```


## Methods

<a id="m-close-8107c6dc012b"></a>
### close()

```java
public void close()
```

Close the SSH session

<a id="m-geterrorstream-8577e8676bda"></a>
### getErrorStream()

```java
public java.io.InputStream getErrorStream()
```

<a id="m-getinputstream-cb1d1fa14d56"></a>
### getInputStream()

```java
public java.io.InputStream getInputStream()
```

<a id="m-getline-6cb6167e418b"></a>
### getLine()

```java
public StringBuilder getLine()
```

Return the line buffer

<a id="m-getoutputstream-b7e39f99be28"></a>
### getOutputStream()

```java
public java.io.OutputStream getOutputStream()
```

<a id="m-getreader-ca9cb7876cc5"></a>
### getReader()

```java
public java.io.BufferedReader getReader()
```

Return the session input reader

<a id="m-getreadtimeout-640fc089c1de"></a>
### getReadTimeout()

```java
public int getReadTimeout()
```

Return the configured read timeout

<a id="m-gettermprintlnmode-bbc6ff231fae"></a>
### getTermPrintlnMode()

```java
public String getTermPrintlnMode()
```

Get configured println mode

<a id="m-getwriter-23ba297ab3e8"></a>
### getWriter()

```java
public java.io.PrintWriter getWriter()
```

Return the session output writer

<a id="m-logdebug-91653b5096b0"></a>
### logDebug(String)

```java
public void logDebug(String msg)
```

Log on debug level

**Parameters**

- `String msg`

<a id="m-loginfo-32ae00d19c47"></a>
### logInfo(String)

```java
public void logInfo(String msg)
```

Log on info level

**Parameters**

- `String msg`

<a id="m-ready-c585210c0993"></a>
### ready(int)

```java
public synchronized boolean ready(int timeout) throws java.io.IOException
```

Checks if the input reader is ready for reading.
 Done with a blocking read in a separate thread.
 Called through a Java Future to ensure timeout exception.

**Parameters**

- `int timeout` - timeout

**Returns:** true if the input reader is ready, false otherwise

**Throws**

- `IOException` - if an I/O error occurs

<a id="m-serversideclosed-0dfe26b0733e"></a>
### serverSideClosed()

```java
public boolean serverSideClosed()
```

Returns true if session has been closed

<a id="m-setreadtimeout-4f6742da7687"></a>
### setReadTimeout(int)

```java
public void setReadTimeout(int readTimeout)
```

Configure the readTimeout

**Parameters**

- `int readTimeout`

<a id="m-settermprintlnmode-36c6657337c2"></a>
### setTermPrintlnMode(String)

```java
public void setTermPrintlnMode(String mode)
```

Configure println mode

**Parameters**

- `String mode`

<a id="m-settracer-6943f9aadf68"></a>
### setTracer(NedTracer)

```java
public void setTracer(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#cls-NedTracer)

Enable tracer

**Parameters**

- `com.tailf.ned.NedTracer tracer`

<a id="m-trace-684478bdb6cc"></a>
### trace(String, String)

```java
public void trace(String msg, String direction)
```

Append to tracer

**Parameters**

- `String msg`
- `String direction`

<a id="m-traceinbufappend-948da59d599a"></a>
### traceInBufAppend(String)

```java
public void traceInBufAppend(String msg)
```

Append to trace in buf

**Parameters**

- `String msg`

<a id="m-traceinbufflush-5f53f59ed390"></a>
### traceInBufFlush()

```java
public void traceInBufFlush()
```

Flush trace in buffer
