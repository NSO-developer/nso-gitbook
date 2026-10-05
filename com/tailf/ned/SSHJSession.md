# SSHJSession <a href="#cls-SSHJSession" id="cls-SSHJSession"></a>

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

- [SSHJSession(SSHJClient, NedWorker, NedConnectionBase, int, int)](#m-SSHJSession-fec161c6178e)

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
- [getErrorStream()](#m-getErrorStream-8577e8676bda)
- [getInputStream()](#m-getInputStream-cb1d1fa14d56)
- [getLine()](#m-getLine-6cb6167e418b)
- [getOutputStream()](#m-getOutputStream-b7e39f99be28)
- [getReader()](#m-getReader-ca9cb7876cc5)
- [getReadTimeout()](#m-getReadTimeout-640fc089c1de)
- [getTermPrintlnMode()](#m-getTermPrintlnMode-bbc6ff231fae)
- [getWriter()](#m-getWriter-23ba297ab3e8)
- [logDebug(String)](#m-logDebug-91653b5096b0)
- [logInfo(String)](#m-logInfo-32ae00d19c47)
- [print(int)](SSHClient/CliSession.md#m-print-41f2f1534264) from CliSession
- [print(String)](SSHClient/CliSession.md#m-print-b202251f9230) from CliSession
- [println(int)](SSHClient/CliSession.md#m-println-4c26ee676efb) from CliSession
- [println(String)](SSHClient/CliSession.md#m-println-15aea44318e6) from CliSession
- [ready()](SSHClient/CliSession.md#m-ready-92162bd485a2) from CliSession
- [ready(int)](#m-ready-c585210c0993)
- [serverSideClosed()](#m-serverSideClosed-0dfe26b0733e)
- [setReadTimeout(int)](#m-setReadTimeout-4f6742da7687)
- [setTermPrintlnMode(String)](#m-setTermPrintlnMode-36c6657337c2)
- [setTracer(NedTracer)](#m-setTracer-6943f9aadf68)
- [trace(String, String)](#m-trace-684478bdb6cc)
- [traceInBufAppend(String)](#m-traceInBufAppend-948da59d599a)
- [traceInBufFlush()](#m-traceInBufFlush-5f53f59ed390)

## Constructors

### SSHJSession(SSHJClient, NedWorker, NedConnectionBase, int, int) <a href="#m-SSHJSession-fec161c6178e" id="m-SSHJSession-fec161c6178e"></a>

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

### log <a href="#m-log" id="m-log"></a>

```java
protected static org.apache.logging.log4j.Logger log = null;
```


## Methods

### close() <a href="#m-close-8107c6dc012b" id="m-close-8107c6dc012b"></a>

```java
public void close()
```

Close the SSH session

### getErrorStream() <a href="#m-getErrorStream-8577e8676bda" id="m-getErrorStream-8577e8676bda"></a>

```java
public java.io.InputStream getErrorStream()
```

### getInputStream() <a href="#m-getInputStream-cb1d1fa14d56" id="m-getInputStream-cb1d1fa14d56"></a>

```java
public java.io.InputStream getInputStream()
```

### getLine() <a href="#m-getLine-6cb6167e418b" id="m-getLine-6cb6167e418b"></a>

```java
public StringBuilder getLine()
```

Return the line buffer

### getOutputStream() <a href="#m-getOutputStream-b7e39f99be28" id="m-getOutputStream-b7e39f99be28"></a>

```java
public java.io.OutputStream getOutputStream()
```

### getReader() <a href="#m-getReader-ca9cb7876cc5" id="m-getReader-ca9cb7876cc5"></a>

```java
public java.io.BufferedReader getReader()
```

Return the session input reader

### getReadTimeout() <a href="#m-getReadTimeout-640fc089c1de" id="m-getReadTimeout-640fc089c1de"></a>

```java
public int getReadTimeout()
```

Return the configured read timeout

### getTermPrintlnMode() <a href="#m-getTermPrintlnMode-bbc6ff231fae" id="m-getTermPrintlnMode-bbc6ff231fae"></a>

```java
public String getTermPrintlnMode()
```

Get configured println mode

### getWriter() <a href="#m-getWriter-23ba297ab3e8" id="m-getWriter-23ba297ab3e8"></a>

```java
public java.io.PrintWriter getWriter()
```

Return the session output writer

### logDebug(String) <a href="#m-logDebug-91653b5096b0" id="m-logDebug-91653b5096b0"></a>

```java
public void logDebug(String msg)
```

Log on debug level

**Parameters**

- `String msg`

### logInfo(String) <a href="#m-logInfo-32ae00d19c47" id="m-logInfo-32ae00d19c47"></a>

```java
public void logInfo(String msg)
```

Log on info level

**Parameters**

- `String msg`

### ready(int) <a href="#m-ready-c585210c0993" id="m-ready-c585210c0993"></a>

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

### serverSideClosed() <a href="#m-serverSideClosed-0dfe26b0733e" id="m-serverSideClosed-0dfe26b0733e"></a>

```java
public boolean serverSideClosed()
```

Returns true if session has been closed

### setReadTimeout(int) <a href="#m-setReadTimeout-4f6742da7687" id="m-setReadTimeout-4f6742da7687"></a>

```java
public void setReadTimeout(int readTimeout)
```

Configure the readTimeout

**Parameters**

- `int readTimeout`

### setTermPrintlnMode(String) <a href="#m-setTermPrintlnMode-36c6657337c2" id="m-setTermPrintlnMode-36c6657337c2"></a>

```java
public void setTermPrintlnMode(String mode)
```

Configure println mode

**Parameters**

- `String mode`

### setTracer(NedTracer) <a href="#m-setTracer-6943f9aadf68" id="m-setTracer-6943f9aadf68"></a>

```java
public void setTracer(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#cls-NedTracer)

Enable tracer

**Parameters**

- `com.tailf.ned.NedTracer tracer`

### trace(String, String) <a href="#m-trace-684478bdb6cc" id="m-trace-684478bdb6cc"></a>

```java
public void trace(String msg, String direction)
```

Append to tracer

**Parameters**

- `String msg`
- `String direction`

### traceInBufAppend(String) <a href="#m-traceInBufAppend-948da59d599a" id="m-traceInBufAppend-948da59d599a"></a>

```java
public void traceInBufAppend(String msg)
```

Append to trace in buf

**Parameters**

- `String msg`

### traceInBufFlush() <a href="#m-traceInBufFlush-5f53f59ed390" id="m-traceInBufFlush-5f53f59ed390"></a>

```java
public void traceInBufFlush()
```

Flush trace in buffer
