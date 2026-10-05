# TelnetSession <a href="#telnetsession-79ad40d9d7fd" id="telnetsession-79ad40d9d7fd"></a>

```java
public class com.tailf.ned.TelnetSession
    implements com.tailf.ned.CliSession
```

Types: [CliSession](CliSession.md#clisession-1e55c4457237)

A telnet  transport.
 Example:


```
 TelnetSession c = new TelnetSession("127.0.0.1", 23);
```

## Members

**Constructors**:

- [TelnetSession(NedWorker)](#telnetsession-d3b2dd744527)
- [TelnetSession(NedWorker, int, NedTracer, NedConnectionBase)](#telnetsession-21f327968cad)
- [TelnetSession(NedWorker, NedTracer, NedConnectionBase)](#telnetsession-caa93be5f9d7)
- [TelnetSession(NedWorker, String, int, NedTracer, NedConnectionBase)](#telnetsession-3ec47bd8b865)

**Fields**:

- [readTimeout](#readtimeout-0c3689315cf4)

**Methods**:

- [close()](#close-8107c6dc012b)
- [expect(Pattern)](#expect-98936155685a)
- [expect(Pattern, boolean, int)](#expect-ae0bda32ace3)
- [expect(Pattern, boolean, int, NedWorker)](#expect-7eb828b58e63)
- [expect(Pattern, NedWorker)](#expect-a363c018c396)
- [expect(Pattern[])](#expect-8149faa90d9d)
- [expect(Pattern[], boolean, int)](#expect-5cc2e4122c7b)
- [expect(Pattern[], boolean, int, boolean)](#expect-7b0546ada421)
- [expect(Pattern[], boolean, int, boolean, NedWorker)](#expect-8367e41003a6)
- [expect(Pattern[], boolean, int, NedWorker)](#expect-6c58bada9cc6)
- [expect(Pattern[], NedWorker)](#expect-b0896c6a7b2a)
- [expect(String)](#expect-5f5d11ad490b)
- [expect(String, boolean, boolean, int)](#expect-b7ee8aa21949)
- [expect(String, boolean, boolean, int, NedWorker)](#expect-a44ee9613d91)
- [expect(String, boolean, int)](#expect-16cd2f682137)
- [expect(String, boolean, int, NedWorker)](#expect-6e2d86346550)
- [expect(String, int)](#expect-37295e1967db)
- [expect(String, int, NedWorker)](#expect-4ba232d952f7)
- [expect(String, NedWorker)](#expect-6426c41e07e7)
- [expect(String[])](#expect-740d81a74e4b)
- [expect(String[], boolean, int)](#expect-f6cb6c02c198)
- [expect(String[], boolean, int, NedWorker)](#expect-90d4e3ee7ac2)
- [expect(String[], NedWorker)](#expect-4485477b99db)
- [flush()](#flush-a4d76f158943)
- [getSocket()](#getsocket-d7da2de81b81)
- [print(String)](#print-b202251f9230)
- [println(String)](#println-15aea44318e6)
- [ready()](#ready-92162bd485a2)
- [ready(int)](#ready-c585210c0993)
- [serverSideClosed()](#serversideclosed-0dfe26b0733e)
- [setScreenSize(int, int)](#setscreensize-cb107ae34294)
- [setTracer(NedTracer)](#settracer-6943f9aadf68)
- [write(String)](#write-65e1fbc7c416)

## Constructors

### TelnetSession(NedWorker) <a href="#telnetsession-d3b2dd744527" id="telnetsession-d3b2dd744527"></a>

```java
public TelnetSession(com.tailf.ned.NedWorker worker) throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

Constructor for Telnet session object. This method creates a
 a new telnet session on top of an existing connection.
 Telnet objects implement the Transport interface and they
 are passed into the constructor of the NetconfSession class.

**Parameters**

- `com.tailf.ned.NedWorker worker` - current NedWorker object

**Throws**

- `IOException`

### TelnetSession(NedWorker, int, NedTracer, NedConnectionBase) <a href="#telnetsession-21f327968cad" id="telnetsession-21f327968cad"></a>

```java
public TelnetSession(
    com.tailf.ned.NedWorker worker,
    int readTimeout,
    com.tailf.ned.NedTracer tracer,
    com.tailf.ned.NedConnectionBase conn
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [NedTracer](NedTracer.md#nedtracer-f8730263f5f2), [NedConnectionBase](NedConnectionBase.md#nedconnectionbase-3139efb66faf)

Constructor with an extra argument for a readTimeout timer.

**Parameters**

- `com.tailf.ned.NedWorker worker` - current NedWorker object
- `int readTimeout` - timeout in milliseconds
- `com.tailf.ned.NedTracer tracer` - Ned tracer
- `com.tailf.ned.NedConnectionBase conn` - NedConnection object

**Throws**

- `IOException`

### TelnetSession(NedWorker, NedTracer, NedConnectionBase) <a href="#telnetsession-caa93be5f9d7" id="telnetsession-caa93be5f9d7"></a>

```java
public TelnetSession(
    com.tailf.ned.NedWorker worker,
    com.tailf.ned.NedTracer tracer,
    com.tailf.ned.NedConnectionBase conn
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [NedTracer](NedTracer.md#nedtracer-f8730263f5f2), [NedConnectionBase](NedConnectionBase.md#nedconnectionbase-3139efb66faf)

Constructor for Telnet session object. This method creates a
 a new telnet connection.

**Parameters**

- `com.tailf.ned.NedWorker worker` - current NedWorker object
- `com.tailf.ned.NedTracer tracer` - Ned tracer
- `com.tailf.ned.NedConnectionBase conn` - NedConnection object

**Throws**

- `IOException`

### TelnetSession(NedWorker, String, int, NedTracer, NedConnectionBase) <a href="#telnetsession-3ec47bd8b865" id="telnetsession-3ec47bd8b865"></a>

```java
public TelnetSession(
    com.tailf.ned.NedWorker worker,
    String username,
    int readTimeout,
    com.tailf.ned.NedTracer tracer,
    com.tailf.ned.NedConnectionBase conn
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [NedTracer](NedTracer.md#nedtracer-f8730263f5f2), [NedConnectionBase](NedConnectionBase.md#nedconnectionbase-3139efb66faf)

Constructor with extra user name argument.

**Parameters**

- `com.tailf.ned.NedWorker worker` - current NedWorker object
- `String username`
- `int readTimeout` - timeout in milliseconds
- `com.tailf.ned.NedTracer tracer` - Ned tracer
- `com.tailf.ned.NedConnectionBase conn` - NedConnection object

**Throws**

- `IOException`


## Fields

### readTimeout <a href="#readtimeout-0c3689315cf4" id="readtimeout-0c3689315cf4"></a>

```java
protected int readTimeout = null;
```


## Methods

### close() <a href="#close-8107c6dc012b" id="close-8107c6dc012b"></a>

```java
public void close()
```

### expect(Pattern) <a href="#expect-98936155685a" id="expect-98936155685a"></a>

```java
public String expect(
    java.util.regex.Pattern p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern p`

### expect(Pattern, boolean, int) <a href="#expect-ae0bda32ace3" id="expect-ae0bda32ace3"></a>

```java
public String expect(
    java.util.regex.Pattern p,
    boolean include,
    int timeout
)
    throws java.io.IOException
```

**Parameters**

- `java.util.regex.Pattern p`
- `boolean include`
- `int timeout`

### expect(Pattern, boolean, int, NedWorker) <a href="#expect-7eb828b58e63" id="expect-7eb828b58e63"></a>

```java
public String expect(
    java.util.regex.Pattern p,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

**Parameters**

- `java.util.regex.Pattern p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern, NedWorker) <a href="#expect-a363c018c396" id="expect-a363c018c396"></a>

```java
public String expect(
    java.util.regex.Pattern p,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern p`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern[]) <a href="#expect-8149faa90d9d" id="expect-8149faa90d9d"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern[] p`

### expect(Pattern[], boolean, int) <a href="#expect-5cc2e4122c7b" id="expect-5cc2e4122c7b"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`

### expect(Pattern[], boolean, int, boolean) <a href="#expect-7b0546ada421" id="expect-7b0546ada421"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout,
    boolean full
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `boolean full`

### expect(Pattern[], boolean, int, boolean, NedWorker) <a href="#expect-8367e41003a6" id="expect-8367e41003a6"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout,
    boolean full,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [NedWorker](NedWorker.md#nedworker-b063de7c0998)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `boolean full`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern[], boolean, int, NedWorker) <a href="#expect-6c58bada9cc6" id="expect-6c58bada9cc6"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [NedWorker](NedWorker.md#nedworker-b063de7c0998)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern[], NedWorker) <a href="#expect-b0896c6a7b2a" id="expect-b0896c6a7b2a"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern[] p`
- `com.tailf.ned.NedWorker worker`

### expect(String) <a href="#expect-5f5d11ad490b" id="expect-5f5d11ad490b"></a>

```java
public String expect(String str) throws java.io.IOException
```

Read from socket until Pattern is encountered.

**Parameters**

- `String str` - is a regular expression pattern which is match against
 each line read.

**Returns:** the characters read.

### expect(String, boolean, boolean, int) <a href="#expect-b7ee8aa21949" id="expect-b7ee8aa21949"></a>

```java
public String expect(
    String str,
    boolean include,
    boolean full,
    int timeout
)
    throws java.io.IOException
```

Read from socket until Pattern is encountered.

**Parameters**

- `String str` - is a regular expression pattern which is match against
 each line read.
- `boolean include` - controls if the pattern should be include
 in the returned string or not.
- `boolean full` - controls if the pattern should be matched against
 the entire line, or if a positive match is accepted whenever the
 pattern matches any substring on a line.
- `int timeout`

**Returns:** the characters read.

### expect(String, boolean, boolean, int, NedWorker) <a href="#expect-a44ee9613d91" id="expect-a44ee9613d91"></a>

```java
public String expect(
    String str,
    boolean include,
    boolean full,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String, boolean, int) <a href="#expect-16cd2f682137" id="expect-16cd2f682137"></a>

```java
public String expect(String str, boolean include, int timeout) throws java.io.IOException
```

Read from socket until Pattern is encountered.

**Parameters**

- `String str` - is a regular expression pattern which is match against
 each line read.
- `boolean include` - controls if the pattern should be include
 in the returned string or not.
- `int timeout`

**Returns:** the characters read.

### expect(String, boolean, int, NedWorker) <a href="#expect-6e2d86346550" id="expect-6e2d86346550"></a>

```java
public String expect(
    String str,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

**Parameters**

- `String str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String, int) <a href="#expect-37295e1967db" id="expect-37295e1967db"></a>

```java
public String expect(String str, int timeout) throws java.io.IOException
```

Read from socket until Pattern is encountered.

**Parameters**

- `String str` - is a regular expression pattern which is match against
 each line read.
- `int timeout` - indicates the read timeout

**Returns:** the characters read.

### expect(String, int, NedWorker) <a href="#expect-4ba232d952f7" id="expect-4ba232d952f7"></a>

```java
public String expect(
    String str,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

**Parameters**

- `String str`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String, NedWorker) <a href="#expect-6426c41e07e7" id="expect-6426c41e07e7"></a>

```java
public String expect(String str, com.tailf.ned.NedWorker worker) throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

**Parameters**

- `String str`
- `com.tailf.ned.NedWorker worker`

### expect(String[]) <a href="#expect-740d81a74e4b" id="expect-740d81a74e4b"></a>

```java
public com.tailf.ned.NedExpectResult expect(String[] str) throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87)

**Parameters**

- `String[] str`

### expect(String[], boolean, int) <a href="#expect-f6cb6c02c198" id="expect-f6cb6c02c198"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    String[] str,
    boolean include,
    int timeout
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`

### expect(String[], boolean, int, NedWorker) <a href="#expect-90d4e3ee7ac2" id="expect-90d4e3ee7ac2"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    String[] str,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [NedWorker](NedWorker.md#nedworker-b063de7c0998)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String[], NedWorker) <a href="#expect-4485477b99db" id="expect-4485477b99db"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    String[] str,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [NedWorker](NedWorker.md#nedworker-b063de7c0998)

**Parameters**

- `String[] str`
- `com.tailf.ned.NedWorker worker`

### flush() <a href="#flush-a4d76f158943" id="flush-a4d76f158943"></a>

```java
public void flush() throws java.io.IOException
```

Signals that the final chunk of data has be printed to the output
 transport stream. This method furthermore flushes the transport
 output stream buffer.

### getSocket() <a href="#getsocket-d7da2de81b81" id="getsocket-d7da2de81b81"></a>

```java
public java.net.Socket getSocket()
```

Needed by users that need to monitor a socket for EOF .
 This will return the underlying socket object.

### print(String) <a href="#print-b202251f9230" id="print-b202251f9230"></a>

```java
public void print(String s) throws java.io.IOException
```

Prints text to the output stream.

**Parameters**

- `String s` - Text to send to the stream.

### println(String) <a href="#println-15aea44318e6" id="println-15aea44318e6"></a>

```java
public void println(String s) throws java.io.IOException
```

Print text to the output stream.
 A newline char is appended to end of the output stream.

**Parameters**

- `String s` - Text to send to the stream.

### ready() <a href="#ready-92162bd485a2" id="ready-92162bd485a2"></a>

```java
public boolean ready() throws java.io.IOException
```

Tell whether this transport is ready to be read.

**Returns:** true if there is something to read, false otherwise.
 This function can typically be used to poll a socket and see
 there is data to be read.
 Note that this method does not detect that the socket is in half-closed
 state and in such case will return false after timeout.

### ready(int) <a href="#ready-c585210c0993" id="ready-c585210c0993"></a>

```java
public boolean ready(int timeout) throws java.io.IOException
```

**Parameters**

- `int timeout`

### serverSideClosed() <a href="#serversideclosed-0dfe26b0733e" id="serversideclosed-0dfe26b0733e"></a>

```java
public boolean serverSideClosed()
```

given a live session, check if the server side has
 closed it's end of the socket.
 Note that it does not detect that the socket in half-closed state.

### setScreenSize(int, int) <a href="#setscreensize-cb107ae34294" id="setscreensize-cb107ae34294"></a>

```java
public void setScreenSize(int width, int length) throws java.io.IOException
```

**Parameters**

- `int width`
- `int length`

### setTracer(NedTracer) <a href="#settracer-6943f9aadf68" id="settracer-6943f9aadf68"></a>

```java
public void setTracer(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#nedtracer-f8730263f5f2)

**Parameters**

- `com.tailf.ned.NedTracer tracer`

### write(String) <a href="#write-65e1fbc7c416" id="write-65e1fbc7c416"></a>

```java
public void write(String s) throws java.io.IOException
```

**Parameters**

- `String s`
