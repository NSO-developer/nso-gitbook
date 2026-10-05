# SSHJSession <a href="#sshjsession-7e69508c20af" id="sshjsession-7e69508c20af"></a>

```java
public class com.tailf.ned.SSHJSession
    implements com.tailf.ned.SSHClient.CliSession
```

Types: [CliSession](SSHClient/CliSession.md#clisession-1e55c4457237)

Class implementing the SSHClient.CliSession interface using
 the net.schmizz.sshj framework.

**Authors:** jrendel

## Members

**Constructors**:

- [SSHJSession(SSHJClient, NedWorker, NedConnectionBase, int, int)](#sshjsession-fec161c6178e)

**Fields**:

- [log](#log-f86e8fa24169)
- [MODE_OCRNL](SSHClient/CliSession.md#mode_ocrnl-2476ec5d2765) from CliSession
- [MODE_ONLRET](SSHClient/CliSession.md#mode_onlret-96689b9dd127) from CliSession
- [MODE_ONOCR](SSHClient/CliSession.md#mode_onocr-54f46cfe0a80) from CliSession

**Methods**:

- [close()](#close-8107c6dc012b)
- [expect(Pattern)](SSHClient/CliSession.md#expect-98936155685a) from CliSession
- [expect(Pattern, boolean, int)](SSHClient/CliSession.md#expect-ae0bda32ace3) from CliSession
- [expect(Pattern, boolean, int, NedWorker)](SSHClient/CliSession.md#expect-7eb828b58e63) from CliSession
- [expect(Pattern, NedWorker)](SSHClient/CliSession.md#expect-a363c018c396) from CliSession
- [expect(Pattern[])](SSHClient/CliSession.md#expect-8149faa90d9d) from CliSession
- [expect(Pattern[], boolean, int)](SSHClient/CliSession.md#expect-5cc2e4122c7b) from CliSession
- [expect(Pattern[], boolean, int, boolean)](SSHClient/CliSession.md#expect-7b0546ada421) from CliSession
- [expect(Pattern[], boolean, int, boolean, NedWorker)](SSHClient/CliSession.md#expect-8367e41003a6) from CliSession
- [expect(Pattern[], boolean, int, NedWorker)](SSHClient/CliSession.md#expect-6c58bada9cc6) from CliSession
- [expect(Pattern[], NedWorker)](SSHClient/CliSession.md#expect-b0896c6a7b2a) from CliSession
- [expect(String)](SSHClient/CliSession.md#expect-5f5d11ad490b) from CliSession
- [expect(String, boolean, boolean, int)](SSHClient/CliSession.md#expect-b7ee8aa21949) from CliSession
- [expect(String, boolean, boolean, int, NedWorker)](SSHClient/CliSession.md#expect-a44ee9613d91) from CliSession
- [expect(String, boolean, int)](SSHClient/CliSession.md#expect-16cd2f682137) from CliSession
- [expect(String, boolean, int, NedWorker)](SSHClient/CliSession.md#expect-6e2d86346550) from CliSession
- [expect(String, int)](SSHClient/CliSession.md#expect-37295e1967db) from CliSession
- [expect(String, int, NedWorker)](SSHClient/CliSession.md#expect-4ba232d952f7) from CliSession
- [expect(String, NedWorker)](SSHClient/CliSession.md#expect-6426c41e07e7) from CliSession
- [expect(String[])](SSHClient/CliSession.md#expect-740d81a74e4b) from CliSession
- [expect(String[], boolean, int)](SSHClient/CliSession.md#expect-f6cb6c02c198) from CliSession
- [expect(String[], boolean, int, NedWorker)](SSHClient/CliSession.md#expect-90d4e3ee7ac2) from CliSession
- [expect(String[], NedWorker)](SSHClient/CliSession.md#expect-4485477b99db) from CliSession
- [flush()](SSHClient/CliSession.md#flush-a4d76f158943) from CliSession
- [getErrorStream()](#geterrorstream-8577e8676bda)
- [getInputStream()](#getinputstream-cb1d1fa14d56)
- [getLine()](#getline-6cb6167e418b)
- [getOutputStream()](#getoutputstream-b7e39f99be28)
- [getReader()](#getreader-ca9cb7876cc5)
- [getReadTimeout()](#getreadtimeout-640fc089c1de)
- [getTermPrintlnMode()](#gettermprintlnmode-bbc6ff231fae)
- [getWriter()](#getwriter-23ba297ab3e8)
- [logDebug(String)](#logdebug-91653b5096b0)
- [logInfo(String)](#loginfo-32ae00d19c47)
- [print(int)](SSHClient/CliSession.md#print-41f2f1534264) from CliSession
- [print(String)](SSHClient/CliSession.md#print-b202251f9230) from CliSession
- [println(int)](SSHClient/CliSession.md#println-4c26ee676efb) from CliSession
- [println(String)](SSHClient/CliSession.md#println-15aea44318e6) from CliSession
- [ready()](SSHClient/CliSession.md#ready-92162bd485a2) from CliSession
- [ready(int)](#ready-c585210c0993)
- [serverSideClosed()](#serversideclosed-0dfe26b0733e)
- [setReadTimeout(int)](#setreadtimeout-4f6742da7687)
- [setTermPrintlnMode(String)](#settermprintlnmode-36c6657337c2)
- [setTracer(NedTracer)](#settracer-6943f9aadf68)
- [trace(String, String)](#trace-684478bdb6cc)
- [traceInBufAppend(String)](#traceinbufappend-948da59d599a)
- [traceInBufFlush()](#traceinbufflush-5f53f59ed390)

## Constructors

### SSHJSession(SSHJClient, NedWorker, NedConnectionBase, int, int) <a href="#sshjsession-fec161c6178e" id="sshjsession-fec161c6178e"></a>

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

Types: [SSHJClient](SSHJClient.md#sshjclient-ed3ef5e4e5e7), [NedWorker](NedWorker.md#nedworker-b063de7c0998), [NedConnectionBase](NedConnectionBase.md#nedconnectionbase-3139efb66faf)

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

### log <a href="#log-f86e8fa24169" id="log-f86e8fa24169"></a>

```java
protected static org.apache.logging.log4j.Logger log = null;
```


## Methods

### close() <a href="#close-8107c6dc012b" id="close-8107c6dc012b"></a>

```java
public void close()
```

Close the SSH session

### getErrorStream() <a href="#geterrorstream-8577e8676bda" id="geterrorstream-8577e8676bda"></a>

```java
public java.io.InputStream getErrorStream()
```

### getInputStream() <a href="#getinputstream-cb1d1fa14d56" id="getinputstream-cb1d1fa14d56"></a>

```java
public java.io.InputStream getInputStream()
```

### getLine() <a href="#getline-6cb6167e418b" id="getline-6cb6167e418b"></a>

```java
public StringBuilder getLine()
```

Return the line buffer

### getOutputStream() <a href="#getoutputstream-b7e39f99be28" id="getoutputstream-b7e39f99be28"></a>

```java
public java.io.OutputStream getOutputStream()
```

### getReader() <a href="#getreader-ca9cb7876cc5" id="getreader-ca9cb7876cc5"></a>

```java
public java.io.BufferedReader getReader()
```

Return the session input reader

### getReadTimeout() <a href="#getreadtimeout-640fc089c1de" id="getreadtimeout-640fc089c1de"></a>

```java
public int getReadTimeout()
```

Return the configured read timeout

### getTermPrintlnMode() <a href="#gettermprintlnmode-bbc6ff231fae" id="gettermprintlnmode-bbc6ff231fae"></a>

```java
public String getTermPrintlnMode()
```

Get configured println mode

### getWriter() <a href="#getwriter-23ba297ab3e8" id="getwriter-23ba297ab3e8"></a>

```java
public java.io.PrintWriter getWriter()
```

Return the session output writer

### logDebug(String) <a href="#logdebug-91653b5096b0" id="logdebug-91653b5096b0"></a>

```java
public void logDebug(String msg)
```

Log on debug level

**Parameters**

- `String msg`

### logInfo(String) <a href="#loginfo-32ae00d19c47" id="loginfo-32ae00d19c47"></a>

```java
public void logInfo(String msg)
```

Log on info level

**Parameters**

- `String msg`

### ready(int) <a href="#ready-c585210c0993" id="ready-c585210c0993"></a>

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

### serverSideClosed() <a href="#serversideclosed-0dfe26b0733e" id="serversideclosed-0dfe26b0733e"></a>

```java
public boolean serverSideClosed()
```

Returns true if session has been closed

### setReadTimeout(int) <a href="#setreadtimeout-4f6742da7687" id="setreadtimeout-4f6742da7687"></a>

```java
public void setReadTimeout(int readTimeout)
```

Configure the readTimeout

**Parameters**

- `int readTimeout`

### setTermPrintlnMode(String) <a href="#settermprintlnmode-36c6657337c2" id="settermprintlnmode-36c6657337c2"></a>

```java
public void setTermPrintlnMode(String mode)
```

Configure println mode

**Parameters**

- `String mode`

### setTracer(NedTracer) <a href="#settracer-6943f9aadf68" id="settracer-6943f9aadf68"></a>

```java
public void setTracer(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#nedtracer-f8730263f5f2)

Enable tracer

**Parameters**

- `com.tailf.ned.NedTracer tracer`

### trace(String, String) <a href="#trace-684478bdb6cc" id="trace-684478bdb6cc"></a>

```java
public void trace(String msg, String direction)
```

Append to tracer

**Parameters**

- `String msg`
- `String direction`

### traceInBufAppend(String) <a href="#traceinbufappend-948da59d599a" id="traceinbufappend-948da59d599a"></a>

```java
public void traceInBufAppend(String msg)
```

Append to trace in buf

**Parameters**

- `String msg`

### traceInBufFlush() <a href="#traceinbufflush-5f53f59ed390" id="traceinbufflush-5f53f59ed390"></a>

```java
public void traceInBufFlush()
```

Flush trace in buffer
