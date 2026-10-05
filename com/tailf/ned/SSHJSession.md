<a id="s-SSHJSession"></a>
# SSHJSession

```java
public class com.tailf.ned.SSHJSession
    implements com.tailf.ned.SSHClient.CliSession
```

Types: [CliSession](SSHClient/CliSession.md#s-CliSession)

Class implementing the SSHClient.CliSession interface using
 the net.schmizz.sshj framework.

**Authors:** jrendel

## Members

**Constructors**:

- [SSHJSession(SSHJClient, NedWorker, NedConnectionBase, int, int)](#s-SSHJSession-1)

**Fields**:

- [log](#s-log)
- [MODE_OCRNL](SSHClient/CliSession.md#s-MODE_OCRNL) from CliSession
- [MODE_ONLRET](SSHClient/CliSession.md#s-MODE_ONLRET) from CliSession
- [MODE_ONOCR](SSHClient/CliSession.md#s-MODE_ONOCR) from CliSession

**Methods**:

- [close()](#s-close)
- [expect(Pattern)](SSHClient/CliSession.md#s-expect) from CliSession
- [expect(Pattern, boolean, int)](SSHClient/CliSession.md#s-expect-1) from CliSession
- [expect(Pattern, boolean, int, NedWorker)](SSHClient/CliSession.md#s-expect-2) from CliSession
- [expect(Pattern, NedWorker)](SSHClient/CliSession.md#s-expect-3) from CliSession
- [expect(Pattern[])](SSHClient/CliSession.md#s-expect-4) from CliSession
- [expect(Pattern[], boolean, int)](SSHClient/CliSession.md#s-expect-5) from CliSession
- [expect(Pattern[], boolean, int, boolean)](SSHClient/CliSession.md#s-expect-6) from CliSession
- [expect(Pattern[], boolean, int, boolean, NedWorker)](SSHClient/CliSession.md#s-expect-7) from CliSession
- [expect(Pattern[], boolean, int, NedWorker)](SSHClient/CliSession.md#s-expect-8) from CliSession
- [expect(Pattern[], NedWorker)](SSHClient/CliSession.md#s-expect-9) from CliSession
- [expect(String)](SSHClient/CliSession.md#s-expect-10) from CliSession
- [expect(String, boolean, boolean, int)](SSHClient/CliSession.md#s-expect-11) from CliSession
- [expect(String, boolean, boolean, int, NedWorker)](SSHClient/CliSession.md#s-expect-12) from CliSession
- [expect(String, boolean, int)](SSHClient/CliSession.md#s-expect-13) from CliSession
- [expect(String, boolean, int, NedWorker)](SSHClient/CliSession.md#s-expect-14) from CliSession
- [expect(String, int)](SSHClient/CliSession.md#s-expect-15) from CliSession
- [expect(String, int, NedWorker)](SSHClient/CliSession.md#s-expect-16) from CliSession
- [expect(String, NedWorker)](SSHClient/CliSession.md#s-expect-17) from CliSession
- [expect(String[])](SSHClient/CliSession.md#s-expect-18) from CliSession
- [expect(String[], boolean, int)](SSHClient/CliSession.md#s-expect-19) from CliSession
- [expect(String[], boolean, int, NedWorker)](SSHClient/CliSession.md#s-expect-20) from CliSession
- [expect(String[], NedWorker)](SSHClient/CliSession.md#s-expect-21) from CliSession
- [flush()](SSHClient/CliSession.md#s-flush) from CliSession
- [getErrorStream()](#s-getErrorStream)
- [getInputStream()](#s-getInputStream)
- [getLine()](#s-getLine)
- [getOutputStream()](#s-getOutputStream)
- [getReader()](#s-getReader)
- [getReadTimeout()](#s-getReadTimeout)
- [getTermPrintlnMode()](#s-getTermPrintlnMode)
- [getWriter()](#s-getWriter)
- [logDebug(String)](#s-logDebug)
- [logInfo(String)](#s-logInfo)
- [print(int)](SSHClient/CliSession.md#s-print) from CliSession
- [print(String)](SSHClient/CliSession.md#s-print-1) from CliSession
- [println(int)](SSHClient/CliSession.md#s-println) from CliSession
- [println(String)](SSHClient/CliSession.md#s-println-1) from CliSession
- [ready()](SSHClient/CliSession.md#s-ready) from CliSession
- [ready(int)](#s-ready)
- [serverSideClosed()](#s-serverSideClosed)
- [setReadTimeout(int)](#s-setReadTimeout)
- [setTermPrintlnMode(String)](#s-setTermPrintlnMode)
- [setTracer(NedTracer)](#s-setTracer)
- [trace(String, String)](#s-trace)
- [traceInBufAppend(String)](#s-traceInBufAppend)
- [traceInBufFlush()](#s-traceInBufFlush)

## Constructors

<a id="s-SSHJSession-1"></a>
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

Types: [SSHJClient](SSHJClient.md#s-SSHJClient), [NedWorker](NedWorker.md#s-NedWorker), [NedConnectionBase](NedConnectionBase.md#s-NedConnectionBase)

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

<a id="s-log"></a>
### log

```java
protected static org.apache.logging.log4j.Logger log = null;
```


## Methods

<a id="s-close"></a>
### close()

```java
public void close()
```

Close the SSH session

<a id="s-getErrorStream"></a>
### getErrorStream()

```java
public java.io.InputStream getErrorStream()
```

<a id="s-getInputStream"></a>
### getInputStream()

```java
public java.io.InputStream getInputStream()
```

<a id="s-getLine"></a>
### getLine()

```java
public StringBuilder getLine()
```

Return the line buffer

<a id="s-getOutputStream"></a>
### getOutputStream()

```java
public java.io.OutputStream getOutputStream()
```

<a id="s-getReader"></a>
### getReader()

```java
public java.io.BufferedReader getReader()
```

Return the session input reader

<a id="s-getReadTimeout"></a>
### getReadTimeout()

```java
public int getReadTimeout()
```

Return the configured read timeout

<a id="s-getTermPrintlnMode"></a>
### getTermPrintlnMode()

```java
public String getTermPrintlnMode()
```

Get configured println mode

<a id="s-getWriter"></a>
### getWriter()

```java
public java.io.PrintWriter getWriter()
```

Return the session output writer

<a id="s-logDebug"></a>
### logDebug(String)

```java
public void logDebug(String msg)
```

Log on debug level

**Parameters**

- `String msg`

<a id="s-logInfo"></a>
### logInfo(String)

```java
public void logInfo(String msg)
```

Log on info level

**Parameters**

- `String msg`

<a id="s-ready"></a>
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

<a id="s-serverSideClosed"></a>
### serverSideClosed()

```java
public boolean serverSideClosed()
```

Returns true if session has been closed

<a id="s-setReadTimeout"></a>
### setReadTimeout(int)

```java
public void setReadTimeout(int readTimeout)
```

Configure the readTimeout

**Parameters**

- `int readTimeout`

<a id="s-setTermPrintlnMode"></a>
### setTermPrintlnMode(String)

```java
public void setTermPrintlnMode(String mode)
```

Configure println mode

**Parameters**

- `String mode`

<a id="s-setTracer"></a>
### setTracer(NedTracer)

```java
public void setTracer(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#s-NedTracer)

Enable tracer

**Parameters**

- `com.tailf.ned.NedTracer tracer`

<a id="s-trace"></a>
### trace(String, String)

```java
public void trace(String msg, String direction)
```

Append to tracer

**Parameters**

- `String msg`
- `String direction`

<a id="s-traceInBufAppend"></a>
### traceInBufAppend(String)

```java
public void traceInBufAppend(String msg)
```

Append to trace in buf

**Parameters**

- `String msg`

<a id="s-traceInBufFlush"></a>
### traceInBufFlush()

```java
public void traceInBufFlush()
```

Flush trace in buffer
